USE [MentalModel]

IF OBJECT_ID('dbo.DriverInformation', 'U') IS NOT NULL
  DROP TABLE dbo.DriverInformation
GO

CREATE TABLE dbo.DriverInformation
(
	LastName VARCHAR(50) NOT NULL,
	GovernmentNumber VARCHAR(9) NOT NULL,
	CONSTRAINT Check_GovernmentNumber CHECK (GovernmentNumber like	'[ABCEHKMOPTXY][0-9][0-9][0-9][ABCEHKMOPTXY][ABCEHKMOPTXY]0[1-9]'
									or GovernmentNumber like	'[ABCEHKMOPTXY][0-9][0-9][0-9][ABCEHKMOPTXY][ABCEHKMOPTXY][1-9][0-9]'
									or GovernmentNumber like	'[ABCEHKMOPTXY][0-9][0-9][0-9][ABCEHKMOPTXY][ABCEHKMOPTXY][127][0-9][0-9]'),
	IDDriver INT NOT NULL,
	CONSTRAINT PK_DriverInformation PRIMARY KEY (IDDriver)
)
GO

INSERT INTO [dbo].[DriverInformation]([IDDriver], [LastName], [GovernmentNumber])
     VALUES
			(1, 'Иванов', 'H633EP77'),
			(2, 'Медведев', 'B253OO35'),
			(3, 'Жириновский', 'X999XX12'),
			(4, 'Злобин', 'E836TH03'),


			(5, 'Соловьев', 'Y984XC96'),
			(6, 'Вахрушев', 'B123XP96'),
			(7, 'Пьянзин', 'M555MM66'),
			(8, 'Солодушкин', 'E783BB66'),
			(9, 'Крутова', 'T612AB66'),
			(10, 'Асанов', 'A111CA196'),
			(11, 'Загидулин', 'O432OT196'),


			(12, 'Клепинин', 'X232OX96'),
			(13, 'Окуловский', 'T444OP96'),
			(14, 'Кумков', 'E686EY196'),
			(15, 'Лахтин', 'E555CC196'),
			(16, 'Шамбуева', 'P343PP196'),
			(17, 'Коврижных', 'M094EX96'),

			(18, 'Баранский', 'B222PA96'),
			(19, 'Шур', 'X999EP66'),
			(20, 'Красовская', 'H194PE196')
GO

SELECT TOP 1000 [LastName]
      ,[GovernmentNumber]
      ,[IDDriver]
  FROM [MentalModel].[dbo].[DriverInformation]
  ORDER BY [IDDriver]

  SELECT GovernmentNumber from [dbo].[DriverInformation]
  WHERE SUBSTRING(GovernmentNumber, 7, 2) = '66' or SUBSTRING(GovernmentNumber, 7, 3) = '123'