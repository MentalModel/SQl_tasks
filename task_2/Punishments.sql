USE [MentalModel]

IF OBJECT_ID('dbo.Punishment', 'U') IS NOT NULL
  DROP TABLE dbo.Punishment
GO

CREATE TABLE dbo.Punishment
(
	
	IDDriver INT NOT NULL, 
	CONSTRAINT PK_IDDriver PRIMARY KEY (IDDriver), 
	
	Fine VARCHAR(50) NOT NULL,
	SumOFFine INT NOT NULL, 
	HaveBeenPayed VARCHAR(50) NOT NULL,
	CONSTRAINT Check_HaveBeenPayed CHECK (HaveBeenPayed LIKE	'Payed' OR
										  HaveBeenPayed LIKE	'Not Payed')
)
GO

INSERT INTO [dbo].[Punishment]([IDDriver], [Fine], [SumOFFine], [HaveBeenPayed])
     VALUES
			(1, 'Вождение в нетрезвом виде', 5000, 'Not Payed'),
			(2, 'Грязные номера', 500, 'Payed'),
			(3, 'Сбил прохожего', 50, 'Not Payed'),
			(4, 'Врезался в фонарный столб', 10000, 'Payed')
GO

SELECT TOP 1000 [IDDriver]
      ,[Fine]
      ,[SumOFFine]
      ,[HaveBeenPayed]
  FROM [MentalModel].[dbo].[Punishment]