# 🏦 Banking Transaction & Fraud Analytics Platform

An end-to-end **Data Analytics project** that analyzes banking transactions, customer behavior, banking channels, and fraud-risk patterns using **Python, Pandas, SQL Server, and Power BI**.

---

## 📌 Project Overview

Banks process thousands of transactions every day across multiple channels such as UPI, ATM, POS, mobile banking, and online banking.

This project simulates a banking analytics environment where transaction data is:

```text
Raw Data
   ↓
Python + Pandas
   ↓
Data Cleaning
   ↓
Data Quality Validation
   ↓
SQL Server
   ↓
SQL Analytics
   ↓
Power BI
   ↓
DAX
   ↓
Business Insights
```

The goal is to transform raw transaction data into actionable insights for:

- Transaction performance
- Customer analytics
- Channel performance
- Fraud monitoring
- Risk analysis
- Business decision-making

---

# 🎯 Business Objectives

The project answers important banking business questions:

### Transaction Performance
- How many transactions were processed?
- What is the total transaction value?
- What is the average transaction value?
- What percentage of transactions succeeded?
- What percentage failed?

### Customer Analytics
- Who are the highest-value customers?
- Who are the most active customers?
- Which customer segment generates the most transaction value?
- Which customers have multiple accounts?
- Which customers have higher risk exposure?

### Channel Analytics
- Which banking channel processes the most transactions?
- Which channel generates the highest transaction value?
- Which channel has the highest failure rate?
- Which channel has the highest fraud-alert rate?

### Fraud & Risk Analytics
- Which transactions have high-risk characteristics?
- Which locations generate the most fraud alerts?
- Which customers have higher risk exposure?
- Are there rapid transaction patterns?
- Are fraud alerts increasing over time?

---

# 🏗️ Project Architecture

```text
                 Raw Banking Data
                       │
                       ▼
                Python + Pandas
                       │
                       ▼
                Data Profiling
                       │
                       ▼
                 Data Cleaning
                       │
                       ▼
              Data Quality Checks
                       │
                       ▼
                  SQL Server
                       │
                       ▼
                SQL Analytics
                       │
                       ▼
                   Power BI
                       │
                       ▼
                     DAX
                       │
                       ▼
              Interactive Dashboards
                       │
                       ▼
               Business Insights
```

---

# 🗂️ Dataset

The project uses **synthetic banking data** created specifically for analytics and portfolio purposes.

## Main Tables

| Table | Description |
|---|---|
| Customers | Customer demographic and segment information |
| Branches | Banking branch information |
| Channels | Banking transaction channels |
| Accounts | Customer bank accounts |
| Cards | Customer card information |
| Transactions | Main transaction dataset |
| Fraud_Alerts | Fraud and risk alert information |
| DateDimension | Date analysis table |

---

# 📊 Dataset Size

| Table | Records |
|---|---:|
| Customers | 80 |
| Branches | 12 |
| Channels | 8 |
| Accounts | ~100 |
| Cards | ~90+ |
| Transactions | 6,000 |
| Fraud Alerts | Generated from risk rules |
| Date Dimension | 365 |

---

# 🛠️ Technology Stack

## Programming & Data Analysis

- Python
- Pandas
- NumPy

## Database

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

## Business Intelligence

- Microsoft Power BI
- DAX

## Development Tools

- PyCharm
- Git
- GitHub

---

# 🐍 Python Data Pipeline

Python and Pandas are used to prepare the transaction data before analytical processing.

## 1. Data Profiling

The profiling process examines:

- Number of rows
- Number of columns
- Column names
- Data types
- Missing values
- Duplicate records
- Numerical statistics
- Transaction status distribution
- Transaction type distribution

---

## 2. Data Cleaning

The cleaning pipeline handles:

- Duplicate records
- Missing merchant categories
- Inconsistent transaction statuses
- Invalid transaction amounts
- Date conversion
- Time conversion
- Numeric conversion
- International transaction flags

Example:

```python
df["TransactionStatus"] = (
    df["TransactionStatus"]
    .astype(str)
    .str.strip()
    .str.title()
)
```

---

## 3. Data Quality Validation

The project validates:

- Duplicate Transaction IDs
- Missing Transaction IDs
- Invalid transaction amounts
- Invalid transaction statuses
- Invalid transaction types
- Invalid international flags
- Invalid transaction dates
- Missing values

This ensures that only reliable data moves into the analytical workflow.

---

# 🗄️ SQL Server Analytics

SQL Server is used for transaction storage and business analysis.

The project demonstrates:

- `SELECT`
- `WHERE`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `CASE`
- `INNER JOIN`
- `LEFT JOIN`
- CTEs
- Aggregations
- Window Functions
- `RANK()`
- `LAG()`
- `PARTITION BY`
- Time-based analysis
- Fraud-risk analysis

---

# 📈 Transaction Analytics

The project calculates:

- Total transactions
- Total transaction value
- Average transaction value
- Minimum transaction value
- Maximum transaction value
- Successful transactions
- Failed transactions
- Pending transactions
- Reversed transactions
- Success rate
- Failure rate

---

# 👥 Customer Analytics

Customer-level analysis includes:

- Top customers by transaction value
- Most active customers
- Customer segment performance
- Customers with multiple accounts
- Customer ranking
- Customer ranking within segments
- Customer behavioral changes
- Customer risk profiles

---

# 🏦 Channel Analytics

The following channels are analyzed:

- ATM
- POS
- Online Banking
- Mobile Banking
- UPI
- Branch
- Credit Card
- Debit Card

Analysis includes:

- Transaction volume
- Transaction value
- Average transaction amount
- Success rate
- Failure rate
- Fraud-alert rate

