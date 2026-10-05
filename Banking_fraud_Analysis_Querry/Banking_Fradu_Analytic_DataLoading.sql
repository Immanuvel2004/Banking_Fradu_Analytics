USE Banking_Analytics;
GO

INSERT INTO Branches
(
    BranchName,
    City,
    State,
    Region,
    BranchType,
    OpeningDate,
    BranchStatus
)
VALUES
('Anna Nagar Branch', 'Chennai', 'Tamil Nadu', 'South', 'Urban', '2010-04-15', 'Active'),
('T Nagar Branch', 'Chennai', 'Tamil Nadu', 'South', 'Urban', '2012-08-20', 'Active'),
('Whitefield Branch', 'Bengaluru', 'Karnataka', 'South', 'Urban', '2015-03-10', 'Active'),
('Koramangala Branch', 'Bengaluru', 'Karnataka', 'South', 'Urban', '2014-11-25', 'Active'),
('MG Road Branch', 'Pune', 'Maharashtra', 'West', 'Urban', '2011-06-18', 'Active'),
('Andheri Branch', 'Mumbai', 'Maharashtra', 'West', 'Urban', '2009-09-12', 'Active'),
('Banjara Hills Branch', 'Hyderabad', 'Telangana', 'South', 'Urban', '2013-01-30', 'Active'),
('Salt Lake Branch', 'Kolkata', 'West Bengal', 'East', 'Urban', '2016-07-22', 'Active'),
('Connaught Place Branch', 'Delhi', 'Delhi', 'North', 'Urban', '2008-05-14', 'Active'),
('Gurgaon Branch', 'Gurugram', 'Haryana', 'North', 'Urban', '2017-10-05', 'Active'),
('Adyar Branch', 'Chennai', 'Tamil Nadu', 'South', 'Urban', '2018-02-11', 'Active'),
('Coimbatore Main Branch', 'Coimbatore', 'Tamil Nadu', 'South', 'Semi-Urban', '2015-12-01', 'Active');
GO

INSERT INTO Channels
(
    ChannelName,
    ChannelCategory
)
VALUES
('ATM', 'Self Service'),
('POS', 'Card Payment'),
('Online Banking', 'Digital'),
('Mobile Banking', 'Digital'),
('UPI', 'Digital'),
('Branch', 'Physical'),
('Credit Card', 'Card Payment'),
('Debit Card', 'Card Payment');
GO

INSERT INTO Customers
(
    FirstName,
    LastName,
    Gender,
    DateOfBirth,
    City,
    State,
    Country,
    RegistrationDate,
    CustomerSegment,
    CustomerStatus
)
VALUES
('Arun','Kumar','Male','1995-04-12','Chennai','Tamil Nadu','India','2022-01-15','Premium','Active'),
('Priya','Sharma','Female','1998-07-22','Bengaluru','Karnataka','India','2022-02-18','Regular','Active'),
('Rahul','Verma','Male','1992-11-05','Mumbai','Maharashtra','India','2022-03-10','Premium','Active'),
('Divya','Rajan','Female','1996-01-17','Coimbatore','Tamil Nadu','India','2022-04-05','Regular','Active'),
('Karthik','Iyer','Male','1990-09-28','Chennai','Tamil Nadu','India','2022-05-12','Premium','Active'),
('Sneha','Patel','Female','1997-03-14','Pune','Maharashtra','India','2022-06-20','Regular','Active'),
('Vijay','Rao','Male','1988-12-09','Hyderabad','Telangana','India','2022-07-11','Premium','Active'),
('Anjali','Mehta','Female','1994-06-30','Delhi','Delhi','India','2022-08-16','Regular','Active'),
('Suresh','Nair','Male','1987-02-18','Kochi','Kerala','India','2022-09-04','Premium','Active'),
('Meena','Krishnan','Female','1999-10-25','Chennai','Tamil Nadu','India','2022-10-19','Basic','Active'),

('Aditya','Singh','Male','1993-05-11','Gurugram','Haryana','India','2022-11-03','Premium','Active'),
('Lakshmi','Menon','Female','1991-08-07','Kochi','Kerala','India','2022-12-12','Regular','Active'),
('Ramesh','Babu','Male','1985-01-21','Coimbatore','Tamil Nadu','India','2023-01-08','Premium','Active'),
('Swathi','Reddy','Female','1996-09-15','Hyderabad','Telangana','India','2023-02-14','Regular','Active'),
('Manoj','Das','Male','1994-12-03','Kolkata','West Bengal','India','2023-03-22','Basic','Active'),
('Pooja','Gupta','Female','1997-04-19','Delhi','Delhi','India','2023-04-11','Regular','Active'),
('Naveen','Thomas','Male','1990-06-26','Bengaluru','Karnataka','India','2023-05-17','Premium','Active'),
('Aishwarya','Mohan','Female','1995-11-08','Chennai','Tamil Nadu','India','2023-06-23','Premium','Active'),
('Santhosh','Kumar','Male','1989-03-31','Chennai','Tamil Nadu','India','2023-07-09','Regular','Active'),
('Keerthana','S','Female','1998-02-13','Coimbatore','Tamil Nadu','India','2023-08-18','Basic','Active'),

