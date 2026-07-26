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
)

SELECT Name, DatePrice, SUM(Volume) AS TotalDailyVolume
FROM TranscationtHistory
WHERE DatePrice = '?' BETWEEN '?'
GROUP BY Name, DatePrice;

SELECT * 
FROM TranscationtHistory
WHERE Name = '?'
  AND DatePrice BETWEEN '?' AND '?';
