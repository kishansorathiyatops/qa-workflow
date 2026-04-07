# QA Workflow Plugin Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a complete Claude Code plugin that guides QA Engineers through the entire testing lifecycle: analyzing requirements, creating test cases, preparing test data, reviewing quality, executing tests, and generating reports.

**Architecture:** Plugin follows ba-workflow's proven command-based pattern with 7 sequential commands, 2 personas (QA Engineer & QA Lead), 4 specialized skills (test case generation, data management, review, execution/reporting), and 4 Markdown templates. All components are Markdown-based and modular.

**Tech Stack:** 
- Markdown for commands, agents, skills, templates, docs
- JavaScript for optional Jira API integration
- Shell scripts for project setup

---

## File Structure

**Core Plugin Structure:**
```
qa-workflow/
├── .claude-plugin/
│   ├── plugin.json           # Plugin metadata & registration
│   └── marketplace.json      # Marketplace listing
├── commands/                 # 7 command modules (init, analyze, create-tests, prepare-data, review, execute, report)
├── agents/                   # 2 personas (qa-engineer.md, qa-lead.md)
├── skills/                   # 4 skill modules (test-case-generation, test-data-management, coverage-review, execution-reporting)
├── templates/                # 4 output templates (test-case, test-data, review, report)
├── docs/                     # Documentation and guides
├── lib/                      # Library code (jira-integration.js)
├── scripts/                  # Setup scripts (setup.sh)
├── bin/                      # CLI entry point
├── config.md                 # Configuration reference
├── README.md                 # Project overview
├── CLAUDE.md                 # Claude Code integration
├── LICENSE                   # MIT License
└── .gitignore
```

**Key Design Principle:** Each command is independent but sequential. Each skill is self-contained. Templates are reusable formats. This allows modular testing and development.

---

## Phase 1: Project Setup & Plugin Infrastructure

### Task 1: Create Plugin Metadata Files

**Files:**
- Create: `.claude-plugin/plugin.json`
- Create: `.claude-plugin/marketplace.json`

- [ ] **Step 1: Create plugin.json**

Create `.claude-plugin/plugin.json`:
```json
{
  "name": "qa-workflow",
  "version": "0.1.0",
  "displayName": "QA Workflow",
  "description": "End-to-end QA testing workflow plugin: analyze requirements → create test cases → prepare test data → review quality → execute tests → generate reports",
  "author": {
    "name": "QA Workflow Team",
    "email": "qa-workflow@example.com"
  },
  "license": "MIT",
  "commands": [
    {
      "name": "init",
      "description": "Initialize a new QA test project"
    },
    {
      "name": "analyze",
      "description": "Analyze requirements and identify test scope"
    },
    {
      "name": "create-tests",
      "description": "Generate test cases from requirements"
    },
    {
      "name": "prepare-data",
      "description": "Create and organize test data"
    },
    {
      "name": "review",
      "description": "Review test cases quality (QA Lead)"
    },
    {
      "name": "execute",
      "description": "Execute tests and track results"
    },
    {
      "name": "report",
      "description": "Generate comprehensive test report"
    }
  ],
  "agents": [
    {
      "name": "qa-engineer",
      "displayName": "QA Engineer",
      "description": "QA Engineer persona - executor of testing workflow"
    },
    {
      "name": "qa-lead",
      "displayName": "QA Lead",
      "description": "QA Lead persona - quality reviewer and approver"
    }
  ],
  "skills": [
    {
      "name": "test-case-generation",
      "displayName": "Test Case Generation",
      "description": "Generate comprehensive, well-formed test cases"
    },
    {
      "name": "test-data-management",
      "displayName": "Test Data Management",
      "description": "Organize and structure test data efficiently"
    },
    {
      "name": "coverage-review",
      "displayName": "Coverage & Quality Review",
      "description": "Validate test case quality and completeness"
    },
    {
      "name": "execution-reporting",
      "displayName": "Execution & Reporting",
      "description": "Guide test execution and generate insights"
    }
  ]
}
```

- [ ] **Step 2: Create marketplace.json**

Create `.claude-plugin/marketplace.json`:
```json
{
  "name": "qa-workflow",
  "displayName": "QA Workflow",
  "version": "0.1.0",
  "description": "Complete end-to-end QA testing workflow plugin for Claude Code. Guides QA Engineers through: analyzing requirements, creating test cases, preparing test data, quality review, test execution, and report generation.",
  "category": "testing",
  "tags": [
    "qa",
    "testing",
    "test-cases",
    "test-data",
    "test-reports",
    "quality-assurance",
    "workflow"
  ],
  "author": {
    "name": "QA Workflow Team",
    "email": "qa-workflow@example.com",
    "url": "https://github.com/kishansorathiyatops/qa-workflow"
  },
  "license": "MIT",
  "repository": {
    "type": "git",
    "url": "https://github.com/kishansorathiyatops/qa-workflow.git"
  },
  "keywords": [
    "qa",
    "qe",
    "testing",
    "test-automation",
    "test-management",
    "quality"
  ],
  "requirements": {
    "claude-code": ">=1.0.0"
  }
}
```

- [ ] **Step 3: Verify plugin metadata**

Run: `cat .claude-plugin/plugin.json | jq . > /dev/null && echo "Valid JSON"`
Expected: Valid JSON output with no errors

- [ ] **Step 4: Commit**

```bash
git add .claude-plugin/
git commit -m "setup: add plugin metadata (plugin.json, marketplace.json)"
```

---

### Task 2: Create Project Root Configuration Files

**Files:**
- Create: `package.json`
- Create: `.gitignore`
- Create: `LICENSE`

- [ ] **Step 1: Create package.json**

Create `package.json`:
```json
{
  "name": "qa-workflow",
  "version": "0.1.0",
  "description": "End-to-end QA testing workflow plugin for Claude Code",
  "main": "bin/qa-workflow",
  "license": "MIT",
  "author": "QA Workflow Team",
  "repository": {
    "type": "git",
    "url": "https://github.com/kishansorathiyatops/qa-workflow.git"
  },
  "keywords": [
    "qa",
    "testing",
    "test-cases",
    "test-data",
    "test-reports"
  ],
  "scripts": {
    "setup": "bash scripts/setup.sh"
  },
  "engines": {
    "node": ">=14.0.0"
  }
}
```

- [ ] **Step 2: Create .gitignore**

Create `.gitignore`:
```
# Dependencies
node_modules/
package-lock.json

# Test artifacts
test-results/
coverage/
*.log

# Environment
.env
.env.local
.DS_Store

# IDE
.vscode/
.idea/
*.swp
*.swo

# Temporary files
*.tmp
*.bak
.tmp/

# Build artifacts
dist/
build/
```

- [ ] **Step 3: Create LICENSE**

Create `LICENSE`:
```
MIT License

Copyright (c) 2026 QA Workflow Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE OR OTHERWISE
OUT OF THE USE OR OTHERWISE OR OTHERWISE OUT OF THE SOFTWARE.
```

- [ ] **Step 4: Commit**

```bash
git add package.json .gitignore LICENSE
git commit -m "setup: add project configuration (package.json, .gitignore, LICENSE)"
```

---

### Task 3: Create Directory Structure

**Files:**
- Create: Commands directory structure
- Create: Agents directory structure  
- Create: Skills directory structure
- Create: Templates directory structure
- Create: Docs directory structure
- Create: Lib & scripts directories

- [ ] **Step 1: Create directories**

Run:
```bash
mkdir -p commands agents skills templates docs/examples lib scripts bin
touch commands/.gitkeep agents/.gitkeep skills/.gitkeep templates/.gitkeep docs/examples/.gitkeep lib/.gitkeep
```

Expected: All directories created successfully

- [ ] **Step 2: Commit**

```bash
git add commands/.gitkeep agents/.gitkeep skills/.gitkeep templates/.gitkeep docs/examples/.gitkeep lib/.gitkeep
git commit -m "setup: create directory structure for plugin components"
```

---

## Phase 2: Personas (Agents)

### Task 4: Create QA Engineer Persona

**Files:**
- Create: `agents/qa-engineer.md`

- [ ] **Step 1: Create qa-engineer.md**

Create `agents/qa-engineer.md`:
```markdown
# QA Engineer Persona

## Profile

**Role:** Primary executor of the QA testing workflow

**Expertise:**
- Test case design and documentation
- Test data creation and management
- Manual and automated test execution
- Defect identification and reporting
- Testing methodologies and best practices

**Perspective:**
- Practical and detail-oriented
- Focused on test coverage and execution quality
- Concerned with efficiency and reusability
- Understands technical requirements and acceptance criteria

**Responsibilities in Workflow:**
- Analyze requirements (analyze command)
- Create comprehensive test cases (create-tests command)
- Prepare organized test data (prepare-data command)
- Execute tests and track results (execute command)
- Generate test reports (report command)

## Interaction Style

- Provide practical guidance on test case design
- Ask clarifying questions about requirements and edge cases
- Suggest test scenarios based on common patterns
- Help organize test data for reusability
- Guide step-by-step test execution
- Offer insights on test coverage and trends

## Key Values

- Completeness: Ensure all scenarios are covered
- Clarity: Test cases should be clear and unambiguous
- Reusability: Organize test data for multiple uses
- Efficiency: Minimize redundancy and manual work
- Documentation: Keep clear records of tests and results

## Communication

Address the QA Engineer as a colleague who understands testing but may need help with:
- Translating requirements into test scenarios
- Identifying edge cases and risk areas
- Organizing complex test data
- Generating insights from test results
```

- [ ] **Step 2: Commit**

```bash
git add agents/qa-engineer.md
git commit -m "feat: add QA Engineer persona definition"
```

---

### Task 5: Create QA Lead Persona

**Files:**
- Create: `agents/qa-lead.md`

- [ ] **Step 1: Create qa-lead.md**

Create `agents/qa-lead.md`:
```markdown
# QA Lead Persona

## Profile

**Role:** Quality gate and strategic reviewer of test cases

**Expertise:**
- Test strategy and planning
- Risk assessment and coverage analysis
- Quality standards and best practices
- Team leadership and mentoring
- Acceptance criteria validation

**Perspective:**
- Strategic and big-picture focused
- Concerned with coverage completeness and risk mitigation
- Responsible for quality gates and approvals
- Understands business requirements and acceptance standards

**Responsibilities in Workflow:**
- Review test cases for quality (review command)
- Approve or reject test plans
- Provide feedback on test coverage
- Assess risk coverage
- Gate test execution readiness

## Interaction Style

- Ask probing questions about coverage gaps
- Validate acceptance criteria clarity
- Assess risk and coverage comprehensively
- Provide constructive feedback
- Make approval/revision decisions
- Consider business impact and risk

## Key Values

- Completeness: Ensure all requirements are covered
- Clarity: Acceptance criteria must be testable
- Risk Management: Identify high-risk areas
- Quality Standards: Enforce quality gates
- Efficiency: Balance thoroughness with practicality

## Communication

Address the QA Lead as a strategic partner who:
- Thinks about testing holistically
- Makes approval/gate decisions
- Mentors the QA team
- Understands business and technical requirements
- Cares about quality and risk mitigation
```

- [ ] **Step 2: Commit**

```bash
git add agents/qa-lead.md
git commit -m "feat: add QA Lead persona definition"
```

---

## Phase 3: Skills (Quality Modules)

### Task 6: Create Test Case Generation Skill

**Files:**
- Create: `skills/test-case-generation.md`

- [ ] **Step 1: Create test-case-generation.md**

