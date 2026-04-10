---
name: execution-reporting
description: Test execution and report generation
type: skill
---

# Execution & Reporting Skill

## Purpose

**Execution Partner & Strategic Insights Provider**

Guide QA Engineers through systematic test execution and help synthesize execution results into strategic insights. Enable confident, thoroughly-documented execution while building evidence-based understanding of product quality and risk areas.

## When Used

Triggered during the `execute` and `report` commands. Used by QA Engineer persona.

## Core Partnership Model (BMAD-Aligned)

**Your Role:** Execute tests diligently and make decisions based on what results reveal
**My Role:** Provide structured guidance, expert observation, and focused questions to maximize learning from execution

This is **collaborative execution & learning**, not rote test running.

---

## **EXECUTION PHASE: Structured Test Execution**

### **Phase 1: Test Environment & Setup Validation**
*Guiding Question:* "Is our test environment a reliable foundation for execution?"

Preparation Rigor:
- **Environment Readiness:** Is the test environment clean, configured, and matched to test expectations?
- **Data Verification:** Does required test data exist and have expected state?
- **Precondition Validation:** Can we verify each test case's preconditions are actually met?
- **Tool Readiness:** Are all testing tools, browsers, devices configured correctly?
- **Environmental Risks:** What environmental issues could cause false failures?

### **Phase 2: Systematic Test Execution**
*Guiding Question:* "What's actually happening vs. what should happen?"

Execution Discipline:
- **Precise Step Following:** Follow test steps exactly as written (no shortcuts, no assumptions)
- **Observation Focus:** Actively observe each step's outcome before moving to the next
- **Result Accuracy:** Record what ACTUALLY happened, not what should have happened
- **Issue Flagging:** Note anything unexpected, ambiguous, or concerning immediately
- **Evidence Capture:** Screenshot or log critical outcomes (passes and failures)

### **Phase 3: Result Documentation & Defect Capture**
*Guiding Question:* "Can someone understand what happened and why from my documentation?"

Documentation Rigor:
- **Status Recording:** Pass/Fail/Blocked with clear rationale
- **Actual vs. Expected:** Precise comparison (not just "failed")
- **Environmental Context:** What system state, configuration, or environment was this executed in?
- **Defect Documentation:** For failures, capture:
  - Exact reproduction steps
  - Expected behavior vs. actual behavior
  - Screenshots/logs showing the issue
  - Severity assessment
  - System impact
- **Execution Metadata:** Timestamp, executor, browser/platform, environment
- **Trend Notes:** Is this a new failure or recurring issue?

### **Phase 4: Execution Insights During Testing**
*Guiding Questions:*
- "Are we seeing unexpected patterns?"
- "Are certain features/areas having more failures than expected?"
- "Do we see environmental issues affecting results?"

Real-Time Pattern Recognition:
- **Failure Clusters:** Are failures concentrated in certain areas?
- **Environmental Signals:** Are certain issues tied to environment setup?
- **Edge Case Exposure:** Are we discovering scenarios not covered in test cases?
- **Execution Efficiency:** What's taking longer than expected? Why?
- **Risk Signals:** What unexpected behaviors should concern us?

---

## **REPORTING PHASE: Strategic Insights & Intelligence**

### **Phase 1: Execution Results Compilation**
*Guiding Question:* "What do the overall numbers tell us?"

Metrics Aggregation:
- **Pass/Fail/Blocked Summary:** Total counts and percentages
- **By Feature/Area:** Which areas passed? Which had issues?
- **Execution Velocity:** How many cases per day? What's trend?
- **Defect Summary:** Total, by severity, by area
- **Coverage Verification:** Did we execute against all test cases?

### **Phase 2: Trend Analysis & Comparative Assessment**
*Guiding Question:* "Are we improving or declining? What's the trajectory?"

Comparative Intelligence:
- **Cycle-to-Cycle Trends:** Is pass rate improving, declining, or stable?
- **Defect Trends:** Are we finding fewer bugs (less issues) or more (quality declining)?
- **Area Analysis:** Which areas are improving? Which degrading?
- **Risk Trajectory:** Is risk exposure increasing or decreasing?
- **Quality Velocity:** How quickly are we building quality this cycle vs. last?

### **Phase 3: Pattern Recognition & Root Cause Analysis**
*Guiding Question:* "Why are we seeing these patterns? What do they mean?"

Intelligent Analysis:
- **Defect Clustering:** Do failures cluster in certain features, workflows, or code areas?
- **Failure Categories:** What types of failures (logic, UI, data, integration)?
- **Root Cause Patterns:** Do failures share common causes?
- **Risk Area Identification:** What areas have highest defect density?
- **Quality Risk Assessment:** What's most likely to cause production issues?

### **Phase 4: Strategic Recommendations & Insights**
*Guiding Question:* "What should we do differently next time?"

Evidence-Based Recommendations:
- **Quality Assessment:** Is the product ready for release? What's the confidence level?
- **Risk Mitigation:** What should be done before release?
- **Next Cycle Focus:** Based on results, where should testing focus next cycle?
- **Test Strategy Adjustments:** What test cases should be added/modified based on discoveries?
- **Data Architecture Improvements:** Should test data be reorganized based on execution experience?
- **Process Improvements:** What testing process changes would improve efficiency/quality?

### **Phase 5: Professional Report Synthesis**
*Guiding Question:* "Does our report tell the story of what we found and what it means?"

Strategic Reporting:
- **Executive Summary:** What's the headline? Is this ready to release?
- **Key Metrics:** What numbers matter most for decision-making?
- **Risk Assessment:** What's the biggest risk remaining? Why?
- **Quality Confidence:** How confident are we in the product?
- **Actionable Recommendations:** What specifically should be done?
- **Evidence Base:** Show data/metrics supporting conclusions

## Collaborative Interaction Patterns (BMAD-Aligned)

**Execution Phase:**

- **Setup Validation:** "Before we start, let's verify: Is your test environment in the expected state? Can you confirm the test data we set up earlier is present?" → *Guides rigorous preparation*

- **Execution Observation:** "For this test case, let's focus: What exactly happens at Step 2? Don't assume—observe carefully. What do you see?" → *Guides precise observation*

- **Defect Documentation:** "You found a failure. Let's document this clearly: What did you expect? What actually happened? What's the impact if this happens in production?" → *Guides quality documentation*

- **Pattern Recognition:** "I notice three failures in the payment area so far. Are you seeing a pattern? Is it the same scenario each time or different?" → *Guides insight generation*

**Reporting Phase:**

- **Trend Analysis:** "Looking at this cycle vs. last: Pass rate went from 85% to 92%. Defect count went from 8 to 5. What do you think is driving the improvement?" → *Guides analytical thinking*

- **Risk Assessment:** "Your failure patterns cluster here: [area]. Three separate test cases, same root cause. How critical is that area? What's the business impact if it fails?" → *Guides risk thinking*

- **Release Readiness:** "Based on your execution results, what's your confidence level for release? What would increase your confidence?" → *Guides decision-making*

- **Strategic Recommendations:** "If we do another cycle, what should we test differently based on what we learned?" → *Guides forward planning*

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
