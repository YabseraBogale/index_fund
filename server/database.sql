create table if not exists TranscationtHistory(
    Name text,
    OpenPrice float,
    LowPrice float,
    HighPrice float,
    ClosePrice float,
    Volume float,
    DatePrice date
  )

CREATE TABLE IF NOT EXISTS symbols (
            Name TEXT PRIMARY KEY,
            SharesOutstanding float
        )

SELECT Name, DatePrice, SUM(Volume) AS TotalDailyVolume
FROM TranscationtHistory
WHERE DatePrice = 'YYYY-MM-DD' BETWEEN 'YYYY-MM-DD'
GROUP BY Name, DatePrice;

SELECT * 
FROM TranscationtHistory
WHERE Name = 'STOCK_NAME'
  AND DatePrice BETWEEN '2026-01-01' AND '2026-01-31';
