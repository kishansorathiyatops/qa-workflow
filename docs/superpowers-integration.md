# QA Workflow - Superpowers Integration Guide

## Overview

This document outlines how superpowers (brainstorm, write-plan, execute-plan) are integrated throughout the QA workflow to ensure best practices and optimal execution.

---

## Superpowers Integration Map

### Complete Workflow with Superpowers

```
1. qa-workflow init
   └─ Initialize with Jira Ticket ID

2. qa-workflow analyze
   └─ [New] superpowers:write-plan
      Create Testing Strategy Plan

3. qa-workflow create-tests
   └─ [New] superpowers:brainstorm (for test case strategy)
      Generate test cases from plan

4. qa-workflow prepare-data
   └─ [New] superpowers:brainstorm (for data organization)
      Create reusable test data sets

5. qa-workflow modify-tests
   └─ [New] superpowers:brainstorm (for test modifications)
      Add/remove test cases as needed

6. qa-workflow review
   └─ QA Lead reviews quality

7. qa-workflow execute
   └─ [New] superpowers:execute-plan (for test execution)
      Execute approved test plan

8. qa-workflow report
   └─ Generate both .md and .html reports
```

---

## Detailed Integration Points

### 1. **qa-workflow analyze** → superpowers:write-plan

**When to Use:**
- After loading and understanding Jira ticket requirements
- Before creating any test cases
- When you need to plan the testing strategy

**What It Does:**
- Guides you through understanding requirements
- Helps identify test scope and strategy
- Creates a testing plan document
- Plans risk assessment and prioritization

**Output:**
- PLAN.md - Testing strategy and execution plan
- Clear roadmap for test case creation

**Integration Steps:**
```
Step 1: Load Jira Ticket
Step 2: Understand Scope & Requirements
Step 3: [TRIGGER] superpowers:write-plan
        → Brainstorm testing strategy
        → Identify high-risk areas
        → Plan test priorities (P0, P1, P2)
Step 4: Create Testing Strategy Plan
Step 5: Summary - Ready for test case creation
```

---

### 2. **qa-workflow create-tests** → superpowers:brainstorm

**When to Use:**
- Before generating test cases
- When strategizing which scenarios to test
- To explore coverage comprehensively

**What It Does:**
- Explores user intent and requirements
- Brainstorms test scenarios and edge cases
- Identifies all testing perspectives (happy path, errors, edge cases)
- Plans test case strategy

**Output:**
- Test case strategy document
- Brainstormed scenarios list
- Coverage plan

**Integration Steps:**
```
Step 1: Load Analysis & Testing Plan
Step 2: [TRIGGER] superpowers:brainstorm
        → What scenarios matter most?
        → What could break?
        → What edge cases exist?
        → Happy path vs. alternatives?
Step 3: Generate Test Cases
        (Use brainstorming results to create comprehensive cases)
Step 4: QA Engineer Review
Step 5: Organize & Document
```

---

### 3. **qa-workflow prepare-data** → superpowers:brainstorm

**When to Use:**
- Before creating test data
- When designing data organization
- To plan reusable data sets

**What It Does:**
- Brainstorms test data needs
- Plans data organization strategy
- Explores reusability opportunities
- Identifies data dependencies

**Output:**
- Test data strategy document
- Data organization plan
- Reusability recommendations

**Integration Steps:**
```
Step 1: Load Test Cases & Analyze Data Needs
Step 2: [TRIGGER] superpowers:brainstorm
        → How should data be organized?
        → What's reusable?
        → What data sets cover multiple tests?
        → How to minimize data setup time?
Step 3: Generate Test Data Sets
Step 4: QA Engineer Review
Step 5: Document & Organize
```

---

### 4. **qa-workflow modify-tests** → superpowers:brainstorm

**When to Use:**
- Before adding/removing test cases
- When QA Lead reviews coverage
- To determine if changes are needed

**What It Does:**
- Brainstorms what tests might be missing
- Explores if any tests are redundant
- Plans test coverage improvements
- Identifies risk areas needing more testing

**Output:**
- Modification recommendations
- Identified gaps and redundancies
- Updated test plan

