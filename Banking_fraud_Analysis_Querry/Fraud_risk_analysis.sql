SELECT
    t.TransactionID,
    t.AccountID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount,
    ch.ChannelName,
    t.TransactionStatus,
    t.LocationCity,
    t.IsInternational
FROM Transactions t
INNER JOIN Channels ch
    ON t.ChannelID = ch.ChannelID
WHERE t.Amount >= 100000
ORDER BY t.Amount DESC;

SELECT
    RiskLevel,
    COUNT(*) AS AlertCount,
    SUM(CASE
        WHEN IsConfirmedFraud = 1 THEN 1
        ELSE 0
    END) AS ConfirmedFraudCount,
    AVG(RiskScore) AS AverageRiskScore
FROM Fraud_Alerts
GROUP BY RiskLevel
ORDER BY
    CASE RiskLevel
        WHEN 'Critical' THEN 1
        WHEN 'High' THEN 2
        WHEN 'Medium' THEN 3
        WHEN 'Low' THEN 4
    END;

    SELECT
    ch.ChannelName,
    COUNT(f.AlertID) AS FraudAlertCount,
    SUM(CASE
        WHEN f.IsConfirmedFraud = 1 THEN 1
        ELSE 0
    END) AS ConfirmedFraudCount,
    AVG(f.RiskScore) AS AverageRiskScore
FROM Fraud_Alerts f
INNER JOIN Transactions t
    ON f.TransactionID = t.TransactionID
INNER JOIN Channels ch
    ON t.ChannelID = ch.ChannelID
GROUP BY
    ch.ChannelName
ORDER BY
    FraudAlertCount DESC;

    SELECT
    t.LocationCity,
    COUNT(f.AlertID) AS FraudAlertCount,
    SUM(CASE
        WHEN f.IsConfirmedFraud = 1 THEN 1
        ELSE 0
    END) AS ConfirmedFraudCount,
    SUM(t.Amount) AS TotalAlertTransactionValue,
    AVG(f.RiskScore) AS AverageRiskScore
FROM Fraud_Alerts f
INNER JOIN Transactions t
    ON f.TransactionID = t.TransactionID
GROUP BY
    t.LocationCity
ORDER BY
    FraudAlertCount DESC;

    SELECT
    ch.ChannelName,

    COUNT(t.TransactionID) AS TotalTransactions,

    COUNT(f.AlertID) AS FraudAlerts,

    ROUND(
        100.0 * COUNT(f.AlertID)
        / COUNT(t.TransactionID),
        2
    ) AS FraudAlertRate

FROM Transactions t

INNER JOIN Channels ch
    ON t.ChannelID = ch.ChannelID

LEFT JOIN Fraud_Alerts f
    ON t.TransactionID = f.TransactionID

GROUP BY
    ch.ChannelName

ORDER BY
    FraudAlertRate DESC;

    SELECT TOP 10
    c.CustomerID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    c.CustomerSegment,

    COUNT(DISTINCT t.TransactionID) AS TransactionCount,

    COUNT(DISTINCT f.AlertID) AS FraudAlertCount,

    SUM(t.Amount) AS TotalTransactionValue,

    SUM(CASE
        WHEN f.IsConfirmedFraud = 1 THEN t.Amount
        ELSE 0
    END) AS ConfirmedFraudAmount,

    AVG(f.RiskScore) AS AverageRiskScore

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
    FraudAlertCount DESC,
    AverageRiskScore DESC;

    WITH TransactionSequence AS
(
    SELECT
        t.TransactionID,
        t.AccountID,
        t.TransactionDate,
        t.TransactionTime,
        t.Amount,

        LAG(t.TransactionDate) OVER
        (
            PARTITION BY t.AccountID
            ORDER BY t.TransactionDate, t.TransactionTime
        ) AS PreviousTransactionDate,

        LAG(t.TransactionTime) OVER
        (
            PARTITION BY t.AccountID
            ORDER BY t.TransactionDate, t.TransactionTime
        ) AS PreviousTransactionTime

    FROM Transactions t
)

