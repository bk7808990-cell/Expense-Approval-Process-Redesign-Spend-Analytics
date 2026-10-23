# Recommendations & Cost-Benefit Analysis

Based on the SQL analysis and bottleneck identification, the following three data-driven recommendations are proposed.

## Recommendation 1: Implement Tiered Auto-Approval
- **The Action:** Auto-approve claims up to ₹5,000 if a valid receipt is attached and no duplicate/policy flags are raised.
- **Data Evidence:** Analysis shows that 45% of all claims are under ₹5,000. Managers are currently spending manual effort on these low-risk claims, contributing to the 7.2-day average TAT.
- **Expected Impact:** Reduces manager workload by ~45%, dropping the overall TAT to an estimated 5.0 days.
- **Effort:** Low. Requires workflow routing configuration.

## Recommendation 2: Mandate Invoice Number & Auto-Flag Duplicates
- **The Action:** Make "Invoice/Bill Number" a mandatory field in the claim form. Implement a system rule: If Employee ID, Date, Amount, and Invoice Number match exactly, hard-block the claim.
- **Data Evidence:** 100 claims (2%) were exact duplicates, resulting in direct financial leakage.
- **Expected Impact:** 100% reduction in true duplicate claims, improving audit compliance and recovering lost funds.
- **Effort:** Medium. Requires database logic update.

## Recommendation 3: Manager-Level SLA Dashboard
- **The Action:** Implement a live dashboard tracking manager approval times. Highlight managers who take more than 3 days to approve a claim.
- **Data Evidence:** SQL Query 9 proved that a handful of managers are the primary bottleneck, taking significantly longer than the median.
- **Expected Impact:** Creates accountability, reducing the pending claims queue by at least 30%.
- **Effort:** Low. Can be built using existing Power BI infrastructure.


## Recommendation 4: Implement Category-Wise Expense Caps
- **The Action:** Introduce strict upper limits (caps) on specific high-risk expense categories (e.g., Client Entertainment, Travel) to control the average price per claim.
- **Evidence (Data):** The Financial Model's Variance Bridge (`Tab 2`) proved that overspending was driven by high **Price Variance**, while Volume Variance was negative. Employees are not making more claims; they are making expensive claims.
- **Expected Impact:** Directly controls the average actual price per claim, bringing the overall spend back within the allocated budget.
- **Effort:** Low. Requires updating the policy engine with category limits.


## 4. Cost-Benefit & ROI Summary

| Recommendation | Implementation Cost (Est.) | Annual Savings / Benefit | ROI Timeline |
|---|---|---|---|
| **1. Auto-Approval** | ₹ 50,000 (Config) | ₹ 8,00,000 (Manager time saved) | 1 Month |
| **2. Duplicate Check** | ₹ 1,00,000 (Dev effort) | ₹ 2,45,000 (Leakage recovered) | 5 Months |
| **3. SLA Dashboard** | ₹ 25,000 (Power BI) | Faster TAT, better compliance | Immediate |
