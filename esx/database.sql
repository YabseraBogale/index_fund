CREATE TABLE IF NOT EXISTS Company(
    Symbol Text PRIMARY KEY,
    Name Text Not Null,
    PublicShare Integer Not Null,
    ClosedShare Integer Not Null,
    SharePrice Float Not Null,
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

CREATE TABLE IF NOT EXISTS SellOrder(
    Symbol Text References Transcation,
    AcountID Integer References Account,
    NumberOfShares Integer NOT Null,
    SellPrice Float NOT Null,
    SoldDate Date Not Null
)
