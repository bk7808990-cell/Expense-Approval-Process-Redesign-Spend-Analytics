# SQL Analysis Report

This report summarizes the business insights derived from the 12 SQL queries executed on the 5,300 claims dataset.

## 1. Turnaround Time (TAT) Analysis
- **Insight:** Avg TAT is 6.51 days. However, P90 is 14 days. The process is dragged down by a "long tail" of claims stuck for 2+ weeks.
- **Action:** Focus on unblocking the tail rather than speeding up every small claim.

## 2. Bottleneck Identification
- **Department:** Delivery department has the highest average TAT (8.5 days).
- **Manager:** Query 9 reveals that just 3 out of 20 managers account for 40% of the total delays (taking >10 days).
- **Action:** Implement a Manager-Level SLA dashboard to create accountability.

## 3. Financial Leakage
- **Insight:** 100 duplicate claims were detected, resulting in ₹2,45,000 of leakage.
- **Action:** Hard-block claims where Employee ID, Date, Amount, and Invoice Number match exactly.

## 4. Compliance & Policy
- **Insight:** 11% of claims violate policy, 9% have missing receipts. Claims without receipts are kept "On Hold".
- **Action:** Auto-reject missing receipts after 7 days. Route policy violations directly to Finance.

## 5. Budget Variance
- **Insight:** All 6 departments exceeded their budget. The Sales department had the highest variance (₹75.5 Lakh over budget), followed by Finance (₹48.8 Lakh). This confirms a systemic lack of budget visibility and control.
- **Action:** Implement a 90% budget utilization alert to warn managers before they overspend.
