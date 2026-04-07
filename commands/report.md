# qa-workflow report

Generate comprehensive test execution report with metrics and insights.

## Purpose

Compile test execution results into a professional report with metrics, defect analysis, trends, and recommendations.

## Who Uses This

QA Engineer

## Command Flow

### Step 1: Load Execution Results

Load execution results from `execute` command.
Display execution summary.

### Step 2: Compile Metrics

Calculate:
- Total test cases, passed, failed, blocked, skipped
- Pass rate percentage
- Defect count and categorization
- Coverage percentage
- Execution time/duration
- Defects per feature area

### Step 3: Trend Analysis

Compare to previous cycle (if available):
- Previous pass rate vs. current
- Trend (improving/declining/stable)
- Defect count trend
- Coverage trend

Use Execution & Reporting Skill to:
- Identify patterns
- Analyze quality trajectory
- Highlight improvements or regressions

### Step 4: Defect Analysis

Analyze defects:
- Categorize by severity (critical/high/medium/low)
- Group by feature/area
- Identify patterns
- Assess impact

### Step 5: Risk Assessment

Assess overall product quality:
- Risk areas that remain
- Confidence level in quality
- Areas requiring additional testing
- Readiness for release

### Step 6: Insights & Recommendations

Generate insights:
- What went well
- What needs improvement
- Recommendations for next cycle
- Risk mitigation strategies
- Areas to focus on

### Step 7: Report Generation (Markdown)

Create professional test report using Report Template:
- Executive summary
- Execution summary (metrics)
- Test results (per case and per feature)
- Defect list and analysis
- Trends and analysis
- Risk assessment
- Recommendations
- Sign-off

Output: `reports/test-execution-report.md`

### Step 8: HTML Report Generation

Convert markdown report to HTML:
- Parse markdown content
- Apply professional HTML styling
- Include CSS for:
  - Clean, readable layout
  - Responsive design (desktop, tablet, mobile)
  - Color-coded metrics (pass=green, fail=red, blocked=yellow)
  - Styled tables for test results
  - Collapsible sections for details
- Add interactive elements:
  - Table of contents with navigation
  - Sortable/filterable tables
  - Charts for metrics visualization
- Generate standalone HTML file (no external dependencies)

Output: `reports/test-execution-report.html`

### Step 9: Summary

Display:
- Report location (Markdown)
- Report location (HTML)
- Key metrics
- Recommendations
- Next steps
- Links to both report files

## Output

### Markdown Report
- `reports/test-execution-report.md`
- Version-controlled, easily editable
- Includes all sections:
  - Executive summary
  - Metrics and statistics
  - Test results detailed listing
  - Defect analysis
  - Trends vs. previous cycles
  - Risk assessment
  - Recommendations
  - QA Lead sign-off

### HTML Report
- `reports/test-execution-report.html`
- Professional, standalone document
- Styled with:
  - Clean, modern layout
  - Responsive design
  - Color-coded metrics and status indicators
  - Interactive elements (table of contents, sortable tables)
  - Charts and visualizations
  - Suitable for sharing with stakeholders, exporting to PDF
  - No external dependencies (standalone file)

## Technical Details

- Persona: QA Engineer
- Skills triggered: Execution & Reporting Skill
- Inputs: Execution results from `execute` command
- Output: 
  - Markdown report: `reports/test-execution-report.md`
  - HTML report: `reports/test-execution-report.html`
- HTML Generation:
  - Converts markdown to HTML using markdown parser
  - Applies professional CSS styling
  - Generates standalone, self-contained HTML file
  - Includes embedded CSS and JavaScript (no external dependencies)
  - Responsive design for all screen sizes
- Next: Stakeholder review, PDF export, release decisions
