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
