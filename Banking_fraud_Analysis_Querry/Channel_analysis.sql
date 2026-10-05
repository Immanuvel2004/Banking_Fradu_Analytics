use Banking_Analytics;
GO

SELECT
    ch.ChannelName,
    COUNT(t.TransactionID) AS TransactionCount,
    SUM(t.Amount) AS TotalTransactionValue,
    AVG(t.Amount) AS AverageTransactionValue
FROM Transactions t
INNER JOIN Channels ch
    ON t.ChannelID = ch.ChannelID
GROUP BY
    ch.ChannelName
ORDER BY
    TotalTransactionValue DESC;


    SELECT
    ch.ChannelName,

    COUNT(t.TransactionID) AS TotalTransactions,

    SUM(CASE
        WHEN t.TransactionStatus = 'Success' THEN 1
        ELSE 0
    END) AS SuccessfulTransactions,

    SUM(CASE
        WHEN t.TransactionStatus = 'Failed' THEN 1
        ELSE 0
    END) AS FailedTransactions,

    ROUND(
        100.0 *
        SUM(CASE
            WHEN t.TransactionStatus = 'Failed' THEN 1
            ELSE 0
        END)
        / COUNT(t.TransactionID),
        2
    ) AS FailureRate

FROM Transactions t

INNER JOIN Channels ch
    ON t.ChannelID = ch.ChannelID

GROUP BY
    ch.ChannelName

ORDER BY
    FailureRate DESC;