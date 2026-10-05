import pandas as pd


df = pd.read_csv("../data/transactions_raw.csv")


print(df.head())


print("\nShape:")
print(df.shape)


print("\nColumns:")
print(df.columns.tolist())


print("\nData Types:")
print(df.dtypes)

print("\nStatistics:")
print(df.describe())

print("\nMissing values: ")
print(df.isnull().sum())

print("Duplicate row: ")
print(df.duplicated().sum())

print("\nInvalid Amounts:")
print((df["Amount"] <= 0).sum())
print("\nTransaction Status:")
print(df["TransactionStatus"].value_counts())

print("\nTransaction Types:")
print(df["TransactionType"].value_counts())


quality_report = pd.DataFrame({
    "Column": df.columns,
    "DataType": df.dtypes.astype(str).values,
    "MissingValues": df.isnull().sum().values,
    "UniqueValues": df.nunique().values
})

print("\nData Quality Report:")
print(quality_report)