('Vignesh','Raj','Male','1993-07-06','Madurai','Tamil Nadu','India','2023-09-12','Regular','Active'),
('Harini','Krish','Female','1996-05-29','Chennai','Tamil Nadu','India','2023-10-07','Premium','Active'),
('Rohit','Malhotra','Male','1988-10-16','Mumbai','Maharashtra','India','2023-11-21','Premium','Active'),
('Neha','Kapoor','Female','1994-01-09','Delhi','Delhi','India','2023-12-02','Regular','Active'),
('Deepak','Joshi','Male','1986-08-24','Pune','Maharashtra','India','2024-01-13','Premium','Active'),
('Shreya','Agarwal','Female','1999-06-18','Gurugram','Haryana','India','2024-02-09','Basic','Active'),
('Ajay','Menon','Male','1991-12-28','Kochi','Kerala','India','2024-03-15','Regular','Active'),
('Nandhini','R','Female','1995-03-03','Chennai','Tamil Nadu','India','2024-04-18','Premium','Active'),
('Gokul','Krishnan','Male','1992-09-12','Coimbatore','Tamil Nadu','India','2024-05-07','Regular','Active'),
('Ishita','Shah','Female','1997-11-21','Mumbai','Maharashtra','India','2024-06-16','Premium','Active'),

('Varun','Chopra','Male','1990-04-27','Delhi','Delhi','India','2024-07-11','Regular','Active'),
('Swetha','Nair','Female','1993-08-14','Kochi','Kerala','India','2024-08-20','Premium','Active'),
('Prakash','R','Male','1985-05-06','Chennai','Tamil Nadu','India','2024-09-09','Premium','Active'),
('Monika','Sharma','Female','1998-12-11','Bengaluru','Karnataka','India','2024-10-14','Regular','Active'),
('Ashwin','Kumar','Male','1996-02-23','Chennai','Tamil Nadu','India','2024-11-03','Basic','Active'),
('Reshma','Paul','Female','1994-07-19','Kochi','Kerala','India','2024-12-17','Regular','Active'),
('Dinesh','Balan','Male','1989-11-30','Coimbatore','Tamil Nadu','India','2025-01-06','Premium','Active'),
('Sowmya','Rao','Female','1997-01-25','Hyderabad','Telangana','India','2025-02-11','Regular','Active'),
('Mohan','Krish','Male','1987-06-13','Chennai','Tamil Nadu','India','2025-03-08','Premium','Active'),
('Riya','Das','Female','1999-09-04','Kolkata','West Bengal','India','2025-04-12','Basic','Active'),

('Balaji','S','Male','1992-02-17','Chennai','Tamil Nadu','India','2025-05-15','Regular','Active'),
('Aarthi','Kumar','Female','1996-10-09','Chennai','Tamil Nadu','India','2025-06-19','Premium','Active'),
('Yash','Mehta','Male','1990-03-22','Pune','Maharashtra','India','2025-07-07','Premium','Active'),
('Kavya','Reddy','Female','1995-12-15','Hyderabad','Telangana','India','2025-08-13','Regular','Active'),
('Surya','Prakash','Male','1988-07-28','Coimbatore','Tamil Nadu','India','2025-09-21','Premium','Active'),
('Nisha','Verma','Female','1993-04-05','Delhi','Delhi','India','2025-10-10','Regular','Active'),
('Ganesh','R','Male','1986-01-19','Chennai','Tamil Nadu','India','2025-11-06','Premium','Active'),
('Maya','Iyer','Female','1998-08-27','Bengaluru','Karnataka','India','2025-12-14','Basic','Active'),
('Hari','Mohan','Male','1991-05-16','Chennai','Tamil Nadu','India','2026-01-08','Regular','Active'),
('Janani','S','Female','1997-02-11','Coimbatore','Tamil Nadu','India','2026-01-21','Premium','Active'),

