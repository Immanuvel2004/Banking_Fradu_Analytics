import pandas as pd
import numpy as np

df = pd.read_csv("../data/transactions_raw.csv")

messy_df = df.copy()

# 1. Create duplicate records

duplicates = messy_df.sample(20, random_state=42)
messy_df = pd.concat([messy_df, duplicates], ignore_index=True)

# 2. Create missing values


missing_indices = messy_df.sample(30, random_state=10).index

messy_df.loc[missing_indices, "MerchantCategory"] = np.nan

# 3. Create inconsistent text


text_indices = messy_df.sample(30, random_state=20).index

messy_df.loc[text_indices[:10], "TransactionStatus"] = " success "
messy_df.loc[text_indices[10:20], "TransactionStatus"] = "SUCCESS"
messy_df.loc[text_indices[20:], "TransactionStatus"] = " success"



# 4. Create invalid amounts


amount_indices = messy_df.sample(10, random_state=30).index

messy_df.loc[amount_indices[:5], "Amount"] = -500
messy_df.loc[amount_indices[5:], "Amount"] = 0


# 5. Save messy dataset

messy_df.to_csv(
    "../data/transactions_messy.csv",
    index=False
)

print("Messy dataset created successfully!")
print("Original rows:", len(df))
print("Messy rows:", len(messy_df))