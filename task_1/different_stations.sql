USE [MentalModel]
GO

IF OBJECT_ID('dbo.Stations', 'U') IS NOT NULL
  DROP TABLE dbo.Stations
GO

CREATE TABLE dbo.Stations
(
	Имя_станции VARCHAR(50) NOT NULL,
	ID_станции INT NOT NULL,
    CONSTRAINT PK_Stations PRIMARY KEY (ID_станции)
)
GO

INSERT INTO [dbo].[Stations]
			([Имя_станции], [ID_станции])
     VALUES
           ('Московская', 1),
		   ('Первоуральская', 2),
		   ('Ревдинская', 3),
		   ('Волгорадская', 4),
		   ('Хабаровская', 5);
GO

ALTER TABLE dbo.Stations
	ADD Адрес VARCHAR(50) NULL CONSTRAINT AddAddressDflt
	DEFAULT 'Россия, г.' WITH VALUES ;
GO