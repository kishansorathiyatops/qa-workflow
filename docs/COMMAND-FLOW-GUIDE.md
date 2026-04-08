# QA Workflow - Command Flow Guide

## ✅ Mandatory Command Sequence

This guide ensures every user follows the proper sequence of commands in order.

---

## 📋 Complete Command Flow Chart

```
┌─────────────────────────────────────────────────────────────┐
│ STEP 1: INITIALIZE PROJECT                                   │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│   qa-workflow init                                            │
│   └─ Jira Ticket ID: PROJ-123                               │
│   ✓ Project created with Jira integration                    │
│                                                               │
└─────────────────────────────────────────────────────────────┘
                          ↓
                   [MANDATORY]
                          ↓
┌─────────────────────────────────────────────────────────────┐
│ STEP 2: ANALYZE & PLAN TESTING STRATEGY                     │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│   qa-workflow analyze                                         │
│   └─ [superpowers:write-plan] - Create PLAN.md              │
│   └─ Load Jira ticket details                               │
│   ✓ Testing strategy plan created                           │
│                                                               │
└─────────────────────────────────────────────────────────────┘
                          ↓
                   [MANDATORY]
                          ↓
┌─────────────────────────────────────────────────────────────┐
│ STEP 3: CREATE TEST CASES                                    │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│   qa-workflow create-tests                                    │
│   └─ [superpowers:brainstorm] - Scenario analysis            │
│   └─ Generate comprehensive test cases                       │
│   ✓ Test cases document created                             │
│                                                               │
└─────────────────────────────────────────────────────────────┘
                          ↓
                   [MANDATORY]
                          ↓
┌─────────────────────────────────────────────────────────────┐
│ STEP 4: PREPARE TEST DATA                                    │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│   qa-workflow prepare-data                                    │
│   └─ [superpowers:brainstorm] - Data organization            │
│   └─ Create reusable test data sets                          │
│   ✓ Test data document created                              │
│                                                               │
└─────────────────────────────────────────────────────────────┘
                          ↓
                   [DECISION POINT]
                          ↓
        ┌─────────────────┴─────────────────┐
        │                                   │
   [OPTION A]                         [OPTION B]
        │                                   │
        ↓                                   ↓
┌──────────────────────┐      ┌──────────────────────┐
│ Modify Test Cases?   │      │ Skip Modifications?  │
│ (QA Lead Decision)   │      │ (No changes needed)  │
└──────────────────────┘      └──────────────────────┘
        │                                   │
        ↓                                   │
┌─────────────────────────────────────────┐
│ STEP 5A: MODIFY TEST CASES (OPTIONAL)   │
├─────────────────────────────────────────┤
│                                         │
│ qa-workflow modify-tests                │
│ └─ [superpowers:brainstorm]            │
│    Coverage gap analysis                │
│ └─ Add/Remove test cases               │
│ ✓ Test case modifications done         │
│                                         │
└─────────────────────────────────────────┘
        │
        │ [After modifications OR no changes]
        │
        └─────────────────┬─────────────────┘
                          │
                   [MANDATORY]
                          ↓
┌─────────────────────────────────────────┐
│ STEP 6: REVIEW (QA LEAD GATE)           │
├─────────────────────────────────────────┤
│                                         │
│ qa-workflow review                      │
│ └─ QA Lead validates quality            │
│ └─ Checks coverage & risk               │
│                                         │
│ APPROVAL DECISION:                      │
│ ✓ APPROVED → Proceed to execute        │
│ ⚠️ REVISIONS NEEDED → Return to QA    │
│    Engineer for fixes                   │
│                                         │
└─────────────────────────────────────────┘
        │
        │ [If APPROVED]
        │
        └─────────────────┬─────────────────┐
                          │                 │
                          ↓          [If REVISIONS]
                   [MANDATORY]       │
                          ↓          ↓
                          │    qa-workflow create-tests
                          │    (OR prepare-data)
                          │    └─ Fix issues
                          │    └─ Re-review
                          │
                          ↓
┌─────────────────────────────────────────┐
│ STEP 7: EXECUTE TESTS                   │
├─────────────────────────────────────────┤
│                                         │
│ qa-workflow execute                     │
│ └─ [superpowers:execute-plan]          │
│ └─ Run tests step-by-step              │
│ └─ Track results                        │
│ ✓ Execution results document created   │
│                                         │
└─────────────────────────────────────────┘
                          ↓
                   [MANDATORY]
                          ↓
┌─────────────────────────────────────────┐
│ STEP 8: GENERATE REPORT                 │
├─────────────────────────────────────────┤
│                                         │
│ qa-workflow report                      │
│ └─ Generate Markdown report             │
│ └─ Generate HTML report                 │
│ ✓ Reports created:                     │
│   • test-execution-report.md           │
│   • test-execution-report.html         │
│                                         │
└─────────────────────────────────────────┘
                          ↓
                          ✓
                      COMPLETE
```

---

## 🔄 Command Sequence with Status

### MANDATORY Commands (In Order)

