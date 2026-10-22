# Data Quality Report

Before starting the analysis, the dataset was strictly validated to ensure reliability and reproducibility. This report documents the 5-point check performed on the generated data.

## 1. Row Count Validation
- **Claims Data:** Exactly 5,300 rows (5,200 original claims + 100 injected duplicates).
- **Budget Data:** Exactly 78 rows (6 departments × 13 months).
- **Status:** Passed ✅

## 2. Date Format Validation
- All dates across both datasets strictly follow the ISO 8601 standard (`YYYY-MM-DD`). This ensures seamless import into SQL and Power BI without parsing errors.
- **Status:** Passed ✅

## 3. Time-Travel Logic Check
- Verified that no `final_approval_date` or `finance_review_date` occurs before the `claim_date`. 
- **Status:** Passed ✅

## 4. Business Rules Validation
- **Missing Receipts:** Verified that claims with `receipt_attached = 'No'` (approx. 9%) are correctly assigned the `On Hold` status.
- **Duplicates:** Verified that exactly 100 claims have `duplicate_flag = 'Yes'`.
- **Status:** Passed ✅

## 5. Data Lineage & Reproducibility
- **Seed Value:** Data was generated using Python with `random.seed(42)`. Anyone running the `generate_data.py` script will get the exact same dataset.
- **Limitations:** The data is synthetic. No real employee PII (Personally Identifiable Information) is included. The budget covers 13 months (Oct 2025 – Oct 2026) to perfectly align with the claims data range.
