# qa-workflow create-tests

Generate test cases from analyzed requirements.

## Purpose

Create comprehensive test cases that cover all identified scenarios, with clear steps, expected results, and data requirements.

## Who Uses This

QA Engineer

## Command Flow

### Step 1: Load Analysis & Strategy Plan

Load:
- Jira ticket requirements
- Testing strategy plan (PLAN.md) from `analyze` command
Display test scenarios and priorities.

### Step 2: Brainstorm Test Scenarios

**[TRIGGER] superpowers:brainstorm**

Use brainstorm to explore:
- What scenarios matter most?
- What could break in this feature?
- Happy path vs. alternative flows?
- Edge cases and boundary conditions?
- Error scenarios and exception handling?
- Non-functional testing (performance, security)?

Output: Brainstorm document with scenario analysis

### Step 4: Generate Test Cases

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
- Suggest edge cases (from brainstorm)
- Validate completeness
- Ensure each case is independent

### Step 5: QA Engineer Review

Present generated test cases to QA Engineer:
- Display test case summaries
- Ask for clarifications
- Collect feedback and adjustments
- Suggest additional edge cases
- Refine as needed

### Step 6: Organize & Document

- Organize test cases by feature/module
- Create test case document
- Include test case summary
- Link each case to requirement and brainstorm scenarios
- Calculate coverage statistics

### Step 7: Summary

Display:
- Total test cases created
- Coverage by requirement
- Coverage percentage
- Brainstorm scenarios covered
- Next steps (prepare-data command)

## Output

- Test Case Document with:
  - All test cases in template format
  - Test case summary table
  - Coverage analysis
  - Data requirements identified
  - Organized by feature/area

## Technical Details

- Persona: QA Engineer
- Superpowers triggered: superpowers:brainstorm (Step 2)
- Skills triggered: Test Case Generation Skill
- Inputs: 
  - Requirement analysis from `analyze` command
  - Testing strategy plan (PLAN.md)
- Outputs:
  - Brainstorm document (test scenario analysis)
  - Test case document (comprehensive test cases)
- Next command: `prepare-data`
