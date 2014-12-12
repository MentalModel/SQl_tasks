USE [Mental.Model]

IF OBJECT_ID('dbo.FullNamesOfCurrency', 'U') IS NOT NULL
  DROP TABLE dbo.FullNamesOfCurrency
GO

CREATE TABLE dbo.FullNamesOfCurrency
(
	ID_Currency INT NOT NULL,
	CurrencyName CHAR(10) NOT NULL,
	CONSTRAINT PK_FullNamesOfCurrency PRIMARY KEY (ID_Currency)
)
GO

INSERT INTO [dbo].[FullNamesOfCurrency]([ID_Currency], [CurrencyName])
     VALUES
			(1, 'USD'),
			(2, 'GBP'),
			(3, 'JPY'),
			(4, 'CHF'),
			(5, 'CAD'),
			(6, 'DKK'),
			(7, 'SEK'),
			(8, 'EUR'),
			(9, 'AUD'),
			(10, 'NZD')
GO

SELECT TOP 1000 [ID_Currency]
      ,[CurrencyName]
  FROM [Mental.Model].[dbo].[FullNamesOfCurrency]