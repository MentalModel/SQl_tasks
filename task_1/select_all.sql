USE [MentalModel];
GO

-- Выдать упорядоченный список дат, в которые проводились измерения (без повторений).
SELECT DISTINCT Дата FROM dbo.Info_Measures
	ORDER BY Дата ASC;
GO

--Выдать максимальное и минимальное значение различных измерений.
SELECT [ID_тип], MIN(Значение) AS "Минимальное значение", MAX(Значение) AS "Максимальное значение"
	FROM dbo.Info_Measures
	GROUP BY ID_тип;
GO

--Напишите запрос с подзапросом для получения данных, которые измеряются в градусах.
-- Вариант номер РАЗ
SELECT Значение AS Градусы
	FROM dbo.Info_Measures AS im
	WHERE EXISTS
		(SELECT Имя_типа FROM dbo.Types_of_Measures AS tm
		 WHERE im.ID_тип = tm.ID_типа AND tm.ID_типа = 2);
GO

-- Вариант номер ДВА
SELECT Значение AS Градусы
	FROM dbo.Info_Measures
	WHERE ID_тип IN
		(SELECT ID_тип
			FROM dbo.Types_of_Measures
			WHERE ID_тип = ID_типа AND ID_типа = 2);
GO

-- Вариант номер ТРИ
SELECT Значение AS Градусы, Полное_Наименование AS Название, Обозначение 
	FROM dbo.Info_Measures AS IM, dbo.Full_Names_of_Measures AS FM
	WHERE ID_тип IN
		(SELECT ID_тип
			FROM dbo.Types_of_Measures AS TM
			WHERE IM.ID_тип = TM.ID_типа AND FM.ID_типа = 2 AND TM.ID_типа = 2);
GO

select Значение AS Градусы
	from dbo.Info_Measures as IM
	where ID_тип IN (
			select ID_типа
			from dbo.Types_of_Measures as TM
			where ID_типа in (
				SELECT ID_типа
				  FROM dbo.Full_Names_of_Measures as FM
				  where Полное_Наименование = 'Температура воздуха'
			)
		)
GO

--------------------------------------------------------------------------------


---Напишите команду SELECT, использующую связанные подзапросы и выполняющую вывод дат, 
---в которые были минимальное значение измерений.
SELECT [Дата] AS "Дата измерения", Значение
	FROM dbo.Info_Measures AS T1,
		(SELECT ID_тип, MIN(Значение) AS Минимум
			FROM dbo.Info_Measures AS T2
			GROUP BY T2.ID_тип) T3
			WHERE T1.ID_тип = T3.ID_тип AND T1.Значение = Минимум
			ORDER BY [Дата];
GO

--Выдать средние значения разных типов измерений ( c единицами измерений) 
--на определенную дату по каждой станции. 
--Заголовки полей итоговых таблиц должны быть на русском языке, даты в виде dd.month.yy(yyyy). 
SELECT FORMAT(Дата, 'dd/MM/yyyy', 'ru-RU' ) AS "Дата измерения", 
		AVG(Значение) AS "Средние значения", Имя_станции AS "Имя станции", 
		ID_тип AS "Тип измерения", Обозначение AS "Единицы измерения"
	FROM dbo.Info_Measures IM inner join
		 dbo.Types_of_Measures TM on IM.ID_тип = TM.ID_типа inner join
		 dbo.Full_Names_of_Measures FM on TM.ID_полное_имя = FM.ID_типа inner join
		 dbo.Stations S on S.ID_станции = IM.ID_ст
	group by Дата, Значение, Имя_станции, ID_тип, Обозначение
GO