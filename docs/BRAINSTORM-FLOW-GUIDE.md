# QA Workflow - Brainstorm & Test Case Creation Flow Guide

## Overview

This guide explains the complete flow from analyzing requirements through brainstorming to creating test cases, ensuring domain-specific context is maintained throughout.

---

## Complete Flow Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│ STEP 1: qa-workflow init                                         │
├─────────────────────────────────────────────────────────────────┤
│ Input:  Jira Ticket ID (e.g., PROJ-123)                         │
│ Output: projects/PROJ-123/ folder structure created              │
│         + Project config with Jira integration                   │
└─────────────────────────────────────────────────────────────────┘
                          ↓
                   [MANDATORY]
                          ↓
┌─────────────────────────────────────────────────────────────────┐
│ STEP 2: qa-workflow analyze                                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                   │
│ Step 2a: Load Jira Ticket                                        │
│   ✓ Fetch ticket details from Jira                              │
│   ✓ Display: Title, Description, Acceptance Criteria            │
│   ✓ Understand domain/context from ticket                       │
│                                                                   │
│ Step 2b: Analyze Impacted Areas & Connected Modules             │
│   [TRIGGER] superpowers:brainstorm                              │
│   Identify and document:                                        │
│     • What modules/components are affected by this feature?     │
│     • What existing functionality could be impacted?            │
│     • What external systems or APIs does this interact with?    │
│     • What data flows between this and other modules?           │
│     • What dependencies exist?                                  │
│     • What user workflows touch this and related modules?       │
│     • What backward compatibility concerns exist?               │
│   Output: impact-analysis.md                                   │
│     • Impacted modules/components list                         │
│     • Integration points identified                            │
│     • Data flow diagrams (if applicable)                       │
│     • Dependency map                                           │
│     • Potential side effects                                   │
│     • Risk areas due to interconnections                       │
│                                                                   │
│ Output Location:                                                 │
│   📄 qa-workflow/projects/{ticketId}/requirements/impact-analysis.md       │
│                                                                   │
│ Step 2c: Create Testing Strategy Plan                           │
│   [TRIGGER] superpowers:write-plan                              │
│   Domain-specific input incorporating impact analysis:         │
│     • Jira ticket domain/context                                │
│     • Impacted areas & modules (from impact-analysis.md)        │
│     • Industry-specific requirements                            │
│     • Project-specific testing standards                        │
│     • Integration points and dependencies                       │
│   Output: PLAN.md                                              │
│     • Testing scope & objectives                               │
│     • High-risk areas                                          │
│     • Test priorities (P0, P1, P2)                             │
│     • Coverage goals                                           │
│     • Integration testing strategy                             │
│                                                                   │
│ Output Location:                                                 │
│   📄 qa-workflow/projects/{ticketId}/requirements/PLAN.md                  │
│                                                                   │
│ Step 2d: Confirm Ready                                          │
│   ✓ Display loading success                                    │
│   ✓ Display impact-analysis.md created                         │
│   ✓ Display PLAN.md created                                    │
│   ✓ Display impacted areas and dependencies understood          │
│   ✓ Ready for comprehensive test case creation                 │
│                                                                   │
└─────────────────────────────────────────────────────────────────┘
                          ↓
                   [MANDATORY]
                          ↓
