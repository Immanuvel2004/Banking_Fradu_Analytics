import pandas as pd
# 1. Load cleaned transaction data


df = pd.read_csv("../data/transactions_clean.csv")

print("========== DATA QUALITY VALIDATION ==========")
print("Rows:", len(df))
print("Columns:", len(df.columns))

# 2. Check duplicate Transaction IDs


duplicate_ids = df["TransactionID"].duplicated().sum()

print("\nDuplicate Transaction IDs:", duplicate_ids)

# 3. Check missing values


missing_values = df.isnull().sum()

print("\nMissing Values:")
print(missing_values[missing_values > 0])


# 4. Check invalid transaction amounts

invalid_amounts = (df["Amount"] <= 0).sum()

print("\nInvalid Amounts:", invalid_amounts)

# 5. Check valid transaction statuses


valid_statuses = [
    "Success",
    "Failed",
    "Pending",
    "Reversed"
]

invalid_statuses = ~df["TransactionStatus"].isin(valid_statuses)

print("\nInvalid Transaction Statuses:")
print(df.loc[invalid_statuses, "TransactionStatus"].value_counts())

# 6. Check valid transaction types

valid_types = [
    "Withdrawal",
    "Deposit",
    "Transfer",
    "Payment",
    "Purchase"
]

invalid_types = ~df["TransactionType"].isin(valid_types)

print("\nInvalid Transaction Types:")
print(df.loc[invalid_types, "TransactionType"].value_counts())

# 7. Check international flag

invalid_international = ~df["IsInternational"].isin([0, 1])

print("\nInvalid International Flags:", invalid_international.sum())

# 8. Check transaction dates

df["TransactionDate"] = pd.to_datetime(
    df["TransactionDate"],
    errors="coerce"
)

invalid_dates = df["TransactionDate"].isna().sum()

print("\nInvalid Transaction Dates:", invalid_dates)

# 9. Check transaction IDs

missing_transaction_ids = df["TransactionID"].isna().sum()

print("\nMissing Transaction IDs:", missing_transaction_ids)


# 10. Create Quality Summary

quality_summary = {
    "Total Rows": len(df),
    "Total Columns": len(df.columns),
    "Duplicate Transaction IDs": duplicate_ids,
    "Invalid Amounts": invalid_amounts,
    "Invalid Dates": invalid_dates,
    "Missing Transaction IDs": missing_transaction_ids,
    "Invalid International Flags": invalid_international.sum(),
    "Missing Values": df.isnull().sum().sum()
}

print("\n========== QUALITY SUMMARY ==========")

for check, result in quality_summary.items():
    print(f"{check}: {result}")

# 11. Overall Quality Status

if all(value == 0 for value in quality_summary.values()
       if isinstance(value, (int, float)) and value != len(df) and value != len(df.columns)):

    print("\nDATA QUALITY STATUS: PASSED")

else:
    print("\nDATA QUALITY STATUS: REVIEW REQUIRED")