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
