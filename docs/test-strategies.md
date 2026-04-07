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
