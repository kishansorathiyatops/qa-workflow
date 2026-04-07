# QA Workflow Configuration

Default configuration and settings for qa-workflow plugin.

## Project Configuration

When you run `qa-workflow init`, a project config file is created with:

```json
{
  "projectName": "My Test Project",
  "description": "Project description",
  "testScope": "What's being tested",
  "teamMembers": ["member1", "member2"],
  "jiraIntegration": {
    "enabled": false,
    "cloudId": "your-domain.atlassian.net",
    "projectKey": "PRJ"
  },
  "coverageGoal": 90,
  "environment": "test"
}
```

## Command Defaults

- **init:** Creates new project with default structure
- **analyze:** Analyzes requirements, defaults to 80%+ coverage goal
- **create-tests:** Generates test cases using Test Case Generation Skill
- **prepare-data:** Organizes test data for reusability
- **review:** QA Lead review gates test plan
- **execute:** Executes tests and tracks results
- **report:** Generates report with pass rate and defects

## Test Case Naming Convention

- **Test Case IDs:** TC-001, TC-002, etc. (sequential)
- **Naming:** [Feature Area]-[Scenario] (e.g., "Login-Valid Credentials", "Payment-Timeout Error")

## Test Data Naming Convention

- **Data Set IDs:** DATA-001, DATA-002, etc. (sequential)
- **Naming:** [Type]-[Scenario] (e.g., "User-Active Premium", "Card-Visa Valid")

## Defect Naming Convention

- **Defect IDs:** BUG-001, BUG-002, etc. (sequential or from Jira)
- **Naming:** [Area]-[Issue] (e.g., "Payment-Timeout Not Shown", "Webhook-Infinite Retry")

## Jira Integration Configuration

If using Jira:

```json
{
  "jiraIntegration": {
    "enabled": true,
    "cloudId": "your-domain.atlassian.net",
    "projectKey": "PAY",
    "credentials": "stored securely",
    "syncOptions": {
      "pullRequirements": true,
      "createTestCases": false,
      "linkDefects": true,
      "updateStatus": false
    }
  }
}
```

## Best Practices

- Keep test cases focused (one scenario per case)
- Use descriptive test data names
- Document all data dependencies
- Review test quality before execution
- Track defects consistently
- Generate reports after each test cycle
- Archive old test results for trend analysis

## Support

For questions or issues, see:
- `docs/test-strategies.md` - Testing approaches
- `docs/best-practices.md` - QA best practices
- `docs/jira-setup.md` - Jira integration guide
