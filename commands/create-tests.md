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

## Technical Details

- Persona: QA Engineer
- Skills triggered: Test Case Generation Skill
- Inputs: Requirement analysis from `analyze` command
- Output: Test case document
- Next command: `prepare-data`
