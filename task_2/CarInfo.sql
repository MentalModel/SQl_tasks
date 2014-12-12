USE [Alexander Dobrunov]

IF OBJECT_ID('dbo.CarInformation', 'U') IS NOT NULL
  DROP TABLE dbo.CarInformation
GO

CREATE TABLE dbo.CarInformation
(
	Model VARCHAR(50) NOT NULL,
	Colour VARCHAR(20) NOT NULL,
	IDDriver INT NOT NULL, 
	CONSTRAINT PK_CarInformation PRIMARY KEY (IDDriver)
)
GO

INSERT INTO [dbo].[CarInformation]([Model], [Colour], [IDDriver])
     VALUES
			('Acura', 'Red', 1),
			('Cadillac', 'Grey', 2),
			('Ferrari', 'Black', 3),
			('Jaguar', 'Yellow', 4),

			('Lamborgini', 'White', 5),
			('Fiat', 'Green', 6),

			('Honda', 'Magenta', 7),
			('Land Rover', 'Black', 8),
			('Ford', 'Orange', 9),
			('BMW', 'Yellow', 10),
			('Kia', 'Blue', 11),
			('Lexus', 'Brown', 12),
			('Daewoo', 'Red', 13),
			('BMW', 'Grey', 14),
			('Chery', 'Black', 15),
			('Bentley', 'Yellow', 16),
			('Luxgen', 'White', 17),
			('Infinity', 'Green', 18),
			('Jaguar', 'White', 19),
			('Mazda', 'Green', 20);
GO

SELECT TOP 1000 [Model]
      ,[Colour]
      ,[IDDriver]
  FROM [Alexander Dobrunov].[dbo].[CarInformation]