---

# 🚨 Fraud & Risk Analytics

The project uses simulated risk rules to identify potentially suspicious transactions.

## Risk Signals

The analysis considers:

- High-value transactions
- International transactions
- Failed transactions
- Rapid transaction activity
- Behavioral changes
- Fraud alerts
- Risk scores

### Example Risk Model

| Risk Signal | Score |
|---|---:|
| High-value transaction | +30 |
| International transaction | +20 |
| Failed transaction | +20 |
| International + high-value | +30 |

### Risk Categories

```text
0–29     → Low
30–59    → Medium
60–79    → High
80–100   → Critical
```

> These thresholds are simulated for portfolio analysis and do not represent real banking fraud-detection policies.

---

# ⏱️ Transaction Velocity Analysis

SQL window functions such as `LAG()` are used to compare consecutive transactions for the same account.

Example:

```text
10:00:00 → ₹5,000
10:00:20 → ₹8,000
10:00:45 → ₹12,000
```

Rapid transaction activity can be identified as a potential risk signal.

> Rapid transaction activity is not proof of fraud. It is an analytical signal that may require further investigation.

---

# 📊 Planned Power BI Dashboards

## 1. Executive Dashboard

Key KPIs:

- Total Transactions
- Total Transaction Value
- Average Transaction Value
- Success Rate
- Failure Rate
- Fraud Alerts
- Confirmed Fraud
- Average Risk Score

---

## 2. Transaction Dashboard

Analysis:

- Transaction trends
- Transaction types
- Transaction status
- Transaction channels
- Branch performance
- Transaction value

---

## 3. Customer Dashboard

Analysis:

- Customer segments
- Top customers
- Customer activity
- Transaction value
- Customer behavior
- Account ownership

---

## 4. Fraud & Risk Dashboard

Analysis:

- Fraud alerts
- Risk levels
- Risk scores
- Fraud trends
- Fraud by channel
- Fraud by location
- High-risk transactions
- Confirmed fraud

---

# 📁 Project Structure

```text
Banking-Transaction-Fraud-Analytics/
│
├── README.md
├── requirements.txt
├── business_insights.md
│
├── data/
│   ├── transactions_raw.csv
│   ├── transactions_messy.csv
│   └── transactions_clean.csv
│
├── sql/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_load_reference_data.sql
│   ├── 04_generate_transactions.sql
│   ├── 05_generate_fraud_alerts.sql
│   └── 06_advanced_analytics.sql
│
├── src/
│   ├── 01_data_profiling.py
│   ├── 02_create_messy_data.py
│   ├── 03_clean_transactions.py
│   └── 04_data_quality_validation.py
│
├── powerbi/
│   └── screenshots/
│
└── reports/
    └── business_insights.md
```

---

# 🔄 ETL Workflow

```text
EXTRACT
   │
   ▼
Raw CSV / SQL Data
   │
   ▼
TRANSFORM
   │
   ├── Remove duplicates
   ├── Handle missing values
   ├── Standardize categories
   ├── Validate amounts
   ├── Convert data types
   └── Validate business rules
   │
   ▼
LOAD
   │
   ▼
SQL Server
   │
   ▼
ANALYZE
   │
   ▼
Power BI
```

---

# 💡 Key Business Questions

### Transaction Performance

- What is the overall transaction volume?
- What is the total transaction value?
- What is the transaction success rate?
- Which transaction types generate the most value?

### Customer Behavior

- Who are the highest-value customers?
- Who are the most active customers?
- Which segment contributes the most transaction value?
- Which customers show unusual transaction behavior?

### Channel Performance

- Which channel has the highest transaction volume?
- Which channel has the highest transaction value?
- Which channel has the highest failure rate?
- Which channel has the highest fraud-alert rate?

### Fraud & Risk

- Which transactions have the highest risk?
- Which locations generate the most alerts?
- Which customers have higher risk exposure?
- Are there rapid transaction patterns?
- Are fraud alerts increasing over time?

---

# 📌 Business Value

This project demonstrates how a Data Analyst can transform raw banking data into actionable business intelligence.

The solution combines:

```text
Python
   +
Pandas
   +
SQL Server
   +
SQL Analytics
   +
Power BI
   +
DAX
   +
Business Analysis
```

The final goal is to provide stakeholders with a clear view of:

```text
Transaction Performance
        +
Customer Behavior
        +
Channel Performance
        +
Fraud Risk
        +
Business Trends
```

---

# ⚠️ Data Disclaimer

This project uses **synthetic/simulated banking data** created for educational and portfolio purposes.

It does not contain real customer banking information.

Fraud rules, risk scores, and thresholds are simplified analytical examples and should not be used for real-world financial decisions.

---

# 🚀 Future Improvements

Future versions may include:

- Machine-learning fraud prediction
- Isolation Forest anomaly detection
- Advanced customer segmentation
- Real-time transaction monitoring
- Automated fraud alerts
- Streaming transaction data
- Automated ETL scheduling
- Cloud data warehouse
- Azure Data Factory
- Advanced Power BI dashboards
- Automated data refresh
- Real-time analytics

---

# 👨‍💻 Skills Demonstrated

```text
Python
Pandas
NumPy
SQL Server
SQL
Data Cleaning
Data Validation
ETL
Data Analysis
Fraud Analytics
Risk Analysis
Window Functions
Power BI
DAX
Data Visualization
Business Intelligence
Git
GitHub
```

---

## ⭐ Project Objective

Build an end-to-end banking analytics solution that demonstrates practical Data Analyst skills from **raw data ingestion to business decision-making**.

**Python → SQL Server → Power BI → Business Insights**