┌─────────────────────────────────────────────────────────────────┐
│ STEP 3: qa-workflow create-tests                                │
├─────────────────────────────────────────────────────────────────┤
│                                                                   │
│ Step 3a: Load Analysis & Strategy Plan                         │
│   ✓ Load Jira ticket requirements (domain context)             │
│   ✓ Load PLAN.md (testing strategy with priorities)            │
│   ✓ Display test scope and priorities to QA Engineer           │
│                                                                   │
│ Step 3b: Understand Testing Strategy                           │
│   ✓ Review PLAN.md details:                                    │
│     - Testing scope and priorities (P0, P1, P2)               │
│     - High-risk areas identified                              │
│     - Domain/technology context                               │
│     - Project-specific requirements                           │
│   ✓ Understand domain context for brainstorming               │
│                                                                   │
│ Step 3c: Brainstorm Test Scenarios                             │
│   [TRIGGER] superpowers:brainstorm                             │
│   Domain-specific exploration:                                 │
│     • What matters most for THIS domain?                       │
│     • What could break in THIS business context?              │
│     • Edge cases specific to THIS feature?                     │
│     • Compliance/regulatory requirements?                      │
│     • Integration points in THIS system?                       │
│   References during brainstorm:                                │
│     📄 Jira ticket (domain context)                           │
│     📄 PLAN.md (strategy & priorities)                        │
│     📄 Project-specific requirements                          │
│   Output: brainstorm-scenarios.md                             │
│     • All brainstormed test scenarios                         │
│     • Scenario descriptions & details                         │
│     • Coverage analysis                                       │
│     • Edge cases identified                                   │
│                                                                   │
│ Output Location:                                                 │
│   📄 qa-workflow/projects/{ticketId}/requirements/brainstorm-scenarios.md  │
│                                                                   │
│ Step 3d: Generate Test Cases from Brainstorm                  │
│   ✓ Review brainstorm-scenarios.md output                      │
│   ✓ For each brainstormed scenario, create test case:          │
│     - Test Case ID (TC-001, TC-002, etc.)                      │
│     - Title (clear, descriptive)                               │
│     - Link to brainstorm scenario                              │
│     - Preconditions & setup                                    │
│     - Test steps (from brainstorm insights)                    │
│     - Expected result (specific, verifiable)                   │
│     - Risk level (based on PLAN.md priorities)                 │
│     - Test data requirements                                   │
│   Use Test Case Generation Skill:                             │
│     ✓ Ensure clarity & testability                            │
│     ✓ Validate all scenarios covered                          │
│     ✓ Suggest edge cases from brainstorm                      │
│     ✓ Link back to requirements                               │
│                                                                   │
│ Step 3e: Review & Validate Test Cases                         │
│   ✓ Display test case summaries                               │
│   ✓ Verify coverage of brainstorm scenarios                   │
│   ✓ Verify alignment with PLAN.md priorities                  │
│   ✓ Check high-risk area coverage                             │
│   ✓ Ask for clarifications & refinements                      │
│   ✓ Validate completeness                                     │
│                                                                   │
│ Step 3f: Organize & Document with Traceability                │
│   ✓ Organize test cases by feature/module                     │
│   ✓ Create test case document with:                           │
│     - Test case summary table                                 │
│     - Full traceability to:                                   │
│       • Jira requirements                                     │
│       • Brainstorm scenarios                                  │
│       • Testing priorities (P0/P1/P2)                         │
│     - Coverage statistics:                                    │
│       • Coverage by requirement (%)                           │
│       • Coverage by brainstorm scenario (%)                   │
│       • Coverage by risk level                                │
│   ✓ Identify any coverage gaps                                │
│                                                                   │
│ Output Location:                                                 │
│   📄 qa-workflow/projects/{ticketId}/test-cases/test-cases.md             │
│                                                                   │
│ Step 3g: Summary                                               │
│   ✓ Display:                                                   │
│     - Total test cases created                                │
│     - Coverage percentages                                    │
│     - High-risk area coverage                                 │
│     - Brainstorm scenarios covered                            │
│     - Any gaps identified                                     │
│                                                                   │
└─────────────────────────────────────────────────────────────────┘
                          ↓
                   [MANDATORY]
                          ↓
