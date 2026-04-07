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
