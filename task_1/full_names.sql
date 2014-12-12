USE [MentalModel]
GO

IF OBJECT_ID('dbo.Full_Names_of_Measures', 'U') IS NOT NULL
  DROP TABLE dbo.Full_Names_of_Measures
GO

CREATE TABLE dbo.Full_Names_of_Measures
(
	������_������������ VARCHAR(50) NOT NULL,
	����������� VARCHAR(50) NOT NULL,
	ID_���� INT NOT NULL,
    CONSTRAINT PK_Full_Names_of_Measures PRIMARY KEY (ID_����)
)
GO

INSERT INTO [dbo].[Full_Names_of_Measures]
           ([������_������������], [�����������], [ID_����])
     VALUES
		('��������� �������', '%', 1),
		('����������� �������', 'C', 2),
		('����������� ��������', '��', 3);
GO