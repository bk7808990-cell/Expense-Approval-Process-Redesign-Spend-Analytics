# Functional Requirements Document (FRD)

While the BRD defines the business goals, this FRD defines the exact technical and system-level rules required to build the solution.

## 1. System Inputs & Data Fields
The digital claim form must capture the following mandatory fields:
- **Employee ID:** Auto-populated based on login.
- **Expense Date:** Date picker (Cannot be a future date).
- **Amount:** Numeric, up to 2 decimal places.
- **Category:** Dropdown (Travel, Meals, Software, etc.).
- **Invoice/Bill Number:** Alphanumeric (Mandatory for all claims > ₹500).
- **Receipt Upload:** File upload (PDF/JPG, max 5MB).
- **Business Purpose:** Text string (Max 200 characters).

## 2. System Validation Rules
- **Duplicate Check:** On submit, the system will query the database. If `Employee ID` + `Expense Date` + `Amount` + `Invoice Number` matches an existing record, throw a "Hard Block" error.
- **Receipt Check:** If no file is uploaded, the status is set to "On Hold" and an automated email is sent to the employee.
- **Policy Check:** If `Category = Client Entertainment` and `Amount > ₹25,000`, the system auto-routes the claim to the Finance Director.

## 3. Automated Workflows
- **Workflow 1 (Amount ≤ ₹5,000):** System auto-approves if validation passes. Status updates to "Approved". Payment API is triggered.
- **Workflow 2 (Amount ₹5,001 - ₹25,000):** System routes to Manager. Email notification sent. If no action in 3 days, auto-escalation to Dept Head.
- **Workflow 3 (Missing Receipts):** System sends a reminder email on Day 1, Day 3, and Day 5. If no action on Day 7, the claim is auto-rejected.

## 4. Dashboard Refresh Requirements
- The Power BI dashboard must connect to the SQL database and refresh every 15 minutes (Incremental load) to ensure leadership sees near real-time data.