Create `skills/test-case-generation.md`:
```markdown
# Test Case Generation Skill

## Purpose

Assist QA Engineers in creating comprehensive, well-formed test cases that validate all requirements and edge cases.

## When Used

Triggered during the `create-tests` command. Used by QA Engineer persona.

## Key Responsibilities

1. **Scenario Identification**
   - Help identify all test scenarios from requirements
   - Suggest happy-path, alternative, and error scenarios
   - Identify boundary conditions and edge cases
   - Recommend non-functional test areas (performance, security, usability)

2. **Test Case Structuring**
   - Ensure each test case follows proper format:
     - Clear title and description
     - Well-defined preconditions
     - Step-by-step test steps
     - Specific expected results
     - Test data requirements
   - Validate that each step is testable and unambiguous

3. **Coverage Analysis**
   - Identify gaps in requirement coverage
   - Suggest additional test cases for missing scenarios
   - Point out edge cases that might be missed
   - Assess coverage percentage and recommend improvements

4. **Clarity Validation**
   - Ensure test steps are clear and repeatable
   - Verify expected results are specific and verifiable
   - Check that preconditions are realistic
   - Confirm test data needs are identified

## Workflow

1. **Analyze Requirements** (input from analyze command)
   - Review identified test scenarios and scope
   - Ask about coverage expectations
   - Clarify ambiguous requirements

2. **Generate Test Cases**
   - Create structured test case templates
   - Cover happy path, alternatives, and errors
   - Identify edge cases and boundary conditions
   - Suggest test data requirements

3. **Review & Refine**
   - Present generated test cases to QA Engineer
   - Ask for clarifications and adjustments
   - Incorporate feedback and refinements
   - Ensure clarity and completeness

4. **Output**
   - Deliver comprehensive test case document
   - Ready for Test Data Preparation phase
   - Includes coverage summary

## Interaction Patterns

- "Based on this requirement, I suggest these scenarios: [happy path], [alternative], [error case]. What else should we cover?"
- "This test case needs clearer expected results. Instead of 'error is shown', let's specify 'error message 'Invalid email format' is displayed'."
- "I notice we don't have test cases for [edge case]. Should we add coverage for that?"
- "Let's organize these test cases by feature area to make execution easier."

## Quality Checks

Before returning test cases to QA Engineer:
- [ ] All identified requirements have at least one test case
- [ ] Edge cases and boundary conditions are covered
- [ ] Test steps are clear and unambiguous
- [ ] Expected results are specific and verifiable
- [ ] Test data requirements are identified
- [ ] Test cases follow standard format
- [ ] Coverage gaps are documented
```

- [ ] **Step 2: Commit**

```bash
git add skills/test-case-generation.md
git commit -m "feat: add Test Case Generation skill definition"
```

---

### Task 7: Create Test Data Management Skill

**Files:**
- Create: `skills/test-data-management.md`

- [ ] **Step 1: Create test-data-management.md**

Create `skills/test-data-management.md`:
```markdown
# Test Data Management Skill

## Purpose

Assist QA Engineers in organizing, structuring, and documenting test data efficiently and reusably.

## When Used

Triggered during the `prepare-data` command. Used by QA Engineer persona.

## Key Responsibilities

1. **Data Requirement Analysis**
   - Analyze test cases to identify data needs
   - Categorize data by type (user data, product data, transaction data, etc.)
   - Identify data dependencies and relationships
   - Flag sensitive data that needs masking or special handling

2. **Test Data Organization**
   - Create reusable test data sets
   - Organize data by scenario or test case
   - Create fixtures and mock data structures
   - Define data setup and teardown procedures
   - Document data lineage (which cases use which data)

3. **Data Documentation**
   - Document data set purpose and scope
   - Record all data values and field definitions
   - Provide setup instructions for test environment
   - Document dependencies between data sets
   - Create cleanup procedures

4. **Data Consistency & Validation**
   - Ensure data matches expected formats
   - Validate data relationships and referential integrity
   - Identify data conflicts or duplication
   - Suggest consolidation or reuse opportunities

## Workflow

1. **Analyze Test Cases** (input from create-tests command)
   - Review all test cases
   - Identify data requirements for each case
   - Map data dependencies

2. **Design Test Data**
   - Create test data sets
   - Organize by scenario or shared use
   - Define mock data and fixtures
   - Plan setup and cleanup

3. **Document Data**
   - Create test data document
   - Record all data values
   - Document setup procedures
   - Document dependencies and lineage

4. **Output**
   - Deliver test data document
   - Ready for Review phase
   - Includes setup guide and data organization

## Interaction Patterns

- "This test case needs user data with [specific attributes]. Let's create a reusable 'Active User' data set."
- "I see three test cases all need product data. Should we create one shared 'Test Products' data set to avoid duplication?"
- "This data set depends on another. Let's document the setup order: create [Data A] first, then [Data B]."
- "For this sensitive data, we should mask [field] to protect privacy."

## Quality Checks

Before returning test data to QA Engineer:
- [ ] All test cases have required data defined
- [ ] Data sets are organized logically and reusably
- [ ] Data dependencies are documented
- [ ] Setup instructions are clear
- [ ] Cleanup procedures are defined
- [ ] Data lineage is documented
- [ ] No sensitive data is exposed
- [ ] Data organization reduces redundancy
```

- [ ] **Step 2: Commit**

```bash
git add skills/test-data-management.md
git commit -m "feat: add Test Data Management skill definition"
```

---

### Task 8: Create Coverage & Quality Review Skill

**Files:**
- Create: `skills/coverage-review.md`

- [ ] **Step 1: Create coverage-review.md**

Create `skills/coverage-review.md`:
```markdown
# Coverage & Quality Review Skill

## Purpose

Assist QA Lead in validating test case quality, completeness, and coverage before test execution.

## When Used

Triggered during the `review` command. Used by QA Lead persona.

## Key Responsibilities

1. **Coverage Analysis**
   - Assess requirement coverage percentage
   - Identify uncovered or under-covered requirements
   - Evaluate scenario completeness
   - Assess edge case and error scenario coverage
   - Recommend additional test cases if gaps found

2. **Quality Validation**
   - Verify test cases follow proper format
   - Check that preconditions are clear and realistic
   - Validate that test steps are unambiguous and repeatable
   - Ensure expected results are specific and verifiable
   - Confirm acceptance criteria are testable

3. **Risk Assessment**
   - Identify high-risk areas requiring additional testing
   - Assess criticality of test cases
   - Recommend risk-based prioritization
   - Evaluate non-functional testing coverage
   - Flag areas of concern

4. **Test Data Validation**
   - Verify test data completeness for all cases
   - Check data organization and reusability
   - Validate setup and cleanup procedures
   - Ensure no sensitive data exposures
   - Confirm data dependencies are documented

## Workflow

1. **Review Test Cases** (input from create-tests command)
   - Analyze test case document
   - Check coverage against requirements
   - Evaluate quality and clarity

2. **Assess Test Data** (input from prepare-data command)
   - Review test data organization
   - Validate completeness and dependencies
   - Check setup procedures

3. **Identify Issues & Gaps**
   - Document coverage gaps
   - Note quality issues
   - Identify risk areas
   - Suggest improvements

4. **Make Approval Decision**
   - Approve if meets quality standards
   - Request revisions if gaps or issues found
   - Document sign-off

5. **Output**
   - Deliver review report
   - Approval or revision requests
   - Documented findings and recommendations

## Interaction Patterns

- "I notice we don't have test cases for [requirement/scenario]. Should we add coverage?"
- "This test case's expected result is too vague. Instead of 'page loads correctly', let's specify 'page loads in under 2 seconds with no JavaScript errors'."
- "This area is high-risk [technical/business reason]. I recommend additional test coverage here."
- "The data setup for test case TC-005 depends on test case TC-002. Let's make sure we document that dependency."

## Quality Checks

Before approving test plan:
- [ ] All requirements are covered (minimum 1 test case each)
- [ ] High-risk areas have adequate coverage
- [ ] Edge cases and error scenarios are included
- [ ] Test cases follow standard format
- [ ] Test steps are clear and repeatable
- [ ] Expected results are specific and verifiable
- [ ] Test data is complete and organized
- [ ] Setup and cleanup procedures are defined
- [ ] Coverage gaps are documented
- [ ] Risk assessment is documented

## Approval Criteria

Test plan is approved when:
- Coverage is adequate (typically 90%+)
- Quality standards are met
- Risk areas are addressed
- All issues from previous review are resolved
```

- [ ] **Step 2: Commit**

```bash
git add skills/coverage-review.md
git commit -m "feat: add Coverage & Quality Review skill definition"
```

---

### Task 9: Create Execution & Reporting Skill

**Files:**
- Create: `skills/execution-reporting.md`

- [ ] **Step 1: Create execution-reporting.md**

Create `skills/execution-reporting.md`:
```markdown
# Execution & Reporting Skill

## Purpose

Assist QA Engineer in executing test cases step-by-step and generating comprehensive test reports with metrics and insights.

## When Used

Triggered during the `execute` and `report` commands. Used by QA Engineer persona.

## Key Responsibilities

### Execution Guidance (execute command)

1. **Test Setup**
   - Guide test environment preparation
   - Help set up required test data
   - Verify preconditions are met
   - Validate environment readiness

2. **Step-by-Step Execution**
   - Guide through each test case step
   - Verify expected results after each step
   - Record actual results observed
   - Capture screenshots or logs if needed
   - Flag any deviations

3. **Result Documentation**
   - Record pass/fail status for each case
   - Document actual results vs. expected
   - Link failures to defects (Jira if available)
   - Note any environmental issues
   - Record execution timestamp and tester info

4. **Defect Identification**
   - Identify and document defects
   - Capture defect details and reproduction steps
   - Link defects to test cases
   - Assess severity and priority

### Report Generation (report command)

1. **Results Compilation**
   - Aggregate all execution results
   - Calculate pass/fail/blocked counts
   - Compute pass rate percentage
   - Count and categorize defects

2. **Metrics & Trends**
   - Calculate pass rate and defect metrics
   - Compare to previous test cycles (if available)
   - Identify trend (improving/declining/stable)
   - Highlight areas of concern

3. **Insights & Recommendations**
   - Analyze defect patterns
   - Identify high-risk areas
   - Recommend focus areas for next cycle
   - Assess overall product quality

4. **Report Documentation**
   - Create professional test report
   - Include executive summary
   - Document test results per case
   - List defects and categorization
   - Present metrics and trends
   - Provide recommendations

## Workflow

### Execution Flow

1. **Prepare for Execution**
   - Review test environment setup
   - Load test data
   - Verify all preconditions

2. **Execute Test Cases**
   - For each test case:
     - Verify preconditions are met
     - Follow test steps exactly
     - Observe actual results
     - Record pass/fail
     - Document any issues
     - Capture supporting evidence

3. **Document Results**
   - Record execution results
   - Link failures to defects
   - Note environmental issues
   - Track execution progress

4. **Output**
   - Deliver execution results document
   - Ready for Report phase

### Report Flow

1. **Compile Results**
   - Review all execution results
   - Aggregate metrics
   - Identify defect patterns

2. **Generate Report**
   - Create test report document
   - Include summary metrics
   - Document all results
   - List defects and status
   - Analyze trends

3. **Output**
   - Deliver professional test report
   - Ready for stakeholder review

## Interaction Patterns

- "Let's execute test case TC-001. First, verify the preconditions: [list]. Are those met?"
- "Now follow step 1: [step description]. What do you see? Is that what we expected?"
- "This step didn't produce the expected result. Let me document this as a defect: [defect description]."
- "You've completed 15 of 25 test cases so far. Current pass rate: 86%. Keep up the good work!"
- "Here's your test report: 25 cases executed, 22 passed (88%), 3 failed. Trending slightly better than last cycle."

## Quality Checks

### For Execution

- [ ] Test environment is properly set up
- [ ] All preconditions are met before starting
- [ ] Test steps are followed exactly as written
- [ ] Actual results are carefully observed
- [ ] All results are recorded
- [ ] Defects are clearly documented
- [ ] Execution is tracked and progress reported

### For Reporting

- [ ] All test results are compiled
- [ ] Metrics are calculated correctly
- [ ] Trends are compared to baseline
- [ ] Defects are categorized and counted
- [ ] Report is professional and clear
- [ ] Recommendations are actionable
- [ ] Sign-off is documented
```

