USE [MentalModel];
GO

-- ������ ������������� ������ ���, � ������� ����������� ��������� (��� ����������).
SELECT DISTINCT ���� FROM dbo.Info_Measures
	ORDER BY ���� ASC;
GO

--������ ������������ � ����������� �������� ��������� ���������.
SELECT [ID_���], MIN(��������) AS "����������� ��������", MAX(��������) AS "������������ ��������"
	FROM dbo.Info_Measures
	GROUP BY ID_���;
GO

--�������� ������ � ����������� ��� ��������� ������, ������� ���������� � ��������.
-- ������� ����� ���
SELECT �������� AS �������
	FROM dbo.Info_Measures AS im
	WHERE EXISTS
		(SELECT ���_���� FROM dbo.Types_of_Measures AS tm
		 WHERE im.ID_��� = tm.ID_���� AND tm.ID_���� = 2);
GO

-- ������� ����� ���
SELECT �������� AS �������
	FROM dbo.Info_Measures
	WHERE ID_��� IN
		(SELECT ID_���
			FROM dbo.Types_of_Measures
			WHERE ID_��� = ID_���� AND ID_���� = 2);
GO

-- ������� ����� ���
SELECT �������� AS �������, ������_������������ AS ��������, ����������� 
	FROM dbo.Info_Measures AS IM, dbo.Full_Names_of_Measures AS FM
	WHERE ID_��� IN
		(SELECT ID_���
			FROM dbo.Types_of_Measures AS TM
			WHERE IM.ID_��� = TM.ID_���� AND FM.ID_���� = 2 AND TM.ID_���� = 2);
GO

select �������� AS �������
	from dbo.Info_Measures as IM
	where ID_��� IN (
			select ID_����
			from dbo.Types_of_Measures as TM
			where ID_���� in (
				SELECT ID_����
				  FROM dbo.Full_Names_of_Measures as FM
				  where ������_������������ = '����������� �������'
			)
		)
GO

--------------------------------------------------------------------------------


---�������� ������� SELECT, ������������ ��������� ���������� � ����������� ����� ���, 
---� ������� ���� ����������� �������� ���������.
SELECT [����] AS "���� ���������", ��������
	FROM dbo.Info_Measures AS T1,
		(SELECT ID_���, MIN(��������) AS �������
			FROM dbo.Info_Measures AS T2
			GROUP BY T2.ID_���) T3
			WHERE T1.ID_��� = T3.ID_��� AND T1.�������� = �������
			ORDER BY [����];
GO

--������ ������� �������� ������ ����� ��������� ( c ��������� ���������) 
--�� ������������ ���� �� ������ �������. 
--��������� ����� �������� ������ ������ ���� �� ������� �����, ���� � ���� dd.month.yy(yyyy). 
SELECT FORMAT(����, 'dd/MM/yyyy', 'ru-RU' ) AS "���� ���������", 
		AVG(��������) AS "������� ��������", ���_������� AS "��� �������", 
		ID_��� AS "��� ���������", ����������� AS "������� ���������"
	FROM dbo.Info_Measures IM inner join
		 dbo.Types_of_Measures TM on IM.ID_��� = TM.ID_���� inner join
		 dbo.Full_Names_of_Measures FM on TM.ID_������_��� = FM.ID_���� inner join
		 dbo.Stations S on S.ID_������� = IM.ID_��
	group by ����, ��������, ���_�������, ID_���, �����������
GO