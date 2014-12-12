USE [Alexander Dobrunov]

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
			(1, '������', 'H633EP77'),
			(2, '��������', 'B253OO35'),
			(3, '�����������', 'X999XX12'),
			(4, '������', 'E836TH03'),


			(5, '��������', 'Y984XC96'),
			(6, '��������', 'B123XP96'),
			(7, '�������', 'M555MM66'),
			(8, '����������', 'E783BB66'),
			(9, '�������', 'T612AB66'),
			(10, '������', 'A111CA196'),
			(11, '���������', 'O432OT196'),


			(12, '��������', 'X232OX96'),
			(13, '����������', 'T444OP96'),
			(14, '������', 'E686EY196'),
			(15, '������', 'E555CC196'),
			(16, '��������', 'P343PP196'),
			(17, '���������', 'M094EX96'),

			(18, '���������', 'B222PA96'),
			(19, '���', 'X999EP66'),
			(20, '����������', 'H194PE196')
GO

SELECT TOP 1000 [LastName]
      ,[GovernmentNumber]
      ,[IDDriver]
  FROM [Alexander Dobrunov].[dbo].[DriverInformation]
  ORDER BY [IDDriver]

  SELECT GovernmentNumber from [dbo].[DriverInformation]
  WHERE SUBSTRING(GovernmentNumber, 7, 2) = '66' or SUBSTRING(GovernmentNumber, 7, 3) = '123'