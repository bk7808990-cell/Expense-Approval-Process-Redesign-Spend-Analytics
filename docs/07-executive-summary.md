# Executive Summary & Leadership Deck

## 1. Executive Summary (1-Page Overview)
**The Problem:** The company's manual expense approval process causes a 7.2-day average turnaround time (TAT). This delays employee reimbursements, while the company suffers financial leakage from 100 duplicate claims and an 11% policy violation rate.

**The Approach:** Analyzed 5,300 synthetic claims to identify bottlenecks, redesigned the workflow (AS-IS to TO-BE), and built a decision-first Power BI dashboard backed by 12 SQL queries to track compliance and budget variance.

**The Recommendations:** 
1. Auto-approve valid claims under ₹5,000.
2. Mandate Invoice Numbers to eliminate duplicates.
3. Implement a manager-level SLA dashboard.

**The Impact:** Projected to reduce TAT from 7.2 to 5.0 days, eliminate duplicate leakage, and provide real-time compliance visibility to leadership.

---

## 2. Presentation Outline (5-Slide Executive Deck)
*(Structure for a 5-minute presentation to Leadership or Hiring Managers)*

- **Slide 1: Title & Context**
  - Project: Expense Approval Redesign
  - Context: Mid-size IT services firm with a manual process.
- **Slide 2: The Problem (Data-Backed)**
  - 7.2-day average TAT (P90 is 14 days).
  - 100 duplicates causing financial leakage.
  - 11% policy violations.
- **Slide 3: The Proposed Solution**
  - Tiered auto-approvals (<₹5k).
  - Automated duplicate detection via Invoice Numbers.
  - Real-time Manager & Leadership dashboards.
- **Slide 4: Key Findings from SQL Analysis**
  - Specific managers are the primary bottlenecks (Query 9).
  - High-value claims get stuck in 'Pending' status (Query 6).
- **Slide 5: Recommendations & ROI**
  - Auto-approval → ₹8L saved in manager time.
  - Duplicate check → ₹2.45L recovered.
  - Next Steps: 4-week pilot in the Delivery department.
