USE [MentalModel]
GO

IF OBJECT_ID('dbo.Stations', 'U') IS NOT NULL
  DROP TABLE dbo.Stations
GO

CREATE TABLE dbo.Stations
(
	���_������� VARCHAR(50) NOT NULL,
	ID_������� INT NOT NULL,
    CONSTRAINT PK_Stations PRIMARY KEY (ID_�������)
)
GO

INSERT INTO [dbo].[Stations]
			([���_�������], [ID_�������])
     VALUES
           ('����������', 1),
		   ('��������������', 2),
		   ('����������', 3),
		   ('������������', 4),
		   ('�����������', 5);
GO

ALTER TABLE dbo.Stations
	ADD ����� VARCHAR(50) NULL CONSTRAINT AddAddressDflt
	DEFAULT '������, �.' WITH VALUES ;
GO