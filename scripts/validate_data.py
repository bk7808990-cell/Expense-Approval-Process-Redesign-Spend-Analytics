import pandas as pd

def validate_data():
    print("Starting Data Validation...\n")
    
    # Load data
    claims = pd.read_csv("data/raw/expense_claims.csv")
    budget = pd.read_csv("data/raw/department_budget.csv")
    
    # 1. Row Count Validation
    print(f"Claims Rows: {len(claims)} (Expected: 5300)")
    print(f"Budget Rows: {len(budget)} (Expected: 78)")
    
    # 2. Date Format Validation
    # Assuming all dates are YYYY-MM-DD. Checking one sample.
    sample_date = claims['claim_date'].iloc[0]
    print(f"Date Format Sample: {sample_date} (Expected: YYYY-MM-DD)")
    
    # 3. Duplicate Validation
    dup_count = (claims['duplicate_flag'] == 'Yes').sum()
    print(f"Duplicate Flags: {dup_count} (Expected: 100)")
    
    # 4. Missing Values Check (Critical columns)
    null_amounts = claims['amount'].isnull().sum()
    print(f"Null Amounts: {null_amounts} (Expected: 0)")
    
    # 5. Business Logic Check (Time Travel)
    # Check if any final_approval_date is before claim_date
    valid_dates = claims.dropna(subset=['final_approval_date'])
    time_travel_errors = valid_dates[valid_dates['final_approval_date'] < valid_dates['claim_date']]
    print(f"Time Travel Errors (Approval before Claim): {len(time_travel_errors)} (Expected: 0)")
    
    print("\n✅ Validation Complete!")

if __name__ == "__main__":
    validate_data()
