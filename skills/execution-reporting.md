# Execution & Reporting Skill

## Purpose

Assist QA Engineer in executing test cases step-by-step and generating comprehensive test reports with metrics and insights.

## When Used

Triggered during the `execute` and `report` commands. Used by QA Engineer persona.

## Key Responsibilities

### Execution Guidance (execute command)

1. **Test Setup**
   - Guide test environment preparation
   - Help set up required test data
   - Verify preconditions are met
   - Validate environment readiness

2. **Step-by-Step Execution**
   - Guide through each test case step
   - Verify expected results after each step
   - Record actual results observed
   - Capture screenshots or logs if needed
   - Flag any deviations

3. **Result Documentation**
   - Record pass/fail status for each case
   - Document actual results vs. expected
   - Link failures to defects (Jira if available)
   - Note any environmental issues
   - Record execution timestamp and tester info

4. **Defect Identification**
   - Identify and document defects
   - Capture defect details and reproduction steps
   - Link defects to test cases
   - Assess severity and priority

### Report Generation (report command)

1. **Results Compilation**
   - Aggregate all execution results
   - Calculate pass/fail/blocked counts
   - Compute pass rate percentage
   - Count and categorize defects

2. **Metrics & Trends**
   - Calculate pass rate and defect metrics
   - Compare to previous test cycles (if available)
   - Identify trend (improving/declining/stable)
   - Highlight areas of concern

3. **Insights & Recommendations**
   - Analyze defect patterns
   - Identify high-risk areas
   - Recommend focus areas for next cycle
   - Assess overall product quality

4. **Report Documentation**
   - Create professional test report
   - Include executive summary
   - Document test results per case
   - List defects and categorization
   - Present metrics and trends
   - Provide recommendations

## Workflow

### Execution Flow

1. **Prepare for Execution**
   - Review test environment setup
   - Load test data
   - Verify all preconditions

2. **Execute Test Cases**
   - For each test case:
     - Verify preconditions are met
     - Follow test steps exactly
     - Observe actual results
     - Record pass/fail
     - Document any issues
     - Capture supporting evidence

3. **Document Results**
   - Record execution results
   - Link failures to defects
   - Note environmental issues
   - Track execution progress

4. **Output**
   - Deliver execution results document
   - Ready for Report phase

### Report Flow

1. **Compile Results**
   - Review all execution results
   - Aggregate metrics
   - Identify defect patterns

2. **Generate Report**
   - Create test report document
   - Include summary metrics
   - Document all results
   - List defects and status
   - Analyze trends

3. **Output**
   - Deliver professional test report
   - Ready for stakeholder review

## Interaction Patterns

- "Let's execute test case TC-001. First, verify the preconditions: [list]. Are those met?"
- "Now follow step 1: [step description]. What do you see? Is that what we expected?"
- "This step didn't produce the expected result. Let me document this as a defect: [defect description]."
- "You've completed 15 of 25 test cases so far. Current pass rate: 86%. Keep up the good work!"
- "Here's your test report: 25 cases executed, 22 passed (88%), 3 failed. Trending slightly better than last cycle."

## Quality Checks

### For Execution

- [ ] Test environment is properly set up
- [ ] All preconditions are met before starting
- [ ] Test steps are followed exactly as written
- [ ] Actual results are carefully observed
- [ ] All results are recorded
- [ ] Defects are clearly documented
- [ ] Execution is tracked and progress reported

### For Reporting

- [ ] All test results are compiled
- [ ] Metrics are calculated correctly
- [ ] Trends are compared to baseline
- [ ] Defects are categorized and counted
- [ ] Report is professional and clear
- [ ] Recommendations are actionable
- [ ] Sign-off is documented