┌─────────────────────────────────────────────────────────────────┐
│ STEP 4: qa-workflow prepare-data (next step)                    │
├─────────────────────────────────────────────────────────────────┤
│ (Continues the flow with data preparation...)                   │
└─────────────────────────────────────────────────────────────────┘
```

---

## Document Chain & Traceability

### Documents Created by Analyze Phase

**impact-analysis.md** (`qa-workflow/projects/{ticketId}/requirements/impact-analysis.md`)
- **Input:** Jira ticket (domain context)
- **Superpowers:** brainstorm (impacted areas analysis)
- **Contains:**
  - Impacted modules/components list
  - Integration points and connected systems
  - Data flows between modules
  - Dependency map
  - Potential side effects
  - Risk areas due to interconnections
  - Backward compatibility concerns

**PLAN.md** (`qa-workflow/projects/{ticketId}/requirements/PLAN.md`)
- **Input:** 
  - Jira ticket (domain context)
  - impact-analysis.md (impacted areas & dependencies)
- **Superpowers:** write-plan (domain-specific planning incorporating impact analysis)
- **Contains:**
  - Testing scope & objectives (domain context)
  - High-risk areas (domain-specific, including integration risks)
  - Test priorities: P0, P1, P2
  - Coverage goals (including integration coverage)
  - Testing roadmap
  - Project-specific considerations
  - Integration testing strategy (based on impact analysis)

### Documents Created by Create-Tests Phase

**brainstorm-scenarios.md** (`qa-workflow/projects/{ticketId}/requirements/brainstorm-scenarios.md`)
- **Input:** 
  - Jira ticket requirements (domain context)
  - PLAN.md (strategy & priorities)
- **Superpowers:** brainstorm (domain-specific scenario exploration)
- **Contains:**
  - All brainstormed test scenarios
  - Scenario details & descriptions
  - Happy path scenarios
  - Alternative flow scenarios
  - Error & edge case scenarios
  - Non-functional test scenarios (security, performance, compliance)
  - Industry-specific compliance scenarios
  - Integration point scenarios
  - Coverage analysis
  - Gaps identified during brainstorm

**test-cases.md** (`qa-workflow/projects/{ticketId}/test-cases/test-cases.md`)
- **Input:**
  - Jira ticket requirements
  - PLAN.md (strategy & priorities)
  - brainstorm-scenarios.md (scenarios identified)
- **Generation Method:** Test Case Generation Skill
- **Contains:**
  - Test cases (TC-001, TC-002, etc.)
  - For each test case:
    - Title & description
    - Link to Jira requirement
    - Link to brainstorm scenario
    - Priority (P0/P1/P2 from PLAN.md)
    - Preconditions & setup
    - Numbered test steps
    - Expected result
    - Test data requirements
    - Risk level
  - Test case summary table
  - Coverage statistics:
    - Coverage by requirement (%)
    - Coverage by brainstorm scenario (%)
    - Coverage by risk level
  - Organized by feature/module

---

## Domain-Specific Context Flow

### How Domain Context is Maintained

```
┌─────────────────┐
│ Jira Ticket     │ (Domain context source)
│                 │
│ • Title         │
│ • Description   │
│ • Requirements  │
│ • Domain type   │
│ • Industry      │
│ • Compliance    │
└────────┬────────┘
         │
         ↓
    [analyze]
         │
    Step 1: Load ticket
    Step 2: brainstorm impact analysis
    (identify impacted modules)
         │
         ↓
┌──────────────────────┐
│ impact-analysis.md   │ (Impacted areas & dependencies)
│                      │
│ • Impacted modules   │
│ • Integration points │
│ • Dependencies       │
│ • Data flows         │
└──────────┬───────────┘
           │
           ↓
    Step 3: write-plan trigger
    (domain + impact-aware planning)
           │
           ↓
┌──────────────────────┐
│ PLAN.md              │ (Strategy with impact context)
│                      │
│ • Scope              │
│ • Priorities (P0/P1) │
│ • High-risk areas    │
│ • Integration tests  │
│ • Dependencies noted │
└──────────┬───────────┘
         │
         ↓
  [create-tests]
         │
    Step 1: Load analysis + impact
    Step 2: Review impacted areas & strategy
         │
         ↓
    brainstorm trigger
    (domain + impact-aware scenarios)
    
    References:
    ✓ Jira ticket (domain)
    ✓ impact-analysis.md (impacted modules)
    ✓ PLAN.md (strategy + integration tests)
    ✓ Project requirements
         │
         ↓
┌──────────────────────────┐
│ brainstorm-scenarios     │ (Domain + Impact-specific)
│                          │
│ Includes scenarios for:  │
│ • Feature domain         │
│ • Business context       │
│ • Compliance needs       │
│ • Integration points     │
│ • Impacted modules       │
│ • Data dependencies      │
│ • Side effects testing   │
│ • End-to-end workflows   │
└──────────┬───────────────┘
           │
           ↓
    Test Case Generation
    (using domain context)
           │
           ↓