- [ ] **Step 2: Commit**

```bash
git add skills/execution-reporting.md
git commit -m "feat: add Execution & Reporting skill definition"
```

---

## Phase 4: Templates

### Task 10: Create Test Case Template

**Files:**
- Create: `templates/test-case-template.md`

- [ ] **Step 1: Create test-case-template.md**

Create `templates/test-case-template.md`:
```markdown
# Test Case Template

Use this template for all test cases in the project. Each test case should be a separate document or section.

---

## Test Case: [TC-XXX]

**Title:** [Clear, concise description of what is being tested]

**Description:** [2-3 sentences explaining what this test validates and why it's important]

**Requirement Link:** [Link to or reference the requirement(s) this test validates]

---

### Preconditions

- [Precondition 1: Specific state or setup required]
- [Precondition 2: System state or permissions needed]
- [Precondition 3: Any dependencies on other test cases or data]

---

### Test Steps

1. [Clear, specific step 1 - use exact field names, menu paths, button labels]
2. [Clear, specific step 2 - each step should be independently verifiable]
3. [Clear, specific step N - avoid ambiguous terms like "click something" or "verify it works"]

---

### Expected Result

[Specific, verifiable expected outcome. Example: "Page loads in under 2 seconds, displays 'Welcome John', and shows 5 product cards without errors"]

---

### Test Data Required

- [Test Data Set 1 - reference the data set by name]
- [Test Data Set 2 - include required attributes/fields]

---

### Actual Result

[Filled during execution - what actually happened]

---

### Status

- [ ] Pass
- [ ] Fail
- [ ] Blocked

---

### Defect ID (if failed)

[Link to defect ticket, e.g., BUG-001]

---

### Risk Level

- [ ] Critical - Core functionality, blocks other tests
- [ ] High - Important feature, user impact
- [ ] Medium - Non-critical feature, workaround available
- [ ] Low - Nice-to-have, minimal impact

---

### Notes

[Any additional notes, observations, or context about this test]

---
```

- [ ] **Step 2: Commit**

```bash
git add templates/test-case-template.md
git commit -m "feat: add Test Case template"
```

---

### Task 11: Create Test Data Template

**Files:**
- Create: `templates/test-data-template.md`

- [ ] **Step 1: Create test-data-template.md**

Create `templates/test-data-template.md`:
```markdown
# Test Data Template

Use this template to document each test data set.

---

## Test Data Set: [DATA-XXX]

**Name:** [Descriptive name, e.g., "Active User - Premium Subscription"]

**Purpose:** [What scenario or test cases does this data support]

**Scope:** [Where/when this data is used - e.g., "Used in login tests, user profile tests"]

---

### Data Records

#### Record 1: [Record description]

| Field | Value | Notes |
|-------|-------|-------|
| user_id | 12345 | System-generated |
| email | john.doe@example.com | Valid test email |
| first_name | John | Sample data |
| last_name | Doe | Sample data |
| status | active | Must be 'active' for login tests |
| subscription | premium | Premium tier for feature tests |

#### Record 2: [Record description]

| Field | Value | Notes |
|-------|-------|-------|
| user_id | 12346 | System-generated |
| email | jane.smith@example.com | Valid test email |
| first_name | Jane | Sample data |
| last_name | Smith | Sample data |
| status | inactive | Test inactive user scenario |
| subscription | free | Free tier for limitation tests |

---

### Setup Instructions

1. [Step 1: How to set up this data - e.g., "Create users in test database"]
2. [Step 2: Any environment configuration needed]
3. [Step 3: Verify setup - e.g., "Verify users are queryable via API"]

**Setup Time:** [Estimated time to set up, e.g., "~5 minutes"]

---

### Data Dependencies

- [Depends on: Data Set X - must be created first]
- [Depends on: Environment setup Y]
- [No dependencies - can be created independently]

---

### Cleanup Procedures

1. [Step 1: How to clean up - e.g., "Delete test users created above"]
2. [Step 2: Reset any modified data]
3. [Step 3: Verify cleanup - e.g., "Verify no test users remain"]

**Cleanup Time:** [Estimated time, e.g., "~2 minutes"]

---

### Used By Test Cases

- [Test Case: TC-001 - [Test case title]]
- [Test Case: TC-005 - [Test case title]]
- [Test Case: TC-012 - [Test case title]]

---

### Sensitive Data Considerations

- [Does this data set contain sensitive information? Yes/No]
- [If yes, how is it masked/protected?]
- [Any compliance or privacy considerations?]

---

### Notes

[Any additional notes about this data set, special considerations, or version history]

---
```

- [ ] **Step 2: Commit**

```bash
git add templates/test-data-template.md
git commit -m "feat: add Test Data template"
```

---

### Task 12: Create Review Template

**Files:**
- Create: `templates/review-template.md`

- [ ] **Step 1: Create review-template.md**

Create `templates/review-template.md`:
```markdown
# Test Review Report Template

Use this template for QA Lead reviews of test cases and test data.

---

## Test Review Report

**Project Name:** [Project name]

**Review Date:** [Date of review]

**Reviewed By:** [QA Lead name]

**Review Version:** [Version of test cases/data being reviewed]

---

### Coverage Analysis

**Total Requirements:** [Number of requirements to cover]

**Requirements Covered:** [Number of requirements with test cases] ([Percentage]%)

**Coverage by Requirement:**

| Requirement ID | Title | Coverage | Test Cases |
|---|---|---|---|
| REQ-001 | [Title] | ✓ Covered | TC-001, TC-002 |
| REQ-002 | [Title] | ✓ Covered | TC-005 |
| REQ-003 | [Title] | ✗ Not Covered | - |

**Coverage Gaps:**

- [Requirement or scenario not covered]
- [High-risk area without adequate testing]

---

### Test Case Quality Assessment

**Total Test Cases:** [Number]

**Quality Findings:**

- **Format Compliance:** [X/N cases follow template properly]
  - Issues: [List any format issues]
  
- **Preconditions:** [Clear and realistic? Yes/No]
  - Issues: [Any unclear preconditions]
  
- **Test Steps:** [Clear and unambiguous? Yes/No]
  - Issues: [Steps that need clarification]
  
- **Expected Results:** [Specific and verifiable? Yes/No]
  - Issues: [Vague or unmeasurable results]
  
- **Edge Cases:** [Adequate coverage? Yes/No]
  - Missing: [Edge cases that should be added]
  
- **Error Scenarios:** [Adequately covered? Yes/No]
  - Missing: [Error scenarios to add]

---

### Test Data Assessment

**Test Data Sets:** [Number]

**Quality Findings:**

- **Completeness:** [All test cases have required data? Yes/No]
  - Issues: [Test cases missing data]
  
- **Organization:** [Logically organized and reusable? Yes/No]
  - Issues: [Redundancy or organization problems]
  
- **Documentation:** [Setup/cleanup procedures clear? Yes/No]
  - Issues: [Unclear documentation]
  
- **Dependencies:** [Documented and understood? Yes/No]
  - Issues: [Unclear dependencies]
  
- **Sensitive Data:** [Properly protected? Yes/No]
  - Issues: [Any exposed sensitive data]

---

### Risk Assessment

**High-Risk Areas Identified:**

- [Risk area 1: Technical risk description, recommended mitigation]
- [Risk area 2: Business-critical feature, recommend additional coverage]
- [Risk area 3: Complex scenario, recommend detailed test cases]

**Risk Mitigation Recommendations:**

- [Recommendation 1]
- [Recommendation 2]

---

### Defects & Issues Found

**Critical Issues (blocking approval):**

1. [Issue 1: Description and impact]
2. [Issue 2: Description and impact]

**Major Issues (should be fixed before execution):**

1. [Issue 1: Description]
2. [Issue 2: Description]

**Minor Issues (nice to fix):**

1. [Issue 1: Description]

---

### Suggestions & Improvements

- [Suggestion 1: How to improve test coverage or quality]
- [Suggestion 2: How to better organize test data]
- [Suggestion 3: Additional edge cases to consider]

---

### Overall Assessment

**Coverage:** [X]% complete ([Pass/Needs work])

**Quality:** [Good/Acceptable/Needs improvement]

**Readiness for Execution:** [Ready/Needs revisions]

---

### Approval Decision

- [ ] **Approved** - Test plan is ready for execution
- [ ] **Approved with Conditions** - Approved with understanding that [conditions] will be addressed
- [ ] **Revisions Requested** - Return for revisions (see Critical/Major Issues above)

---

### QA Lead Sign-off

**Name:** [QA Lead name]

**Title:** [Title]

**Date:** [Date]

**Signature:** ___________________________

---

### Comments

[Any additional comments or context from QA Lead]

---
```

- [ ] **Step 2: Commit**

```bash
git add templates/review-template.md
git commit -m "feat: add Review report template"
```

---

### Task 13: Create Report Template

**Files:**
- Create: `templates/report-template.md`

- [ ] **Step 1: Create report-template.md**

