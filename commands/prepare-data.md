# qa-workflow prepare-data

Create and organize test data needed for test execution.

## Purpose

Prepare reusable, well-organized test data sets that support all test cases, with clear setup and cleanup procedures.

## Who Uses This

QA Engineer

## Command Flow

### Step 1: Load Test Cases

Load test cases from previous `create-tests` command.
Analyze data requirements.

### Step 2: Brainstorm Data Organization

**[TRIGGER] superpowers:brainstorm**

Use brainstorm to explore:
- How should test data be organized for reusability?
- What data sets can be consolidated?
- What are critical data dependencies?
- How to minimize data setup time?
- What user scenarios need specific data?
- Performance considerations for large data sets?

Output: Brainstorm document with data strategy

### Step 3: Identify Data Needs

Extract data requirements from test cases:
- User data (users, permissions, roles)
- Product/Item data (products, inventory)
- Transaction data (orders, payments)
- Config/Environment data (settings, features)

Group and consolidate (using brainstorm insights):
- Multiple cases needing same data → create reusable data set
- Related data that should be together
- Dependencies between data sets
- Optimization opportunities from brainstorm

### Step 4: Generate Test Data

For each data need, create test data set with:
- Data Set ID (DATA-001, DATA-002, etc.)
- Name (descriptive, e.g., "Active Premium User")
- Purpose (what it's used for)
- Data Records (specific values)
- Setup Instructions (how to create/load)
- Cleanup Instructions (how to remove)
- Dependencies (other data sets it depends on)
- Used By (which test cases use it)

Use Test Data Management Skill to:
- Optimize for reusability
- Identify dependencies
- Ensure completeness
- Suggest consolidations

### Step 5: QA Engineer Review

Present data sets:
- Review organization and reusability (from brainstorm)
- Collect feedback on data values
- Add or modify data as needed
- Verify setup procedures

### Step 6: Document & Organize

Create test data document with:
- All data sets in template format
- Data summary table
- Setup guide
- Cleanup guide
- Dependencies and relationships
- Data organization strategy (from brainstorm)

### Step 7: Summary

Display:
- Total data sets created
- Setup time estimate
- Data organization strategy highlighted
- ✓ Data preparation complete
- Next steps:
  - **Option 1:** `qa-workflow modify-tests` (if QA Lead wants to adjust test cases)
  - **Option 2:** `qa-workflow review` (if no test modifications needed)

## Output

- Test Data Document with:
  - All data sets in template format
  - Data summary table
  - Setup and cleanup procedures
  - Dependencies documented
  - Linked to test cases

## Technical Details

- Persona: QA Engineer
- Superpowers triggered: superpowers:brainstorm (Step 2)
- Skills triggered: Test Data Management Skill
- Inputs: Test cases from `create-tests` command
- Outputs:
  - Brainstorm document (data organization strategy)
  - Test data document (organized, reusable data sets)
- Next command: `modify-tests`
