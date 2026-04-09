# qa-workflow create-tests

Generate test cases from analyzed requirements.

## Purpose

Create comprehensive test cases that cover all identified scenarios, with clear steps, expected results, and data requirements.

## Who Uses This

QA Engineer

## Command Flow

### Flow Context

This command executes after `qa-workflow analyze` which produces:
- **impact-analysis.md** (`qa-workflow/projects/{ticketId}/requirements/impact-analysis.md`): Impacted modules, integration points, dependencies
- **PLAN.md** (`qa-workflow/projects/{ticketId}/requirements/PLAN.md`): Testing strategy with scope, priorities (P0/P1/P2), and high-risk areas

This command will produce:
- **brainstorm-scenarios.md** (`qa-workflow/projects/{ticketId}/requirements/brainstorm-scenarios.md`): Brainstormed test scenarios
- **test-cases.md** (`qa-workflow/projects/{ticketId}/test-cases/test-cases.md`): All test cases with full traceability

---

### Step 1: Load Analysis, Impact Analysis & Strategy Plan

Load and review inputs from previous `analyze` command:
- Jira ticket requirements and context
- Impact analysis (impact-analysis.md) showing:
  - Impacted modules/components
  - Integration points
  - Connected systems and dependencies
  - Data flows between modules
  - Potential side effects
- Testing strategy plan (PLAN.md) with:
  - Testing scope and objectives
  - High-risk areas
  - Test priorities (P0, P1, P2)
  - Coverage goals
  - Integration testing considerations

Display loaded context and impacted areas to QA Engineer.

### Step 2: Understand Testing Strategy & Impacted Areas

Review the testing strategy plan (PLAN.md) and impact analysis (impact-analysis.md) created in the `analyze` command:
- **Impact Analysis Review:**
  - Understand which modules/components are affected
  - Review integration points and connected systems
  - Understand data dependencies
  - Review potential side effects
  - Identify modules needing integration tests
- **Testing Strategy Review:**
  - Understand testing scope and priorities (P0, P1, P2)
  - Review high-risk areas identified in the plan
  - Understand domain/technology context
  - Review project-specific requirements
  - Review integration testing strategy

### Step 3: Brainstorm Test Scenarios & Integration Testing

**[TRIGGER] superpowers:brainstorm**

Use brainstorm to explore **domain-specific test scenarios, integration points, and impacted areas**:

**Core Test Scenarios:**
- What scenarios matter most **based on the Jira ticket domain**?
- What could break in this feature **in your specific business context**?
- Happy path vs. alternative flows **for this project type**?
- Edge cases and boundary conditions **specific to this domain**?
- Error scenarios and exception handling **relevant to this feature**?
- Non-functional testing (performance, security) **required by this project/domain**?
- Industry-specific compliance or regulatory requirements?

**Integration & Impact Testing:**
- How does this feature **interact with impacted modules** (from impact-analysis.md)?
- What integration test scenarios **for connected systems**?
- What data flows between this feature and **other modules**?
- What **end-to-end workflows** touch both this feature and connected modules?
- What **side effects** could occur in connected modules?
- What **dependency-based test scenarios** (e.g., data availability, external service failures)?
- What **backward compatibility** test scenarios for connected modules?
- What **performance impact** tests for integrated systems?

**IMPORTANT:** Reference during brainstorm:
- The Jira ticket description and requirements (domain context)
- Impact analysis (impact-analysis.md) - impacted modules and integrations
- Testing strategy plan (PLAN.md) created in analyze step
- Project-specific requirements and priorities from the ticket
- High-risk areas and integration points identified

**Brainstorm Output:** `qa-workflow/projects/{ticketId}/requirements/brainstorm-scenarios.md` (scenario analysis)

Use brainstorm results as input for comprehensive test case generation including integration testing.

### Step 4: Generate Test Cases from Brainstorm Scenarios

Generate comprehensive test cases using scenarios identified in Step 3 (brainstorm-scenarios.md):