Create `templates/report-template.md`:
```markdown
# Test Execution Report Template

Use this template to document final test execution results and insights.

---

## Test Execution Report

**Project Name:** [Project name]

**Test Cycle:** [Cycle name, e.g., "v1.5.0 Release Testing"]

**Execution Period:** [Date range, e.g., "April 1-5, 2026"]

**Executed By:** [QA Engineer name(s)]

**Report Date:** [Date report generated]

---

### Executive Summary

[1-2 paragraph summary of test results, key findings, and overall quality assessment]

Example: "Completed testing of v1.5.0 with 42 test cases. Overall pass rate: 95% (40 passed, 2 failed). Found 2 critical defects and 3 minor defects. Product is ready for release with documented caveats."

---

### Test Execution Summary

| Metric | Count | Percentage |
|--------|-------|-----------|
| Total Test Cases | 42 | 100% |
| Passed | 40 | 95% |
| Failed | 2 | 5% |
| Blocked | 0 | 0% |
| Skipped | 0 | 0% |

**Pass Rate:** 95%

**Execution Status:** [Complete/In Progress/Blocked]

**Execution Time:** [Duration, e.g., "3 days"]

---

### Test Results by Feature

| Feature | Total | Passed | Failed | Pass Rate |
|---------|-------|--------|--------|-----------|
| [Feature A] | 10 | 10 | 0 | 100% |
| [Feature B] | 12 | 12 | 0 | 100% |
| [Feature C] | 15 | 14 | 1 | 93% |
| [Feature D] | 5 | 4 | 1 | 80% |

---

### Detailed Test Results

#### Passed Tests (40 cases)

| Test ID | Title | Status | Notes |
|---------|-------|--------|-------|
| TC-001 | [Title] | ✓ Pass | Completed as expected |
| TC-002 | [Title] | ✓ Pass | Completed as expected |
| ... | ... | ... | ... |

#### Failed Tests (2 cases)

| Test ID | Title | Status | Defect ID | Severity |
|---------|-------|--------|-----------|----------|
| TC-035 | [Title] | ✗ Fail | BUG-001 | Critical |
| TC-041 | [Title] | ✗ Fail | BUG-002 | Medium |

---

### Defects Found

**Summary:** 2 critical, 3 medium, 0 low defects

#### Critical Defects

1. **BUG-001: [Title]**
   - **Description:** [What is broken]
   - **Severity:** Critical
   - **Status:** Open / In Progress / Fixed
   - **Test Case:** TC-035
   - **Steps to Reproduce:** [How to reproduce]
   - **Impact:** [What does user experience / impact]

2. **BUG-002: [Title]**
   - **Description:** [What is broken]
   - **Severity:** Critical
   - **Status:** Open / In Progress / Fixed
   - **Test Case:** TC-040
   - **Steps to Reproduce:** [How to reproduce]
   - **Impact:** [What does user experience / impact]

#### Medium Defects

[List medium severity defects in similar format]

---

### Trends & Analysis

**Previous Cycle Comparison (if available):**

| Metric | Previous Cycle | Current Cycle | Change |
|--------|---|---|---|
| Pass Rate | 92% | 95% | ↑ +3% |
| Total Defects | 8 | 5 | ↓ -3 |
| Critical Defects | 2 | 2 | → No change |

**Trend:** Improving (pass rate increasing, defect count decreasing)

---

### Coverage Assessment

**Requirements Coverage:** 98% (49 of 50 requirements covered)

**Feature Coverage:** 100% (all features tested)

**Risk Areas:** [List any areas that may need additional testing in future cycles]

---

### Risk Assessment

**Current Risk Level:** [High / Medium / Low]

**Risk Factors:**

- [Critical defects blocking release]
- [Incomplete feature coverage]
- [Environmental instability affecting test reliability]

**Recommendations:**

1. [Recommendation 1 - what should be done before release]
2. [Recommendation 2 - suggested improvements for next cycle]
3. [Recommendation 3 - areas to monitor]

---

### Quality Metrics

- **Defect Density:** [X defects per 1000 lines of code, if applicable]
- **Test Coverage:** [X% of code/requirements covered]
- **Execution Efficiency:** [X test cases per day]
- **Defect Detection Rate:** [X% of bugs found in testing vs. production]

---

### Conclusion

[Summary of overall quality, readiness for release/next steps, and key recommendations]

Example: "Product quality is good with 95% test pass rate. Two critical defects must be addressed before release. Recommend one additional test cycle after bug fixes."

---

### Stakeholder Sign-off

**QA Engineer:** _________________ Date: _______

**QA Lead:** _________________ Date: _______

**Product Owner (if applicable):** _________________ Date: _______

---

### Attachments

- [Detailed test case results]
- [Defect screenshots or logs]
- [Test data setup documentation]
- [Performance metrics (if applicable)]

---
```

- [ ] **Step 2: Commit**

```bash
git add templates/report-template.md
git commit -m "feat: add Test Execution Report template"
```

---

## Phase 5: Commands

### Task 14: Create init Command

**Files:**
- Create: `commands/init.md`

- [ ] **Step 1: Create init.md**

Create `commands/init.md`:
```markdown
# qa-workflow init

Initialize a new QA test project.

## Purpose

Sets up a new qa-workflow project, creates project structure, and optionally configures Jira integration.

## Who Uses This

QA Engineer (primary project lead)

## Command Flow

### Step 1: Project Information

Prompt for:
- **Project Name:** [e.g., "Payment Processing v1.5.0"]
- **Description:** [Brief project description]
- **Test Scope:** [What's being tested - features, modules, etc.]
- **Team Members:** [Who will be involved - QA Engineers, QA Lead, etc.]

### Step 2: Requirements Source

Ask where requirements come from:
- [ ] Upload requirements document
- [ ] Paste requirements text
- [ ] Jira project (if Jira integration chosen)
- [ ] Other source

### Step 3: Jira Integration (Optional)

Ask: "Do you want to integrate with Jira?"
- If Yes:
  - Request Jira Cloud ID
  - Request Jira Project Key
  - Verify connection
  - Store credentials securely
- If No:
  - Proceed with standalone workflow

### Step 4: Project Setup

- Create project directory structure
- Create project config file with metadata
- Create README with project overview
- Initialize git repository (if not already done)
- Create initial CLAUDE.md with integration info

### Step 5: Summary

Display:
- Project name and description
- Project location
- Jira integration status
- Next steps (analyze command)

## Output

- Project directory created with:
  - `qa-workflow/project-config.json` - Project metadata
  - `qa-workflow/README.md` - Project overview
  - `qa-workflow/requirements/` - Directory for requirement documents
  - `qa-workflow/test-cases/` - Directory for test cases
  - `qa-workflow/test-data/` - Directory for test data
  - `qa-workflow/test-results/` - Directory for execution results
  - `qa-workflow/reports/` - Directory for reports

## Example Usage

```
User: qa-workflow init

QA Workflow: Hello! Let's set up your new QA test project.

Project name: Payment Processing v1.5.0
Description: Testing new payment gateway integration
Test scope: Payment processing, refunds, retry logic
Team: John (QA Engineer), Sarah (QA Lead)

Excellent! Now, where are your requirements?
[1] Upload document
[2] Paste requirements
[3] Jira project
[4] Other

User chooses [3] Jira

QA Workflow: Great! Jira integration will help us pull requirements directly.
Jira Cloud ID: your-domain.atlassian.net
Jira Project Key: PAY

[Verifying Jira connection...]
✓ Connection successful! 

QA Workflow: Perfect! Your project "Payment Processing v1.5.0" is ready.
📁 Project location: qa-workflow/
🔗 Jira integration: Enabled (PAY project)
📋 Next step: Run 'qa-workflow analyze' to analyze requirements

Ready to proceed!
```

## Technical Details

- Persona: QA Engineer
- Skills triggered: None (setup only)
- Output files: Project config, metadata
- Next command: `analyze`
```

- [ ] **Step 2: Commit**

```bash
git add commands/init.md
git commit -m "feat: add init command - project initialization"
```

---

### Task 15: Create analyze Command

**Files:**
- Create: `commands/analyze.md`

- [ ] **Step 1: Create analyze.md**

Create `commands/analyze.md`:
```markdown
# qa-workflow analyze

Analyze requirements and identify test scope.

## Purpose

Understand requirements, identify test scenarios, assess coverage needs, and define testing strategy.

## Who Uses This

QA Engineer

## Command Flow

### Step 1: Load Requirements

Ask:
- "Do you have requirements from:"
  - [ ] Uploaded document (from init)
  - [ ] Jira project (if integrated)
  - [ ] New source (paste, upload, or link)

Load and display requirements summary.

### Step 2: Understand Scope

Ask clarifying questions:
- "What are the main features being tested?"
- "Are there any out-of-scope items?"
- "What's the timeline for testing?"
- "Are there any known risky areas?"
- "Do we need performance/security/usability testing?"

### Step 3: Identify Scenarios

Analyze requirements to identify:
- Happy path scenarios (normal usage)
- Alternative scenarios (variations)
- Error scenarios (error handling)
- Edge cases (boundary conditions)
- Non-functional scenarios (performance, security, etc.)

Document each scenario with:
- Scenario ID
- Description
- Actor/User type
- Preconditions
- Expected outcome
- Risk level (Critical/High/Medium/Low)

### Step 4: Define Test Strategy

Create test strategy including:
- Testing approach (manual, automated, both)
- Coverage goals (e.g., "90%+ of requirements covered")
- Risk-based prioritization
- Testing phases/waves (if applicable)
- Acceptance criteria for completion

### Step 5: Summary & Approval

Present:
- Identified test scenarios
- Test strategy summary
- Estimated test case count
- Coverage plan
- Next steps (create-tests command)

Ask: "Does this strategy look good? Any adjustments needed?"

## Output

- Requirement analysis document with:
  - Requirements summary
  - Identified test scenarios
  - Test strategy
  - Risk assessment
  - Coverage plan
  - Next steps (create test cases)

## Example Usage

```
User: qa-workflow analyze

QA Workflow: Great! Let's analyze your requirements for Payment Processing v1.5.0.

📋 Loading requirements from Jira project PAY...
✓ Found 12 requirements

Let me ask a few clarifying questions:

Q: What are the main features being tested?
A: Payment processing, refunds, transaction logs, webhook notifications

Q: Are there out-of-scope items?
A: Yes - credit card validation (handled by payment provider), user authentication (separate system)

Q: Any risky areas?
A: Yes - webhook retry logic is complex, needs careful testing. Also, we need to handle concurrent transactions.

Based on your requirements, I've identified these test scenarios:

🎯 Happy Path Scenarios:
- [SC-001] Process payment successfully
- [SC-002] Process refund successfully
- [SC-003] Handle webhook notification

⚠️ Error Scenarios:
- [SC-004] Handle failed payment attempt
- [SC-005] Handle webhook timeout
- [SC-006] Handle invalid payment data

🔄 Edge Cases:
- [SC-007] Concurrent payments from same user
- [SC-008] Retry failed payment
- [SC-009] Duplicate webhook notification

My Test Strategy:
✓ Manual testing for all scenarios
✓ Coverage goal: 95% of requirements
✓ Risk-based: High-risk areas (webhooks, concurrency) prioritized
✓ Estimated test cases: 25-30

Ready to move to Test Case Creation? Run: qa-workflow create-tests
```

## Technical Details

- Persona: QA Engineer
- Skills triggered: None (planning only)
- Inputs: Requirements (from Jira, document, paste)
- Output: Requirement analysis document
- Next command: `create-tests`
```

- [ ] **Step 2: Commit**

```bash
git add commands/analyze.md
git commit -m "feat: add analyze command - requirements analysis"
```

---

### Task 16: Create create-tests Command

**Files:**
- Create: `commands/create-tests.md`

- [ ] **Step 1: Create create-tests.md**

Create `commands/create-tests.md`:
```markdown
# qa-workflow create-tests

Generate test cases from analyzed requirements.

## Purpose

Create comprehensive test cases that cover all identified scenarios, with clear steps, expected results, and data requirements.

## Who Uses This

QA Engineer

## Command Flow

### Step 1: Load Analysis

Load requirement analysis from previous `analyze` command.
Display test scenarios to be covered.

### Step 2: Generate Test Cases

For each test scenario, generate test case with:
- Test Case ID (TC-001, TC-002, etc.)
- Title (clear, descriptive)
- Description (what's being tested)
- Preconditions (setup required)
- Test Steps (numbered, specific, unambiguous)
- Expected Result (specific, verifiable)
- Test Data Requirements (what data is needed)
- Risk Level (Critical/High/Medium/Low)

Use Test Case Generation Skill to:
- Ensure clarity and testability
- Suggest edge cases
- Validate completeness
- Ensure each case is independent

### Step 3: QA Engineer Review

Present generated test cases to QA Engineer:
- Display test case summaries
- Ask for clarifications
- Collect feedback and adjustments
- Suggest additional edge cases
- Refine as needed

### Step 4: Organize & Document

- Organize test cases by feature/module
- Create test case document
- Include test case summary
- Link each case to requirement
- Calculate coverage statistics

### Step 5: Summary

Display:
- Total test cases created
- Coverage by requirement
- Coverage percentage
- Next steps (prepare-data command)

## Output

- Test Case Document with:
  - All test cases in template format
  - Test case summary table
  - Coverage analysis
  - Data requirements identified
  - Organized by feature/area

## Example Usage

```
User: qa-workflow create-tests

QA Workflow: Excellent! Let's create test cases for your Payment Processing project.