| Step | Command | Purpose | Status | Next |
|------|---------|---------|--------|------|
| 1 | `qa-workflow init` | Setup project | ✓ Mandatory | → analyze |
| 2 | `qa-workflow analyze` | Create testing plan | ✓ Mandatory | → create-tests |
| 3 | `qa-workflow create-tests` | Generate test cases | ✓ Mandatory | → prepare-data |
| 4 | `qa-workflow prepare-data` | Prepare test data | ✓ Mandatory | → (modify-tests OR review) |
| 5 | `qa-workflow review` | QA Lead approval | ✓ Mandatory | → execute (if approved) |
| 6 | `qa-workflow execute` | Run tests | ✓ Mandatory | → report |
| 7 | `qa-workflow report` | Generate reports | ✓ Mandatory | ✓ Complete |

### OPTIONAL Commands

| Step | Command | Purpose | Trigger |
|------|---------|---------|---------|
| 5A | `qa-workflow modify-tests` | Add/remove test cases | Only if QA Lead wants changes |

---

## 📍 Decision Points & Conditional Paths

### Path 1: With Test Modifications
```
prepare-data
    ↓
modify-tests (QA Lead decides to adjust)
    ↓
review
    ↓
execute
    ↓
report
```

### Path 2: Without Test Modifications
```
prepare-data
    ↓
review (skip modify-tests)
    ↓
execute
    ↓
report
```

### Path 3: Review Revisions Needed
```
review
    ↓
QA Lead requests revisions
    ↓
create-tests OR prepare-data (fix issues)
    ↓
review (re-review)
    ↓
execute (if approved)
    ↓
report
```

---

## ✅ Next Command Suggestions at Each Step

### After `qa-workflow init`
```
✓ Project created with Jira Ticket: PROJ-123
Next step: qa-workflow analyze
→ Run: qa-workflow analyze
```

### After `qa-workflow analyze`
```
✓ Testing strategy plan created (PLAN.md)
Next step: qa-workflow create-tests
→ Run: qa-workflow create-tests
```

### After `qa-workflow create-tests`
```
✓ Test cases created (TC-001 through TC-020)
Next step: qa-workflow prepare-data
→ Run: qa-workflow prepare-data
```

### After `qa-workflow prepare-data`
```
✓ Test data sets created (DATA-001 through DATA-010)
Next step: Choose ONE of:
  [1] qa-workflow modify-tests (if QA Lead wants to adjust tests)
  [2] qa-workflow review (if no modifications needed)
→ Run: qa-workflow modify-tests  OR  qa-workflow review
```

### After `qa-workflow modify-tests`
```
✓ Test cases modified (1 added, 0 removed)
Next mandatory step: qa-workflow review
→ Run: qa-workflow review
```

### After `qa-workflow review`
```
Approval Status:
  ✓ APPROVED
  Next mandatory step: qa-workflow execute
  → Run: qa-workflow execute

OR

  ⚠️ REVISIONS NEEDED
  Action: Return to QA Engineer for fixes
  Next step: qa-workflow create-tests OR qa-workflow prepare-data
  Then: Re-run qa-workflow review
```

### After `qa-workflow execute`
```
✓ Test execution completed (85 passed, 5 failed)
Next step: qa-workflow report
→ Run: qa-workflow report
```

### After `qa-workflow report`
```
✓ Reports generated:
  • test-execution-report.md (version-controlled)
  • test-execution-report.html (stakeholder-friendly)
Status: WORKFLOW COMPLETE ✓
```

---

## 🚀 Quick Command Reference

```bash
# Proper sequence in order:
qa-workflow init          # Step 1: Initialize
qa-workflow analyze       # Step 2: Plan
qa-workflow create-tests  # Step 3: Create tests
qa-workflow prepare-data  # Step 4: Prepare data

# CONDITIONAL STEP (Optional):
qa-workflow modify-tests  # Step 5A: Modify tests (if needed)

# Mandatory continuation:
qa-workflow review        # Step 5/6: Review & approve
qa-workflow execute       # Step 6/7: Execute tests
qa-workflow report        # Step 7/8: Generate reports
```

---

## ⚠️ Important Notes

1. **NEVER skip any MANDATORY step** - Each builds on the previous
2. **modify-tests is OPTIONAL** - Only run if QA Lead wants to adjust tests
3. **review is MANDATORY** - Must always be done, even if no test modifications
4. **Approval is required** - execute only runs after review approval
5. **Proper sequence ensures quality** - Don't run commands out of order

---

## Troubleshooting Command Flow

### Issue: "I don't know what to do next"
**Solution:** Look for the "Next step" message at the end of each command's summary. It will tell you exactly which command to run next.

### Issue: "Should I run modify-tests?"
**Solution:** You should run `qa-workflow modify-tests` ONLY if:
- QA Lead wants to add new test cases (missing scenarios)
- QA Lead wants to remove unnecessary test cases
- Coverage analysis shows gaps

Otherwise, skip directly to `qa-workflow review`

### Issue: "Can I skip review?"
**Solution:** **NO** - `qa-workflow review` is MANDATORY. It's the QA Lead's quality gate before execution.

### Issue: "What if review fails?"
**Solution:** If review finds issues:
1. QA Lead documents what needs to be fixed
2. QA Engineer runs `qa-workflow create-tests` or `qa-workflow prepare-data` to fix
3. Run `qa-workflow review` again

---

## 🎯 Command Flow Validation

Every command output includes:
✓ What was accomplished
✓ What files were created
✓ What the NEXT step is

**This ensures you ALWAYS know what to do next!**
