---
name: execute
description: Execute tests and track results
type: command
---

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

### Step 2: Execute Approved Test Plan

**[TRIGGER] superpowers:execute-plan**

Use execute-plan to guide disciplined execution:
- Execute test cases from approved plan
- Follow testing strategy (from PLAN.md)
- Track results systematically
- Handle failures and exceptions
- Document defects properly
- Maintain execution quality

Output: Execution results with all test data

### Step 3: Test Execution

For each test case (guided by execute-plan):
1. Display test case details
2. Verify preconditions are met
3. Guide through test steps one-by-one
4. After each step, ask: "What do you see?"
5. Compare actual result to expected
6. Record result: Pass / Fail / Blocked
7. If fail: document defect
8. If blocked: document reason
9. Move to next test case

### Step 4: Result Recording

For each test case, record:
- Test case ID
- Execution date/time
- Tester name
- Result: Pass / Fail / Blocked / Skipped
- Actual result (what happened)
- Defect ID (if failed)
- Notes/observations
- Supporting evidence (screenshots, logs)

### Step 5: Progress Tracking

Display progress (from execute-plan):
- Test cases completed vs. total
- Current pass rate
- Defects found so far
- Blocked/failing cases needing attention
- Time remaining estimate

### Step 6: Defect Management

If test fails:
- Document defect details
- Capture steps to reproduce
- Record severity assessment
- Create Jira defect (if Jira integrated)
- Link to test case

### Step 7: Completion

When all tests executed (via execute-plan):
- Display execution summary
- Pass/fail counts and percentages
- Defects found
- Plan adherence metrics
- Next steps (report command)

## Output

- Execution Results Document: `qa-workflow/projects/{ticketId}/test-results/execution-results.md` with:
  - All test case results
  - Pass/fail counts
  - Defect list
  - Progress timeline
  - Ready for report generation
- **NOTE:** No auto-commit. Files saved locally for user to review and commit.

## Technical Details

- Persona: QA Engineer
- Superpowers triggered: superpowers:execute-plan (Step 2)
- Skills triggered: Execution & Reporting Skill
- Inputs:
  - Test cases from `create-tests`
  - Test data from `prepare-data`
  - Testing plan (PLAN.md) from `analyze`
- Outputs:
  - Execution plan execution results
  - Execution results document (complete with all data)
  - Defect documentation
- Next command: `report`