📋 Requirement Analysis loaded (from previous analyze step)
🎯 12 requirements identified
📊 9 test scenarios identified

Generating test cases...

✓ Generated 26 test cases covering:
  - Payment Processing (8 cases)
  - Refunds (6 cases)
  - Webhooks (7 cases)
  - Error Handling (5 cases)

Here's a summary:

Test Case: TC-001
Title: Process valid payment successfully
Requirement: REQ-001 (Process Payments)
Steps:
  1. Navigate to payment form
  2. Enter valid payment details
  3. Click "Pay" button
  4. Verify payment confirmation screen

Expected Result: Payment processed successfully, confirmation displayed, transaction logged

Data Required: Valid credit card test data (TEST-DATA-001)

---

[... more test cases ...]

Coverage Summary:
✓ REQ-001: 3 test cases (Payment Processing)
✓ REQ-002: 2 test cases (Refund Processing)
✓ REQ-003: 4 test cases (Webhook Notifications)
... (all requirements covered)

Overall Coverage: 100% of 12 requirements

These look good! Any adjustments needed before we prepare test data?

Next step: qa-workflow prepare-data
```

## Technical Details

- Persona: QA Engineer
- Skills triggered: Test Case Generation Skill
- Inputs: Requirement analysis from `analyze` command
- Output: Test case document
- Next command: `prepare-data`
```

- [ ] **Step 2: Commit**

```bash
git add commands/create-tests.md
git commit -m "feat: add create-tests command - test case generation"
```

---

### Task 17: Create prepare-data Command

**Files:**
- Create: `commands/prepare-data.md`

- [ ] **Step 1: Create prepare-data.md**

Create `commands/prepare-data.md`:
```markdown
# qa-workflow prepare-data

Create and organize test data needed for test execution.

## Purpose

Prepare reusable, well-organized test data sets that support all test cases, with clear setup and cleanup procedures.

## Who Uses This

QA Engineer

## Command Flow

### Step 1: Load Test Cases

Load test cases from previous `create-tests` command.
Analyze data requirements.

### Step 2: Identify Data Needs

Extract data requirements from test cases:
- User data (users, permissions, roles)
- Product/Item data (products, inventory)
- Transaction data (orders, payments)
- Config/Environment data (settings, features)

Group and consolidate:
- Multiple cases needing same data → create reusable data set
- Related data that should be together
- Dependencies between data sets

### Step 3: Generate Test Data

For each data need, create test data set with:
- Data Set ID (DATA-001, DATA-002, etc.)
- Name (descriptive, e.g., "Active Premium User")
- Purpose (what it's used for)
- Data Records (specific values)
- Setup Instructions (how to create/load)
- Cleanup Instructions (how to remove)
- Dependencies (other data sets it depends on)
- Used By (which test cases use it)

Use Test Data Management Skill to:
- Optimize for reusability
- Identify dependencies
- Ensure completeness
- Suggest consolidations

### Step 4: QA Engineer Review

Present data sets:
- Review organization and reusability
- Collect feedback on data values
- Add or modify data as needed
- Verify setup procedures

### Step 5: Document & Organize

Create test data document with:
- All data sets in template format
- Data summary table
- Setup guide
- Cleanup guide
- Dependencies and relationships

### Step 6: Summary

Display:
- Total data sets created
- Setup time estimate
- Next steps (review command for QA Lead)

## Output

- Test Data Document with:
  - All data sets in template format
  - Data summary table
  - Setup and cleanup procedures
  - Dependencies documented
  - Linked to test cases

## Example Usage

```
User: qa-workflow prepare-data

QA Workflow: Perfect! Let's prepare test data for your test cases.

📋 Test cases loaded (26 total)
🔍 Analyzing data requirements...

Found these data needs:
✓ User data (for login/permission testing)
✓ Payment card data (for payment processing)
✓ Product data (for transaction testing)
✓ Webhook mock data (for webhook testing)
✓ Transaction history (for refund testing)

Creating reusable data sets...

✓ Created 8 test data sets:

Data Set: DATA-001 - Active User with Premium Subscription
Purpose: User authentication and premium feature access
Records: 1 user (john@example.com)
Used By: TC-002, TC-008, TC-015
Setup Time: ~2 minutes

Data Set: DATA-002 - Inactive User
Purpose: Test permission restrictions for inactive users
Records: 1 user (inactive@example.com)
Used By: TC-004, TC-007
Setup Time: ~2 minutes

[... more data sets ...]

Setup Guide:
1. Create users in test database (DATA-001, DATA-002)
   Time: ~5 minutes
2. Add payment methods to users (DATA-003)
   Time: ~3 minutes
3. Create sample transactions (DATA-004)
   Time: ~5 minutes
4. Set up webhook mock server (DATA-005)
   Time: ~10 minutes

Total Setup Time: ~25 minutes

Everything looks ready! Next, we'll have the QA Lead review test quality:

qa-workflow review
```

## Technical Details

- Persona: QA Engineer
- Skills triggered: Test Data Management Skill
- Inputs: Test cases from `create-tests` command
- Output: Test data document
- Next command: `review`
```

- [ ] **Step 2: Commit**

```bash
git add commands/prepare-data.md
git commit -m "feat: add prepare-data command - test data creation"
```

---

### Task 18: Create review Command

**Files:**
- Create: `commands/review.md`

- [ ] **Step 1: Create review.md**

Create `commands/review.md`:
```markdown
# qa-workflow review

Review test cases and test data for quality and completeness.

## Purpose

QA Lead validates test case quality, completeness, coverage, and risk assessment before test execution.

## Who Uses This

QA Lead

## Command Flow

### Step 1: Load Test Cases & Data

Load test cases from `create-tests` command.
Load test data from `prepare-data` command.

### Step 2: Coverage Review

Use Coverage & Quality Review Skill to:
- Assess requirement coverage
- Calculate coverage percentage
- Identify coverage gaps
- Evaluate scenario completeness
- Assess edge case coverage
- Document findings

### Step 3: Quality Validation

Review test case quality:
- Format compliance (follow template)
- Clarity of preconditions
- Clarity and specificity of test steps
- Specificity of expected results
- Testability of acceptance criteria
- Data requirement completeness

Document quality findings.

### Step 4: Risk Assessment

Assess risk coverage:
- High-risk areas identified
- Adequate test coverage for high-risk items
- Error scenarios covered
- Non-functional testing (performance, security, etc.)
- Environmental considerations

### Step 5: Data Validation

Review test data:
- All test cases have required data
- Data organization and reusability
- Setup/cleanup procedures clear
- Dependencies documented
- Sensitive data handled properly

### Step 6: Approval Decision

QA Lead decides:
- **Approve** - Ready for execution
- **Approve with Conditions** - Approved, but with noted concerns
- **Revise** - Return for specific revisions

If revisions needed:
- Document specific issues
- Return to QA Engineer for fixes
- Re-review after revisions

If approved:
- Generate review report
- Document sign-off
- Proceed to execution

### Step 7: Summary

Display:
- Coverage percentage
- Quality assessment
- Risk findings
- Approval decision
- Next steps

## Output

- Review Report (using Review Template) with:
  - Coverage analysis
  - Quality findings
  - Risk assessment
  - Data assessment
  - Approval decision
  - QA Lead sign-off

## Example Usage

```
User: qa-workflow review

QA Workflow: QA Lead Review starting for Payment Processing v1.5.0

📋 Loading test cases (26 total)
📊 Loading test data (8 sets)

Performing quality review...

COVERAGE ANALYSIS:
✓ REQ-001 (Payment Processing): 3 test cases [COVERED]
✓ REQ-002 (Refund Processing): 2 test cases [COVERED]
... (all 12 requirements covered)

Coverage: 100% ✓

QUALITY VALIDATION:
✓ Test case format: 26/26 compliant
✓ Preconditions clarity: All clear ✓
✓ Test step clarity: All clear ✓
✓ Expected results specificity: All specific ✓
⚠️ Edge cases: Found 2 missing edge cases
  - Concurrent payment processing
  - Duplicate webhook notification handling

RISK ASSESSMENT:
🔴 High-Risk Areas:
  ✓ Webhook retry logic: 7 test cases [ADEQUATE]
  ✓ Concurrent transactions: 3 test cases [ADEQUATE]
  ⚠️ Payment failure recovery: 2 test cases [MARGINAL - suggest 1 more]

TEST DATA VALIDATION:
✓ All test cases have required data
✓ Data organization: Logical and reusable ✓
✓ Setup/cleanup: All documented ✓
✓ No sensitive data exposure ✓

RECOMMENDATION:
Add 3 additional test cases for:
1. Concurrent payment processing
2. Webhook duplicate handling
3. Payment failure recovery scenarios

After additions: Recommend APPROVAL for test execution.

Current Decision: APPROVED WITH REVISIONS REQUESTED

Review Report generated: reports/review-2026-04-07.md

Next: Address review findings and re-run review, or proceed if acceptable.
```

## Technical Details

- Persona: QA Lead
- Skills triggered: Coverage & Quality Review Skill
- Inputs: Test cases and test data from previous commands
- Output: Review report
- Next command (if approved): `execute`
- Next command (if revisions requested): `create-tests` or `prepare-data` (by QA Engineer)
```

- [ ] **Step 2: Commit**

```bash
git add commands/review.md
git commit -m "feat: add review command - test quality review (QA Lead gate)"
```

---

### Task 19: Create execute Command

**Files:**
- Create: `commands/execute.md`

- [ ] **Step 1: Create execute.md**

Create `commands/execute.md`:
```markdown
# qa-workflow execute

Execute test cases and track results.

## Purpose

Guide QA Engineer through test execution step-by-step, capture results, and track progress.

## Who Uses This

QA Engineer

## Command Flow

### Step 1: Preparation

Ask:
- "Are you ready to start test execution?"
- "Is test environment ready?"
- "Is test data set up?" (using prepare-data procedures)

Use Execution & Reporting Skill to:
- Guide test environment setup
- Verify preconditions
- Load test data
- Validate environment readiness

### Step 2: Test Execution

For each test case:
1. Display test case details
2. Verify preconditions are met
3. Guide through test steps one-by-one
4. After each step, ask: "What do you see?"
5. Compare actual result to expected
6. Record result: Pass / Fail / Blocked
7. If fail: document defect
8. If blocked: document reason
9. Move to next test case

### Step 3: Result Recording

For each test case, record:
- Test case ID
- Execution date/time
- Tester name
- Result: Pass / Fail / Blocked / Skipped
- Actual result (what happened)
- Defect ID (if failed)
- Notes/observations
- Supporting evidence (screenshots, logs)

### Step 4: Progress Tracking

Display progress:
- Test cases completed vs. total
- Current pass rate
- Defects found so far
- Blocked/failing cases needing attention
- Time remaining estimate

### Step 5: Defect Management

If test fails:
- Document defect details
- Capture steps to reproduce
- Record severity assessment
- Create Jira defect (if Jira integrated)
- Link to test case

### Step 6: Completion

When all tests executed:
- Display execution summary
- Pass/fail counts and percentages
- Defects found
- Next steps (report command)

## Output

- Execution Results Document with:
  - All test case results
  - Pass/fail counts
  - Defect list
  - Progress timeline
  - Ready for report generation

## Example Usage

```
User: qa-workflow execute

QA Workflow: Starting test execution for Payment Processing v1.5.0

✓ Is test environment ready? Yes
✓ Is test data set up? Yes
✓ Environment validation: READY

Let's begin! I'll guide you through each test case.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Test 1 of 26: TC-001
Title: Process valid payment successfully
Requirement: REQ-001