('Ravi','Shankar','Male','1989-09-29','Chennai','Tamil Nadu','India','2026-02-04','Premium','Active'),
('Anu','Joseph','Female','1995-06-18','Kochi','Kerala','India','2026-02-19','Regular','Active'),
('Suraj','Patel','Male','1993-11-12','Mumbai','Maharashtra','India','2026-03-05','Premium','Active'),
('Isha','Gupta','Female','1998-04-26','Delhi','Delhi','India','2026-03-16','Basic','Active'),
('Aravind','Nair','Male','1987-12-08','Kochi','Kerala','India','2026-03-28','Premium','Active'),
('Madhuri','Rao','Female','1994-09-17','Hyderabad','Telangana','India','2026-04-09','Regular','Active'),
('Sanjay','Kumar','Male','1990-01-31','Chennai','Tamil Nadu','India','2026-04-22','Premium','Active'),
('Roshini','M','Female','1999-07-13','Coimbatore','Tamil Nadu','India','2026-05-03','Basic','Active'),
('Vivek','Shah','Male','1992-10-21','Pune','Maharashtra','India','2026-05-17','Regular','Active'),
('Amritha','Menon','Female','1996-03-08','Kochi','Kerala','India','2026-05-29','Premium','Active'),

('Sathish','Babu','Male','1988-06-14','Chennai','Tamil Nadu','India','2026-06-04','Premium','Active'),
('Divya','Menon','Female','1997-11-02','Kochi','Kerala','India','2026-06-11','Regular','Active'),
('Kiran','Reddy','Male','1991-02-26','Hyderabad','Telangana','India','2026-06-18','Premium','Active'),
('Shalini','Joshi','Female','1995-08-19','Pune','Maharashtra','India','2026-06-25','Basic','Active'),
('Abhishek','Singh','Male','1993-05-07','Gurugram','Haryana','India','2026-07-02','Regular','Active'),
('Megha','Nair','Female','1998-01-14','Chennai','Tamil Nadu','India','2026-07-09','Premium','Active'),
('Srinivas','Rao','Male','1986-09-23','Bengaluru','Karnataka','India','2026-07-16','Premium','Active'),
('Aparna','Krishnan','Female','1994-12-06','Coimbatore','Tamil Nadu','India','2026-07-23','Regular','Active'),
('Lokesh','Kumar','Male','1990-07-18','Chennai','Tamil Nadu','India','2026-07-30','Basic','Active'),
('Bhavana','Sharma','Female','1996-04-11','Delhi','Delhi','India','2026-08-06','Premium','Active'),

('Rakesh','M','Male','1989-10-05','Chennai','Tamil Nadu','India','2026-08-13','Regular','Active'),
('Sangeetha','R','Female','1995-01-22','Chennai','Tamil Nadu','India','2026-08-20','Premium','Active'),
('Tarun','Gupta','Male','1992-06-29','Gurugram','Haryana','India','2026-08-27','Regular','Active'),
('Pavithra','S','Female','1998-09-16','Coimbatore','Tamil Nadu','India','2026-09-01','Basic','Active'),
('Nikhil','Varma','Male','1991-03-12','Mumbai','Maharashtra','India','2026-09-05','Premium','Active'),
('Shivani','Rao','Female','1997-07-25','Hyderabad','Telangana','India','2026-09-10','Regular','Active'),
('Mani','Kumar','Male','1987-11-18','Chennai','Tamil Nadu','India','2026-09-15','Premium','Active'),
('Gayathri','Nair','Female','1994-05-03','Kochi','Kerala','India','2026-09-18','Regular','Active'),
('Ranjith','B','Male','1990-08-27','Bengaluru','Karnataka','India','2026-09-21','Premium','Active'),
('Sakshi','Patel','Female','1999-02-09','Pune','Maharashtra','India','2026-09-25','Basic','Active');
GO

INSERT INTO Accounts
(
    CustomerID,
    AccountType,
    BranchID,
    AccountOpenDate,
    AccountStatus,
    CurrentBalance
)
SELECT
    CustomerID,
    CASE
        WHEN CustomerID % 5 = 0 THEN 'Current'
        WHEN CustomerID % 7 = 0 THEN 'Salary'
        ELSE 'Savings'
    END AS AccountType,

    ((CustomerID - 1) % 12) + 1 AS BranchID,

    DATEADD(
        DAY,
        CustomerID * 10,
        '2023-01-01'
    ) AS AccountOpenDate,

    CASE
        WHEN CustomerID % 13 = 0 THEN 'Inactive'
        ELSE 'Active'
    END AS AccountStatus,

    CAST(
        5000 + (CustomerID * 137.50)
        AS DECIMAL(18,2)
    ) AS CurrentBalance

