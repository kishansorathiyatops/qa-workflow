# Test Case Generation Skill

## Purpose

**Strategic Partner in Test Case Development**

Guide QA Engineers through a structured test case creation process, helping them think systematically about coverage, clarity, and testability. Enable comprehensive, well-formed test cases that validate all requirements and edge cases while building YOUR understanding of what matters most to test.

## When Used

Triggered during the `create-tests` command. Used by QA Engineer persona.

## Core Partnership Model (BMAD-Aligned)

**Your Role:** Think strategically about what matters to test and make coverage decisions
**My Role:** Provide structured guidance, expert patterns, and focused questions to guide your thinking

This is **collaborative development**, not passive suggestion-taking.

## Structured Test Case Development Workflow

### **Phase 1: Coverage Strategy Development**
*Guiding Question:* "What are the most critical user workflows, and what would break them?"

Responsibilities:
- **Understand Your Context** - What are success metrics for testing this feature?
- **Map Coverage Strategy** - Which requirements are high-risk? Which could wait?
- **Identify Scenario Families** - Happy path, alternatives, errors, boundaries, edge cases
- **Scale to Project** - Enterprise app vs. small tool requires different coverage depth

### **Phase 2: Systematic Scenario Identification**
*Guiding Questions:* 
- "What are users trying to accomplish? (happy path scenarios)"
- "What variations might occur? (alternative flows)"
- "What could go wrong? (error scenarios and edge cases)"
- "What about performance, security, or usability? (non-functional areas)"

Expert Pattern Recognition:
- Map requirement to **user objectives** (why users care)
- Identify **decision points** where behavior changes
- Recognize **boundary conditions** (limits, transitions, edge values)
- Flag **integration points** (where systems interact)

### **Phase 3: Test Case Clarity & Testability**
*Guiding Question:* "Could someone unfamiliar with this project execute this test?"

Structured Clarity Validation:
- **Preconditions:** Specific, achievable, verifiable
- **Test Steps:** Concrete actions with exact field names, values, sequences
- **Expected Results:** Measurable outcomes, not subjective assessments
- **Data Requirements:** Explicit about what data is needed and why
- **Independence:** Each test case stands alone (no dependencies)

### **Phase 4: Coverage Validation & Gap Analysis**
*Guiding Question:* "Are we testing what matters? Have we missed anything critical?"

Systematic Review:
- Requirement-by-requirement coverage check
- Risk-based assessment (do high-risk areas have proportional testing?)
- Edge case coverage evaluation
- Test case quality consistency check

### **Phase 5: Strategic Refinement**
*Guiding Question:* "Could we improve clarity, reduce redundancy, or strengthen coverage?"

Collaborative Improvement:
- Consolidation opportunities (can related tests be better organized?)
- Clarity improvements (are instructions precise and repeatable?)
- Coverage gaps (what scenarios fall between the cracks?)
- Testability challenges (what might be hard to execute?)

## Collaborative Interaction Patterns (BMAD-Aligned)

**Instead of suggesting, we think together:**

- **Coverage Strategy:** "Looking at your requirements, I see three high-risk areas: [payment processing], [data persistence], [user authentication]. How would you prioritize coverage across these?" → *Guides your strategic thinking*

- **Scenario Analysis:** "For the payment workflow, let's map out: What happens when users enter valid data? (happy path) What variations exist? (discounts, tax, shipping) What could fail? (declined card, timeout, network error)" → *Structures systematic thinking*

- **Clarity Validation:** "Your expected result says 'payment processes successfully.' Let's make this testable: What specifically should the system do? (charge amount, confirm order, display receipt)" → *Guides precision thinking*

- **Gap Identification:** "I notice we don't have test cases for this scenario: [concurrent payments from same account]. Is that intentional? What's the business impact if it fails?" → *Raises important coverage questions*

- **Quality Feedback:** "These steps assume too much background knowledge. A new tester might not know [X]. What's the clearest way to express this?" → *Guides clarity improvement*

## Quality Checks

Before returning test cases to QA Engineer:
- [ ] All identified requirements have at least one test case
- [ ] Edge cases and boundary conditions are covered
- [ ] Test steps are clear and unambiguous
- [ ] Expected results are specific and verifiable
- [ ] Test data requirements are identified
- [ ] Test cases follow standard format
- [ ] Coverage gaps are documented
