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

### Step 2: Analyze Impacted Areas & Connected Modules

**[TRIGGER] superpowers:brainstorm**

Use brainstorm to identify and document **impacted areas and connected modules**:

**Key Questions to Explore:**
- What modules/components in the system will be affected by this feature?
- What existing functionality could be impacted (positive or negative)?
- What external systems or APIs does this feature interact with?
- What data flows between this feature and other modules?
- What dependencies exist (database, third-party services, internal services)?
- What user workflows touch this feature and related modules?
- What shared resources or data does this feature access?
- What backward compatibility concerns exist?
- What performance implications for connected systems?
- What security implications for integrated modules?

**Output:** `qa-workflow/projects/{ticketId}/requirements/impact-analysis.md`
- Impacted modules/components list
- Integration points identified
- Data flow diagrams (if applicable)
- Dependency map
- Potential side effects
- Risk areas due to interconnections

This analysis is critical for:
- Identifying integration test cases
- Understanding end-to-end flows
- Catching unintended side effects
- Planning data setup for tests
- Identifying performance test scenarios

### Step 3: Create Testing Strategy Plan

**[TRIGGER] superpowers:write-plan**

Use write-plan to create a comprehensive testing strategy **specific to this domain/project**:
- Understand testing scope and objectives **from the Jira ticket context**
- Identify high-risk areas **specific to this feature/domain**
- Plan test priorities (P0, P1, P2) **based on business impact**
- Define coverage goals **appropriate for this project type**
- Create testing roadmap **tailored to ticket requirements**

**IMPORTANT:** Include in your planning:
- Specific domain/technology context from the Jira ticket
- Industry-specific compliance or quality requirements
- Project-specific testing standards or best practices
- Integration points or dependencies mentioned in the ticket

**IMPORTANT:** Include in your planning:
- Specific domain/technology context from the Jira ticket
- Industry-specific compliance or quality requirements
- Project-specific testing standards or best practices
- Integration points or dependencies mentioned in the ticket
- **Impacted areas identified in impact-analysis.md (Step 2)**
- **Testing needed for connected modules and integrations**

Output: `qa-workflow/projects/{ticketId}/requirements/PLAN.md` (testing strategy document)

### Step 4: Confirm Ready

Display:
- ✓ Ticket loaded successfully
- ✓ Impact analysis completed (impact-analysis.md)
- ✓ Impacted areas and modules identified
- ✓ Testing strategy plan created (PLAN.md)
- ✓ Integration and end-to-end testing considered
- Ready to brainstorm comprehensive test cases

## Output

- Jira ticket details in console
- Impact analysis document: `qa-workflow/projects/{ticketId}/requirements/impact-analysis.md`
  - Impacted modules/components
  - Integration points
  - Dependencies and interconnections
- Testing strategy plan: `qa-workflow/projects/{ticketId}/requirements/PLAN.md`
  - Incorporates impact analysis findings
  - Includes integration test strategy
- Ready status confirmation
- **NOTE:** No auto-commit. Files saved locally for user to review and commit.

## Technical Details

- Persona: QA Engineer
- Superpowers triggered: 
  - superpowers:brainstorm (Step 2 - impact analysis)
  - superpowers:write-plan (Step 3 - testing strategy)
- Skills triggered: None
- Inputs: Jira Ticket ID (from init)
- Outputs:
  - Console display (ticket details)
  - Impact analysis document: `qa-workflow/projects/{ticketId}/requirements/impact-analysis.md`
  - Testing strategy plan: `qa-workflow/projects/{ticketId}/requirements/PLAN.md`
    - Incorporates impact analysis findings
- Next command: `create-tests`
