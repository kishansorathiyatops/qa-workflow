# Test Review Report Template

Use this template for QA Lead reviews of test cases and test data.

---

## Test Review Report

**Project Name:** [Project name]

**Review Date:** [Date of review]

**Reviewed By:** [QA Lead name]

**Review Version:** [Version of test cases/data being reviewed]

---

### Coverage Analysis

**Total Requirements:** [Number of requirements to cover]

**Requirements Covered:** [Number of requirements with test cases] ([Percentage]%)

**Coverage by Requirement:**

| Requirement ID | Title | Coverage | Test Cases |
|---|---|---|---|
| REQ-001 | [Title] | ✓ Covered | TC-001, TC-002 |
| REQ-002 | [Title] | ✓ Covered | TC-005 |
| REQ-003 | [Title] | ✗ Not Covered | - |

**Coverage Gaps:**

- [Requirement or scenario not covered]
- [High-risk area without adequate testing]

---

### Test Case Quality Assessment

**Total Test Cases:** [Number]

**Quality Findings:**

- **Format Compliance:** [X/N cases follow template properly]
  - Issues: [List any format issues]
  
- **Preconditions:** [Clear and realistic? Yes/No]
  - Issues: [Any unclear preconditions]
  
- **Test Steps:** [Clear and unambiguous? Yes/No]
  - Issues: [Steps that need clarification]
  
- **Expected Results:** [Specific and verifiable? Yes/No]
  - Issues: [Vague or unmeasurable results]
  
- **Edge Cases:** [Adequate coverage? Yes/No]
  - Missing: [Edge cases that should be added]
  
- **Error Scenarios:** [Adequately covered? Yes/No]
  - Missing: [Error scenarios to add]

---

### Test Data Assessment

**Test Data Sets:** [Number]

**Quality Findings:**

- **Completeness:** [All test cases have required data? Yes/No]
  - Issues: [Test cases missing data]
  
- **Organization:** [Logically organized and reusable? Yes/No]
  - Issues: [Redundancy or organization problems]
  
- **Documentation:** [Setup/cleanup procedures clear? Yes/No]
  - Issues: [Unclear documentation]
  
- **Dependencies:** [Documented and understood? Yes/No]
  - Issues: [Unclear dependencies]
  
- **Sensitive Data:** [Properly protected? Yes/No]
  - Issues: [Any exposed sensitive data]

---

### Risk Assessment

**High-Risk Areas Identified:**

- [Risk area 1: Technical risk description, recommended mitigation]
- [Risk area 2: Business-critical feature, recommend additional coverage]
- [Risk area 3: Complex scenario, recommend detailed test cases]

**Risk Mitigation Recommendations:**

- [Recommendation 1]
- [Recommendation 2]

---

### Defects & Issues Found

**Critical Issues (blocking approval):**

1. [Issue 1: Description and impact]
2. [Issue 2: Description and impact]

**Major Issues (should be fixed before execution):**

1. [Issue 1: Description]
2. [Issue 2: Description]

**Minor Issues (nice to fix):**

1. [Issue 1: Description]

---

### Suggestions & Improvements

- [Suggestion 1: How to improve test coverage or quality]
- [Suggestion 2: How to better organize test data]
- [Suggestion 3: Additional edge cases to consider]

---

### Overall Assessment

**Coverage:** [X]% complete ([Pass/Needs work])

**Quality:** [Good/Acceptable/Needs improvement]

**Readiness for Execution:** [Ready/Needs revisions]

---

### Approval Decision

- [ ] **Approved** - Test plan is ready for execution
- [ ] **Approved with Conditions** - Approved with understanding that [conditions] will be addressed
- [ ] **Revisions Requested** - Return for revisions (see Critical/Major Issues above)

---

### QA Lead Sign-off

**Name:** [QA Lead name]

**Title:** [Title]

**Date:** [Date]

**Signature:** ___________________________

---

### Comments

[Any additional comments or context from QA Lead]

---