FROM Customers;
GO
INSERT INTO Accounts
(
    CustomerID,
    AccountType,
    BranchID,
    AccountOpenDate,
    AccountStatus,
    CurrentBalance
)
SELECT
    CustomerID,
    CASE
        WHEN CustomerID % 2 = 0 THEN 'Current'
        ELSE 'Savings'
    END AS AccountType,

    ((CustomerID + 4) % 12) + 1 AS BranchID,

    DATEADD(
        DAY,
        CustomerID * 12,
        '2024-01-01'
    ) AS AccountOpenDate,

    'Active' AS AccountStatus,

    CAST(
        10000 + (CustomerID * 225.75)
        AS DECIMAL(18,2)
    ) AS CurrentBalance

FROM Customers
WHERE CustomerID % 4 = 0;
GO

INSERT INTO Cards
(
    CustomerID,
    AccountID,
    CardType,
    CardNetwork,
    IssueDate,
    ExpiryDate,
    CardStatus
)
SELECT
    a.CustomerID,
    a.AccountID,

    CASE
        WHEN a.AccountType = 'Current' THEN 'Debit'
        WHEN a.AccountType = 'Salary' THEN 'Debit'
        ELSE 'Debit'
    END AS CardType,

    CASE
        WHEN a.AccountID % 3 = 0 THEN 'Visa'
        WHEN a.AccountID % 3 = 1 THEN 'Mastercard'
        ELSE 'RuPay'
    END AS CardNetwork,

    DATEADD(
        DAY,
        a.AccountID * 5,
        a.AccountOpenDate
    ) AS IssueDate,

    DATEADD(
        YEAR,
        5,
        DATEADD(
            DAY,
            a.AccountID * 5,
            a.AccountOpenDate
        )
    ) AS ExpiryDate,

    CASE
        WHEN a.AccountStatus = 'Inactive' THEN 'Blocked'
        WHEN a.AccountID % 17 = 0 THEN 'Blocked'
        ELSE 'Active'
    END AS CardStatus

FROM Accounts a
WHERE a.AccountStatus = 'Active';
GO

;WITH NumberSeries AS
(
    SELECT TOP (6000)
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS N
    FROM sys.all_objects A
    CROSS JOIN sys.all_objects B
),
AccountList AS
(
    SELECT
        AccountID,
        ROW_NUMBER() OVER (ORDER BY AccountID) AS RN
    FROM Accounts
    WHERE AccountStatus = 'Active'
)
INSERT INTO Transactions
(
    AccountID,
    TransactionDate,
    TransactionTime,
    TransactionType,
    Amount,
    ChannelID,
    BranchID,
    TransactionStatus,
    MerchantCategory,
    LocationCity,
    LocationState,
    IsInternational
)
SELECT
    A.AccountID,

    DATEADD(
        DAY,
        (N.N % 365),
        '2025-10-01'
    ) AS TransactionDate,

    CAST(
        DATEADD(
            SECOND,
            (N.N * 7919) % 86400,
            '00:00:00'
        )
        AS TIME
    ) AS TransactionTime,

    CASE
        WHEN N.N % 10 IN (1,2) THEN 'Withdrawal'
        WHEN N.N % 10 IN (3,4) THEN 'Deposit'
        WHEN N.N % 10 IN (5,6) THEN 'Transfer'
        WHEN N.N % 10 IN (7,8) THEN 'Payment'
        ELSE 'Purchase'
    END AS TransactionType,

    CAST(
        CASE
            WHEN N.N % 97 = 0
                THEN 150000 + (N.N % 50000)

            WHEN N.N % 41 = 0
                THEN 75000 + (N.N % 25000)

            ELSE
                250 + ((N.N * 137) % 19750)
        END
        AS DECIMAL(18,2)
    ) AS Amount,

    ((N.N - 1) % 8) + 1 AS ChannelID,

    CASE
        WHEN N.N % 8 IN (1,2,3) THEN
            ((N.N - 1) % 12) + 1
        ELSE
            NULL
    END AS BranchID,

    CASE
        WHEN N.N % 29 = 0 THEN 'Failed'
        WHEN N.N % 53 = 0 THEN 'Pending'
        WHEN N.N % 71 = 0 THEN 'Reversed'
        ELSE 'Success'
    END AS TransactionStatus,

    CASE
        WHEN N.N % 6 = 0 THEN 'Grocery'
        WHEN N.N % 6 = 1 THEN 'Fuel'
        WHEN N.N % 6 = 2 THEN 'Restaurant'
        WHEN N.N % 6 = 3 THEN 'Electronics'
        WHEN N.N % 6 = 4 THEN 'Travel'
        ELSE 'Healthcare'
    END AS MerchantCategory,

    CASE
        WHEN N.N % 7 = 0 THEN 'Chennai'
        WHEN N.N % 7 = 1 THEN 'Bengaluru'
        WHEN N.N % 7 = 2 THEN 'Mumbai'
        WHEN N.N % 7 = 3 THEN 'Hyderabad'
        WHEN N.N % 7 = 4 THEN 'Delhi'
        WHEN N.N % 7 = 5 THEN 'Pune'
        ELSE 'Coimbatore'
    END AS LocationCity,

    CASE
        WHEN N.N % 7 = 0 THEN 'Tamil Nadu'
        WHEN N.N % 7 = 1 THEN 'Karnataka'
        WHEN N.N % 7 = 2 THEN 'Maharashtra'
        WHEN N.N % 7 = 3 THEN 'Telangana'
        WHEN N.N % 7 = 4 THEN 'Delhi'
        WHEN N.N % 7 = 5 THEN 'Maharashtra'
        ELSE 'Tamil Nadu'
    END AS LocationState,

    CASE
        WHEN N.N % 113 = 0 THEN 1
        ELSE 0
    END AS IsInternational