Preconditions:
✓ Test user is logged in (DATA-001)
✓ Valid payment method is added (DATA-003)

Test Steps:
1. Navigate to payment page
   ✓ Done. What do you see?
   → "Payment form appears"
   ✓ Expected: Payment form ✓ PASS
   
2. Enter payment amount: $50
   ✓ Done. What do you see?
   → "Amount field shows $50"
   ✓ Expected: Amount displayed ✓ PASS
   
3. Click 'Pay' button
   ✓ Done. What do you see?
   → "Loading spinner appears, then 'Payment successful' message"
   ✓ Expected: Payment successful ✓ PASS

Result: PASS ✓

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[... more tests ...]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Test 15 of 26: TC-015
Title: Handle payment timeout gracefully

[Test execution...]

Result: FAIL ✗

Defect Created:
ID: BUG-003
Title: Timeout error message not displayed
Severity: High
Reproduction: [Steps documented]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 EXECUTION PROGRESS

Completed: 15/26 (58%)
Current Pass Rate: 24/25 = 96%
Defects Found: 2
Blocked: 0

Estimated Time to Complete: ~45 minutes

Continue with test 16?
```

## Technical Details

- Persona: QA Engineer
- Skills triggered: Execution & Reporting Skill
- Inputs: Test cases and test data from previous commands
- Output: Execution results document
- Next command: `report`
```

- [ ] **Step 2: Commit**

```bash
git add commands/execute.md
git commit -m "feat: add execute command - test execution guidance"
```

---

### Task 20: Create report Command

**Files:**
- Create: `commands/report.md`

- [ ] **Step 1: Create report.md**

Create `commands/report.md`:
```markdown
# qa-workflow report

Generate comprehensive test execution report with metrics and insights.

## Purpose

Compile test execution results into a professional report with metrics, defect analysis, trends, and recommendations.

## Who Uses This

QA Engineer

## Command Flow

### Step 1: Load Execution Results

Load execution results from `execute` command.
Display execution summary.

### Step 2: Compile Metrics

Calculate:
- Total test cases, passed, failed, blocked, skipped
- Pass rate percentage
- Defect count and categorization
- Coverage percentage
- Execution time/duration
- Defects per feature area

### Step 3: Trend Analysis

Compare to previous cycle (if available):
- Previous pass rate vs. current
- Trend (improving/declining/stable)
- Defect count trend
- Coverage trend

Use Execution & Reporting Skill to:
- Identify patterns
- Analyze quality trajectory
- Highlight improvements or regressions

### Step 4: Defect Analysis

Analyze defects:
- Categorize by severity (critical/high/medium/low)
- Group by feature/area
- Identify patterns
- Assess impact

### Step 5: Risk Assessment

Assess overall product quality:
- Risk areas that remain
- Confidence level in quality
- Areas requiring additional testing
- Readiness for release

### Step 6: Insights & Recommendations

Generate insights:
- What went well
- What needs improvement
- Recommendations for next cycle
- Risk mitigation strategies
- Areas to focus on

### Step 7: Report Generation

Create professional test report using Report Template:
- Executive summary
- Execution summary (metrics)
- Test results (per case and per feature)
- Defect list and analysis
- Trends and analysis
- Risk assessment
- Recommendations
- Sign-off

### Step 8: Summary

Display:
- Report location
- Key metrics
- Recommendations
- Next steps

## Output

- Test Execution Report (using Report Template) with:
  - Executive summary
  - Metrics and statistics
  - Test results detailed listing
  - Defect analysis
  - Trends vs. previous cycles
  - Risk assessment
  - Recommendations
  - Ready for stakeholder review

## Example Usage

```
User: qa-workflow report

QA Workflow: Generating test execution report for Payment Processing v1.5.0

📊 Loading execution results (26 test cases)

Compiling metrics...

EXECUTION SUMMARY:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Total Test Cases: 26
Passed: 24 (92%)
Failed: 2 (8%)
Blocked: 0
Skipped: 0

Pass Rate: 92%

DEFECTS FOUND:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Critical: 2
- BUG-001: Webhook retry infinite loop
- BUG-002: Concurrent payment race condition

Medium: 1
- BUG-003: Timeout error message not shown

Total: 3 defects

RESULTS BY FEATURE:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Payment Processing: 8/8 PASS (100%)
Refund Processing: 5/6 PASS (83%)
  Failed: TC-015 (BUG-001)
Webhook Notifications: 6/7 PASS (86%)
  Failed: TC-023 (BUG-002)
Transaction History: 5/5 PASS (100%)

TREND ANALYSIS (vs. v1.4.0):
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Previous Pass Rate: 88%
Current Pass Rate: 92%
Trend: ↑ IMPROVING (+4%)

Defect Trend: ↓ IMPROVING
  v1.4.0: 5 defects
  v1.5.0: 3 defects (-40%)

RECOMMENDATIONS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. 🔴 BLOCKING: Fix critical defects (BUG-001, BUG-002) before release
2. ⚠️ IMPORTANT: Fix medium defect (BUG-003) - impacts user experience
3. 🟢 GOOD: Payment processing is solid (100% pass rate)
4. 📋 NEXT CYCLE: Add more concurrency tests for high-traffic scenarios

RELEASE READINESS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Status: NOT READY FOR RELEASE
Reason: 2 critical defects must be fixed
Recommendation: After bug fixes, run smoke test (at least TC-001, TC-008, TC-015, TC-023)

✅ Full report generated: reports/test-execution-2026-04-07.md

Report is ready for stakeholder review!
```

## Technical Details

- Persona: QA Engineer
- Skills triggered: Execution & Reporting Skill
- Inputs: Execution results from `execute` command
- Output: Test execution report (professional document)
- Next: Stakeholder review and release decisions
```

- [ ] **Step 2: Commit**

```bash
git add commands/report.md
git commit -m "feat: add report command - test report generation"
```

---

## Phase 6: Documentation

### Task 21: Create config.md

**Files:**
- Create: `config.md`

- [ ] **Step 1: Create config.md**

Create `config.md`:
```markdown
# QA Workflow Configuration

Default configuration and settings for qa-workflow plugin.

## Project Configuration

When you run `qa-workflow init`, a project config file is created with:

```json
{
  "projectName": "My Test Project",
  "description": "Project description",
  "testScope": "What's being tested",
  "teamMembers": ["member1", "member2"],
  "jiraIntegration": {
    "enabled": false,
    "cloudId": "your-domain.atlassian.net",
    "projectKey": "PRJ"
  },
  "coverageGoal": 90,
  "environment": "test"
}
```

## Command Defaults

- **init:** Creates new project with default structure
- **analyze:** Analyzes requirements, defaults to 80%+ coverage goal
- **create-tests:** Generates test cases using Test Case Generation Skill
- **prepare-data:** Organizes test data for reusability
- **review:** QA Lead review gates test plan
- **execute:** Executes tests and tracks results
- **report:** Generates report with pass rate and defects

## Test Case Naming Convention

- **Test Case IDs:** TC-001, TC-002, etc. (sequential)
- **Naming:** [Feature Area]-[Scenario] (e.g., "Login-Valid Credentials", "Payment-Timeout Error")

## Test Data Naming Convention

- **Data Set IDs:** DATA-001, DATA-002, etc. (sequential)
- **Naming:** [Type]-[Scenario] (e.g., "User-Active Premium", "Card-Visa Valid")

## Defect Naming Convention

- **Defect IDs:** BUG-001, BUG-002, etc. (sequential or from Jira)
- **Naming:** [Area]-[Issue] (e.g., "Payment-Timeout Not Shown", "Webhook-Infinite Retry")

## Jira Integration Configuration

If using Jira:

```json
{
  "jiraIntegration": {
    "enabled": true,
    "cloudId": "your-domain.atlassian.net",
    "projectKey": "PAY",
    "credentials": "stored securely",
    "syncOptions": {
      "pullRequirements": true,
      "createTestCases": false,
      "linkDefects": true,
      "updateStatus": false
    }
  }
}
```

## Best Practices

- Keep test cases focused (one scenario per case)
- Use descriptive test data names
- Document all data dependencies
- Review test quality before execution
- Track defects consistently
- Generate reports after each test cycle
- Archive old test results for trend analysis

## Support

For questions or issues, see:
- `docs/test-strategies.md` - Testing approaches
- `docs/best-practices.md` - QA best practices
- `docs/jira-setup.md` - Jira integration guide
```

- [ ] **Step 2: Commit**

```bash
git add config.md
git commit -m "feat: add config.md - configuration reference"
```

---

### Task 22: Create README.md

**Files:**
- Create: `README.md`

- [ ] **Step 1: Create README.md**

Create `README.md`:
```markdown
# QA Workflow

End-to-end QA testing workflow plugin for Claude Code. Guides QA Engineers through complete testing lifecycle:

**Requirements → Test Cases → Test Data → Review → Execute → Report**

## Quick Start

```bash
# Initialize a new QA test project
qa-workflow init

# Analyze requirements and identify test scope
qa-workflow analyze

# Generate test cases from requirements
qa-workflow create-tests

# Create and organize test data
qa-workflow prepare-data

# Review test quality (QA Lead)
qa-workflow review

# Execute tests
qa-workflow execute

# Generate test report
qa-workflow report
```

## Features

- **Requirement Analysis** - Understand scope and identify test scenarios
- **Intelligent Test Case Generation** - Auto-generate comprehensive test cases
- **Smart Test Data Management** - Organize reusable, well-documented test data
- **Quality Review Gates** - QA Lead validation before execution
- **Test Execution Guidance** - Step-by-step test execution tracking
- **Professional Reporting** - Metrics, defects, trends, and insights
- **Optional Jira Integration** - Pull requirements, link defects, track status

## Who's It For?

- **QA Engineers** - Create, manage, execute, and report on tests
- **QA Leads** - Review quality, approve test plans, assess risk
- **Product Teams** - Professional test reports with metrics and trends

## Workflow Overview

### 1. Init
Initialize a new test project, optionally integrate with Jira.

### 2. Analyze
Understand requirements, identify test scenarios, define strategy.

### 3. Create Test Cases
Generate comprehensive test cases covering all scenarios.

### 4. Prepare Test Data
Create reusable, well-organized test data sets.

### 5. Review (QA Lead)
Quality gate: verify coverage, validate clarity, assess risk.

### 6. Execute
Execute tests step-by-step, track results, document defects.

### 7. Report
Generate professional test report with metrics, trends, recommendations.

## Structure

```
qa-workflow/
├── commands/         - 7 workflow commands
├── agents/          - QA Engineer & QA Lead personas
├── skills/          - Test generation, data mgmt, review, reporting
├── templates/       - Test case, data, review, report formats
├── docs/            - Guides and documentation
└── lib/             - Library code (Jira integration)
```

## Documentation

- `docs/test-strategies.md` - Testing methodologies and approaches
- `docs/best-practices.md` - QA best practices and guidelines
- `docs/jira-setup.md` - Jira integration setup guide
- `config.md` - Configuration reference

## Commands

- `qa-workflow init` - Initialize project
- `qa-workflow analyze` - Analyze requirements
- `qa-workflow create-tests` - Generate test cases
- `qa-workflow prepare-data` - Create test data
- `qa-workflow review` - Quality review (QA Lead)
- `qa-workflow execute` - Execute tests
- `qa-workflow report` - Generate report

## Personas

- **QA Engineer** - Primary executor, creates and manages tests
- **QA Lead** - Reviewer, approves test plans, assesses quality

## Skills

- **Test Case Generation** - Create comprehensive, well-formed test cases
- **Test Data Management** - Organize and structure test data
- **Coverage & Quality Review** - Validate quality and completeness
- **Execution & Reporting** - Guide execution and generate insights

## License

MIT

## Contributing

We welcome contributions! Please see CONTRIBUTING.md for guidelines.

## Support

For questions, issues, or feedback:
- Check documentation in `docs/`
- Review examples in `docs/examples/`
- Open an issue on GitHub

---

**Ready to streamline your QA workflow? Let's get started:**

```bash
qa-workflow init
```
```

