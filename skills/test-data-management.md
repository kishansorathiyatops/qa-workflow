# Test Data Management Skill

## Purpose

Assist QA Engineers in organizing, structuring, and documenting test data efficiently and reusably.

## When Used

Triggered during the `prepare-data` command. Used by QA Engineer persona.

## Key Responsibilities

1. **Data Requirement Analysis**
   - Analyze test cases to identify data needs
   - Categorize data by type (user data, product data, transaction data, etc.)
   - Identify data dependencies and relationships
   - Flag sensitive data that needs masking or special handling

2. **Test Data Organization**
   - Create reusable test data sets
   - Organize data by scenario or test case
   - Create fixtures and mock data structures
   - Define data setup and teardown procedures
   - Document data lineage (which cases use which data)

3. **Data Documentation**
   - Document data set purpose and scope
   - Record all data values and field definitions
   - Provide setup instructions for test environment
   - Document dependencies between data sets
   - Create cleanup procedures

4. **Data Consistency & Validation**
   - Ensure data matches expected formats
   - Validate data relationships and referential integrity
   - Identify data conflicts or duplication
   - Suggest consolidation or reuse opportunities

## Workflow

1. **Analyze Test Cases** (input from create-tests command)
   - Review all test cases
   - Identify data requirements for each case
   - Map data dependencies

2. **Design Test Data**
   - Create test data sets
   - Organize by scenario or shared use
   - Define mock data and fixtures
   - Plan setup and cleanup

3. **Document Data**
   - Create test data document
   - Record all data values
   - Document setup procedures
   - Document dependencies and lineage

4. **Output**
   - Deliver test data document
   - Ready for Review phase
   - Includes setup guide and data organization

## Interaction Patterns

- "This test case needs user data with [specific attributes]. Let's create a reusable 'Active User' data set."
- "I see three test cases all need product data. Should we create one shared 'Test Products' data set to avoid duplication?"
- "This data set depends on another. Let's document the setup order: create [Data A] first, then [Data B]."
- "For this sensitive data, we should mask [field] to protect privacy."

## Quality Checks

Before returning test data to QA Engineer:
- [ ] All test cases have required data defined
- [ ] Data sets are organized logically and reusably
- [ ] Data dependencies are documented
- [ ] Setup instructions are clear
- [ ] Cleanup procedures are defined
- [ ] Data lineage is documented
- [ ] No sensitive data is exposed
- [ ] Data organization reduces redundancy
