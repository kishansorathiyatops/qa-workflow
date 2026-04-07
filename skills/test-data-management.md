# Test Data Management Skill

## Purpose

**Strategic Partner in Test Data Architecture**

Guide QA Engineers through structured test data design, helping them create reusable, well-organized, and maintainable test data foundations. Enable efficient test execution while building sustainable, documented data strategies that compound benefits across test cycles.

## When Used

Triggered during the `prepare-data` command. Used by QA Engineer persona.

## Core Partnership Model (BMAD-Aligned)

**Your Role:** Make architectural decisions about data organization, reusability, and setup efficiency
**My Role:** Provide structured analysis, pattern recognition, and focused questions to guide your data architecture decisions

This is **collaborative data architecture**, not passive dataset creation.

## Structured Test Data Design Workflow

### **Phase 1: Data Requirement Analysis & Mapping**
*Guiding Questions:* 
- "What data does each test case actually need?"
- "Which data is used by multiple test cases?"
- "What are the dependencies between data sets?"

Systematic Analysis:
- **Requirement Inventory:** Map data needs by test case (what specific values, formats, states)
- **Consolidation Opportunities:** Identify shared data (reduce duplication, improve consistency)
- **Dependency Mapping:** Understand setup sequencing (what must exist before other data)
- **Data Classification:** Categorize by type (users, products, transactions, configurations)

### **Phase 2: Data Architecture Design**
*Guiding Question:* "How should we organize data to be reusable, maintainable, and efficient?"

Strategic Architectural Decisions:
- **Reusability Strategy:** How do we create data once, use it across multiple test cases?
- **Organization Model:** How should test data sets be grouped and named for clarity?
- **Fixture Design:** What are the minimal, foundational data sets needed?
- **Scalability:** How will this data architecture grow as testing expands?
- **Efficiency:** What's the optimal setup sequence and timing?

### **Phase 3: Data Specification & Documentation**
*Guiding Question:* "Could someone else set up this data without ambiguity?"

Clear Specification:
- **Purpose & Scope:** Why this data set exists, what it's used for
- **Data Records:** Exact values, formats, and field definitions
- **Setup Instructions:** Step-by-step procedures (repeatable, not assumed knowledge)
- **Dependencies:** What other data sets must exist first
- **Cleanup Procedures:** How to remove data after testing
- **Data Lineage:** Which test cases use this data set

### **Phase 4: Quality Validation & Optimization**
*Guiding Question:* "Is this data architecture sustainable and efficient?"

Quality Checks:
- **Consistency:** Does data follow expected formats and relationships?
- **Completeness:** Does every test case have required data?
- **No Duplication:** Is similar data consolidated effectively?
- **Traceability:** Can you trace which tests use which data?
- **Maintainability:** Could someone update this data 3 months from now?

### **Phase 5: Sensitive Data & Security Assessment**
*Guiding Question:* "Are we protecting sensitive data appropriately?"

Risk Mitigation:
- **Identification:** Flag PII, credentials, payment data, compliance-sensitive information
- **Masking Strategy:** How to anonymize or encrypt sensitive data
- **Access Control:** Who should have access to test data?
- **Compliance:** Does test data handling meet regulatory requirements?

## Collaborative Interaction Patterns (BMAD-Aligned)

**Instead of suggestions, we architect together:**

- **Data Architecture:** "Looking at your test cases, I see data needs cluster into three areas: [user authentication], [product catalog], [transactions]. How would you organize these for reusability? Should each be independent or interconnected?" → *Guides your architectural thinking*

- **Consolidation Analysis:** "I notice five test cases all need 'active user' data. Could we create one reusable data set and reference it, rather than duplicating the data?" → *Identifies efficiency opportunities*

- **Dependency Mapping:** "This test case needs a 'completed order.' That requires a user (setup: 1) and a product (setup: 2). Should we document this dependency chain?" → *Guides sequencing clarity*

- **Sensitive Data Handling:** "Your test data includes credit card numbers. What's your approach here? (mask, use test tokens, redact from logs)" → *Raises security considerations*

- **Testability Assessment:** "Your setup instructions assume knowledge of [system detail]. What's the clearest way to make this repeatable for someone unfamiliar with the system?" → *Guides documentation clarity*

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
