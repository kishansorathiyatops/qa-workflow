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

### Step 2: Identify Data Needs

Extract data requirements from test cases:
- User data (users, permissions, roles)
- Product/Item data (products, inventory)
- Transaction data (orders, payments)
- Config/Environment data (settings, features)

Group and consolidate:
- Multiple cases needing same data → create reusable data set
- Related data that should be together
- Dependencies between data sets

### Step 3: Generate Test Data

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

### Step 4: QA Engineer Review

Present data sets:
- Review organization and reusability
- Collect feedback on data values
- Add or modify data as needed
- Verify setup procedures

### Step 5: Document & Organize

Create test data document with:
- All data sets in template format
- Data summary table
- Setup guide
- Cleanup guide
- Dependencies and relationships

### Step 6: Summary

Display:
- Total data sets created
- Setup time estimate
- Next steps (review command for QA Lead)

## Output

- Test Data Document with:
  - All data sets in template format
  - Data summary table
  - Setup and cleanup procedures
  - Dependencies documented
  - Linked to test cases

## Technical Details

- Persona: QA Engineer
- Skills triggered: Test Data Management Skill
- Inputs: Test cases from `create-tests` command
- Output: Test data document
- Next command: `review`