FROM NumberSeries N
INNER JOIN AccountList A
    ON A.RN = ((N.N - 1) % (SELECT COUNT(*) FROM AccountList)) + 1;
GO

INSERT INTO Fraud_Alerts
(
    TransactionID,
    AlertDate,
    AlertType,
    RiskLevel,
    RiskScore,
    AlertStatus,
    IsConfirmedFraud
)
SELECT
    t.TransactionID,
    t.TransactionDate AS AlertDate,

    CASE
        WHEN t.IsInternational = 1
             AND t.Amount >= 100000
            THEN 'International High Value'

        WHEN t.Amount >= 100000
            THEN 'High Value Transaction'

        WHEN t.TransactionStatus = 'Failed'
            THEN 'Failed Transaction'

        WHEN t.IsInternational = 1
            THEN 'International Transaction'

        ELSE 'Transaction Risk'
    END AS AlertType,

    CASE
        WHEN t.IsInternational = 1
             AND t.Amount >= 100000
            THEN 'Critical'

        WHEN t.Amount >= 100000
            THEN 'High'

        WHEN t.TransactionStatus = 'Failed'
            THEN 'Medium'

        WHEN t.IsInternational = 1
            THEN 'Medium'

        ELSE 'Low'
    END AS RiskLevel,

    CAST(
        CASE
            WHEN t.IsInternational = 1
                 AND t.Amount >= 100000
                THEN 95

            WHEN t.Amount >= 100000
                THEN 85

            WHEN t.TransactionStatus = 'Failed'
                THEN 60

            WHEN t.IsInternational = 1
                THEN 55

            ELSE 30
        END
        AS DECIMAL(5,2)
    ) AS RiskScore,

    CASE
        WHEN t.Amount >= 100000
             OR t.IsInternational = 1
            THEN 'Investigating'

        WHEN t.TransactionStatus = 'Failed'
            THEN 'Open'

        ELSE 'Open'
    END AS AlertStatus,

    CASE
        WHEN t.IsInternational = 1
             AND t.Amount >= 100000
            THEN 1
        ELSE 0
    END AS IsConfirmedFraud

FROM Transactions t
WHERE
       t.Amount >= 100000
    OR t.IsInternational = 1
    OR t.TransactionStatus = 'Failed';
GO

;WITH DateSeries AS
(
    SELECT CAST('2025-10-01' AS DATE) AS FullDate

    UNION ALL

    SELECT DATEADD(DAY, 1, FullDate)
    FROM DateSeries
    WHERE FullDate < '2026-09-30'
)
INSERT INTO DateDimension
(
    DateKey,
    FullDate,
    Year,
    Quarter,
    MonthNumber,
    MonthName,
    WeekNumber,
    DayNumber,
    DayName,
    IsWeekend
)
SELECT
    CONVERT(INT, FORMAT(FullDate, 'yyyyMMdd')) AS DateKey,

    FullDate,

    YEAR(FullDate) AS Year,

    DATEPART(QUARTER, FullDate) AS Quarter,

    MONTH(FullDate) AS MonthNumber,

    DATENAME(MONTH, FullDate) AS MonthName,

    DATEPART(WEEK, FullDate) AS WeekNumber,

    DAY(FullDate) AS DayNumber,

    DATENAME(WEEKDAY, FullDate) AS DayName,

    CASE
        WHEN DATENAME(WEEKDAY, FullDate) IN ('Saturday', 'Sunday')
            THEN 1
        ELSE 0
    END AS IsWeekend

FROM DateSeries
OPTION (MAXRECURSION 400);
GO