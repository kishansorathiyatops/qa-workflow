---
name: init
description: Initialize new QA project
type: command
---

# qa-workflow init

Initialize a new QA test project.

## Purpose

Sets up a new qa-workflow project with mandatory Jira integration, creates project structure, and links to a Jira Ticket ID.

## Who Uses This

QA Engineer (primary project lead)

## Command Flow

### Step 1: Jira Integration (Compulsory)

Jira integration is required for all projects:
- Request Jira Ticket ID (e.g., PROJ-123)
- Verify connection with the ticket
- Store ticket ID
- **Note:** This step is mandatory and cannot be skipped

### Step 2: Project Setup

- Create project directory structure under `qa-workflow/projects/{ticketId}/`
- Create project config file with metadata
- Create README with project overview
- Initialize git repository (if not already done)
- Create initial CLAUDE.md with integration info
- **NOTE:** Do NOT auto-commit. Let user manage git commits manually.

### Step 3: Summary

Display:
- Jira Ticket ID
- Project location
- Jira integration status
- Next steps (analyze command)

## Output

- Project directory created with:
  - `qa-workflow/projects/{ticketId}/project-config.json` - Project metadata
  - `qa-workflow/projects/{ticketId}/README.md` - Project overview
  - `qa-workflow/projects/{ticketId}/requirements/` - Directory for requirement documents
  - `qa-workflow/projects/{ticketId}/test-cases/` - Directory for test cases
  - `qa-workflow/projects/{ticketId}/test-data/` - Directory for test data
  - `qa-workflow/projects/{ticketId}/test-results/` - Directory for execution results
  - `qa-workflow/projects/{ticketId}/reports/` - Directory for reports

## Example Usage

```
User: qa-workflow init

QA Workflow: Setting up your QA test project with Jira integration.

Step 1: Jira Integration (Required)
Jira Ticket ID: PROJ-123

[Verifying connection with ticket...]
✓ Connection successful! 

QA Workflow: Perfect! Your project is ready.
📁 Project location: projects/PROJ-123/
🔗 Jira Ticket: PROJ-123
📋 Next step: Run 'qa-workflow analyze' to analyze requirements

Ready to proceed!
```

## Technical Details

- Persona: QA Engineer
- Skills triggered: None (setup only)
- Output files: Project config, metadata
- Next command: `analyze`
