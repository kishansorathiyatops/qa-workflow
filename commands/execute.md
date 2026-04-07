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

## Technical Details

- Persona: QA Engineer
- Skills triggered: Execution & Reporting Skill
- Inputs: Test cases and test data from previous commands
- Output: Execution results document
- Next command: `report`
