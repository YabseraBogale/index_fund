CREATE TABLE IF NOT EXISTS Company(
    Symbol Text PRIMARY KEY,
    CompanyName Text Not Null,
    PublicShare Integer Not Null,
    SharePrice Float Not Null
);

CREATE TABLE IF NOT EXISTS Account(
    AccountID Integer PRIMARY KEY,
    StartingMoney Float NOT Null,
    TotalValue Float NOT Null,
    AllFee Float Not Null 
);

CREATE TABLE IF NOT EXISTS BuyOrder(
    Symbol Text References Company,
    AccountID Integer References Account,
    NumberOfShares Integer NOT Null,
    BoughtPrice Float NOT Null,
    BoughtDate Date Not Null
);

CREATE TABLE IF NOT EXISTS SellOrder(
    Symbol Text References Company,
    AccountID Integer References Account,
    NumberOfShares Integer NOT Null,
    SellPrice Float NOT Null,
    SoldDate Date Not Null
);

Insert Into Company(
	Symbol,
	CompanyName,
	PublicShare,
	SharePrice
) values(
	'TELE',
	'Ethio Telecom',
	10700000,
	463
),
(
	'BOAX',
	'Bank of Abyssinia',
	17481120,
	2000
),
(
	'AWAB',
	'Awash Bank',
	54066089,
	2500
),
(
	'GDAB',
	'Gadaa Bank',
	1232728,
	1397
),
(
	'WGBX',
	'Wegagen Bank',
	10094666,
	1356
),
(
	'ABAYB',
	'Abay Bank',
	9657286,
	1663
);

select * from company 


