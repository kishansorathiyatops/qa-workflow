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

### Step 2: Create Testing Strategy Plan

**[TRIGGER] superpowers:write-plan**

Use write-plan to create a comprehensive testing strategy:
- Understand testing scope and objectives
- Identify high-risk areas
- Plan test priorities (P0, P1, P2)
- Define coverage goals
- Create testing roadmap

Output: PLAN.md (testing strategy document)

### Step 3: Confirm Ready

Display:
- ✓ Ticket loaded successfully
- ✓ Testing strategy plan created (PLAN.md)
- Ready to brainstorm test cases

## Output

- Jira ticket details in console
- Ready status confirmation

## Technical Details

- Persona: QA Engineer
- Superpowers triggered: superpowers:write-plan (Step 2)
- Skills triggered: None
- Inputs: Jira Ticket ID (from init)
- Outputs:
  - Console display (ticket details)
  - Testing strategy plan (PLAN.md)
- Next command: `create-tests`
