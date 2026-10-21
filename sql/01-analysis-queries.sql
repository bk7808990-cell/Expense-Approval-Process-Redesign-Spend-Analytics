-- =========================================================
-- EXPENSE APPROVAL ANALYTICS: CORE SQL QUERIES
-- Description: Queries to validate business hypotheses and 
--              identify bottlenecks, duplicates, and budget variance.
-- =========================================================

-- QUERY 1: Baseline Overview (Total Claims & Spend)
-- Business Question: What is the total scale of expenses?
SELECT 
    COUNT(claim_id) AS total_claims,
    ROUND(SUM(amount), 2) AS total_spend_inr,
    ROUND(AVG(amount), 2) AS average_claim_amount
FROM 
    expense_claims;

-- QUERY 2: Turnaround Time (TAT) Analysis
-- Business Question: How slow is the current process? (P50 and P90 provide a clearer picture than just the average)
SELECT 
    ROUND(AVG(approval_days), 1) AS avg_tat_days,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY approval_days) AS median_tat_days,
    PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY approval_days) AS p90_tat_days
FROM 
    expense_claims
WHERE 
    final_status = 'Approved' AND approval_days != '';

-- QUERY 3: Department Bottlenecks
-- Business Question: Which department has the slowest approval time?
SELECT 
    department,
    COUNT(claim_id) AS total_claims,
    ROUND(AVG(approval_days), 1) AS avg_tat_days
FROM 
    expense_claims
WHERE 
    final_status = 'Approved' AND approval_days != ''
GROUP BY 
    department
ORDER BY 
    avg_tat_days DESC;

-- QUERY 4: Financial Leakage (Duplicate Detection)
-- Business Question: How much money is locked in duplicate claims?
SELECT 
    COUNT(claim_id) AS duplicate_claims_count,
    ROUND(SUM(amount), 2) AS total_duplicate_amount,
    ROUND((COUNT(claim_id) * 100.0 / (SELECT COUNT(*) FROM expense_claims WHERE duplicate_flag = 'No')), 2) AS duplicate_percentage
FROM 
    expense_claims
WHERE 
    duplicate_flag = 'Yes';

-- QUERY 5: Compliance Risk (Missing Receipts & Policy Violations)
-- Business Question: What is the magnitude of compliance failures?
SELECT 
    SUM(CASE WHEN receipt_attached = 'No' THEN 1 ELSE 0 END) AS missing_receipts,
    SUM(CASE WHEN policy_flag = 'Yes' THEN 1 ELSE 0 END) AS policy_violations,
    ROUND(SUM(CASE WHEN policy_flag = 'Yes' THEN amount ELSE 0 END), 2) AS flagged_amount_inr
FROM 
    expense_claims;

-- QUERY 6: Budget vs Actual Variance (Finance Core)
-- Business Question: Which departments are overspending?
WITH ActualSpend AS (
    SELECT 
        department,
        DATE_FORMAT(claim_date, '%Y-%m') AS claim_month,
        SUM(amount) AS actual_amount
    FROM 
        expense_claims
    WHERE 
        final_status = 'Approved'
    GROUP BY 
        department, DATE_FORMAT(claim_date, '%Y-%m')
)
SELECT 
    a.department,
    a.claim_month,
    ROUND(b.budget_amount, 2) AS budgeted_amount,
    ROUND(a.actual_amount, 2) AS actual_spend,
    ROUND((a.actual_amount - b.budget_amount), 2) AS variance,
    CASE 
        WHEN a.actual_amount > b.budget_amount THEN 'Over Budget'
        ELSE 'Under Budget'
    END AS status
FROM 
    ActualSpend a
JOIN 
    department_budget b 
    ON a.department = b.department 
    AND a.claim_month = DATE_FORMAT(b.month, '%Y-%m')
ORDER BY 
    variance DESC;
