---
name: QA Workflow Plugin Design
description: Claude Code plugin for end-to-end QA testing workflow with test case generation, data management, review, execution, and reporting
type: design
date: 2026-04-07
---

# QA Workflow Plugin Design

## Overview

**qa-workflow** is a Claude Code plugin that guides QA Engineers through a complete testing lifecycle: analyzing requirements → creating test cases → preparing test data → reviewing quality → executing tests → generating reports.

The plugin follows the proven ba-workflow pattern with QA-specific customization, featuring two personas (QA Engineer & QA Lead), specialized skills for each workflow phase, and optional Jira integration for teams using Jira.

## 1. Purpose & Scope

**Primary User:** QA Engineer

**Primary Goal:** Streamline the entire QA testing process—from understanding requirements to delivering comprehensive test reports—with AI-assisted test case generation, quality review gates, and automated report generation.

**Key Outcomes:**
- Comprehensive, well-documented test cases linked to requirements
- Organized, reusable test data
- Validated test quality before execution
- Tracked test execution results with insights
- Professional test reports with metrics and trends

## 2. Workflow & Commands

The plugin provides 7 sequential commands that guide the QA Engineer through the complete workflow:

### **Command: init**
- **Purpose:** Initialize a new QA test project
- **User:** QA Engineer
- **Flow:** 
  - Prompt for project name, description, scope
  - Optional: Link to Jira (provide cloud ID, project key)
  - Create project structure and baseline documentation
- **Output:** Project initialized with metadata, ready for next steps

### **Command: analyze**
- **Purpose:** Understand requirements and identify test scope
- **User:** QA Engineer
- **Flow:**
  - Import requirements (upload document, paste text, or pull from Jira if integrated)
  - Analyze requirements to identify test scenarios, actors, workflows
  - Identify scope boundaries, out-of-scope items, risk areas
  - Document assumptions and test strategy
- **Output:** Requirement analysis document with identified test scenarios

### **Command: create-tests**
- **Purpose:** Generate test cases from analyzed requirements
- **User:** QA Engineer
- **Flow:**
  - Review requirement analysis
  - Auto-generate test cases covering all scenarios
  - For each case: scenario, preconditions, steps, expected results, test data needs
  - QA Engineer reviews and refines generated cases
  - Add edge cases, error scenarios, non-functional tests as needed
- **Output:** Comprehensive test case document (ready for review phase)

### **Command: prepare-data**
- **Purpose:** Create and organize test data needed for test execution
- **User:** QA Engineer
- **Flow:**
  - Analyze test cases to identify data requirements
  - Generate/organize test data sets (mock data, fixtures, etc.)
  - Document data dependencies and setup instructions
  - Create cleanup/teardown procedures
  - Link data sets to specific test cases
- **Output:** Test data document with organized data sets and setup guides

### **Command: review**
- **Purpose:** Quality review of test cases and test data (QA Lead gate)
- **User:** QA Lead
- **Flow:**
  - Review test case document for coverage completeness
  - Validate acceptance criteria clarity and testability
  - Assess risk coverage and edge cases
  - Review test data organization and completeness
  - Provide feedback and approve or request changes
- **Output:** Review report with approval sign-off (or revision requests)

### **Command: execute**
- **Purpose:** Guide test execution and track results
- **User:** QA Engineer
- **Flow:**
  - Set up test environment and data
  - Execute test cases step-by-step (manual or automated reference)
  - Record results: pass/fail, actual vs. expected, defect links
  - Optional: Create Jira bugs if failures found (if Jira integrated)
  - Track execution progress and metrics
- **Output:** Test execution results with per-case status and defect links

### **Command: report**
- **Purpose:** Generate comprehensive test report with metrics and insights
- **User:** QA Engineer
- **Flow:**
  - Compile execution results into structured report
  - Calculate metrics: pass rate, coverage, defect density
  - Identify trends vs. previous runs (if available)
  - Generate risk assessment and recommendations
  - Create professional, shareable report
- **Output:** Test report (Markdown or exportable format)

## 3. Personas

### **QA Engineer**
- **Role:** Primary executor of the testing workflow
- **Responsibilities:** 
  - Understand requirements (analyze command)
  - Create test cases (create-tests command)
  - Prepare test data (prepare-data command)
  - Execute tests and track results (execute command)
  - Generate reports (report command)
- **Perspective:** Practical, detail-oriented, focused on coverage and execution quality
- **Expertise:** Testing methodologies, test case design, edge case thinking

