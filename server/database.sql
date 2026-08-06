create table if not exists TranscationtHistory(
    Name text,
    OpenPrice float,
    LowPrice float,
    HighPrice float,
    ClosePrice float,
    Volume float,
    DatePrice date
)

SELECT 
    Name,
    SUM(Volume * ClosePrice) AS StockVolume,
    (SUM(Volume * ClosePrice) / SUM(SUM(Volume * ClosePrice)) OVER()) * 100 AS PercentageShare
FROM TranscationtHistory
WHERE DatePrice BETWEEN '2021-02-03' AND '2022-02-03'
GROUP BY Name
ORDER BY PercentageShare DESC;

CREATE TABLE IF NOT EXISTS Transcationt(
    Symbol TEXT PRIMARY KEY,
    Name text NOT Null,
    SharePrice Float NOT Null,
    PublicShares Integer NOT Null,
    ClosedShares Integer NOT Null,
    TotalShares Integer NOT Null
)

CREATE TABLE IF NOT EXISTS Account(
    AcountID Integer PRIMARY KEY,
    StartingMoney float not null,
    BoughtDate date not null,
    AllFee float not null 
)