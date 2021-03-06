USE [MentalModel]

IF OBJECT_ID('dbo.RegionNames', 'U') IS NOT NULL
  DROP TABLE dbo.RegionNames
GO

CREATE TABLE dbo.RegionNames
(
	FullNameOfRegion VARCHAR(100) NOT NULL,
	CodeOfRegion VARCHAR(3) NOT NULL,
	CONSTRAINT CheckCodeOfRegion CHECK	(CodeOfRegion like	'0[1-9]' 
										or	CodeOfRegion like '[1-9][0-9]'
										or	CodeOfRegion like '[127][0-9][0-9]'),
    CONSTRAINT PK_RegionNames PRIMARY KEY (CodeOfRegion)
)
GO

INSERT INTO [dbo].[RegionNames]([CodeOfRegion],[FullNameOfRegion])
	VALUES
		('01', '���������� ������'),
		('02', '���������� ������������'),
		('102', '���������� ������������'),
		('03', '���������� �������'),
		('04', '���������� �����'),
		('05', '���������� ��������'),
		('06', '���������� ���������'),
		('07', '���������-���������� ����������'),
		('08', '���������� ��������'),
		('09', '���������� ���������-���������'),
		('10', '���������� �������'),
		('11', '���������� ����'),
		('12', '���������� ����� ��'),
		('13', '���������� ��������'),
		('113', '���������� ��������'),
		('14', '���������� ���� (������)'),
		('15', '���������� �������� ������ � ������'),
		('16', '���������� ���������'),
		('116', '���������� ���������'),
		('17', '���������� ����'),
		('18', '���������� ����������'),
		('19', '���������� �������'),
		('21', '��������� ����������'),
		('121', '��������� ����������'),
		('22', '��������� ����'),
		('23', '������������� ����'),
		('93', '������������� ����'),
		('123', '������������� ����'),
		('24', '������������ ����'),
		('84', '������������ ����'),
		('88', '������������ ����'),
		('124', '������������ ����'),
		('25', '���������� ����'),
		('125', '���������� ����'),
		('26', '�������������� ����'),
		('27', '����������� ����'),
		('28', '�������� �������'),
		('29', '������������� �������'),
		('30', '������������ �������'),
		('31', '������������ �������'),
		('32', '�������� �������'),
		('33', '������������ �������'),
		('34', '������������� �������'),
		('134', '������������� �������'),
		('35', '����������� �������'),
		('36', '����������� �������'),
		('37', '���������� �������'),
		('38', '��������� �������'),
		('85', '��������� �������'),
		('39', '��������������� �������'),
		('91', '��������������� �������'),
		('40', '��������� �������'),
		('41', '���������� ����'),
		('42', '����������� �������'),
		('43', '��������� �������'),
		('44', '����������� �������'),
		('45', '���������� �������'),
		('46', '������� �������'),
		('47', '������������� �������'),
		('48', '�������� �������'),
		('49', '����������� �������'),
		('50', '���������� �������'),
		('90', '���������� �������'),
		('150', '���������� �������'),
		('190', '���������� �������'),
		('51', '���������� �������'),
		('52', '������������� �������'),
		('152', '������������� �������'),
		('53', '������������ �������'),
		('54', '������������� �������'),
		('55', '������ �������'),
		('56', '������������ �������'),
		('57', '��������� �������'),
		('58', '���������� �������'),
		('59', '�������� ����'),
		('81', '�������� ����'),
		('159', '�������� ����'),
		('60', '��������� �������'),
		('61', '���������� �������'),
		('161', '���������� �������'),
		('62', '��������� �������'),
		('63', '��������� �������'),
		('163', '��������� �������'),
		('64', '����������� �������'),
		('164', '����������� �������'),
		('65', '����������� �������'),
		('66', '������������ �������'),
		('96', '������������ �������'),
		('196', '������������ �������'),
		('67', '���������� �������'),
		('68', '���������� �������'),
		('69', '�������� �������'),
		('70', '������� �������'),
		('71', '�������� �������'),
		('72', '��������� �������'),
		('73', '����������� �������'),
		('173', '����������� �������'),
		('74', '����������� �������'),
		('174', '����������� �������'),
		('75', '������������� ����'),
		('80', '������������� ����'),
		('76', '����������� �������'),
		('77', '�. ������'),
		('97', '�. ������'),
		('99', '�. ������'),
		('177', '�. ������'),
		('197', '�. ������'),
		('199', '�. ������'),
		('777', '�. ������'),
		('78', '�. �����-���������'),
		('98', '�. �����-���������'),
		('178', '�. �����-���������'),
		('79', '��������� ���������� �������'),
		('82', '���������� ����'),
		('83', '�������� ���������� �����'),
		('86', '�����-���������� ���������� ����� � ����'),
		('186', '�����-���������� ���������� ����� � ����'),
		('87', '��������� ���������� �����'),
		('89', '�����-�������� ���������� �����'),
		('92', '�. �����������'),
		('94', '����������, ����������� �� ��������� �� � ������������� ������������� �������� �������� ��� ������'),
		('95', '��������� ����������')
GO

SELECT TOP 1000 [FullNameOfRegion]
      ,[CodeOfRegion]
  FROM [MentalModel].[dbo].[RegionNames]