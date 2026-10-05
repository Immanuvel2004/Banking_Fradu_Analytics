use Banking_analytics;
GO 

SELECT
    YEAR(TransactionDate) AS TransactionYear,
    MONTH(TransactionDate) AS TransactionMonth,
    COUNT(*) AS TransactionCount,
    SUM(Amount) AS TotalTransactionValue,
    AVG(Amount) AS AverageTransactionValue
FROM Transactions
GROUP BY
    YEAR(TransactionDate),
    MONTH(TransactionDate)
ORDER BY
    TransactionYear,
    TransactionMonth;

    SELECT
    YEAR(f.AlertDate) AS AlertYear,
    MONTH(f.AlertDate) AS AlertMonth,

    COUNT(f.AlertID) AS FraudAlertCount,

    SUM(CASE
        WHEN f.IsConfirmedFraud = 1 THEN 1
        ELSE 0
    END) AS ConfirmedFraudCount,

    SUM(t.Amount) AS AlertTransactionValue,

    AVG(f.RiskScore) AS AverageRiskScore

FROM Fraud_Alerts f

INNER JOIN Transactions t
    ON f.TransactionID = t.TransactionID

GROUP BY
    YEAR(f.AlertDate),
    MONTH(f.AlertDate)

ORDER BY
    AlertYear,
    AlertMonth;

    WITH DailyTransactions AS
(
    SELECT
        TransactionDate,
        COUNT(*) AS TransactionCount,
        SUM(Amount) AS TotalTransactionValue
    FROM Transactions
    GROUP BY TransactionDate
)

SELECT
    TransactionDate,
    TransactionCount,
    TotalTransactionValue,

    AVG(TransactionCount) OVER () AS AverageDailyTransactions,

    CASE
        WHEN TransactionCount >
             AVG(TransactionCount) OVER () * 1.5
        THEN 'High Activity'
        ELSE 'Normal'
    END AS ActivityFlag

FROM DailyTransactions

ORDER BY TransactionDate;

WITH CustomerTransactions AS
(
    SELECT
        c.CustomerID,
        c.FirstName + ' ' + c.LastName AS CustomerName,
        t.TransactionID,
        t.TransactionDate,
        t.Amount,

        LAG(t.Amount) OVER
        (
            PARTITION BY c.CustomerID
            ORDER BY t.TransactionDate, t.TransactionTime
        ) AS PreviousAmount

    FROM Customers c

    INNER JOIN Accounts a
        ON c.CustomerID = a.CustomerID

    INNER JOIN Transactions t
        ON a.AccountID = t.AccountID
)

SELECT
    CustomerID,
    CustomerName,
    TransactionID,
    TransactionDate,
    Amount,
    PreviousAmount,

    Amount - PreviousAmount AS AmountDifference,

    CASE
        WHEN PreviousAmount IS NULL THEN 'First Transaction'

        WHEN Amount > PreviousAmount * 2
            THEN 'Large Increase'

        WHEN Amount < PreviousAmount * 0.5
            THEN 'Large Decrease'

        ELSE 'Normal Change'
    END AS BehaviorFlag

FROM CustomerTransactions

ORDER BY
    CustomerID,
    TransactionDate;

    SELECT
    c.CustomerID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    c.CustomerSegment,

    COUNT(t.TransactionID) AS TotalTransactions,

    SUM(t.Amount) AS TotalTransactionValue,

    COUNT(f.AlertID) AS FraudAlerts,

    SUM(CASE
        WHEN f.IsConfirmedFraud = 1 THEN 1
        ELSE 0
    END) AS ConfirmedFraudAlerts,

    AVG(f.RiskScore) AS AverageRiskScore,

    MAX(f.RiskScore) AS MaximumRiskScore

FROM Customers c

INNER JOIN Accounts a
    ON c.CustomerID = a.CustomerID

INNER JOIN Transactions t
    ON a.AccountID = t.AccountID

LEFT JOIN Fraud_Alerts f
    ON t.TransactionID = f.TransactionID

GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.CustomerSegment

ORDER BY
    AverageRiskScore DESC;