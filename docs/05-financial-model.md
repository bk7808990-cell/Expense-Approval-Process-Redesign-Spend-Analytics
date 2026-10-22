# Financial Model (Driver-Based Budget Variance)

As per the project scope, a 3-tab driver-based financial model was designed in Excel to support the Finance team.

## Tab 1: Budget vs Actual (Monthly)
- **Logic:** Compares actual approved spend (from SQL Query 11) against monthly budget.
- **Visuals:** RAG (Red/Amber/Green) status. If spend exceeds budget by >5%, it turns Red.
- **Business Value:** Highlights which departments are burning cash faster than allocated.

## Tab 2: Variance Bridge (Price vs Volume)
- **Logic:** Breaks down variance to show if overspending was driven by higher claim volumes (Volume) or higher average claim amounts (Price).
- **Formula:** `Variance = (Actual Volume - Budgeted Volume) * Budgeted Price + (Actual Price - Budgeted Price) * Actual Volume`
- **Business Value:** Tells Finance whether to control claim frequency or cap claim limits.

## Tab 3: Scenario Analysis (Base / Best / Worst)
- **Base Case:** Current trends continue.
- **Best Case:** Auto-approval (<₹5k) and duplicate checks reduce volume by 15%. Expected savings: ₹8,00,000.
- **Worst Case:** Unchecked policy violations cause a 10% increase in high-value claims. Expected loss: ₹3,00,000.

## Key Financial Insights
- **Insight 1:** Delivery dept exceeds budget in Q3, driven by high-value Client Entertainment (Price variance).
- **Insight 2:** 100 duplicate claims (₹2,45,000) represent a direct margin leakage of 1.5% for Finance.
