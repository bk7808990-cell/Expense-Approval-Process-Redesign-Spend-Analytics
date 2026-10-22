import pandas as pd
import random
from datetime import date, timedelta
import os

# Fixed seed for reproducibility
random.seed(42)

# Setup directories
os.makedirs("data/raw", exist_ok=True)

# --- PART 1: GENERATE EXPENSE CLAIMS ---
print("Generating 5,300 expense claims...")
TOTAL_CLAIMS = 5200
START_DATE = date(2025, 10, 1)

departments = ["Delivery", "Sales", "Human Resources", "Finance", "IT Support", "Operations"]
categories = {
    "Travel": ["Flight", "Train", "Taxi", "Fuel"],
    "Hotel": ["Room Booking", "Service Charges"],
    "Meals": ["Team Lunch", "Client Dinner", "Snacks"],
    "Client Entertainment": ["Dinner", "Event Tickets", "Gifts"],
    "Software": ["Subscription", "License"],
    "Office Supplies": ["Stationery", "Equipment"]
}

employees = [{"id": f"EMP{i:03d}", "name": f"Employee {i}"} for i in range(1, 201)]
managers = [{"id": f"MGR{i:03d}", "name": f"Manager {i}"} for i in range(1, 21)]

claims = []
for i in range(1, TOTAL_CLAIMS + 1):
    emp = random.choice(employees)
    mgr = random.choice(managers)
    dept = random.choice(departments)
    cat = random.choice(list(categories.keys()))
    subcat = random.choice(categories[cat])

    # Dates logic
    expense_date = START_DATE + timedelta(days=random.randint(0, 364))
    claim_date = expense_date + timedelta(days=random.randint(1, 15))

    # Amounts
    amt_choice = random.choices(["small", "medium", "large", "vlarge"], weights=[45, 35, 15, 5])[0]
    if amt_choice == "small": amount = round(random.uniform(500, 5000), 2)
    elif amt_choice == "medium": amount = round(random.uniform(5001, 25000), 2)
    elif amt_choice == "large": amount = round(random.uniform(25001, 100000), 2)
    else: amount = round(random.uniform(100001, 200000), 2)

    receipt = "No" if random.random() < 0.09 else "Yes"
    policy = "Yes" if random.random() < 0.11 else "No"

    # Timeline & Status Logic (FIXED: No time travel)
    manager_app = claim_date + timedelta(days=random.randint(1, 4))
    finance_rev = ""
    final_app = ""
    status = ""
    rej_reason = ""
    needs_finance = (amount > 25000 or cat == "Client Entertainment")

    if receipt == "No":
        status = "On Hold"
        manager_app = ""
    elif policy == "Yes":
        if random.random() < 0.6:
            status = "Pending"
            manager_app = claim_date + timedelta(days=random.randint(1,4))
        else:
            status = "Rejected"
            final_app = manager_app + timedelta(days=random.randint(1, 3))
            rej_reason = "Policy violation"
    else:
        status = "Approved"
        if needs_finance:
            finance_rev = manager_app + timedelta(days=random.randint(1, 3))
            final_app = finance_rev + timedelta(days=random.randint(1, 3))
        else:
            final_app = manager_app + timedelta(days=random.randint(1, 7))

    # Calculate TAT
    tat = (final_app - claim_date).days if status == "Approved" else ""

    # Format dates to ISO (YYYY-MM-DD)
    def fmt(d): return d.strftime("%Y-%m-%d") if d != "" else ""

    claims.append({
        "claim_id": f"CLM{i:05d}",
        "employee_id": emp["id"],
        "employee_name": emp["name"],
        "department": dept,
        "cost_center": "CC-" + dept[:3].upper(),
        "expense_category": cat,
        "expense_subcategory": subcat,
        "claim_date": fmt(claim_date),
        "expense_date": fmt(expense_date),
        "amount": amount,
        "currency": "INR",
        "receipt_attached": receipt,
        "business_purpose": f"{cat} expense for {dept} team",
        "manager_id": mgr["id"],
        "manager_name": mgr["name"],
        "manager_approval_date": fmt(manager_app),
        "finance_review_date": fmt(finance_rev),
        "final_approval_date": fmt(final_app),
        "final_status": status,
        "rejection_reason": rej_reason,
        "policy_flag": policy,
        "duplicate_flag": "No",
        "approval_days": tat
    })

# Inject 100 Duplicates
print("Injecting 100 duplicate claims...")
dupes = []
for i in range(100):
    orig = random.choice(claims).copy()
    orig["claim_id"] = f"CLM{6000 + i:05d}"
    orig["duplicate_flag"] = "Yes"
    dupes.append(orig)

claims.extend(dupes)
df_claims = pd.DataFrame(claims)
df_claims.to_csv("data/raw/expense_claims.csv", index=False)

# --- PART 2: GENERATE BUDGET (13 Months) ---
print("Generating department budget for 13 months...")
months = pd.date_range("2025-10-01", periods=13, freq="MS")
budget_data = []
for dept in departments:
    for m in months:
        budget_data.append({
            "department": dept,
            "cost_center": "CC-" + dept[:3].upper(),
            "month": m.strftime("%Y-%m-%d"),
            "budget_amount": round(random.uniform(500000, 2000000), 2)
        })

df_budget = pd.DataFrame(budget_data)
df_budget.to_csv("data/raw/department_budget.csv", index=False)

print("\n✅ DONE! Files saved in: data/raw/")
