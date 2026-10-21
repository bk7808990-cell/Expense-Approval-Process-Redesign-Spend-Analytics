# Problem Statement & Hypothesis

## 1. Context
The company is a mid-size IT services firm with approximately 200 employees across 6 departments. The current expense approval process is manual, relying on Excel sheets, emails, and physical receipts.

## 2. The Core Problem (SCQA Framework)

**Situation:** 
Employees submit expense claims manually. Managers approve them via email, and the finance team manually verifies receipts and policy compliance before processing the payment.

**Complication:** 
This manual workflow is slow and lacks visibility. Analysis of 5,300 simulated claims reveals three critical issues:
- **Slow Processing:** The average approval time is 7.2 days.
- **Compliance Risk:** 11% of claims violate policy rules, and 9% are submitted without receipts.
- **Financial Leakage:** 100 claims (2%) are duplicate submissions that went undetected.

**Question:** 
How can the company redesign this process to reduce approval time, prevent duplicate claims, and improve compliance?

**Proposed Direction:** 
Implement a tiered auto-approval system, automated policy/duplicate checks, and a real-time leadership dashboard. *(Note: This direction will be validated during the SQL analysis phase).*

## 3. Initial Hypotheses
Before deep-dive analysis, we assume the following based on industry patterns:
- **Hypothesis 1:** Managers are the primary bottleneck. Claims are stuck in the manager's queue waiting for manual review.
- **Hypothesis 2:** Missing receipts cause significant rework. Claims without receipts are kept on hold, delaying the overall cycle.
- **Hypothesis 3:** Manual policy checks are inefficient. Finance teams miss edge cases, leading to an 11% violation rate.

## 4. Assumptions & Limitations
- **Synthetic Data:** The dataset used is generated via Python to simulate real-world rules. No actual employee data is used.
- **Industry Standard Thresholds:** Approval tiers (₹5,000, ₹25,000, ₹100,000) are assumed based on general IT industry standards, not a specific company's policy.
