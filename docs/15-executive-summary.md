# Executive Summary & Leadership Deck

## 1. Executive Summary (1-Page Overview)
**The Problem:** The company's manual expense approval process causes a 7.2-day average turnaround time (TAT). This delays employee reimbursements, while the company suffers financial leakage from 100 duplicate claims and an 11% policy violation rate.

**The Approach:** Analyzed 5,300 synthetic claims to identify bottlenecks, redesigned the workflow (AS-IS to TO-BE), and built a decision-first Power BI dashboard backed by 12 SQL queries and a Financial Variance Model.

**The Recommendations:**
1. Auto-approve valid claims under ₹5,000.
2. Mandate Invoice Numbers to eliminate duplicates.
3. Implement a manager-level SLA dashboard.
4. Implement Category-Wise Expense Caps to control high Price Variance.

**The Impact:** Projected to reduce TAT from 7.2 to 5.0 days, eliminate duplicate leakage, control expensive claims, and provide real-time compliance visibility to leadership.

---

## 2. Presentation Outline (6-Slide Executive Deck)
*(Structure for a 5-minute presentation to Leadership or Hiring Managers)*

- **Slide 1: Title & Context**
  - Project: Expense Approval Redesign
  - Context: Mid-size IT services firm with a manual process.

- **Slide 2: The Problem (Data-Backed)**
  - 7.2-day average TAT (P90 is 14 days).
  - 100 duplicates causing financial leakage.
  - 11% policy violations.

- **Slide 3: Root Cause Analysis (The "Aha" Moment)**
  - Variance Bridge shows that overspending is driven by **Price Variance** (expensive claims), not Volume. 
  - *Why it matters:* Limiting claim frequency won't work; we need to cap expensive claims.

- **Slide 4: The Proposed Solution**
  - Tiered auto-approvals (<₹5k).
  - Automated duplicate detection via Invoice Numbers.
  - Category-Wise Expense Caps for high-risk categories.

- **Slide 5: Recommendations & ROI**
  - Auto-approval → ₹8L saved in manager time.
  - Duplicate check → ₹2.45L recovered.
  - SLA Dashboard → Faster TAT.

- **Slide 6: Next Steps**
  - 4-week pilot in the Delivery department.
  - Post-pilot review and full rollout.
