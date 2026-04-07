# qa-workflow init

Initialize a new QA test project.

## Purpose

Sets up a new qa-workflow project with mandatory Jira integration, creates project structure, and configures Jira credentials.

## Who Uses This

QA Engineer (primary project lead)

## Command Flow

### Step 1: Jira Integration (Compulsory)

Jira integration is required for all projects:
- Request Jira Cloud ID
- Request Jira Project Key
- Verify connection
- Store credentials securely
- **Note:** This step is mandatory and cannot be skipped

### Step 2: Project Setup

- Create project directory structure
- Create project config file with metadata
- Create README with project overview
- Initialize git repository (if not already done)
- Create initial CLAUDE.md with integration info

### Step 3: Summary

Display:
- Jira project details (Cloud ID, Project Key)
- Project location
- Jira integration status
- Next steps (analyze command)

## Output

- Project directory created with:
  - `qa-workflow/project-config.json` - Project metadata
  - `qa-workflow/README.md` - Project overview
  - `qa-workflow/requirements/` - Directory for requirement documents
  - `qa-workflow/test-cases/` - Directory for test cases
  - `qa-workflow/test-data/` - Directory for test data
  - `qa-workflow/test-results/` - Directory for execution results
  - `qa-workflow/reports/` - Directory for reports

## Example Usage

```
User: qa-workflow init

QA Workflow: Setting up your QA test project with Jira integration.

Step 1: Jira Integration (Required)
Jira Cloud ID: your-domain.atlassian.net
Jira Project Key: PAY

[Verifying Jira connection...]
✓ Connection successful! 

QA Workflow: Perfect! Your project is ready.
📁 Project location: qa-workflow/
🔗 Jira integration: Enabled (PAY project)
📋 Next step: Run 'qa-workflow analyze' to analyze requirements

Ready to proceed!
```

## Technical Details

- Persona: QA Engineer
- Skills triggered: None (setup only)
- Output files: Project config, metadata
- Next command: `analyze`
