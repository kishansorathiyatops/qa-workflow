# qa-workflow init

Initialize a new QA test project.

## Purpose

Sets up a new qa-workflow project, creates project structure, and optionally configures Jira integration.

## Who Uses This

QA Engineer (primary project lead)

## Command Flow

### Step 1: Project Information

Prompt for:
- **Project Name:** [e.g., "Payment Processing v1.5.0"]
- **Description:** [Brief project description]
- **Test Scope:** [What's being tested - features, modules, etc.]
- **Team Members:** [Who will be involved - QA Engineers, QA Lead, etc.]

### Step 2: Requirements Source

Ask where requirements come from:
- [ ] Upload requirements document
- [ ] Paste requirements text
- [ ] Jira project (if Jira integration chosen)
- [ ] Other source

### Step 3: Jira Integration (Optional)

Ask: "Do you want to integrate with Jira?"
- If Yes:
  - Request Jira Cloud ID
  - Request Jira Project Key
  - Verify connection
  - Store credentials securely
- If No:
  - Proceed with standalone workflow

### Step 4: Project Setup

- Create project directory structure
- Create project config file with metadata
- Create README with project overview
- Initialize git repository (if not already done)
- Create initial CLAUDE.md with integration info

### Step 5: Summary

Display:
- Project name and description
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

QA Workflow: Hello! Let's set up your new QA test project.

Project name: Payment Processing v1.5.0
Description: Testing new payment gateway integration
Test scope: Payment processing, refunds, retry logic
Team: John (QA Engineer), Sarah (QA Lead)

Excellent! Now, where are your requirements?
[1] Upload document
[2] Paste requirements
[3] Jira project
[4] Other source

User chooses [3] Jira

QA Workflow: Great! Jira integration will help us pull requirements directly.
Jira Cloud ID: your-domain.atlassian.net
Jira Project Key: PAY

[Verifying Jira connection...]
✓ Connection successful! 

QA Workflow: Perfect! Your project "Payment Processing v1.5.0" is ready.
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
