create table IF NOT EXISTS TranscationtHistory(
    Symbol Text References Transcation,
    OpenPrice Float,
    LowPrice Float,
    HighPrice Float,
    ClosePrice Float,
    Volume Float,
    DatePrice Date
)

CREATE TABLE IF NOT EXISTS Transcation(
    Symbol TEXT PRIMARY KEY,
    Name Text NOT Null,
    SharePrice Float NOT Null,
    PublicShares Integer NOT Null,
    ClosedShares Integer NOT Null,
    TotalShares Integer NOT Null
)

CREATE TABLE IF NOT EXISTS Account(
    AcountID Integer PRIMARY KEY,
    StartingMoney Float NOT Null,
    TotalValue Float NOT Null,
    AllFee float not null 
)

CREATE TABLE IF NOT EXISTS BuyOrder(
    Symbol Text References Transcation,
    AcountID Integer References Account,
    NumberOfShares Integer NOT Null,
    BoughtPrice Float NOT Null,
    BoughtDate Date Not Null
)

SELECT 
    Name,
    SUM(Volume * ClosePrice) AS StockVolume,
    (SUM(Volume * ClosePrice) / SUM(SUM(Volume * ClosePrice)) OVER()) * 100 AS PercentageShare
FROM TranscationtHistory
WHERE DatePrice BETWEEN '2021-02-03' AND '2022-02-03'
GROUP BY Name
ORDER BY PercentageShare DESC;