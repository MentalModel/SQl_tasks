USE [MentalModel]
GO

IF OBJECT_ID('dbo.Types_of_Measures', 'U') IS NOT NULL
  DROP TABLE dbo.Types_of_Measures
GO

CREATE TABLE dbo.Types_of_Measures
(
	���_���� VARCHAR(50) NOT NULL,
	ID_���� INT NOT NULL,
    CONSTRAINT PK_Types_of_Measure PRIMARY KEY (ID_����)
)
GO

INSERT INTO [dbo].[Types_of_Measures]
           ([���_����]
           ,[ID_����])
     VALUES
		('���������', 1),
		('�����������', 2),
		('��������', 3);
GO

ALTER TABLE dbo.Types_of_Measures 
	ADD ID_������_��� INT NULL 
GO

ALTER TABLE dbo.Types_of_Measures 
	ADD CONSTRAINT FK_FullNameTypeID FOREIGN KEY ("ID_������_���")
	REFERENCES dbo.Full_Names_of_Measures ("ID_����")
GO