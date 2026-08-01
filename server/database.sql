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

SELECT Name,ClosePrice, SUM(Volume) AS TotalDailyVolume
FROM TranscationtHistory
WHERE DatePrice = '?' AND '?'
GROUP BY Name, DatePrice;

SELECT Sum(Volume) 
FROM TranscationtHistory
WHERE Name = '?'
  AND DatePrice BETWEEN '?' AND '?';

