# Process Maps (AS-IS & TO-BE)

This document visualizes the current manual expense approval process (AS-IS) and the proposed automated workflow (TO-BE). It also highlights how the new process solves current bottlenecks.

---

## 1. AS-IS Process (Current State)
The current process is manual, heavily reliant on emails, and lacks real-time visibility. 

### Step-by-Step Flow:
1. **Expense Incurred:** Employee spends money and collects physical receipts.
2. **Claim Creation:** Employee fills out an Excel claim form.
3. **Submission:** Employee emails the form and receipts to the Manager.
4. **Manager Review:** Manager manually reviews and approves or rejects the claim.
5. **High-Value Routing:** If the amount is above ₹25,000, the claim is forwarded to the Department Head.
6. **Finance Review:** Finance manually verifies the receipt and checks for policy violations.
7. **Hold/Reject:** If a receipt is missing, the claim is held. If a policy is violated, it is rejected.
8. **Payment:** If all is clear, payment is processed.
9. **Reporting:** Finance manually enters the data into a monthly report for Leadership (30-day lag).

### Key Pain Points in AS-IS:
- **No automated duplicate check:** Finance relies on manual review, leading to financial leakage.
- **Manual receipt verification:** Finance manually checks every receipt, causing delays.
- **Delayed reporting:** Leadership gets reports 30 days late, preventing real-time budget control.

---

## 2. TO-BE Process (Future State)
The proposed process introduces automated checks and tiered routing to save time and reduce errors.

### Step-by-Step Flow:
1. **Digital Submission:** Employee submits a claim via a digital app and uploads the receipt.
2. **Auto-Checks:** The system automatically checks for missing receipts, duplicate claims (via invoice matching), and policy violations.
3. **Exception Handling:** If there is an issue, the claim is held or routed to Finance for manual review.
4. **Tiered Approval Routing (If all checks pass):**
   - **Under ₹5,000:** Auto-Approved.
   - **₹5,000 to ₹25,000:** Manager Approval required.
   - **₹25,000 to ₹1,00,000:** Manager and Dept Head approval required.
   - **Above ₹1,00,000:** Manager, Dept Head, and Finance Director approval required.
5. **Payment:** Once approved, payment is processed instantly.
6. **Real-time Reporting:** The Leadership dashboard updates automatically in real-time.

### Key Improvements in TO-BE:
- **Zero manual entry for small claims:** Claims under ₹5,000 are auto-approved.
- **Instant compliance check:** System flags duplicates and missing receipts automatically.
- **Real-time visibility:** Leadership dashboard updates instantly, no more 30-day lag.

---

## 3. How TO-BE Solves AS-IS Pain Points (Traceability)

| AS-IS Pain Point | TO-BE Solution | Impact |
|---|---|---|
| Manual duplicate check | System flags potential duplicates via invoice matching | Eliminates financial leakage |
| Finance manually verifies every receipt | Auto-hold for missing receipts | Frees up Finance team's time |
| 30-day delayed reporting | Real-time Power BI dashboard | Instant budget visibility |
