# Expense Approval Process Redesign & Spend Analytics

An end-to-end business analysis and data analytics project focused on redesigning a manual expense approval process for a mid-size IT services firm. This repository demonstrates the full lifecycle: from defining business requirements (BA) and financial modeling (FA) to executing SQL data analysis (DA) and designing decision-grade dashboards.

## Data & Methodology (AI Diligence Statement)

* **Synthetic Data:** This project uses a synthetic dataset of 5,300 expense claims generated via Python. This was done to simulate real-world complexity, business rules, and edge cases (like missing receipts and duplicate claims) without exposing any sensitive or confidential company data.
* **AI-Assisted Workflow:** I leveraged AI tools as a productivity multiplier. Specifically, AI assisted with syntax generation for Python scripts and formatting documentation drafts. However, the core business logic, SQL query architecture, and financial modeling were designed by me. Every AI-generated output was manually reviewed, tested against the data, and validated to ensure 100% accuracy before inclusion. This "human-in-the-loop" approach allowed me to focus on analytical judgment while ensuring technical precision.

## The Business Problem
The company relied on a manual, Excel-based approval process. Analyzing the data revealed four critical issues:
* **Slow Turnaround:** The average approval time was 7.2 days (P90 was 14 days).
* **Financial Leakage:** 100 duplicate claims slipped through, causing direct financial loss.
* **Compliance Risk:** 11% of claims violated policies, and 9% lacked mandatory receipts.
* **Lack of Visibility:** Leadership lacked a real-time view of departmental budget utilization.

## Key Analytical Findings (The "Aha" Moments)
* **The "Long Tail" Bottleneck:** The process wasn't uniformly slow; it was dragged down by a small group of claims stuck in limbo for two weeks or more.
* **Manager-Level Delays:** SQL analysis revealed that just 3 out of 20 managers were responsible for 40% of the total approval delays.
* **The Compliance Trade-off:** Managers were spending too much time manually reviewing low-value claims (under ₹5,000), which inadvertently caused high-value claims to get delayed.

## Recommendations Delivered
Based on the analysis, I proposed three actionable solutions to leadership:
1. **Tiered Auto-Approvals:** Auto-approve claims under ₹5,000 if they pass basic checks (Projected TAT reduction: 30%).
2. **Mandatory Invoice Matching:** Hard-block claims if the Employee ID, Date, Amount, and Invoice Number match an existing record.
3. **Manager SLA Dashboard:** Implement a live dashboard to track manager approval times, creating accountability.

## Project Architecture

### 1. Business Analysis & Requirements (`docs/`)
* [01. Problem Statement](docs/01-problem-statement.md): SCQA framework defining the current bottlenecks.
* [02. Stakeholder RACI](docs/02-stakeholder-raci.md): RACI Matrix mapping 7 key stakeholders.
* [03. Business Requirements (BRD)](docs/03-business-requirements.md): 12 FRs, 5 NFRs, 15 User Stories, and 8 UAT Test Cases.
* [04. Process Maps](docs/04-process-maps.md): AS-IS vs. TO-BE process flows with a traceability matrix.
* [11. Wireframes](docs/11-wireframes.md): Basic UI mockups for Employee, Manager, and Finance.
* [12. RTM](docs/12-requirements-traceability.md): Requirements Traceability Matrix linking business goals to test cases.
* [14. FRD](docs/14-frd.md): Functional Requirements Document defining system validations.

### 2. Financial & Compliance Analysis (`docs/`)
* [05. Financial Model](docs/05-financial-model.md): Driver-based budget variance analysis and 3-scenario forecasting.
* [13. Expense Policy](docs/13-expense-policy-controls.md): Internal fraud controls and Segregation of Duties (SoD) policies.
* [06. Recommendations](docs/06-recommendations.md): Detailed cost-benefit and ROI analysis.

### 3. Excel Financial Model (`excel_model/`)
* **[Financial Model (Excel)](excel_model/Expense_Approval_Financial_Model.xlsx)**: Includes 3 tabs — Budget vs Actual, Variance Bridge (Price/Volume), and Scenario Analysis (Base/Best/Worst).

### 4. Data Analysis & Engineering (`sql/`, `scripts/`, `powerbi/`)
* [07. SQL Analysis Report](docs/07-sql-analysis-report.md): Business insights derived from the data.
* [SQL Queries](sql/01-analysis-queries.sql): 12 SQL queries used for TAT and bottleneck analysis.
* [08. Dashboard Design](https://github.com/bk7808990-cell/expense-approval-analytics/blob/main/powerbi/screenshots/08-dashboard-design.md): 3-page Power BI architecture with KPI lineage.
* [09. Data Quality Report](docs/09-data-quality-report.md): 5-point validation ensuring no logical errors.
* [10. KPI Validation](docs/10-kpi-validation.md): Proof that dashboard metrics perfectly match SQL outputs.
* [Python Scripts](scripts/generate_data.py): Scripts used to generate and validate the 5,300 claims.

### 5. Executive Presentation (`docs/`)
* [15. Executive Summary](https://github.com/bk7808990-cell/expense-approval-analytics/blob/main/docs/15-executive-summary.md): 1-page summary and 8-slide deck outline for leadership.

## Tools & Technologies Used
* **Business Analysis:** SCQA, RACI, BRD, RTM, Wireframing
* **Data & Analytics:** SQL, Python (Pandas)
* **Visualization:** Power BI, Excel (Financial Modeling)

## Contact
* **Name:** [Bittu kr.singh]
* **Email:** [bk7808997@gmail.com]
