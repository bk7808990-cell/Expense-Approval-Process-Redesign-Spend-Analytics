-- =========================================================
-- EXPENSE APPROVAL ANALYTICS: 12 CORE SQL QUERIES
-- Note: Queries are kept simple, readable, and business-focused.
-- =========================================================

-- QUERY 1: Total Claims & Spend
-- Explain: "This gives me the baseline numbers—total claims, total money spent, and average claim size."
SELECT 
    COUNT(claim_id) AS total_claims,
    ROUND(SUM(amount), 2) AS total_spend,
    ROUND(AVG(amount), 2) AS avg_claim
FROM expense_claims;

-- QUERY 2: Turnaround Time (TAT) Analysis
-- Explain: "Instead of just average, I used Median (P50) and P90 to see if a few slow claims are dragging the whole system down."
SELECT 
    ROUND(AVG(approval_days), 1) AS avg_days,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY approval_days) AS median_days,
    PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY approval_days) AS p90_days
FROM expense_claims
WHERE final_status = 'Approved';

-- QUERY 3: Department Bottlenecks
-- Explain: "This ranks departments by how slow they are. Delivery is usually the slowest."
SELECT 
    department,
    COUNT(claim_id) AS total_claims,
    ROUND(AVG(approval_days), 1) AS avg_days
FROM expense_claims
WHERE final_status = 'Approved'
GROUP BY department
ORDER BY avg_days DESC;

-- QUERY 4: Duplicate Claims (Financial Leakage)
-- Explain: "This calculates exactly how much money is stuck in duplicate claims and what percentage of total claims they represent."
SELECT 
    COUNT(claim_id) AS duplicate_count,
    SUM(amount) AS duplicate_amount
FROM expense_claims
WHERE duplicate_flag = 'Yes';

-- QUERY 5: Compliance Check (Missing Receipts & Policy Violations)
-- Explain: "This counts how many claims are missing receipts or breaking policy. The CASE statement is just a smart way to count 'Yes' values."
SELECT 
    SUM(CASE WHEN receipt_attached = 'No' THEN 1 ELSE 0 END) AS missing_receipts,
    SUM(CASE WHEN policy_flag = 'Yes' THEN 1 ELSE 0 END) AS policy_violations
FROM expense_claims;

-- QUERY 6: High-Value Stuck Claims
-- Explain: "This finds claims over 1 Lakh that are currently stuck (Pending or On Hold). These are high-risk for the business."
SELECT 
    final_status,
    COUNT(claim_id) AS claim_count,
    SUM(amount) AS total_money_stuck
FROM expense_claims
WHERE amount > 100000 AND final_status IN ('Pending', 'On Hold')
GROUP BY final_status;

-- QUERY 7: Spending by Category
-- Explain: "This shows which expense category costs the company the most money."
SELECT 
    expense_category,
    SUM(amount) AS total_spend
FROM expense_claims
WHERE final_status = 'Approved'
GROUP BY expense_category
ORDER BY total_spend DESC;

-- QUERY 8: Monthly Spending Trend
-- Explain: "This groups data by month so we can see if spending is going up or down over time."
SELECT 
    DATE_FORMAT(claim_date, '%Y-%m') AS month,
    SUM(amount) AS total_spend
FROM expense_claims
WHERE final_status = 'Approved'
GROUP BY DATE_FORMAT(claim_date, '%Y-%m')
ORDER BY month;

-- QUERY 9: Manager-Level Bottleneck (The "Aha" Query)
-- Explain: "This finds the top 5 managers who take the most time to approve. I used HAVING to only look at managers who have handled at least 50 claims, so the data is fair."
SELECT 
    manager_name,
    COUNT(claim_id) AS claims_handled,
    ROUND(AVG(approval_days), 1) AS avg_days_taken
FROM expense_claims
WHERE final_status = 'Approved'
GROUP BY manager_name
HAVING COUNT(claim_id) > 50
ORDER BY avg_days_taken DESC
LIMIT 5;

-- QUERY 10: Rejection Reasons
-- Explain: "This shows exactly why claims are being rejected and how much money is being blocked."
SELECT 
    rejection_reason,
    COUNT(claim_id) AS rejections,
    SUM(amount) AS blocked_amount
FROM expense_claims
WHERE final_status = 'Rejected'
GROUP BY rejection_reason;

-- QUERY 11: Budget vs Actual (Finance Core)
-- Explain: "This joins the claims table with the budget table. It shows which departments are overspending and by how much."
SELECT 
    e.department,
    DATE_FORMAT(e.claim_date, '%Y-%m') AS month,
    SUM(e.amount) AS actual_spend,
    MAX(b.budget_amount) AS budget_amount,
    (SUM(e.amount) - MAX(b.budget_amount)) AS variance
FROM expense_claims e
JOIN department_budget b 
    ON e.department = b.department 
    AND DATE_FORMAT(e.claim_date, '%Y-%m') = DATE_FORMAT(b.month, '%Y-%m')
WHERE e.final_status = 'Approved'
GROUP BY e.department, DATE_FORMAT(e.claim_date, '%Y-%m')
ORDER BY variance DESC;

-- QUERY 12: First-Pass Approval Rate
-- Explain: "This calculates how many claims get approved without any issues (no duplicates, no missing receipts). It's a key metric for process efficiency."
SELECT 
    COUNT(claim_id) AS total_claims,
    SUM(CASE WHEN final_status = 'Approved' 
             AND duplicate_flag = 'No' 
             AND receipt_attached = 'Yes' 
             AND policy_flag = 'No' THEN 1 ELSE 0 END) AS clean_approvals
FROM expense_claims;
