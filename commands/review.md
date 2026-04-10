---
name: review
description: Quality review of test cases
type: command
---

# qa-workflow review

Review test cases and test data for quality and completeness.

## Purpose

QA Lead validates test case quality, completeness, coverage, and risk assessment before test execution.

## Who Uses This

QA Lead

## Command Flow

### Step 1: Load Test Cases & Data

Load test cases from `create-tests` command.
Load test data from `prepare-data` command.

### Step 2: Coverage Review

Use Coverage & Quality Review Skill to:
- Assess requirement coverage
- Calculate coverage percentage
- Identify coverage gaps
- Evaluate scenario completeness
- Assess edge case coverage
- Document findings

### Step 3: Quality Validation

Review test case quality:
- Format compliance (follow template)
- Clarity of preconditions
- Clarity and specificity of test steps
- Specificity of expected results
- Testability of acceptance criteria
- Data requirement completeness

Document quality findings.

### Step 4: Risk Assessment

Assess risk coverage:
- High-risk areas identified
- Adequate test coverage for high-risk items
- Error scenarios covered
- Non-functional testing
- Environmental considerations

### Step 5: Data Validation

Review test data:
- All test cases have required data
- Data organization and reusability
- Setup/cleanup procedures clear
- Dependencies documented
- Sensitive data handled properly

### Step 6: Approval Decision

QA Lead decides:
- **Approve** - Ready for execution
- **Approve with Conditions** - Approved, but with noted concerns
- **Revise** - Return for specific revisions

If revisions needed:
- Document specific issues
- Return to QA Engineer for fixes
- Re-review after revisions

If approved:
- Generate review report
- Document sign-off
- Proceed to execution

### Step 7: Summary

Display:
- Coverage percentage
- Quality assessment
- Risk findings
- Approval decision
- **Approval Status:**
  - ✓ **APPROVED** → Next: `qa-workflow execute`
  - ⚠️ **REVISIONS NEEDED** → Return to QA Engineer for fixes, then re-review
- Next mandatory step (if approved): `qa-workflow execute`

## Output

- Review Report: `qa-workflow/projects/{ticketId}/reports/review-report.md` with:
  - Coverage analysis
  - Quality findings
  - Risk assessment
  - Data assessment
  - Approval decision
  - QA Lead sign-off
- **NOTE:** No auto-commit. Files saved locally for user to review and commit.

## Technical Details

- Persona: QA Lead
- Skills triggered: Coverage & Quality Review Skill
- Inputs: Test cases and test data from previous commands
- Output: Review report
- Next command (if approved): `execute`
- Next command (if revisions requested): `create-tests` or `prepare-data` (by QA Engineer)
