import pandas as pd

# Load messy dataset
df = pd.read_csv("../data/transactions_messy.csv")

print("Original shape:", df.shape)

# 1. Check duplicates
print("Duplicate rows:")
print(df.duplicated().sum())
#2.Drop Duplicates
df=df.drop_duplicates()
print(df.duplicated().sum())

df["TransactionStatus"] = (
    df["TransactionStatus"]
    .astype(str)
    .str.strip()
    .str.title()
)

print("Transaction Status:")
print(df["TransactionStatus"].value_counts())

df["MerchantCategory"] = (
    df["MerchantCategory"]
    .fillna("Unknown")
)

invalid_amounts = df[df["Amount"] <= 0]

print("\nInvalid amount records:")
print(invalid_amounts[["TransactionID", "Amount"]])

df = df[df["Amount"] > 0].copy()
print("\nInvalid amounts remaining:",(df["Amount"] <= 0).sum())

df["TransactionDate"] = pd.to_datetime(df["TransactionDate"])

df["TransactionTime"] = pd.to_datetime(df["TransactionTime"],format="mixed").dt.time

df["Amount"] = pd.to_numeric(df["Amount"],errors="coerce")

df["IsInternational"] = df["IsInternational"].astype(int)

print("\n========== FINAL DATA QUALITY CHECK ==========")

print("\nShape:")
print(df.shape)

print("\nDuplicate rows:")
print(df.duplicated().sum())

print("\nMissing values:")
print(df.isnull().sum())

print("\nInvalid amounts:")
print((df["Amount"] <= 0).sum())

print("\nTransaction statuses:")
print(df["TransactionStatus"].value_counts())

print("\nData types:")
print(df.dtypes)

df.to_csv("../data/transactions_clean.csv",index=False)

print("\nClean dataset saved successfully!")
