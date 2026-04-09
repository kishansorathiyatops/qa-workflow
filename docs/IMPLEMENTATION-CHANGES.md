# QA Workflow - Implementation Changes

## Summary of Changes (2026-04-09)

This document outlines the changes made to implement the two critical requirements:
1. **Folder Structure**: Organize test cases by Project/TicketID
2. **Domain-Specific Brainstorm**: Ensure brainstorm is tailored to specific domain/project context
3. **No Auto-Commits**: Prevent automatic git commits

---

## 1. Folder Structure Changes

### Previous Structure
- All test artifacts in flat `qa-workflow/` directory
- No ticket-ID based organization

### New Structure
```
projects/
├── {ticketId}/
│   ├── requirements/
│   │   ├── PLAN.md                          (testing strategy)
│   │   ├── brainstorm-scenarios.md          (test scenario analysis)
│   │   ├── brainstorm-data-strategy.md      (data organization strategy)
│   │   └── brainstorm-modifications.md      (test modifications analysis)
│   ├── test-cases/
│   │   └── test-cases.md                    (all test cases)
│   ├── test-data/
│   │   └── test-data.md                     (all test data sets)
│   ├── test-results/
│   │   └── execution-results.md             (execution results)
│   └── reports/
│       ├── review-report.md                 (QA Lead review)
│       ├── test-execution-report.md         (Markdown report)
│       └── test-execution-report.html       (HTML report)
```

### Files Updated for Path Changes

**Commands Updated:**
- `commands/init.md` - Output paths changed to `qa-workflow/projects/{ticketId}/`
- `commands/analyze.md` - Output path: `qa-workflow/projects/{ticketId}/requirements/PLAN.md`
- `commands/create-tests.md` - Output paths: `qa-workflow/projects/{ticketId}/test-cases/` and `qa-workflow/projects/{ticketId}/requirements/`
- `commands/prepare-data.md` - Output paths: `qa-workflow/projects/{ticketId}/test-data/` and `qa-workflow/projects/{ticketId}/requirements/`
- `commands/modify-tests.md` - Output paths: `qa-workflow/projects/{ticketId}/test-cases/` and `qa-workflow/projects/{ticketId}/requirements/`
- `commands/review.md` - Output path: `qa-workflow/projects/{ticketId}/reports/review-report.md`
- `commands/execute.md` - Output path: `qa-workflow/projects/{ticketId}/test-results/execution-results.md`
- `commands/report.md` - Output paths: `qa-workflow/projects/{ticketId}/reports/test-execution-report.md` and `.html`

**Documentation Updated:**
- `docs/NEXT-COMMAND-PROMPTS.md` - Updated all example paths to use new structure

**Scripts Updated:**
- `scripts/setup.sh` - Added notes about individual project directory creation

---

## 2. Domain-Specific Brainstorm Enhancement

### Changes Made

All brainstorm steps now include **explicit domain/project context** instructions:

**In `commands/analyze.md` (write-plan):**
```
**IMPORTANT:** Include in your planning:
- Specific domain/technology context from the Jira ticket
- Industry-specific compliance or quality requirements
- Project-specific testing standards or best practices
- Integration points or dependencies mentioned in the ticket
```

**In `commands/create-tests.md` (brainstorm):**
```
**IMPORTANT:** Reference:
- The Jira ticket description and requirements (domain context)
- Testing strategy plan (PLAN.md) created in analyze step
- Project-specific requirements from the ticket
```

**In `commands/prepare-data.md` (brainstorm):**
```
**IMPORTANT:** Reference:
- The Jira ticket requirements (domain context)
- Test cases created (test-cases.md) 
- Testing strategy plan (PLAN.md)
```

**In `commands/modify-tests.md` (brainstorm):**
```
**IMPORTANT:** Reference:
- The Jira ticket and requirements (domain context)
- Testing strategy plan (PLAN.md)
- Current test cases and brainstorm documents
```

### Brainstorm Context Improvements

Each brainstorm trigger now asks domain-specific questions:
- Questions are tailored to the feature/domain context
- References to Jira ticket context are included
- Industry-specific compliance and requirements are considered
- Project-type-specific testing standards are incorporated

---

## 3. No Auto-Commit Implementation

### Changes Made

**In `commands/init.md`:**
```
- **NOTE:** Do NOT auto-commit. Let user manage git commits manually.
```

**In `commands/analyze.md`:**
```
- **NOTE:** No auto-commit. Files saved locally for user to review and commit.
```

**In `commands/create-tests.md`:**
```
- **NOTE:** No auto-commit. Files saved locally for user to review and commit.
```

**In `commands/prepare-data.md`:**
```
- **NOTE:** No auto-commit. Files saved locally for user to review and commit.
```

**In `commands/modify-tests.md`:**
```
- **NOTE:** No auto-commit. Files saved locally for user to review and commit.
```

**In `commands/review.md`:**
```
- **NOTE:** No auto-commit. Files saved locally for user to review and commit.
```

**In `commands/execute.md`:**
```
- **NOTE:** No auto-commit. Files saved locally for user to review and commit.
```

**In `commands/report.md`:**
```
### No Auto-Commit
- **NOTE:** No auto-commit. Files saved locally for user to review and commit.
```

**In `scripts/setup.sh`:**
```
# Note: Do NOT auto-commit when creating individual project artifacts
# Let users manage git commits for qa-workflow/projects/{ticketId}/ separately
```

---

## Verification Checklist

- ✅ All command files updated with `qa-workflow/projects/{ticketId}/` folder structure
- ✅ All brainstorm steps include domain-specific context instructions
- ✅ All brainstorm steps reference Jira ticket requirements
- ✅ All commands include "No auto-commit" notes
- ✅ Documentation updated with new folder paths
- ✅ Setup script updated with folder structure notes

---

## Migration Guide

### For Existing Projects

If you have existing test artifacts in the flat structure:

1. Create the new folder structure:
   ```bash
   mkdir -p projects/{TICKET_ID}/{requirements,test-cases,test-data,test-results,reports}
   ```

2. Move existing files:
   ```bash
   mv qa-workflow/PLAN.md projects/{TICKET_ID}/requirements/
   mv qa-workflow/test-cases.md projects/{TICKET_ID}/test-cases/
   mv qa-workflow/test-data.md projects/{TICKET_ID}/test-data/
   ```

3. Commit the reorganization:
   ```bash
   git add projects/
   git commit -m "refactor: reorganize test artifacts by ticket ID"
   ```

---

## Impact

- **Folder Organization**: Test artifacts are now properly organized by project/ticket ID
- **Domain Specificity**: Brainstorm activities are tailored to specific domain/project context
- **User Control**: Users have full control over when to commit changes (no auto-commits)
- **Scalability**: Multiple projects can be managed independently under `projects/` directory

---

## Next Steps

1. Run `qa-workflow init` with a Jira Ticket ID
2. Test the workflow to ensure folder structure is created correctly
3. Verify brainstorm steps include domain-specific context
4. Confirm git commits are manual only
