use Banking_Analytics;
GO

SELECT TOP 10
    a.CustomerID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    COUNT(t.TransactionID) AS TransactionCount,
    SUM(t.Amount) AS TotalTransactionValue,
    AVG(t.Amount) AS AverageTransactionValue
FROM Transactions t
INNER JOIN Accounts a
    ON t.AccountID = a.AccountID
INNER JOIN Customers c
    ON a.CustomerID = c.CustomerID
GROUP BY
    a.CustomerID,
    c.FirstName,
    c.LastName
ORDER BY TotalTransactionValue DESC;



SELECT TOP 10
    a.CustomerID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    c.CustomerSegment,
    COUNT(t.TransactionID) AS TransactionCount,
    SUM(t.Amount) AS TotalTransactionValue
FROM Transactions t
INNER JOIN Accounts a
    ON t.AccountID = a.AccountID
INNER JOIN Customers c
    ON a.CustomerID = c.CustomerID
GROUP BY
    a.CustomerID,
    c.FirstName,
    c.LastName,
    c.CustomerSegment
ORDER BY TransactionCount DESC;

SELECT
    c.CustomerSegment,
    COUNT(DISTINCT c.CustomerID) AS CustomerCount,
    COUNT(t.TransactionID) AS TransactionCount,
    SUM(t.Amount) AS TotalTransactionValue,
    AVG(t.Amount) AS AverageTransactionValue
FROM Customers c
INNER JOIN Accounts a
    ON c.CustomerID = a.CustomerID
INNER JOIN Transactions t
    ON a.AccountID = t.AccountID
GROUP BY
    c.CustomerSegment
ORDER BY TotalTransactionValue DESC;

WITH CustomerSummary AS
(
    SELECT
        a.CustomerID,
        c.FirstName + ' ' + c.LastName AS CustomerName,
        c.CustomerSegment,
        COUNT(t.TransactionID) AS TransactionCount,
        SUM(t.Amount) AS TotalTransactionValue
    FROM Transactions t
    INNER JOIN Accounts a
        ON t.AccountID = a.AccountID
    INNER JOIN Customers c
        ON a.CustomerID = c.CustomerID
    GROUP BY
        a.CustomerID,
        c.FirstName,
        c.LastName,
        c.CustomerSegment
)

SELECT
    CustomerID,
    CustomerName,
    CustomerSegment,
    TransactionCount,
    TotalTransactionValue,

    RANK() OVER (
        ORDER BY TotalTransactionValue DESC
    ) AS CustomerRank

FROM CustomerSummary
ORDER BY CustomerRank;

WITH CustomerSummary AS
(
    SELECT
        a.CustomerID,
        c.FirstName + ' ' + c.LastName AS CustomerName,
        c.CustomerSegment,
        COUNT(t.TransactionID) AS TransactionCount,
        SUM(t.Amount) AS TotalTransactionValue
    FROM Transactions t
    INNER JOIN Accounts a
        ON t.AccountID = a.AccountID
    INNER JOIN Customers c
        ON a.CustomerID = c.CustomerID
    GROUP BY
        a.CustomerID,
        c.FirstName,
        c.LastName,
        c.CustomerSegment
)

SELECT
    CustomerID,
    CustomerName,
    CustomerSegment,
    TransactionCount,
    TotalTransactionValue,

    RANK() OVER
    (
        PARTITION BY CustomerSegment
        ORDER BY TotalTransactionValue DESC
    ) AS SegmentRank

FROM CustomerSummary
ORDER BY
    CustomerSegment,
    SegmentRank;


    SELECT
    c.CustomerID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    c.CustomerSegment,
    COUNT(a.AccountID) AS AccountCount
FROM Customers c
INNER JOIN Accounts a
    ON c.CustomerID = a.CustomerID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.CustomerSegment
HAVING COUNT(a.AccountID) > 1
ORDER BY AccountCount DESC;