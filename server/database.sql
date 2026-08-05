create table if not exists TranscationtHistory(
    Name text,
    OpenPrice float,
    LowPrice float,
    HighPrice float,
    ClosePrice float,
    Volume float,
    DatePrice date
)

CREATE TABLE IF NOT EXISTS Symbols (
            Name TEXT PRIMARY KEY,
            SharesOutstanding float
)

CREATE TABLE IF NOT EXISTS Account(
    AcountID Integer PRIMARY KEY,
    StartingMoney float not null,
    BoughtDate date not null,
    AllFee float not null 
)

SELECT 
    Name,
    SUM(Volume * ClosePrice) AS StockVolume,
    (SUM(Volume * ClosePrice) / SUM(SUM(Volume * ClosePrice)) OVER()) * 100 AS PercentageShare
FROM TranscationtHistory
WHERE DatePrice BETWEEN '2021-02-03' AND '2022-02-03'
GROUP BY Name
ORDER BY PercentageShare DESC;

