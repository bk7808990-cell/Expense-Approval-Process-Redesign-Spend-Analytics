# Business Requirements Document (BRD)

## 1. Business Objectives
1. Reduce the average expense approval turnaround time (TAT) from 7.2 days to under 5 days.
2. Eliminate financial leakage by automatically detecting and flagging 100% of true duplicate claims.
3. Improve compliance by reducing policy violations from 11% to less than 2%.

## 2. Scope
**In Scope:**
- Digital claim submission and receipt upload.
- Automated policy and invoice-based duplicate checks.
- Tiered approval routing based on amount and category.
- Real-time dashboard for leadership and finance.

**Out of Scope:**
- Payment gateway integration (handled by a separate ERP).
- Payroll processing.
- Tax compliance automation.

## 3. Functional Requirements (FR)
- **FR-01:** The system must allow employees to submit claims digitally with mandatory receipt uploads.
- **FR-02:** The system must auto-approve claims up to ₹5,000 if they pass policy and duplicate checks.
- **FR-03:** Claims between ₹5,001 and ₹25,000 must require Manager approval.
- **FR-04:** Claims between ₹25,001 and ₹1,00,000 must require Manager and Dept Head approval.
- **FR-05:** Claims above ₹1,00,000 must require Manager, Dept Head, and Finance Director approval.
- **FR-06:** Client Entertainment claims must always require Finance review, regardless of amount.
- **FR-07:** The claim submission form must include a mandatory field for "Invoice/Bill Number" to enable accurate duplicate detection.
- **FR-08:** The system must flag a claim as a "Potential Duplicate" if the Employee ID, Expense Date, and Amount match an existing claim. If the Invoice Number also matches, it is a hard block (True Duplicate). If the Invoice Number is different, it routes to Finance for manual review.
- **FR-09:** Claims without a receipt must be placed "On Hold" until the receipt is uploaded.
- **FR-10:** The system must check department budgets and warn Finance if a claim pushes utilization above 90%.
- **FR-11:** The system must provide a dashboard showing approval TAT, rejection rate, and budget variance.

## 4. Non-Functional Requirements (NFR)
- **NFR-01 (Performance):** The claim submission process must take less than 2 minutes.
- **NFR-02 (Availability):** The system must be available 99.9% of the time during business hours.
- **NFR-03 (Security):** Role-based access control (RBAC) must be enforced (e.g., employees cannot see other employees' claims).
- **NFR-04 (Audit):** The system must maintain an immutable audit log of all approvals and rejections.

## 5. User Stories & Acceptance Criteria
*(Format: As a [role], I want to [action], so that [benefit].)*

**Story 1: Auto-Approval for Low-Value Claims**
- **As an** Employee, **I want** small claims to be auto-approved, **so that** I get reimbursed faster without waiting for manual review.
- **Acceptance Criteria:**
  - **Given** a claim amount is ₹4,000, a receipt is attached, and no policy/duplicate flags are raised.
  - **When** the employee submits the claim.
  - **Then** the status should automatically update to "Approved" within 5 minutes.

**Story 2: Duplicate Detection & Review**
- **As a** Finance Manager, **I want** the system to flag potential duplicates and verify invoice numbers, **so that** we don't lose money but also don't frustrate employees with genuine same-day expenses.
- **Acceptance Criteria:**

  **Scenario A (Genuine Same-Day Expense):**
  - **Given** an employee already has an approved claim for ₹10,000 on 2025-11-01 with Invoice #INV-001.
  - **When** the same employee submits a new claim for ₹10,000 on 2025-11-01 but with a different Invoice #INV-002.
  - **Then** the system must flag the new claim as "Review Required" and route it to Finance for manual approval.

  **Scenario B (True Duplicate):**
  - **Given** an employee already has a claim for ₹10,000 on 2025-11-01 with Invoice #INV-001.
  - **When** the same employee submits a second claim for ₹10,000 on 2025-11-01 with the exact same Invoice #INV-001.
  - **Then** the system must immediately block the claim and mark it as "Rejected - Duplicate".

**Story 3: Missing Receipt Handling**
- **As a** Finance Auditor, **I want** claims without receipts to be held, **so that** we maintain compliance and prevent fraudulent claims.
- **Acceptance Criteria:**
  - **Given** a claim submitted without a receipt.
  - **When** the employee clicks "Submit".
  - **Then** the claim status must be set to "On Hold" and an alert sent to the employee.