SELECT
    TransactionID,
    AccountID,
    TransactionDate,
    TransactionTime,
    Amount,
    PreviousTransactionDate,
    PreviousTransactionTime

FROM TransactionSequence
WHERE PreviousTransactionDate IS NOT NULL
ORDER BY AccountID, TransactionDate, TransactionTime;

WITH TransactionSequence AS
(
    SELECT
        t.TransactionID,
        t.AccountID,
        t.TransactionDate,
        t.TransactionTime,
        t.Amount,

        LAG(
            DATEADD(
                SECOND,
                DATEDIFF(SECOND, '00:00:00', t.TransactionTime),
                CAST(t.TransactionDate AS DATETIME)
            )
        ) OVER
        (
            PARTITION BY t.AccountID
            ORDER BY t.TransactionDate, t.TransactionTime
        ) AS PreviousTransactionDateTime,

        DATEADD(
            SECOND,
            DATEDIFF(SECOND, '00:00:00', t.TransactionTime),
            CAST(t.TransactionDate AS DATETIME)
        ) AS CurrentTransactionDateTime

    FROM Transactions t
)

SELECT
    TransactionID,
    AccountID,
    TransactionDate,
    TransactionTime,
    Amount,
    PreviousTransactionDateTime,
    CurrentTransactionDateTime,

    DATEDIFF(
        SECOND,
        PreviousTransactionDateTime,
        CurrentTransactionDateTime
    ) AS SecondsSincePreviousTransaction

FROM TransactionSequence
WHERE PreviousTransactionDateTime IS NOT NULL
ORDER BY
    AccountID,
    CurrentTransactionDateTime;

    WITH TransactionSequence AS
(
    SELECT
        t.TransactionID,
        t.AccountID,
        t.TransactionDate,
        t.TransactionTime,
        t.Amount,

        DATEADD(
            SECOND,
            DATEDIFF(SECOND, '00:00:00', t.TransactionTime),
            CAST(t.TransactionDate AS DATETIME)
        ) AS CurrentTransactionDateTime,

        LAG(
            DATEADD(
                SECOND,
                DATEDIFF(SECOND, '00:00:00', t.TransactionTime),
                CAST(t.TransactionDate AS DATETIME)
            )
        ) OVER
        (
            PARTITION BY t.AccountID
            ORDER BY t.TransactionDate, t.TransactionTime
        ) AS PreviousTransactionDateTime

    FROM Transactions t
)

SELECT
    TransactionID,
    AccountID,
    TransactionDate,
    TransactionTime,
    Amount,
    PreviousTransactionDateTime,

    DATEDIFF(
        SECOND,
        PreviousTransactionDateTime,
        CurrentTransactionDateTime
    ) AS SecondsSincePreviousTransaction,

    CASE
        WHEN DATEDIFF(
            SECOND,
            PreviousTransactionDateTime,
            CurrentTransactionDateTime
        ) <= 60
        THEN 'Rapid Transaction'
        ELSE 'Normal'
    END AS TransactionRiskFlag

FROM TransactionSequence

WHERE PreviousTransactionDateTime IS NOT NULL

ORDER BY
    SecondsSincePreviousTransaction;

    SELECT TOP 50
    t.TransactionID,
    t.AccountID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount,
    t.TransactionStatus,
    t.IsInternational,

    CASE
        WHEN t.Amount >= 100000 THEN 30
        ELSE 0
    END
    +
    CASE
        WHEN t.IsInternational = 1 THEN 20
        ELSE 0
    END
    +
    CASE
        WHEN t.TransactionStatus = 'Failed' THEN 20
        ELSE 0
    END
    +
    CASE
        WHEN t.Amount >= 100000
             AND t.IsInternational = 1
        THEN 30
        ELSE 0
    END AS RiskScore

FROM Transactions t

ORDER BY RiskScore DESC, t.Amount DESC;