┌─────────────────────┐
│ test-cases.md       │ (Domain-aware test cases)
│                     │
│ Each test case:     │
│ ✓ Links to domain   │
│ ✓ Links to scenario │
│ ✓ Links to strategy │
│ ✓ Includes domain-  │
│   specific steps    │
└─────────────────────┘
```

---

## Key Principles

1. **Domain Context First**: Every step starts by understanding the domain context from the Jira ticket
2. **Strategy-Driven**: All test case creation follows the testing strategy (PLAN.md)
3. **Scenario-Based**: Test cases are generated from explicitly brainstormed scenarios
4. **Full Traceability**: Every test case traces back to:
   - Jira requirement
   - Brainstorm scenario
   - Testing priority
5. **Gap Analysis**: Coverage gaps are identified and documented

---

## Quality Checks at Each Step

### After Analyze (PLAN.md)
- ✓ Jira ticket understood
- ✓ Testing scope defined
- ✓ High-risk areas identified
- ✓ Priorities assigned (P0/P1/P2)
- ✓ Domain context captured

### After Brainstorm (brainstorm-scenarios.md)
- ✓ All major scenarios identified
- ✓ Happy path covered
- ✓ Alternative flows explored
- ✓ Error scenarios included
- ✓ Edge cases considered
- ✓ Domain-specific scenarios included
- ✓ Compliance requirements identified
- ✓ Gaps documented

### After Test Case Generation (test-cases.md)
- ✓ All scenarios have corresponding test cases
- ✓ All requirements covered by at least one test
- ✓ High-risk areas have adequate coverage
- ✓ Test cases are clear and testable
- ✓ Test data requirements identified
- ✓ Full traceability to requirements and scenarios
- ✓ Coverage statistics calculated
- ✓ No gaps in requirements coverage

---

## Example: E-Commerce Payment Feature

### Scenario: Testing Payment Processing

#### Step 1: Jira Ticket (Domain Context)
```
PROJ-456: Implement Credit Card Payment Processing
Description: Add credit card payment functionality with PCI DSS compliance
Domain: Financial/E-commerce
Compliance: PCI DSS, fraud prevention
```

#### Step 2: PLAN.md (Domain-Specific Strategy)
```
Domain: E-commerce Payment Processing
High-Risk Areas:
  P0: Successful payment processing (revenue impact)
  P0: Payment failure handling (user experience)
  P1: Fraud detection (security)
  P1: PCI DSS compliance (regulatory)

Testing Roadmap:
  - Payment flow (happy path)
  - Error handling (failed cards, timeouts)
  - Fraud detection scenarios
  - PCI compliance validation
```

#### Step 3: brainstorm-scenarios.md (Domain-Specific Brainstorm)
```
Happy Path:
  - Valid card, sufficient funds
  - Card declined (insufficient funds)
  - Card declined (fraud detection)

Error Scenarios:
  - Network timeout during payment
  - Invalid card number
  - Expired card
  - Incorrect CVV
  - Card locked after failed attempts

Compliance Scenarios:
  - PCI DSS: Card data not stored in logs
  - PCI DSS: SSL/TLS encryption verified
  - Fraud detection: Unusual transaction amount
  - Fraud detection: Unusual geographic location

Edge Cases:
  - Payment at currency conversion boundary
  - Transaction at 23:59:59 (boundary time)
  - Concurrent duplicate payments
```

#### Step 4: test-cases.md (Domain-Aware Test Cases)
```
TC-001: Valid Credit Card Payment (P0)
  Brainstorm Scenario: Happy Path - Valid card, sufficient funds
  Steps: [payment flow steps]
  Expected: Payment succeeds, order confirmed
  
TC-002: Card Declined - Insufficient Funds (P0)
  Brainstorm Scenario: Error Scenarios - Card declined
  Steps: [decline handling steps]
  Expected: Clear error message, offer alternatives

TC-003: PCI DSS Compliance - Card Data Not Logged (P1)
  Brainstorm Scenario: Compliance - PCI DSS compliance validation
  Steps: [log verification steps]
  Expected: Card data NOT in application logs

TC-004: Fraud Detection - Unusual Location (P1)
  Brainstorm Scenario: Fraud Detection - Unusual geographic location
  Steps: [fraud detection steps]
  Expected: Transaction flagged for review or blocked

...
```

---

## Summary

The complete analyze → brainstorm → create-tests flow ensures:
- **Domain context** is maintained throughout
- **Testing strategy** guides all test case creation
- **Brainstorming** happens explicitly and systematically
- **Traceability** connects every test case to requirements and scenarios
- **Coverage** is verified and gaps are identified
- **Quality** is ensured at every step
