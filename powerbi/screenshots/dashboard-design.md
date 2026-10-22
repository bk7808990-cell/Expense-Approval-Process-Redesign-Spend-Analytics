# Power BI Dashboard Design & Architecture

This document outlines the design, layout, and KPI definitions for the Expense Approval Analytics dashboard. The dashboard follows a "Decision-First" approach, ensuring every visual answers a specific business question.

## 1. Dashboard Structure (3 Pages)
The dashboard is split into three pages, each targeting a specific stakeholder group.

### Page 1: Expense Overview (For Leadership)
**Goal:** Provide a quick, high-level snapshot of overall company spending.
- **KPI Cards (Top Row):** Total Spend (₹), Total Claims, Average Claim Amount.
- **Bar Chart:** Spend by Department (Identifies where the money is going).
- **Column Chart:** Spend by Expense Category (Travel, Meals, etc.).
- **Line Chart:** Monthly Spend Trend (Helps track if spending is increasing or decreasing).
- **Slicer:** Date Range (Month/Year).

### Page 2: Approval Performance (For Managers)
**Goal:** Identify bottlenecks, delays, and manager-level efficiency.
- **KPI Cards (Top Row):** Average Approval TAT (Days), % of Claims Pending > 5 days.
- **Histogram:** Distribution of Approval Days (Shows how many claims take 2 days vs 10 days).
- **Bar Chart:** Average TAT by Department (Highlights the slowest department).
- **Table:** Top 5 Slowest Managers (Actionable insight for training and SLA tracking).
- **Slicer:** Department, Manager.

### Page 3: Compliance & Budget (For Finance)
**Goal:** Highlight financial leakage, compliance issues, and budget overruns.
- **KPI Cards (Top Row):** Total Duplicate Amount (₹), Total Missing Receipts, % of Policy Violations.
- **Bar Chart:** Duplicate Claims by Department (Shows where the leakage is concentrated).
- **Scatter Plot:** Budget vs Actual Spend by Department (RAG Status: Red if over budget, Green if under).
- **Table:** Top Rejection Reasons (Helps HR/Finance understand why claims fail).
- **Slicer:** Expense Category, Claim Status.

---

## 2. KPI Lineage (Traceability Matrix)
This table ensures that every visual on the dashboard is backed by a verified SQL query. It proves data reproducibility.

| Dashboard Visual / KPI | Underlying SQL Query | Business Question Answered |
|---|---|---|
| Total Spend & Total Claims | Query 1 | What is the baseline scale of expenses? |
| Average TAT (P50 / P90) | Query 2 | How slow is the process, and are there outliers? |
| Spend by Department | Query 3 | Which department has the most claims? |
| Duplicate Amount | Query 4 | How much money is locked in duplicates? |
| Missing Receipts & Violations | Query 5 | How bad is the compliance risk? |
| High-Value Stuck Claims | Query 6 | Where is high-value money getting stuck? |
| Monthly Spend Trend | Query 8 | Is spending going up or down over time? |
| Top 5 Slowest Managers | Query 9 | Who is causing the approval bottleneck? |
| Budget vs Actual Variance | Query 11 | Which department is over budget? |

---

## 3. Design Principles Applied
- **No Chart Junk:** No 3D charts, no gradient fills, and no unnecessary data labels on every bar.
- **Consistent Color Palette:** Blue for standard metrics, Red for negative issues (duplicates, rejections), Green for positive status (Under Budget, Approved).
- **Accessibility:** High contrast text for readability. Tooltips provided for every KPI to explain the calculation.
