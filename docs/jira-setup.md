# Jira Integration Setup

Configure qa-workflow to integrate with Jira for requirements and defect tracking.

## Prerequisites

- Jira Cloud account with API access
- Jira project created for your software
- Jira API token generated for your account

## Setup Steps

### Step 1: Generate Jira API Token

1. Log in to Jira Cloud
2. Go to Settings > Security > API tokens
3. Click "Create token"
4. Name it (e.g., "qa-workflow-token")
5. Click "Create"
6. Copy the token (you'll need it below)

### Step 2: Initialize qa-workflow with Jira

Run:
```bash
qa-workflow init
```

When prompted:
```
Project name: My Project Name
Description: Project description

Do you want to integrate with Jira? (y/n): y

Jira Cloud ID: your-domain.atlassian.net
Jira Project Key: PROJ

Jira Email: your-email@example.com
Jira API Token: [paste token from Step 1]

Testing Jira connection...
✓ Connection successful!
```

### Step 3: Verify Integration

Test the integration:
```bash
qa-workflow analyze
```

If Jira is configured, you'll be prompted to pull requirements from Jira:
```
Where are your requirements?
[1] Upload document
[2] Paste requirements
[3] Jira project (PROJ) ← Select this
[4] Other source

Select: 3
Pulling requirements from Jira project PROJ...
✓ Found 12 issues
```

## Features Enabled with Jira Integration

### Pull Requirements
```
qa-workflow analyze
→ Can pull requirements from Jira issues
→ Automatically extract acceptance criteria
```

### Create Test Cases in Jira (Optional)
```
qa-workflow create-tests
→ Optionally create test case issues in Jira
→ Link to requirement issues
```

### Link Defects to Jira
```
qa-workflow execute
→ Create Jira bugs from test failures
→ Automatically link to test cases
→ Include reproduction steps
```

### Update Jira Status (Optional)
```
qa-workflow report
→ Update requirement status based on test results
→ Track testing progress in Jira
```

## Project Configuration

Jira settings are stored in `qa-workflow/project-config.json`:

```json
{
  "jiraIntegration": {
    "enabled": true,
    "cloudId": "your-domain.atlassian.net",
    "projectKey": "PROJ",
    "syncOptions": {
      "pullRequirements": true,
      "createTestCases": false,
      "linkDefects": true,
      "updateStatus": false
    }
  }
}
```

### Options

- **pullRequirements:** Pull requirements from Jira (recommended: true)
- **createTestCases:** Create test case issues in Jira (recommended: false initially)
- **linkDefects:** Link test failures to Jira bugs (recommended: true)
- **updateStatus:** Auto-update Jira issue status (recommended: false initially)

## Troubleshooting

### "Connection failed"
- Verify Jira Cloud ID is correct
- Verify API token is valid and not expired
- Check network access to Jira

### "Project not found"
- Verify project key matches your Jira project
- Ensure you have access to the project

### "Permission denied"
- Verify API token has required permissions
- Check user has project access in Jira

### Requirements not showing up
- Verify issues are in the correct project
- Check issue type is recognized (Story, Task, etc.)
- Verify issues have acceptance criteria

## Disabling Jira Integration

To work standalone without Jira:

In `qa-workflow/project-config.json`, set:
```json
{
  "jiraIntegration": {
    "enabled": false
  }
}
```

Or run `qa-workflow init` again and choose not to integrate with Jira.

## Best Practices

1. **Organize Requirements in Jira First**
   - Create clear stories with acceptance criteria
   - Use consistent naming and labeling
   - Keep requirements up-to-date

2. **Link Test Cases to Requirements**
   - Each test case should link to a requirement
   - Helps track coverage in Jira

3. **Use Standard Issue Types**
   - Story, Task, Bug are recognized
   - Custom issue types may not work

4. **Secure Your API Token**
   - Don't share tokens
   - Rotate tokens regularly
   - Use tokens instead of passwords

5. **Regular Syncs**
   - Pull requirements at cycle start
   - Link defects as they're found
   - Update status after testing

## Advanced: Custom Issue Mapping

For custom Jira configurations, edit the Jira integration settings. By default, qa-workflow maps:
- Jira Stories → Requirements
- Test executions → Jira Issues
- Test failures → Jira Bugs

Contact support for custom mappings.

## Support

For Jira integration issues:
- Verify Jira Cloud access
- Check API token permissions
- Review Jira documentation
- Contact Jira support if needed
