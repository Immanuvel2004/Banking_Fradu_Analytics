create database Banking_Analytics;
use Banking_Analytics;
GO

CREATE TABLE Customers
(
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender VARCHAR(20),
    DateOfBirth DATE,
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100) DEFAULT 'India',
    RegistrationDate DATE NOT NULL,
    CustomerSegment VARCHAR(30),
    CustomerStatus VARCHAR(20) NOT NULL
);
GO

CREATE TABLE Branches
(
    BranchID INT IDENTITY(1,1) PRIMARY KEY,
    BranchName VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    Region VARCHAR(50),
    BranchType VARCHAR(50),
    OpeningDate DATE,
    BranchStatus VARCHAR(20) NOT NULL
);
GO
CREATE TABLE Channels
(
    ChannelID INT IDENTITY(1,1) PRIMARY KEY,
    ChannelName VARCHAR(50) NOT NULL,
    ChannelCategory VARCHAR(50)
);

GO

CREATE TABLE Accounts
(
    AccountID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    AccountType VARCHAR(30) NOT NULL,
    BranchID INT NOT NULL,
    AccountOpenDate DATE NOT NULL,
    AccountStatus VARCHAR(20) NOT NULL,
    CurrentBalance DECIMAL(18,2) NOT NULL DEFAULT 0,

    CONSTRAINT FK_Accounts_Customers
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID),

    CONSTRAINT FK_Accounts_Branches
        FOREIGN KEY (BranchID)
        REFERENCES Branches(BranchID)
);
GO

CREATE TABLE Cards
(
    CardID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    AccountID INT NOT NULL,
    CardType VARCHAR(30) NOT NULL,
    CardNetwork VARCHAR(30),
    IssueDate DATE NOT NULL,
    ExpiryDate DATE NOT NULL,
    CardStatus VARCHAR(20) NOT NULL,

    CONSTRAINT FK_Cards_Customers
        FOREIGN KEY (CustomerID)
        REFERENCES dbo.Customers(CustomerID),

    CONSTRAINT FK_Cards_Accounts
        FOREIGN KEY (AccountID)
        REFERENCES dbo.Accounts(AccountID)
);
GO

CREATE TABLE Transactions
(
    TransactionID BIGINT IDENTITY(1,1) PRIMARY KEY,
    AccountID INT NOT NULL,
    TransactionDate DATE NOT NULL,
    TransactionTime TIME NOT NULL,
    TransactionType VARCHAR(30) NOT NULL,
    Amount DECIMAL(18,2) NOT NULL,
    ChannelID INT NOT NULL,
    BranchID INT NULL,
    TransactionStatus VARCHAR(20) NOT NULL,
    MerchantCategory VARCHAR(50),
    LocationCity VARCHAR(100),
    LocationState VARCHAR(100),
    IsInternational BIT NOT NULL DEFAULT 0,

    CONSTRAINT FK_Transactions_Accounts
        FOREIGN KEY (AccountID)
        REFERENCES dbo.Accounts(AccountID),

    CONSTRAINT FK_Transactions_Channels
        FOREIGN KEY (ChannelID)
        REFERENCES dbo.Channels(ChannelID),

    CONSTRAINT FK_Transactions_Branches
        FOREIGN KEY (BranchID)
        REFERENCES dbo.Branches(BranchID),

    CONSTRAINT CK_Transactions_Amount
        CHECK (Amount > 0)
);
GO

CREATE TABLE Fraud_Alerts
(
    AlertID BIGINT IDENTITY(1,1) PRIMARY KEY,
    TransactionID BIGINT NOT NULL,
    AlertDate DATE NOT NULL,
    AlertType VARCHAR(50) NOT NULL,
    RiskLevel VARCHAR(20) NOT NULL,
    RiskScore DECIMAL(5,2) NOT NULL,
    AlertStatus VARCHAR(30) NOT NULL,
    IsConfirmedFraud BIT NOT NULL DEFAULT 0,

    CONSTRAINT FK_FraudAlerts_Transactions
        FOREIGN KEY (TransactionID)
        REFERENCES dbo.Transactions(TransactionID),

    CONSTRAINT CK_FraudAlerts_RiskScore
        CHECK (RiskScore >= 0 AND RiskScore <= 100)
);
GO

CREATE TABLE DateDimension
(
    DateKey INT PRIMARY KEY,
    FullDate DATE NOT NULL,
    Year INT NOT NULL,
    Quarter INT NOT NULL,
    MonthNumber INT NOT NULL,
    MonthName VARCHAR(20) NOT NULL,
    WeekNumber INT NOT NULL,
    DayNumber INT NOT NULL,
    DayName VARCHAR(20) NOT NULL,
    IsWeekend BIT NOT NULL
);
GO
