# qa-workflow analyze

Load Jira ticket and prepare for test case creation.

## Purpose

Load the Jira ticket details and prepare to create test cases.

## Who Uses This

QA Engineer

## Command Flow

### Step 1: Load Jira Ticket

- Load Jira Ticket ID from project config
- Fetch ticket details from Jira
- Display ticket summary:
  - Ticket ID
  - Title
  - Description
  - Acceptance Criteria (if available)

### Step 2: Confirm Ready

Display:
- ✓ Ticket loaded successfully
- Ready to create test cases

## Output

- Jira ticket details in console
- Ready status confirmation

## Technical Details

- Persona: QA Engineer
- Skills triggered: None
- Inputs: Jira Ticket ID (from init)
- Output: Console display
- Next command: `create-tests`
