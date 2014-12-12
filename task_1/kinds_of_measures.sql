USE [MentalModel]
GO

IF OBJECT_ID('dbo.Types_of_Measures', 'U') IS NOT NULL
  DROP TABLE dbo.Types_of_Measures
GO

CREATE TABLE dbo.Types_of_Measures
(
	Имя_типа VARCHAR(50) NOT NULL,
	ID_типа INT NOT NULL,
    CONSTRAINT PK_Types_of_Measure PRIMARY KEY (ID_типа)
)
GO

INSERT INTO [dbo].[Types_of_Measures]
           ([Имя_типа]
           ,[ID_типа])
     VALUES
		('Влажность', 1),
		('Температура', 2),
		('Давление', 3);
GO

ALTER TABLE dbo.Types_of_Measures 
	ADD ID_полное_имя INT NULL 
GO

ALTER TABLE dbo.Types_of_Measures 
	ADD CONSTRAINT FK_FullNameTypeID FOREIGN KEY ("ID_полное_имя")
	REFERENCES dbo.Full_Names_of_Measures ("ID_типа")
GO