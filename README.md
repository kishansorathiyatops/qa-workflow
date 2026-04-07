# QA Workflow

End-to-end QA testing workflow plugin for Claude Code. Guides QA Engineers through complete testing lifecycle:

**Requirements → Test Cases → Test Data → Modify → Review → Execute → Report**

## Quick Start

```bash
# Initialize a new QA test project
qa-workflow init

# Analyze requirements and identify test scope
qa-workflow analyze

# Generate test cases from requirements
qa-workflow create-tests

# Create and organize test data
qa-workflow prepare-data

# Modify test cases - add or remove (QA Lead)
qa-workflow modify-tests

# Review test quality (QA Lead)
qa-workflow review

# Execute tests
qa-workflow execute

# Generate test report
qa-workflow report
```

## Features

- **Requirement Analysis** - Understand scope and identify test scenarios
- **Intelligent Test Case Generation** - Auto-generate comprehensive test cases
- **Smart Test Data Management** - Organize reusable, well-documented test data
- **Quality Review Gates** - QA Lead validation before execution
- **Test Execution Guidance** - Step-by-step test execution tracking
- **Professional Reporting** - Dual format reports (Markdown + HTML) with metrics, defects, trends, and insights
- **Optional Jira Integration** - Pull requirements, link defects, track status

## Who's It For?

- **QA Engineers** - Create, manage, execute, and report on tests
- **QA Leads** - Review quality, approve test plans, assess risk
- **Product Teams** - Professional test reports with metrics and trends

## Workflow Overview

### 1. Init
Initialize a new test project, optionally integrate with Jira.

### 2. Analyze
Understand requirements, identify test scenarios, define strategy.

### 3. Create Test Cases
Generate comprehensive test cases covering all scenarios.

### 4. Prepare Test Data
Create reusable, well-organized test data sets.

### 5. Modify Test Cases (QA Lead)
Add new test cases or remove unnecessary ones before review.

### 6. Review (QA Lead)
Quality gate: verify coverage, validate clarity, assess risk.

### 7. Execute
Execute tests step-by-step, track results, document defects.

### 8. Report
Generate professional test reports in both Markdown (.md) and HTML (.html) formats with metrics, trends, recommendations, and visualizations.

## Structure

```
qa-workflow/
├── commands/         - 8 workflow commands
├── agents/          - QA Engineer & QA Lead personas
├── skills/          - Test generation, data mgmt, review, reporting
├── templates/       - Test case, data, review, report formats
├── docs/            - Guides and documentation
└── lib/             - Library code (Jira integration)
```

## Documentation

- `docs/test-strategies.md` - Testing methodologies and approaches
- `docs/best-practices.md` - QA best practices and guidelines
- `docs/jira-setup.md` - Jira integration setup guide
- `config.md` - Configuration reference

## Commands

- `qa-workflow init` - Initialize project
- `qa-workflow analyze` - Analyze requirements
- `qa-workflow create-tests` - Generate test cases
- `qa-workflow prepare-data` - Create test data
- `qa-workflow modify-tests` - Modify test cases (add/remove)
- `qa-workflow review` - Quality review (QA Lead)
- `qa-workflow execute` - Execute tests
- `qa-workflow report` - Generate report

## Personas

- **QA Engineer** - Primary executor, creates and manages tests
- **QA Lead** - Reviewer, approves test plans, assesses quality

## Skills

- **Test Case Generation** - Create comprehensive, well-formed test cases
- **Test Data Management** - Organize and structure test data
- **Coverage & Quality Review** - Validate quality and completeness
- **Execution & Reporting** - Guide execution and generate insights

## License

MIT

## Contributing

We welcome contributions! Please see CONTRIBUTING.md for guidelines.

## Support

For questions, issues, or feedback:
- Check documentation in `docs/`
- Review examples in `docs/examples/`
- Open an issue on GitHub

---

**Ready to streamline your QA workflow? Let's get started:**

```bash
qa-workflow init
```
