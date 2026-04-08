# QA Workflow - Next Command Prompts

## Purpose

This document defines the standardized "Next Command" prompts that should appear at the end of EVERY command execution to guide users to the next step.

---

## Standardized Next Command Format

Every command should display this format at the end:

```
═══════════════════════════════════════════════════════════
✓ [Command Name] Complete!

Summary:
- [Key output 1]
- [Key output 2]
- [Key output 3]

Next Step: [Next Command]
→ Run: qa-workflow [next-command]
═══════════════════════════════════════════════════════════
```

---

## Command-Specific Next Command Prompts

### 1. After `qa-workflow init`

```
═══════════════════════════════════════════════════════════
✓ Project initialized!

Summary:
- Jira Ticket ID: PROJ-123
- Project location: qa-workflow/
- Jira integration: Enabled

Next Step: Analyze requirements and plan testing strategy
→ Run: qa-workflow analyze
═══════════════════════════════════════════════════════════
```

---

### 2. After `qa-workflow analyze`

```
═══════════════════════════════════════════════════════════
✓ Testing strategy created!

Summary:
- Testing plan document: PLAN.md
- Test scope: [Identified]
- Risk assessment: [Completed]

Next Step: Create comprehensive test cases
→ Run: qa-workflow create-tests
═══════════════════════════════════════════════════════════
```

---

### 3. After `qa-workflow create-tests`

```
═══════════════════════════════════════════════════════════
✓ Test cases generated!

Summary:
- Total test cases: 20
- Coverage: 95%
- Test case document: test-cases.md

Next Step: Create and organize test data
→ Run: qa-workflow prepare-data
═══════════════════════════════════════════════════════════
```

---

### 4. After `qa-workflow prepare-data`

```
═══════════════════════════════════════════════════════════
✓ Test data prepared!

Summary:
- Total data sets: 10
- Reusability: Optimized
- Test data document: test-data.md

Next Step: Choose ONE of the following:

Option A (If QA Lead wants to modify tests):
→ Run: qa-workflow modify-tests

Option B (If no modifications needed):
→ Run: qa-workflow review

═══════════════════════════════════════════════════════════
```

---

### 5. After `qa-workflow modify-tests`

```
═══════════════════════════════════════════════════════════
✓ Test cases modified!

Summary:
- Test cases added: 2
- Test cases removed: 1
- New total: 21

Next Mandatory Step: Quality review (QA Lead)
→ Run: qa-workflow review
═══════════════════════════════════════════════════════════
```

---

### 6. After `qa-workflow review`

```
APPROVAL DECISION REQUIRED!

══════════════════════════════════════════════════════════

IF APPROVED ✓:

Next Mandatory Step: Execute tests
→ Run: qa-workflow execute

══════════════════════════════════════════════════════════

IF REVISIONS NEEDED ⚠️:

Action: QA Engineer fixes issues
Next Step: Run ONE of:
→ qa-workflow create-tests (to fix test cases)
→ qa-workflow prepare-data (to fix test data)

Then re-run:
→ qa-workflow review (for re-review)

═══════════════════════════════════════════════════════════
```

---

### 7. After `qa-workflow execute`

```
═══════════════════════════════════════════════════════════
✓ Test execution complete!

Summary:
- Total tests executed: 21
- Passed: 18
- Failed: 3
- Pass rate: 85.7%

Next Step: Generate test execution report
→ Run: qa-workflow report
═══════════════════════════════════════════════════════════
```

---

### 8. After `qa-workflow report`

```
═══════════════════════════════════════════════════════════
✓ Reports generated!

Summary:
- Markdown report: test-execution-report.md ✓
- HTML report: test-execution-report.html ✓
- Total defects: 3
- Coverage: 95%

Status: WORKFLOW COMPLETE! ✅

Next Steps:
1. Review reports with stakeholders
2. Create defects in Jira (if integrated)
3. Plan next test cycle

═══════════════════════════════════════════════════════════
```

---

## Implementation Notes

### Where to Add These Prompts

Each command should display this prompt in the **Step 7/8/9 (Final Summary)** section:
- At the very end of command execution
- Before the command exits
- As the last thing the user sees

### Format Guidelines

1. **Always use consistent format** - Same border, layout, style
2. **Be explicit about next step** - Use → Run: command syntax
3. **Provide options** - Show alternatives (like after prepare-data)
4. **Handle conditionals** - Show different prompts for different outcomes
5. **Use visual indicators** - ✓ for success, ⚠️ for warnings, ❌ for errors

### Example Implementation in Command File

```markdown
### Step 7: Summary

Display:
- [Summary items...]
- **Next Step:**
  - Mandatory: qa-workflow review
  - Command: qa-workflow review
  
Display prompt:
═══════════════════════════════════════════════════════════
✓ Test data prepared!
Summary:
- Total data sets: 10
- Next mandatory step: qa-workflow review
→ Run: qa-workflow review
═══════════════════════════════════════════════════════════
```

---

## Guarantees This Provides

✅ **Users always know what to do next**
✅ **No confusion about command sequence**
✅ **Clear distinction between mandatory and optional steps**
✅ **Handles all decision points and conditional paths**
✅ **Consistent user experience across all commands**
✅ **Review command is ALWAYS explicitly suggested**

---

## Testing the Flow

To verify the flow works correctly:

1. Run `qa-workflow init` → Should suggest analyze
2. Run `qa-workflow analyze` → Should suggest create-tests
3. Run `qa-workflow create-tests` → Should suggest prepare-data
4. Run `qa-workflow prepare-data` → Should suggest modify-tests OR review
5. Run `qa-workflow review` → Should suggest execute (if approved) OR return to fixes
6. Run `qa-workflow execute` → Should suggest report
7. Run `qa-workflow report` → Should indicate complete

**Every user should ALWAYS know exactly which command to run next!**
