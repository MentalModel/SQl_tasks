USE [Mental.Model]

IF OBJECT_ID('dbo.Vallet', 'U') IS NOT NULL
  DROP TABLE dbo.Vallet
GO

CREATE TABLE dbo.Vallet
(
	ID_Currency INT NOT NULL,
	CurrencyQuantity FLOAT NOT NULL,
	CONSTRAINT FK_Vallet FOREIGN KEY (ID_Currency)
	REFERENCES dbo.FullNamesOfCurrency (ID_Currency)
)
GO

INSERT INTO [dbo].[Vallet]([ID_Currency], [CurrencyQuantity])
     VALUES
			(1, 2),
			(2, 4.24),
			(3, 122.5),
			(4, 13.66),
			(5, 550),
			(6, 1.25),
			(7, 24),
			(8, 37),
			(9, 82),
			(10, 21.4)
GO

SELECT TOP 1000 [ID_Currency]
      ,[CurrencyQuantity]
  FROM [Mental.Model].[dbo].[Vallet]
GO


DECLARE @SUMMA INT;

DECLARE @TEMP INT;
SET @SUMMA = 0;

--PRINT @SUMMA
DECLARE @MyCounter int;

-- Initialize the variable.
SET @MyCounter = 0;

DECLARE @Model INT
SET @Model = 1;
select SUM(CurrencyQuantity * Attitude) from dbo.Vallet as t, dbo.CrossCourses as p
where t.ID_Currency in
(select t.ID_Currency from dbo.Vallet
	where p.Attitude IN
	(select p.Attitude from dbo.CrossCourses
	where t.ID_Currency = p.ID_ToSell and p.ID_ToBuy =  @Model) )
GO

(select t.CurrencyQuantity,t.ID_Currency, p.ID_ToSell,p.ID_ToBuy, p.Attitude 
	from dbo.Vallet t
	INNER JOIN
	dbo.CrossCourses p
	ON t.ID_Currency = p.ID_ToSell and p.ID_ToBuy = 2) 
GO

create function dbo.convertMoneyFromPocket(@NewCurrency char(3)) returns FLOAT
	as
	begin
		
		declare @new_exc int = (select ID_Currency from dbo.FullNamesOfCurrency where CurrencyName = @NewCurrency)

		if @new_exc is null
		begin
			return cast('This currency does not exist.' as int);
		end
			
		declare @ret float = (select sum(CurrencyQuantity * Attitude) from dbo.Vallet as t, dbo.CrossCourses as p
								where t.ID_Currency in
									(select t.ID_Currency from dbo.Vallet
										where p.Attitude IN
										(select p.Attitude from dbo.CrossCourses
										where t.ID_Currency = p.ID_ToSell and p.ID_ToBuy =  @new_exc)
							)

							)
		return @ret;
	end;


drop function dbo.convertMoneyFromPocket

select dbo.convertMoneyFromPocket('USD') as Total;