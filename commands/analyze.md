# qa-workflow analyze

Analyze requirements and identify test scope.

## Purpose

Understand requirements, identify test scenarios, assess coverage needs, and define testing strategy.

## Who Uses This

QA Engineer

## Command Flow

### Step 1: Load Requirements

Ask:
- "Do you have requirements from:"
  - [ ] Uploaded document (from init)
  - [ ] Jira project (if integrated)
  - [ ] New source (paste, upload, or link)

Load and display requirements summary.

### Step 2: Understand Scope

Ask clarifying questions:
- "What are the main features being tested?"
- "Are there any out-of-scope items?"
- "What's the timeline for testing?"
- "Are there any known risky areas?"
- "Do we need performance/security/usability testing?"

### Step 3: Identify Scenarios

Analyze requirements to identify:
- Happy path scenarios (normal usage)
- Alternative scenarios (variations)
- Error scenarios (error handling)
- Edge cases (boundary conditions)
- Non-functional scenarios (performance, security, etc.)

Document each scenario with:
- Scenario ID
- Description
- Actor/User type
- Preconditions
- Expected outcome
- Risk level (Critical/High/Medium/Low)

### Step 4: Define Test Strategy

Create test strategy including:
- Testing approach (manual, automated, both)
- Coverage goals (e.g., "90%+ of requirements covered")
- Risk-based prioritization
- Testing phases/waves (if applicable)
- Acceptance criteria for completion

### Step 5: Summary & Approval

Present:
- Identified test scenarios
- Test strategy summary
- Estimated test case count
- Coverage plan
- Next steps (create-tests command)

Ask: "Does this strategy look good? Any adjustments needed?"

## Output

- Requirement analysis document with:
  - Requirements summary
  - Identified test scenarios
  - Test strategy
  - Risk assessment
  - Coverage plan
  - Next steps (create test cases)

## Technical Details

- Persona: QA Engineer
- Skills triggered: None (planning only)
- Inputs: Requirements (from Jira, document, paste)
- Output: Requirement analysis document
- Next command: `create-tests`
