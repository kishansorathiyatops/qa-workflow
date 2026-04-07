# Claude Code Integration Configuration

QA Workflow plugin integration with Claude Code.

## Plugin Registration

The qa-workflow plugin is registered in Claude Code via:
- `.claude-plugin/plugin.json` - Plugin metadata and commands
- `.claude-plugin/marketplace.json` - Marketplace listing

## Available Commands

### Primary Commands

1. **qa-workflow init**
   - Initialize new QA project
   - Configure Jira integration (optional)
   - Used by: QA Engineer

2. **qa-workflow analyze**
   - Analyze requirements, identify scenarios
   - Used by: QA Engineer

3. **qa-workflow create-tests**
   - Generate test cases from requirements
   - Triggers: Test Case Generation Skill
   - Used by: QA Engineer

4. **qa-workflow prepare-data**
   - Create and organize test data
   - Triggers: Test Data Management Skill
   - Used by: QA Engineer

5. **qa-workflow review**
   - Quality review of test cases (QA Lead gate)
   - Triggers: Coverage & Quality Review Skill
   - Used by: QA Lead

6. **qa-workflow execute**
   - Execute tests and track results
   - Triggers: Execution & Reporting Skill
   - Used by: QA Engineer

7. **qa-workflow report**
   - Generate test execution report
   - Triggers: Execution & Reporting Skill
   - Used by: QA Engineer

## Available Agents/Personas

- **qa-engineer** - QA Engineer executor persona
- **qa-lead** - QA Lead reviewer persona

## Available Skills

- **test-case-generation** - Test case creation and validation
- **test-data-management** - Test data organization
- **coverage-review** - Quality and coverage review
- **execution-reporting** - Test execution and report generation

## Usage in Claude Code

### Invoking Commands

```
/qa-workflow init
/qa-workflow analyze
/qa-workflow create-tests
/qa-workflow prepare-data
/qa-workflow review
/qa-workflow execute
/qa-workflow report
```

### Using Agents

Commands automatically use appropriate agent:
- `init`, `analyze`, `create-tests`, `prepare-data`, `execute`, `report` → QA Engineer
- `review` → QA Lead

### Using Skills

Commands trigger skills automatically based on context:
- `create-tests` → Test Case Generation Skill
- `prepare-data` → Test Data Management Skill
- `review` → Coverage & Quality Review Skill
- `execute`, `report` → Execution & Reporting Skill

## Workflow Integration

QA Workflow integrates with Claude Code's workflow engine to:
- Guide step-by-step through testing lifecycle
- Maintain context across commands
- Generate and manage output documents
- Track progress through test cycle

## Jira Integration

Optional Jira integration available:
- Pull requirements from Jira
- Create test case issues in Jira
- Link failures to bug tickets
- Update ticket status

See `docs/jira-setup.md` for setup instructions.

## Output Generation

All outputs are generated as Markdown documents:
- Test case documents
- Test data specifications
- Review reports
- Test execution reports

Documents are version-control friendly and can be shared, archived, and tracked.

## Performance Notes

- Test case generation: ~2-5 minutes for 20-30 cases
- Data preparation: ~3-5 minutes for 20-30 cases
- Test execution guidance: Depends on test count (~10-15 min per test)
- Report generation: ~2 minutes

## Troubleshooting

- **Plugin not appearing in Claude Code:** Verify `.claude-plugin/plugin.json` is valid
- **Jira integration issues:** Check Jira credentials in project config
- **Missing output files:** Verify write permissions in project directory
- **Command not found:** Run `qa-workflow init` first to set up project

## Development Notes

- Plugin uses Markdown-based architecture for easy editing and version control
- Each command, agent, skill is self-contained and modular
- Templates are reusable and customizable
- Integration points with Claude Code are in `.claude-plugin/`

## Next Steps

1. Review `docs/test-strategies.md` for testing methodologies
2. Check `docs/jira-setup.md` if using Jira
3. Run `qa-workflow init` to start a project
4. Refer to `docs/examples/` for sample test cases and data
