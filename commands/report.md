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

### Step 7: Report Generation

Create professional test report using Report Template:
- Executive summary
- Execution summary (metrics)
- Test results (per case and per feature)
- Defect list and analysis
- Trends and analysis
- Risk assessment
- Recommendations
- Sign-off

### Step 8: Summary

Display:
- Report location
- Key metrics
- Recommendations
- Next steps

## Output

- Test Execution Report (using Report Template) with:
  - Executive summary
  - Metrics and statistics
  - Test results detailed listing
  - Defect analysis
  - Trends vs. previous cycles
  - Risk assessment
  - Recommendations
  - Ready for stakeholder review

## Technical Details

- Persona: QA Engineer
- Skills triggered: Execution & Reporting Skill
- Inputs: Execution results from `execute` command
- Output: Test execution report (professional document)
- Next: Stakeholder review and release decisions
