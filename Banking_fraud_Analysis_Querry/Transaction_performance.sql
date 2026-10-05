use banking_analytics;
GO

SELECT
    COUNT(*) AS TotalTransactions,
    SUM(Amount) AS TotalTransactionValue,
    AVG(Amount) AS AverageTransactionValue,
    MIN(Amount) AS MinimumTransactionValue,
    MAX(Amount) AS MaximumTransactionValue
FROM Transactions;

SELECT
    TransactionStatus,
    COUNT(*) AS TransactionCount,
    SUM(Amount) AS TotalAmount,
    AVG(Amount) AS AverageAmount
FROM Transactions
GROUP BY TransactionStatus
ORDER BY TransactionCount DESC;

SELECT
    COUNT(*) AS TotalTransactions,

    SUM(CASE
        WHEN TransactionStatus = 'Success' THEN 1
        ELSE 0
    END) AS SuccessfulTransactions,

    SUM(CASE
        WHEN TransactionStatus = 'Failed' THEN 1
        ELSE 0
    END) AS FailedTransactions,

    ROUND(
        100.0 * SUM(CASE
            WHEN TransactionStatus = 'Success' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS SuccessRate,

    ROUND(
        100.0 * SUM(CASE
            WHEN TransactionStatus = 'Failed' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS FailureRate

FROM Transactions;