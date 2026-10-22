# Data Dictionary

This document defines the schema, data types, and business rules for the datasets used in this project.

## 1. Expense Claims (`expense_claims.csv`)
Contains 5,300 rows (5,200 unique + 100 injected duplicates) representing 12 months of simulated expense claims.

| Field Name | Data Type | Description | Business Rule / Expected Values |
|---|---|---|---|
| `claim_id` | String | Unique identifier for the claim | Format: CLM00001 to CLM05200 (originals), CLM06000 to CLM06099 (duplicates) |
| `employee_id` | String | Unique employee identifier | Format: EMP001 to EMP200 |
| `employee_name` | String | Name of the employee | Format: Employee 1 to 200 |
| `department` | String | Employee's department | Delivery, Sales, Human Resources, Finance, IT Support, Operations |
| `cost_center` | String | Cost center code | CC-DEL, CC-SAL, CC-HUM, CC-FIN, CC-IT, CC-OPE |
| `expense_category` | String | Main expense category | Travel, Hotel, Meals, Client Entertainment, Software, Office Supplies |
| `expense_subcategory` | String | Detailed expense type | E.g., Flight, Train, Room Booking, Team Lunch |
| `claim_date` | Date | Date the claim was submitted | Format: YYYY-MM-DD |
| `expense_date` | Date | Date the expense actually occurred | Format: YYYY-MM-DD (Always before claim_date) |
| `amount` | Float | Claimed amount in INR | Range: ₹500 to ₹2,00,000 |
| `currency` | String | Currency of the claim | INR |
| `receipt_attached` | String | Was a receipt provided? | Yes / No (~9% are "No" which triggers "On Hold") |
| `business_purpose` | String | Reason for expense | E.g., "Meals expense for Sales team" |
| `manager_id` | String | Manager's unique ID | Format: MGR001 to MGR020 |
| `manager_name` | String | Name of the manager | Format: Manager 1 to 20 |
| `manager_approval_date`| Date | Date manager approved/reviewed | Format: YYYY-MM-DD (Blank if On Hold) |
| `finance_review_date` | Date | Date finance reviewed | Format: YYYY-MM-DD (Blank if not required) |
| `final_approval_date` | Date | Date of final approval/rejection | Format: YYYY-MM-DD (Blank if Pending) |
| `final_status` | String | Current state of the claim | Approved, Rejected, Pending, On Hold |
| `rejection_reason` | String | Reason if rejected | "Policy violation" or Blank |
| `policy_flag` | String | Did it violate a policy? | Yes / No (~11% are "Yes") |
| `duplicate_flag` | String | Is this a duplicate claim? | Yes / No (100 claims are "Yes") |
| `approval_days` | Integer | Turnaround Time (TAT) in days | Calculated as: `final_approval_date` - `claim_date` |

## 2. Department Budget (`department_budget.csv`)
Contains 78 rows (6 departments × 13 months).

| Field Name | Data Type | Description | Business Rule / Expected Values |
|---|---|---|---|
| `department` | String | Department name | 6 departments (same as above) |
| `cost_center` | String | Cost center code | CC-DEL, CC-SAL, etc. (Trimmed, no spaces) |
| `month` | Date | Month of the budget | Format: YYYY-MM-DD (1st of every month, Oct 2025 to Oct 2026) |
| `budget_amount` | Float | Allocated budget for that month | Range: ₹5,00,000 to ₹20,00,000 |

## 3. Key Business Rules Applied in Data Generation
- **Auto-Approval:** Claims ≤ ₹5,000 with valid receipts are auto-approved.
- **Tiered Approvals:** Higher amounts trigger Manager, Dept Head, or Finance Director reviews.
- **Missing Receipts:** Claims without receipts are automatically marked "On Hold".
- **Duplicates:** 100 exact matches (same employee, date, amount, category) were injected to test detection logic.
