USE [MentalModel]
GO

IF OBJECT_ID('dbo.Full_Names_of_Measures', 'U') IS NOT NULL
  DROP TABLE dbo.Full_Names_of_Measures
GO

CREATE TABLE dbo.Full_Names_of_Measures
(
	Полное_Наименование VARCHAR(50) NOT NULL,
	Обозначение VARCHAR(50) NOT NULL,
	ID_типа INT NOT NULL,
    CONSTRAINT PK_Full_Names_of_Measures PRIMARY KEY (ID_типа)
)
GO

INSERT INTO [dbo].[Full_Names_of_Measures]
           ([Полное_Наименование], [Обозначение], [ID_типа])
     VALUES
		('Влажность воздуха', '%', 1),
		('Температура воздуха', 'C', 2),
		('Атмосферное давление', 'Па', 3);
GO