- [ ] **Step 2: Commit**

```bash
git add README.md
git commit -m "feat: add README.md - project overview and quick start"
```

---

### Task 23: Create CLAUDE.md

**Files:**
- Create: `CLAUDE.md`

- [ ] **Step 1: Create CLAUDE.md**

Create `CLAUDE.md`:
```markdown
# Claude Code Integration Configuration

QA Workflow plugin integration with Claude Code.

## Plugin Registration

The qa-workflow plugin is registered in Claude Code via:
- `.claude-plugin/plugin.json` - Plugin metadata and commands
- `.claude-plugin/marketplace.json` - Marketplace listing

## Available Commands

### Primary Commands

1. **qa-workflow init**
   - Initialize new QA project
   - Configure Jira integration (optional)
   - Used by: QA Engineer

2. **qa-workflow analyze**
   - Analyze requirements, identify scenarios
   - Used by: QA Engineer

3. **qa-workflow create-tests**
   - Generate test cases from requirements
   - Triggers: Test Case Generation Skill
   - Used by: QA Engineer

4. **qa-workflow prepare-data**
   - Create and organize test data
   - Triggers: Test Data Management Skill
   - Used by: QA Engineer

5. **qa-workflow review**
   - Quality review of test cases (QA Lead gate)
   - Triggers: Coverage & Quality Review Skill
   - Used by: QA Lead

6. **qa-workflow execute**
   - Execute tests and track results
   - Triggers: Execution & Reporting Skill
   - Used by: QA Engineer

7. **qa-workflow report**
   - Generate test execution report
   - Triggers: Execution & Reporting Skill
   - Used by: QA Engineer

## Available Agents/Personas

- **qa-engineer** - QA Engineer executor persona
- **qa-lead** - QA Lead reviewer persona

## Available Skills

- **test-case-generation** - Test case creation and validation
- **test-data-management** - Test data organization
- **coverage-review** - Quality and coverage review
- **execution-reporting** - Test execution and report generation

## Usage in Claude Code

### Invoking Commands

```
/qa-workflow init
/qa-workflow analyze
/qa-workflow create-tests
/qa-workflow prepare-data
/qa-workflow review
/qa-workflow execute
/qa-workflow report
```

### Using Agents

Commands automatically use appropriate agent:
- `init`, `analyze`, `create-tests`, `prepare-data`, `execute`, `report` → QA Engineer
- `review` → QA Lead

### Using Skills

Commands trigger skills automatically based on context:
- `create-tests` → Test Case Generation Skill
- `prepare-data` → Test Data Management Skill
- `review` → Coverage & Quality Review Skill
- `execute`, `report` → Execution & Reporting Skill

## Workflow Integration

QA Workflow integrates with Claude Code's workflow engine to:
- Guide step-by-step through testing lifecycle
- Maintain context across commands
- Generate and manage output documents
- Track progress through test cycle

## Jira Integration

Optional Jira integration available:
- Pull requirements from Jira
- Create test case issues in Jira
- Link failures to bug tickets
- Update ticket status

See `docs/jira-setup.md` for setup instructions.

## Output Generation

All outputs are generated as Markdown documents:
- Test case documents
- Test data specifications
- Review reports
- Test execution reports

Documents are version-control friendly and can be shared, archived, and tracked.

## Performance Notes

- Test case generation: ~2-5 minutes for 20-30 cases
- Data preparation: ~3-5 minutes for 20-30 cases
- Test execution guidance: Depends on test count (~10-15 min per test)
- Report generation: ~2 minutes

## Troubleshooting

- **Plugin not appearing in Claude Code:** Verify `.claude-plugin/plugin.json` is valid
- **Jira integration issues:** Check Jira credentials in project config
- **Missing output files:** Verify write permissions in project directory
- **Command not found:** Run `qa-workflow init` first to set up project

## Development Notes

- Plugin uses Markdown-based architecture for easy editing and version control
- Each command, agent, skill is self-contained and modular
- Templates are reusable and customizable
- Integration points with Claude Code are in `.claude-plugin/`

## Next Steps

1. Review `docs/test-strategies.md` for testing methodologies
2. Check `docs/jira-setup.md` if using Jira
3. Run `qa-workflow init` to start a project
4. Refer to `docs/examples/` for sample test cases and data
```

- [ ] **Step 2: Commit**

```bash
git add CLAUDE.md
git commit -m "feat: add CLAUDE.md - Claude Code integration configuration"
```

---

### Task 24: Create Supporting Documentation

**Files:**
- Create: `docs/test-strategies.md`
- Create: `docs/best-practices.md`
- Create: `docs/jira-setup.md`

- [ ] **Step 1: Create test-strategies.md**

Create `docs/test-strategies.md`:
```markdown
# QA Testing Strategies

Common testing approaches and methodologies for use with qa-workflow.

## Testing Approaches

### Manual Testing
- QA Engineer executes tests manually
- Best for: UI/UX testing, exploratory testing, user workflows
- When to use: Rapid feedback, complex user interactions, new features

### Automated Testing Reference
- QA Workflow documents test cases that can be automated
- Provides test case documentation for automation engineers
- Includes steps for translating to automation scripts

### Hybrid Approach
- Mix of manual and automated testing
- Manual: Complex UI interactions, exploratory
- Automated: Repetitive scenarios, regression testing, data validation

## Coverage Strategies

### Requirement-Based Coverage
- Every requirement has at least one test case
- Goal: 90%+ of requirements covered
- Validates: All planned functionality works as specified

### Risk-Based Coverage
- High-risk areas (critical features, complex logic) get more tests
- Low-risk areas (simple features, well-tested code) get fewer tests
- Optimizes: Testing effort based on risk and business impact

### Scenario-Based Coverage
- Identify key user scenarios and workflows
- Create test cases for: Happy path, alternatives, error cases
- Validates: Common user workflows work correctly

## Test Case Design Patterns

### Happy Path Testing
- User performs normal, expected steps
- System behaves as designed
- Tests the main workflow

### Boundary Testing
- Test minimum and maximum values
- Test transitions between valid/invalid states
- Finds off-by-one errors, boundary logic issues

### Error Path Testing
- Invalid input, missing data, permission errors
- System handles errors gracefully
- Tests error handling and messaging

### State-Based Testing
- Test transitions between system states
- Verify state consistency
- Tests stateful behavior

### Integration Testing
- Multiple components interact
- Data flows correctly between systems
- Validates end-to-end workflows

## Test Data Strategies

### Minimal Data
- Just enough data to run the test
- Faster setup, easier to understand
- Best for: Unit-level tests, isolated scenarios

### Representative Data
- Data that mimics production patterns
- Realistic values and combinations
- Best for: Integration tests, user workflows

### Edge Case Data
- Boundary values, empty sets, maximum limits
- Tests system limits and edge cases
- Best for: Robustness testing

## Defect Classification

### By Severity

- **Critical:** Core functionality broken, blocks workflow
- **High:** Important feature broken, workaround may exist
- **Medium:** Non-critical feature broken, has workaround
- **Low:** Minor issue, cosmetic or nice-to-have

### By Type

- **Functional:** Feature doesn't work as specified
- **Performance:** Slower than expected
- **Security:** Vulnerability or security issue
- **Usability:** Confusing or difficult to use
- **Data:** Data integrity or consistency issue

## Coverage Goals

**Typical coverage targets:**
- Requirements coverage: 90%+ (all major requirements tested)
- Feature coverage: 95%+ (all major features tested)
- Risk-based coverage: 100% of high-risk items tested

## Testing Best Practices

1. **Test Pyramid:** More unit tests, fewer integration tests, even fewer E2E tests
2. **Independent Tests:** Each test case is independent, can run in any order
3. **Repeatable Results:** Same test produces same result every time
4. **Clear Expected Results:** Know exactly what success looks like
5. **Minimal Test Data:** Only test what you need to test
6. **Isolated Test Data:** Test data doesn't affect other tests
7. **Fast Feedback:** Tests run quickly (minutes, not hours)
8. **Meaningful Names:** Test names describe what they test

## Workflow Selection Guide

**Use Scenario-Based when:**
- Requirements are user-centric
- Focus is on user workflows
- Testing new features

**Use Risk-Based when:**
- Time/resources are limited
- Some areas are higher risk
- Need to prioritize testing effort

**Use Requirement-Based when:**
- Requirements are clear and detailed
- Compliance/validation needed
- Want comprehensive coverage
```

- [ ] **Step 2: Create best-practices.md**

Create `docs/best-practices.md`:
```markdown
# QA Best Practices

Guidelines and best practices for effective QA testing with qa-workflow.

## Test Case Design

### ✓ DO:
- Write clear, specific test case titles
- Make each test case test ONE thing
- Use exact field names, button labels, menu paths
- Include all necessary preconditions
- Write specific, measurable expected results
- Link test cases to requirements
- Use consistent formatting (follow template)

### ✗ DON'T:
- Create test cases that test multiple scenarios
- Use vague expected results like "works correctly"
- Skip preconditions to save time
- Use ambiguous step descriptions
- Create test cases without clear purpose
- Assume tester knowledge

### Example - BAD vs. GOOD

**BAD:**
```
Title: Test Login
Preconditions: User exists
Steps: Login with user
Expected: Login works
```

**GOOD:**
```
Title: Login with valid email and password
Preconditions: 
  - User john@example.com exists in system
  - User password is "Test123!"
Steps:
  1. Navigate to https://app.example.com/login
  2. Enter email: john@example.com in "Email" field
  3. Enter password: Test123! in "Password" field
  4. Click "Login" button
Expected: 
  - User redirects to dashboard
  - Dashboard displays "Welcome John"
  - Login timestamp is logged
```

## Test Data Management

### ✓ DO:
- Create reusable data sets
- Document data dependencies clearly
- Include setup and cleanup steps
- Use realistic but safe test data
- Mask sensitive information
- Organize data by scenario/feature
- Version control test data

### ✗ DON'T:
- Create unique data for each test (redundant)
- Use production data in tests
- Forget cleanup procedures
- Create test data without documenting it
- Leave test data orphaned in systems
- Use hardcoded values in test documentation

## Test Execution

### ✓ DO:
- Follow test steps exactly as written
- Observe results carefully before recording
- Document actual results (not just "pass/fail")
- Record any environmental issues
- Create defects for failures
- Verify test environment setup before starting
- Track execution progress

### ✗ DON'T:
- Guess whether tests pass/fail
- Skip steps to save time
- Execute from memory instead of documentation
- Record results without verification
- Assume results without looking
- Mix multiple tests together

## Defect Reporting

### ✓ DO:
- Include clear steps to reproduce
- Record exact error messages and codes
- Attach supporting evidence (screenshots, logs)
- Assess severity appropriately
- Link defects to test cases
- Include environment info (browser, OS, etc.)
- Be specific about what failed

### ✗ DON'T:
- Report vague defects ("something's broken")
- Forget reproduction steps
- Assume developer knows what you mean
- Mislabel severity (everything is "critical")
- Report without evidence
- Report on wrong environment

### Defect Report Template

```
Title: [Specific issue description]
Severity: [Critical/High/Medium/Low]
Steps to Reproduce:
  1. [Step 1]
  2. [Step 2]
  3. [Expected result, but...]