For each brainstormed scenario, create a test case with:
- Test Case ID (TC-001, TC-002, etc.)
- Title (clear, descriptive)
- Description (what's being tested, reference brainstorm scenario)
- Preconditions (setup required)
- Test Steps (numbered, specific, unambiguous, from brainstorm insights)
- Expected Result (specific, verifiable)
- Test Data Requirements (what data is needed)
- Risk Level (Critical/High/Medium/Low) **based on PLAN.md priorities**
- Related Brainstorm Scenario (link to brainstorm-scenarios.md)

Use Test Case Generation Skill to:
- Ensure clarity and testability of each case
- Validate all brainstorm scenarios are covered
- Suggest edge cases (from brainstorm output)
- Ensure each case is independent and self-contained
- Link cases back to original requirements and brainstorm scenarios

### Step 5: QA Engineer Review & Validation

Review generated test cases against brainstorm and strategy plan:
- Display test case summaries with brainstorm scenario references
- Verify all brainstormed scenarios are covered by test cases
- Verify test cases align with testing strategy (PLAN.md)
- Ask for clarifications on specific test cases
- Collect feedback on clarity and completeness
- Suggest additional edge cases **from the brainstorm output**
- Refine test cases as needed to improve clarity and coverage
- Validate that high-risk areas (from PLAN.md) have adequate test coverage

### Step 6: Organize, Document & Link

Create comprehensive test case document with full traceability:
- Organize test cases by feature/module/area
- Create test case document: `qa-workflow/projects/{ticketId}/test-cases/test-cases.md`
- Include test case summary table
- **Link each test case to:**
  - Original Jira ticket requirement
  - Brainstorm scenario (from brainstorm-scenarios.md)
  - Testing strategy priority (P0/P1/P2 from PLAN.md)
- Calculate coverage statistics:
  - Coverage by Jira requirement
  - Coverage by brainstorm scenario
  - Coverage by risk level
- Identify any coverage gaps
- Add notes on test data requirements

### Step 7: Summary & Verification

Display:
- **Test Case Summary:**
  - Total test cases created
  - Coverage by Jira requirement (%)
  - Coverage by brainstorm scenario (%)
  - Coverage percentage overall
- **Traceability Verified:**
  - All brainstorm scenarios linked to test cases
  - All high-risk areas (from PLAN.md) covered
  - All requirements from Jira ticket addressed
- **Quality Metrics:**
  - Test cases by risk level
  - Test cases by feature/module
  - Edge cases identified
- **Documentation Status:**
  - Test case document ready: `qa-workflow/projects/{ticketId}/test-cases/test-cases.md`
  - Brainstorm scenarios document: `qa-workflow/projects/{ticketId}/requirements/brainstorm-scenarios.md`
- **Next steps:** Run `qa-workflow prepare-data` to create test data

## Output

- Test Case Document: `qa-workflow/projects/{ticketId}/test-cases/test-cases.md` with:
  - All test cases in template format
  - Test case summary table
  - Coverage analysis
  - Data requirements identified
  - Organized by feature/area
- Brainstorm document: `qa-workflow/projects/{ticketId}/requirements/brainstorm-scenarios.md`
- **NOTE:** No auto-commit. Files saved locally for user to review and commit.

## Technical Details

- Persona: QA Engineer
- Superpowers triggered: superpowers:brainstorm (Step 3)
- Skills triggered: Test Case Generation Skill
- **Inputs (from previous steps):**
  - Jira Ticket ID and requirements (from `init` command)
  - Impact analysis (impact-analysis.md) from `analyze` command
    - Impacted modules, integration points, dependencies
  - Testing strategy plan (PLAN.md) from `analyze` command
    - Scope, objectives, priorities, high-risk areas, integration testing strategy
- **Outputs (generated by this command):**
  - Brainstorm document: `qa-workflow/projects/{ticketId}/requirements/brainstorm-scenarios.md`
    - Brainstormed test scenarios from domain-specific analysis
  - Test case document: `qa-workflow/projects/{ticketId}/test-cases/test-cases.md`
    - Comprehensive test cases with full traceability to:
      - Jira requirements
      - Brainstorm scenarios
      - Testing priorities
- **Flow Chain:**
  ```
  analyze (impact-analysis.md + PLAN.md) 
    → create-tests load & review (impact analysis + strategy)
    → create-tests brainstorm (brainstorm-scenarios.md with integration scenarios)
    → create-tests generate (test-cases.md with traceability + integration tests)
  ```
- Next command: `prepare-data`