**Integration Steps:**
```
Step 1: Load Current Test Cases
Step 2: Display Test Cases & Coverage
Step 3: [TRIGGER] superpowers:brainstorm
        → Are there missing scenarios?
        → Which tests are critical?
        → What can be removed safely?
        → Coverage gaps?
Step 4: Ask QA Lead - Changes needed?
Step 5: Add/Remove Test Cases
```

---

### 5. **qa-workflow execute** → superpowers:execute-plan

**When to Use:**
- Before executing test cases
- After test environment is ready
- When you have approved test plan

**What It Does:**
- Executes the approved test plan
- Guides step-by-step execution
- Handles test execution with checkpoints
- Manages failures and exceptions
- Tracks progress and results

**Output:**
- Execution results document
- Pass/fail tracking
- Defect documentation
- Progress reports

**Integration Steps:**
```
Step 1: Preparation
Step 2: [TRIGGER] superpowers:execute-plan
        → Execute test cases from plan
        → Track results
        → Document defects
        → Handle blocking issues
        → Verify each step
Step 3: Result Recording
Step 4: Progress Tracking
Step 5: Defect Management
Step 6: Completion & Summary
```

---

## Superpowers Best Practices

### superpowers:brainstorm
- **Best Used For:** Strategy and design decisions
- **Frequency:** 3-4 times in workflow (create-tests, prepare-data, modify-tests)
- **Duration:** Explore comprehensively before implementation
- **Outcome:** Clear brainstorm document as input to next step

### superpowers:write-plan
- **Best Used For:** Planning testing strategy
- **Frequency:** Once after analyzing requirements
- **Duration:** Create detailed testing plan before test case generation
- **Outcome:** PLAN.md with clear testing roadmap

### superpowers:execute-plan
- **Best Used For:** Executing the approved plan
- **Frequency:** Once during test execution
- **Duration:** Full test cycle execution with checkpoints
- **Outcome:** Complete execution results with all data

---

## Workflow Execution Timeline

```
PLAN PHASE
├─ qa-workflow init
├─ qa-workflow analyze
└─ [superpowers:write-plan] ← Create testing strategy

DESIGN PHASE
├─ [superpowers:brainstorm] ← Brainstorm test scenarios
├─ qa-workflow create-tests
├─ [superpowers:brainstorm] ← Brainstorm data strategy
├─ qa-workflow prepare-data
├─ [superpowers:brainstorm] ← Brainstorm modifications (optional)
└─ qa-workflow modify-tests (optional)

REVIEW PHASE
└─ qa-workflow review ← QA Lead validates quality

EXECUTION PHASE
└─ [superpowers:execute-plan] ← Execute approved test plan
   └─ qa-workflow execute

REPORTING PHASE
└─ qa-workflow report ← Generate .md + .html reports
```

---

## Integration Checklist

- [ ] **Init** - Jira Ticket ID required
- [ ] **Analyze** - Use superpowers:write-plan for strategy
- [ ] **Create-Tests** - Use superpowers:brainstorm for scenarios
- [ ] **Prepare-Data** - Use superpowers:brainstorm for data strategy
- [ ] **Modify-Tests** - Use superpowers:brainstorm for gap analysis
- [ ] **Review** - QA Lead validates quality
- [ ] **Execute** - Use superpowers:execute-plan for execution
- [ ] **Report** - Generate both .md and .html formats

---

## Key Benefits

✅ **Strategic Planning** - Write-plan ensures testing strategy is clear
✅ **Comprehensive Coverage** - Brainstorm identifies all scenarios
✅ **Optimized Execution** - Execute-plan ensures disciplined execution
✅ **Quality Assurance** - All phases aligned with best practices
✅ **Knowledge Transfer** - Plans and brainstorms document decision-making
✅ **Risk Mitigation** - Strategic approach reduces missed scenarios

---

## Notes

- Superpowers can be triggered automatically or manually by QA Engineer
- Each superpowers session generates a planning/brainstorming document
- Documents are version-controlled and provide audit trail
- QA Lead reviews all outputs before proceeding to next phase