Expected: [What should happen]
Actual: [What actually happens]
Error Message: [If applicable]
Evidence: [Screenshot, log file, etc.]
Environment: [Browser, OS, version, etc.]
Test Case: [TC-XXX]
```

## Review Process

### As QA Engineer:
- Provide context when asking for review
- Be open to feedback
- Ask clarifying questions about requirements
- Revise based on review feedback
- Verify fixes address all review comments

### As QA Lead:
- Provide constructive, specific feedback
- Explain why revisions are needed
- Approve when quality standards are met
- Document sign-off clearly
- Be available for clarification

## Documentation

### ✓ DO:
- Keep test cases up-to-date with code changes
- Document reasons for test cases
- Include examples in documentation
- Version control all documentation
- Archive old test cycles for reference
- Write clear, concise descriptions

### ✗ DON'T:
- Let test documentation become stale
- Write cryptic or unclear descriptions
- Forget to update when requirements change
- Delete old test cases without archiving
- Assume readers understand context

## Performance & Efficiency

### Tips for Faster Execution:
1. **Organize test cases smartly** - Run related tests together
2. **Prepare test data efficiently** - Create reusable data sets
3. **Parallel execution** - Run independent tests in parallel if possible
4. **Minimize manual steps** - Automate repetitive setup/teardown
5. **Use checklists** - Have quick reference guides for common tasks

### Tips for Better Coverage:
1. **Think like a user** - Test real user scenarios
2. **Consider edge cases** - What could break?
3. **Test error paths** - What happens on failure?
4. **Check combinations** - How do features interact?
5. **Risk-prioritize** - Test high-risk areas thoroughly

## Team Collaboration

### Good Communication:
- Be clear about what you're testing and why
- Share test cases and data with team
- Document decisions and assumptions
- Discuss complex scenarios before testing
- Provide constructive feedback

### Version Control Best Practices:
- Commit test changes regularly
- Write clear commit messages
- Review changes before committing
- Archive completed test cycles
- Tag releases with test status

## Common Pitfalls to Avoid

1. **Testing Too Late** - Start testing requirements, not just code
2. **Insufficient Coverage** - Make sure all requirements are tested
3. **Unclear Test Cases** - Be specific, not vague
4. **Poor Test Data** - Invest in good test data
5. **No Documentation** - Document everything
6. **Rushing Execution** - Take time to execute thoroughly
7. **Ignoring Trends** - Learn from past test cycles
8. **No Risk Assessment** - Prioritize based on risk
```

- [ ] **Step 3: Create jira-setup.md**

Create `docs/jira-setup.md`:
```markdown
# Jira Integration Setup

Configure qa-workflow to integrate with Jira for requirements and defect tracking.

## Prerequisites

- Jira Cloud account with API access
- Jira project created for your software
- Jira API token generated for your account

## Setup Steps

### Step 1: Generate Jira API Token

1. Log in to Jira Cloud
2. Go to Settings > Security > API tokens
3. Click "Create token"
4. Name it (e.g., "qa-workflow-token")
5. Click "Create"
6. Copy the token (you'll need it below)

### Step 2: Initialize qa-workflow with Jira

Run:
```bash
qa-workflow init
```

When prompted:
```
Project name: My Project Name
Description: Project description

Do you want to integrate with Jira? (y/n): y

Jira Cloud ID: your-domain.atlassian.net
Jira Project Key: PROJ

Jira Email: your-email@example.com
Jira API Token: [paste token from Step 1]

Testing Jira connection...
✓ Connection successful!
```

### Step 3: Verify Integration

Test the integration:
```bash
qa-workflow analyze
```

If Jira is configured, you'll be prompted to pull requirements from Jira:
```
Where are your requirements?
[1] Upload document
[2] Paste requirements
[3] Jira project (PROJ) ← Select this
[4] Other source

Select: 3
Pulling requirements from Jira project PROJ...
✓ Found 12 issues
```

## Features Enabled with Jira Integration

### Pull Requirements
```
qa-workflow analyze
→ Can pull requirements from Jira issues
→ Automatically extract acceptance criteria
```

### Create Test Cases in Jira (Optional)
```
qa-workflow create-tests
→ Optionally create test case issues in Jira
→ Link to requirement issues
```

### Link Defects to Jira
```
qa-workflow execute
→ Create Jira bugs from test failures
→ Automatically link to test cases
→ Include reproduction steps
```

### Update Jira Status (Optional)
```
qa-workflow report
→ Update requirement status based on test results
→ Track testing progress in Jira
```

## Project Configuration

Jira settings are stored in `qa-workflow/project-config.json`:

```json
{
  "jiraIntegration": {
    "enabled": true,
    "cloudId": "your-domain.atlassian.net",
    "projectKey": "PROJ",
    "syncOptions": {
      "pullRequirements": true,
      "createTestCases": false,
      "linkDefects": true,
      "updateStatus": false
    }
  }
}
```

### Options

- **pullRequirements:** Pull requirements from Jira (recommended: true)
- **createTestCases:** Create test case issues in Jira (recommended: false initially)
- **linkDefects:** Link test failures to Jira bugs (recommended: true)
- **updateStatus:** Auto-update Jira issue status (recommended: false initially)

## Troubleshooting

### "Connection failed"
- Verify Jira Cloud ID is correct
- Verify API token is valid and not expired
- Check network access to Jira

### "Project not found"
- Verify project key matches your Jira project
- Ensure you have access to the project

### "Permission denied"
- Verify API token has required permissions
- Check user has project access in Jira

### Requirements not showing up
- Verify issues are in the correct project
- Check issue type is recognized (Story, Task, etc.)
- Verify issues have acceptance criteria

## Disabling Jira Integration

To work standalone without Jira:

In `qa-workflow/project-config.json`, set:
```json
{
  "jiraIntegration": {
    "enabled": false
  }
}
```

Or run `qa-workflow init` again and choose not to integrate with Jira.

## Best Practices

1. **Organize Requirements in Jira First**
   - Create clear stories with acceptance criteria
   - Use consistent naming and labeling
   - Keep requirements up-to-date

2. **Link Test Cases to Requirements**
   - Each test case should link to a requirement
   - Helps track coverage in Jira

3. **Use Standard Issue Types**
   - Story, Task, Bug are recognized
   - Custom issue types may not work

4. **Secure Your API Token**
   - Don't share tokens
   - Rotate tokens regularly
   - Use tokens instead of passwords

5. **Regular Syncs**
   - Pull requirements at cycle start
   - Link defects as they're found
   - Update status after testing

## Advanced: Custom Issue Mapping

For custom Jira configurations, edit the Jira integration settings. By default, qa-workflow maps:
- Jira Stories → Requirements
- Test executions → Jira Issues
- Test failures → Jira Bugs

Contact support for custom mappings.

## Support

For Jira integration issues:
- Verify Jira Cloud access
- Check API token permissions
- Review Jira documentation
- Contact Jira support if needed
```

- [ ] **Step 4: Commit**

```bash
git add docs/test-strategies.md docs/best-practices.md docs/jira-setup.md
git commit -m "feat: add documentation (test strategies, best practices, Jira setup)"
```

---

## Phase 7: Scripts & Utilities

### Task 25: Create setup.sh Script

**Files:**
- Create: `scripts/setup.sh`

- [ ] **Step 1: Create setup.sh**

Create `scripts/setup.sh`:
```bash
#!/bin/bash

# QA Workflow Setup Script
# Initializes a new qa-workflow project

set -e

echo "======================================"
echo "QA Workflow Project Setup"
echo "======================================"
echo ""

# Check if node/npm is available
if ! command -v node &> /dev/null; then
    echo "⚠️  Node.js not found. Some features may not work."
    echo "   Please install Node.js from https://nodejs.org"
fi

# Create directories
echo "📁 Creating project directories..."
mkdir -p qa-workflow/{commands,agents,skills,templates,docs/examples,lib,scripts,bin}
mkdir -p qa-workflow/{test-cases,test-data,test-results,reports}

# Create basic files
echo "📄 Creating project files..."

# .gitignore
cat > qa-workflow/.gitignore << 'EOF'
node_modules/
package-lock.json
test-results/
coverage/
*.log
.env
.DS_Store
*.swp
*.tmp
EOF

# package.json
cat > qa-workflow/package.json << 'EOF'
{
  "name": "qa-workflow",
  "version": "0.1.0",
  "description": "End-to-end QA testing workflow plugin",
  "license": "MIT"
}
EOF

# Initialize git
if [ ! -d "qa-workflow/.git" ]; then
    echo "🔧 Initializing git repository..."
    cd qa-workflow
    git init
    git add .
    git commit -m "initial: Project setup"
    cd ..
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. cd qa-workflow"
echo "2. qa-workflow init"
echo "3. qa-workflow analyze"
echo ""
```

Make it executable:
```bash
chmod +x scripts/setup.sh
```

- [ ] **Step 2: Commit**

```bash
git add scripts/setup.sh
git commit -m "feat: add setup.sh - project initialization script"
```

---

## Self-Review

Let me verify the plan against the design specification:

**Spec Coverage Check:**
- ✅ 7 commands (init, analyze, create-tests, prepare-data, review, execute, report)
- ✅ 2 personas (QA Engineer, QA Lead)
- ✅ 4 skills (test-case-generation, test-data-management, coverage-review, execution-reporting)
- ✅ 4 templates (test-case, test-data, review, report)
- ✅ Directory structure documented
- ✅ Jira integration designed
- ✅ Plugin metadata (plugin.json, marketplace.json)
- ✅ Documentation (README, config, CLAUDE.md, strategies, best practices, Jira setup)

**No Placeholders Check:**
- ✅ All files have complete content
- ✅ All code snippets are actual code, not pseudo-code
- ✅ All examples are realistic and complete
- ✅ All workflows include specific steps

**Consistency Check:**
- ✅ File paths are exact and consistent
- ✅ Command names are consistent
- ✅ Persona references are consistent
- ✅ File structure matches design

**Plan Completeness:**
- ✅ Setup phase (5 tasks)
- ✅ Personas phase (2 tasks)
- ✅ Skills phase (4 tasks)
- ✅ Templates phase (4 tasks)
- ✅ Commands phase (7 tasks)
- ✅ Documentation phase (3 tasks)
- ✅ Scripts phase (1 task)

---

## Implementation Approach

**Recommended Execution:** Use superpowers:subagent-driven-development for parallel, independent file creation tasks. Tasks are organized for efficiency:
- Phase 1-2: Sequential (setup dependencies)
- Phase 3-7: Can be highly parallelized (independent file creation)

**Frequency of Commits:** Each task ends with a commit for atomicity and tracking.

**Testing Strategy:** Each file is self-contained Markdown, so testing is verification of:
- Markdown syntax validity
- File path correctness
- Content completeness
- Format consistency with templates

---

**Plan Status:** ✅ Complete and ready for implementation

**Saved to:** `/home/lap-0113/Office/AI/qa-workflow/docs/superpowers/plans/2026-04-07-qa-workflow-implementation.md`

---

## Execution Options

Plan complete and saved to `docs/superpowers/plans/2026-04-07-qa-workflow-implementation.md`. Two execution options:

**1. Subagent-Driven (recommended)** 
- I dispatch a fresh subagent per task
- Review between tasks
- Fast iteration with checkpoints

**2. Inline Execution** 
- Execute tasks in this session
- Batch execution with checkpoints for review

**Which approach?**