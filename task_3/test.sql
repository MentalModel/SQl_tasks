USE [Mental.Model]





IF OBJECT_ID('dbo.Test', 'U') IS NOT NULL
  DROP TABLE dbo.Test
GO

CREATE TABLE dbo.Test
(
	ID_Test INT NOT NULL
)
GO

INSERT INTO [dbo].[Test]([ID_Test])
     VALUES
			(1),
			(2),
			(3),
			(4),
			(5),
			(6),
			(7),
			(8),
			(9),
			(10)
GO



DECLARE @MyCounter int;
SET @MyCounter = -1;
--declare @table table;

while (@MyCounter < 1)
begin
	Set @MyCounter = @MyCounter + 1
	select r.ID_Test from dbo.Test r
	JOIN
	(select Attitude from dbo.CrossCourses, dbo.Vallet as p
		where ID_ToSell = p.ID_Currency and ID_ToBuy = @MyCounter) as t2
	ON r.ID_Test = t2.ID_ToSell
end


DECLARE @MyCounter int;
SET @MyCounter = -1;
--declare @table table;

while (@MyCounter < 1)
begin
	Set @MyCounter = @MyCounter + 1
	select Attitude from dbo.CrossCourses as q, dbo.Vallet as p 
	--	where ID_ToSell = p.ID_Currency and ID_ToBuy = @MyCounter group by Attitude)
		inner join
		dbo.Test
	ON ID_Test = q.ID_ToBuy
end


DECLARE @MyCounter int;
SET @MyCounter = 1;
select Attitude from dbo.CrossCourses, dbo.Vallet as p
where ID_ToSell = p.ID_Currency and ID_ToBuy = @MyCounter
GO

SELECT ask_name as 'Name',      ISNULL([AUD], 1) as 'AUD',
        ISNULL([CAD], 1) as 'CAD',      ISNULL([CHF], 1) as 'CHF',      ISNULL([DKK], 1) as 'DKK',
        ISNULL([EUR], 1) as 'EUR',      ISNULL([GBP], 1) as 'GBP',      ISNULL([JPY], 1) as 'JPY',
        ISNULL([NZD], 1) as 'NZD',      ISNULL([SEK], 1) as 'SEK',      ISNULL([USD], 1) as 'USD'
FROM
        (SELECT DISTINCT cn_ask.CurrencyName as [ask_name], cn_bid.CurrencyName as [bid_name], Attitude FROM
                (SELECT ID_ToSell, ID_ToBuy, Attitude FROM dbo.CrossCourses) as er
                JOIN dbo.FullNamesOfCurrency as cn_ask
                ON cn_ask.ID_Currency = er.ID_ToSell
                JOIN dbo.FullNamesOfCurrency as cn_bid
                ON cn_bid.ID_Currency = er.ID_ToBuy) as cross_rates
        PIVOT (
                AVG(Attitude)
                FOR bid_name IN ([AUD], [CAD], [CHF], [DKK], [EUR], [GBP], [JPY], [NZD], [SEK], [USD])
        ) as pvt