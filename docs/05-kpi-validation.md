# KPI Validation & Verification Matrix

To ensure data trust, every KPI designed for the Power BI dashboard was cross-verified against the raw SQL query outputs. This prevents discrepancies between the backend data and frontend visuals.

## 1. KPI Verification Matrix

| KPI / Metric | SQL Query Used | Expected SQL Result | Dashboard Verification | Status |
|---|---|---|---|---|
| **Total Claims** | Query 1 | 5,300 | 5,300 | Passed ✅ |
| **Average TAT** | Query 2 | 7.2 Days | 7.2 Days | Passed ✅ |
| **Duplicate Claims** | Query 4 | 100 Claims | 100 Claims | Passed ✅ |
| **Missing Receipts** | Query 5 | 477 Claims | 477 Claims | Passed ✅ |
| **Policy Violations** | Query 5 | 583 Claims | 583 Claims | Passed ✅ |

## 2. Slicer & Filter Testing
- **Date Slicer:** Tested filtering by specific months (e.g., Nov 2025). The Total Spend, TAT, and Duplicate metrics correctly updated to reflect only that month's data.
- **Department Slicer:** Tested filtering by "Delivery" and "Sales". The visuals correctly isolated department-specific bottlenecks without affecting overall company totals.

## 3. Null Handling Verification
- Verified that claims with no `approval_days` (Pending/On Hold) are excluded from the Average TAT calculation, ensuring the final metric is not artificially dragged down by incomplete claims.
