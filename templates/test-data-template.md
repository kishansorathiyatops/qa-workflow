# Test Data Template

Use this template to document each test data set.

---

## Test Data Set: [DATA-XXX]

**Name:** [Descriptive name, e.g., "Active User - Premium Subscription"]

**Purpose:** [What scenario or test cases does this data support]

**Scope:** [Where/when this data is used - e.g., "Used in login tests, user profile tests"]

---

### Data Records

#### Record 1: [Record description]

| Field | Value | Notes |
|-------|-------|-------|
| user_id | 12345 | System-generated |
| email | john.doe@example.com | Valid test email |
| first_name | John | Sample data |
| last_name | Doe | Sample data |
| status | active | Must be 'active' for login tests |
| subscription | premium | Premium tier for feature tests |

#### Record 2: [Record description]

| Field | Value | Notes |
|-------|-------|-------|
| user_id | 12346 | System-generated |
| email | jane.smith@example.com | Valid test email |
| first_name | Jane | Sample data |
| last_name | Smith | Sample data |
| status | inactive | Test inactive user scenario |
| subscription | free | Free tier for limitation tests |

---

### Setup Instructions

1. [Step 1: How to set up this data - e.g., "Create users in test database"]
2. [Step 2: Any environment configuration needed]
3. [Step 3: Verify setup - e.g., "Verify users are queryable via API"]

**Setup Time:** [Estimated time to set up, e.g., "~5 minutes"]

---

### Data Dependencies

- [Depends on: Data Set X - must be created first]
- [Depends on: Environment setup Y]
- [No dependencies - can be created independently]

---

### Cleanup Procedures

1. [Step 1: How to clean up - e.g., "Delete test users created above"]
2. [Step 2: Reset any modified data]
3. [Step 3: Verify cleanup - e.g., "Verify no test users remain"]

**Cleanup Time:** [Estimated time, e.g., "~2 minutes"]

---

### Used By Test Cases

- [Test Case: TC-001 - [Test case title]]
- [Test Case: TC-005 - [Test case title]]
- [Test Case: TC-012 - [Test case title]]

---

### Sensitive Data Considerations

- [Does this data set contain sensitive information? Yes/No]
- [If yes, how is it masked/protected?]
- [Any compliance or privacy considerations?]

---

### Notes

[Any additional notes about this data set, special considerations, or version history]

---
