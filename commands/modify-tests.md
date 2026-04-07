# qa-workflow modify-tests

Modify test cases - add or remove test cases before review.

## Purpose

Allow QA Lead to add new test cases or remove unnecessary test cases before the review and execution phases.

## Who Uses This

QA Lead

## Command Flow

### Step 1: Load Current Test Cases

Display:
- Total number of test cases
- List of all current test cases with IDs and titles
- Test case summary

### Step 2: Ask for Changes

Prompt: **"Do you want to make changes to any test case?"**

Options:
- [ ] **Add Test Case** - Add new test case(s)
- [ ] **Remove Test Case** - Remove test case(s)
- [ ] **No Changes** - Proceed to review

### Step 3A: Add Test Case (if selected)

Prompt QA Lead:
- "Enter test case details:"
  - **Title:** [Test case title]
  - **Type:** [UI / API / Integration / Security / Performance]
  - **Preconditions:** [Preconditions]
  - **Test Data:** [Required test data]
  - **Steps:** [Test steps]
  - **Expected Result:** [Expected outcome]
  - **Priority:** [P0 / P1 / P2]
  - **Can we automate this?** [Yes / No]

Add to test case list.
Ask: "Add another test case?" → Repeat or go to Step 4

### Step 3B: Remove Test Case (if selected)

Display:
- List of all current test cases with numbers
- Prompt: "Select test case ID(s) to remove (comma-separated): [TCID]"
- Confirm removal: "Remove these test cases? (Y/N)"

Remove selected test cases.
Ask: "Remove another test case?" → Repeat or go to Step 4

### Step 4: Summary & Confirm

Display:
- Changes made:
  - Test cases added: [Count]
  - Test cases removed: [Count]
  - New total test cases: [Count]
  
Ask: "Ready to proceed to review?"
- [ ] Yes - Proceed to review
- [ ] No - Make more changes (go to Step 2)

## Output

- Updated test case list with modifications
- Summary of changes made
- Ready status for review

## Example Usage

```
User: qa-workflow modify-tests

QA Workflow: Loading current test cases...

Current Test Cases (5 total):
1. TC-001: Valid login with email
2. TC-002: Invalid password handling
3. TC-003: Empty email field
4. TC-004: User account locked
5. TC-005: Password reset flow

Do you want to make changes to any test case?
[1] Add Test Case
[2] Remove Test Case
[3] No Changes

User selects [1]

Enter test case details:
Title: Multi-factor authentication flow
Type: UI
Preconditions: User has MFA enabled
Steps: 
  1. Login with email
  2. Enter OTP code
  3. Click verify
Expected Result: User logged in successfully
Priority: P1
Can we automate this?: Yes

✓ Test case added!

Do you want to make changes?
[1] Add Test Case
[2] Remove Test Case
[3] No Changes

User selects [3]

Summary of Changes:
✓ Test cases added: 1
✓ Test cases removed: 0
✓ New total test cases: 6

Ready to proceed to review?
→ Run: qa-workflow review
```

## Technical Details

- Persona: QA Lead
- Skills triggered: None (direct editing)
- Inputs: Test cases from `create-tests`
- Output: Modified test case list
- Previous command: `prepare-data`
- Next command: `review`
