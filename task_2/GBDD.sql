USE [Alexander Dobrunov]

IF OBJECT_ID('dbo.GBDDInfo', 'U') IS NOT NULL
  DROP TABLE dbo.GBDDInfo
GO

CREATE TABLE dbo.GBDDInfo
(
	ID_GBDD	INT NOT NULL,  
	RegionCode VARCHAR(15) NOT NULL,
	CONSTRAINT Check_RegionCode CHECK (	   RegionCode like	'0[1-9]'
										or RegionCode like	'[1-9][0-9]'
										or RegionCode like	'[127][0-9][0-9]'),
	CONSTRAINT PK_GBDDInfo PRIMARY KEY (ID_GBDD)
)
GO

INSERT INTO [dbo].[GBDDInfo]([ID_GBDD], [RegionCode])
     VALUES
		(1, '196'),
		(2, '96'),
		(3, '96'),
		(4, '66'),
		(5, '196')
GO

SELECT TOP 1000 [ID_GBDD]
      ,[RegionCode]
  FROM [Alexander Dobrunov].[dbo].[GBDDInfo]