### **QA Lead**
- **Role:** Quality gate for test case and strategy validation
- **Responsibilities:**
  - Review test case completeness and quality (review command)
  - Approve test strategy and coverage
  - Provide feedback and enforce quality standards
- **Perspective:** Strategic, focused on completeness and risk coverage
- **Expertise:** Test strategy, risk assessment, quality assurance best practices

## 4. Skills (Quality Modules)

### **Test Case Generation Skill**
- **Purpose:** Assist in creating comprehensive, well-formed test cases
- **Triggers:** During `create-tests` command
- **Responsibilities:**
  - Guide QA Engineer through test case creation
  - Suggest scenarios and edge cases based on requirements
  - Ensure each test case has: scenario, preconditions, steps, expected results, data needs
  - Validate test case clarity and testability
  - Identify coverage gaps
- **Output:** Well-formed test case documents

### **Test Data Management Skill**
- **Purpose:** Organize and structure test data efficiently
- **Triggers:** During `prepare-data` command
- **Responsibilities:**
  - Analyze test cases for data requirements
  - Help organize test data (mock data, fixtures, environments)
  - Identify data dependencies and relationships
  - Guide setup and cleanup procedures
  - Document data lineage (which cases use which data)
- **Output:** Organized test data sets with documentation

### **Coverage & Quality Review Skill**
- **Purpose:** Validate test case quality and completeness
- **Triggers:** During `review` command (QA Lead uses)
- **Responsibilities:**
  - Assess coverage completeness (% of requirements covered)
  - Validate acceptance criteria are clear and testable
  - Identify gaps in scenario coverage
  - Risk assessment (what could break, what's at risk)
  - Provide improvement suggestions
  - Gate approval/rejection
- **Output:** Review report with approval/revision requests

### **Execution & Reporting Skill**
- **Purpose:** Guide test execution and generate insights
- **Triggers:** During `execute` and `report` commands
- **Responsibilities:**
  - Guide step-by-step test execution
  - Capture results (pass/fail, defect links, notes)
  - Aggregate execution metrics (pass rate, defect density, coverage)
  - Analyze trends vs. previous runs
  - Generate insights and recommendations
- **Output:** Execution results and comprehensive test reports

## 5. Templates & Output Formats

### **Test Case Template**
```
# Test Case: [ID]

**Title:** [Clear, descriptive title]
**Description:** [What this test validates]

## Preconditions
- [Prerequisite 1]
- [Prerequisite 2]

## Test Steps
1. [Step 1]
2. [Step 2]
3. [Step N]

## Expected Result
[What should happen]

## Actual Result
[What actually happened - filled during execution]

## Status
[ ] Pass  [ ] Fail  [ ] Blocked

## Test Data Required
- [Data set 1]
- [Data set 2]

## Linked Requirement
[Requirement ID/link]

## Risk Level
[ ] Critical  [ ] High  [ ] Medium  [ ] Low

## Notes
[Any additional notes]
```

### **Test Data Template**
```
# Test Data: [Data Set ID]

**Purpose:** [What scenario this data supports]
**Scope:** [Where/when this data is used]

## Data Records

### Data Set 1: [Name]
| Field | Value | Notes |
|-------|-------|-------|
| id | 123 | |
| name | John Doe | |

## Setup Instructions
[Steps to set up this data]

## Dependencies
- [Depends on: Data Set X]

## Cleanup Procedures
[Steps to clean up after test]

## Used By
- Test Case: TC-001
- Test Case: TC-003

## Notes
[Any additional context]
```

### **Test Review Template**
```
# Test Review Report

**Project:** [Project name]
**Reviewed By:** [QA Lead name]
**Review Date:** [Date]

## Coverage Analysis
- Total Requirements: N
- Requirements Covered: N (X%)
- Requirements Not Covered: N
- Coverage Gaps: [List gaps]

## Test Case Quality
- Total Test Cases: N
- Clear Preconditions: Y/N
- Clear Expected Results: Y/N
- Testable Criteria: Y/N
- Edge Cases Covered: Y/N

## Findings & Recommendations
### Critical Issues
- [Issue 1]
- [Issue 2]

### Suggestions
- [Suggestion 1]
- [Suggestion 2]

## Risk Assessment
- [Risk: High/Medium/Low]

## Approval
- [ ] Approved
- [ ] Approved with revisions
- [ ] Rejected - Requires major changes

## Sign-off
QA Lead: ____________  Date: ____________
```

### **Test Execution Report Template**
```
# Test Execution Report

**Project:** [Project name]
**Test Cycle:** [Cycle name/date]
**Executed By:** [QA Engineer name]
**Execution Date:** [Date range]

## Execution Summary
- Total Test Cases: N
- Passed: N (X%)
- Failed: N (X%)
- Blocked: N (X%)
- Skipped: N (X%)

## Test Case Results
| Test ID | Title | Status | Defect ID | Notes |
|---------|-------|--------|-----------|-------|
| TC-001 | [Title] | Pass/Fail | [BUG-123] | [Notes] |

## Defects Found
| Defect ID | Title | Severity | Status | Test Case |
|-----------|-------|----------|--------|-----------|
| BUG-001 | [Title] | High | Open | TC-005 |

## Trends
- Previous Cycle Pass Rate: X%
- Current Cycle Pass Rate: X%
- Trend: [Improving/Declining/Stable]

## Risk Assessment
- Current Risk Level: [High/Medium/Low]
- Recommendations: [What needs attention]

## Notes
[Summary and additional observations]
```

## 6. Directory Structure

```
qa-workflow/
├── .claude-plugin/
│   ├── marketplace.json            # Marketplace listing metadata
│   └── plugin.json                 # Plugin configuration
├── commands/
│   ├── init.md                     # Initialize QA project
│   ├── analyze.md                  # Analyze requirements
│   ├── create-tests.md             # Generate test cases
│   ├── prepare-data.md             # Prepare test data
│   ├── review.md                   # Review test cases
│   ├── execute.md                  # Execute tests
│   └── report.md                   # Generate test report
├── agents/
│   ├── qa-engineer.md              # QA Engineer persona
│   └── qa-lead.md                  # QA Lead persona
├── skills/
│   ├── test-case-generation.md     # Generate test cases skill
│   ├── test-data-management.md     # Manage test data skill
│   ├── coverage-review.md          # Coverage & quality review skill
│   └── execution-reporting.md      # Test execution & reporting skill
├── templates/
│   ├── test-case-template.md       # Test case format
│   ├── test-data-template.md       # Test data format
│   ├── review-template.md          # Review format
│   └── report-template.md          # Report format
├── docs/
│   ├── test-strategies.md          # Testing approaches & methodologies
│   ├── jira-setup.md               # Jira integration guide
│   ├── best-practices.md           # QA best practices
│   └── examples/                   # Example test cases & data
├── lib/
│   └── jira-integration.js         # Jira API client (optional)
├── scripts/
│   └── setup.sh                    # Initialize new test project
├── bin/
│   └── qa-workflow                 # CLI entry point
├── .gitignore
├── LICENSE
├── README.md                       # Project overview
├── CLAUDE.md                       # Claude Code integration config
├── config.md                       # Default configuration & settings
└── package-lock.json
```

## 7. Jira Integration (Optional)

### **How It Works**
- During `init`, user can optionally link Jira (provide cloud ID, project key)
- Commands detect Jira context and offer integration options
- User can choose "Use Jira" or "Work standalone" for any command
- All Jira operations are optional; workflow functions fully without Jira

### **Integration Points**
- **analyze:** Pull requirements from Jira tickets
- **create-tests:** Link test cases to Jira stories
- **execute:** Link test failures to bug tickets
- **report:** Update Jira ticket status with test results

### **Implementation**
- Use Jira REST API via authenticated client
- Store Jira connection metadata in project config
- Graceful fallback if Jira unavailable or not configured

## 8. Success Criteria

The qa-workflow will be successful when:

1. **QA Engineers can quickly generate comprehensive test cases** from requirements with minimal manual effort
2. **Test quality is validated** before execution through the review gate
3. **Test data is organized and reusable** across test cycles
4. **Test execution results are tracked and reported** with clear metrics
5. **Optional Jira integration** streamlines workflows for teams using Jira
6. **The plugin follows ba-workflow patterns** for consistency and familiarity
7. **All outputs are Markdown-based** for version control and easy sharing

## 9. Implementation Phases

### Phase 1: Core Workflow (Commands 1-7)
- Implement all 7 commands with basic functionality
- Create agent personas and skill definitions
- Develop all templates
- Test end-to-end workflow

### Phase 2: Skills & Quality Gates
- Implement full Test Case Generation Skill logic
- Implement Coverage & Review Skill logic
- Add validation and quality checks
- Test review and revision workflows

### Phase 3: Jira Integration
- Implement Jira API client
- Add Jira linking to commands
- Test with real Jira instance
- Document Jira setup

### Phase 4: Polish & Documentation
- Write comprehensive README
- Create examples and tutorials
- Test edge cases
- Package for marketplace

---

**Design Status:** ✅ Approved by user
**Next Step:** Create implementation plan via writing-plans skill
