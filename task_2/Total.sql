USE [Alexander Dobrunov]

/*----------------------------------FULL TOTAL TABLE------------------------------------------- */
SELECT	u.DriverID, q.LastName, q.GovernmentNumber, c.Model, c.Colour, u.DepartureTimeIN, 
		u.IDGBDD_IN, d.DriverID, d.DepartureTimeOUT, d.IDGBDD_OUT, t.FullNameOfRegion, t.CodeOfRegion, n.Fine, n.SumOFFine, n.HaveBeenPayed from
	dbo.ComeIN u
		FULL OUTER JOIN
	dbo.ComeOUT d
		ON u.DriverID = d.DriverID
		FULL OUTER JOIN
	dbo.DriverInformation q
		ON d.DriverID = q.IDDriver or u.DriverID = q.IDDriver
		FULL OUTER JOIN
	dbo.CarInformation c
		ON  d.DriverID = c.IDDriver or u.DriverID = c.IDDriver
		INNER JOIN
	dbo.RegionNames t
		ON t.CodeOfRegion = SUBSTRING(q.GovernmentNumber, 7, 3)
		FULL OUTER JOIN
	dbo.Punishment n
		ON n.IDDriver = u.DriverID or n.IDDriver = d.DriverID 
	order by u.DriverID
GO

/* Transite Cars     post1 ---> post2    diff region */
SELECT DISTINCT i.DriverID, o.DriverID, i.IDGBDD_IN, o.IDGBDD_OUT, SUBSTRING(t.GovernmentNumber, 7, 3), q.RegionCode, 
				f.FullNameOfRegion, a.FullNameOfRegion FROM 
	dbo.ComeIN i
	INNER JOIN
	dbo.ComeOUT o
	ON i.DriverID = o.DriverID and i.IDGBDD_IN != o.IDGBDD_OUT and i.DepartureTimeIN <= o.DepartureTimeOUT
	INNER JOIN
	dbo.GBDDInfo q
	ON q.ID_GBDD = i.IDGBDD_IN
	INNER JOIN 
	dbo.DriverInformation t
		ON t.IDDriver = i.DriverID
	INNER JOIN
	dbo.RegionNames f
		ON q.RegionCode = f.CodeOfRegion
	INNER JOIN
	dbo.RegionNames a
		ON  SUBSTRING(t.GovernmentNumber, 7, 3) = a.CodeOfRegion where f.FullNameOfRegion != a.FullNameOfRegion
GO

/* Number of Transite Cars */
select count(DriverID) from dbo.ComeIN as i
where DriverID in 
	(select DriverID from dbo.ComeOUT as o
		INNER JOIN
		dbo.GBDDInfo q
		ON q.ID_GBDD = i.IDGBDD_IN
		INNER JOIN 
		dbo.DriverInformation t
		ON t.IDDriver = i.DriverID
		INNER JOIN
		dbo.RegionNames f
		ON q.RegionCode = f.CodeOfRegion
		INNER JOIN
		dbo.RegionNames a
		ON  SUBSTRING(t.GovernmentNumber, 7, 3) = a.CodeOfRegion where f.FullNameOfRegion != a.FullNameOfRegion
		and  i.IDGBDD_IN != o.IDGBDD_OUT and i.DepartureTimeIN <= o.DepartureTimeOUT)
GO
/*--------------------------------------------------------------------------------------*/


/* Foreign Cars     post1 ---> post1   similar region */
SELECT DISTINCT i.DriverID, o.DriverID, i.IDGBDD_IN, o.IDGBDD_OUT, SUBSTRING(t.GovernmentNumber, 7, 3), q.RegionCode, 
				f.FullNameOfRegion, a.FullNameOfRegion FROM 
	dbo.ComeIN i
	INNER JOIN
	dbo.ComeOUT o
	ON i.DriverID = o.DriverID and i.IDGBDD_IN = o.IDGBDD_OUT and i.DepartureTimeIN <= o.DepartureTimeOUT
	INNER JOIN
	dbo.GBDDInfo q
	ON q.ID_GBDD = i.IDGBDD_IN
	INNER JOIN 
	dbo.DriverInformation t
		ON t.IDDriver = i.DriverID
	INNER JOIN
	dbo.RegionNames f
		ON q.RegionCode = f.CodeOfRegion
	INNER JOIN
	dbo.RegionNames a
		ON  SUBSTRING(t.GovernmentNumber, 7, 3) = a.CodeOfRegion where f.FullNameOfRegion = a.FullNameOfRegion
GO

/* Number of Foreign Cars */
select count(DriverID) from dbo.ComeIN as i
where DriverID in 
	(select DriverID from dbo.ComeOUT as o
		INNER JOIN
		dbo.GBDDInfo q
		ON q.ID_GBDD = i.IDGBDD_IN
		INNER JOIN 
		dbo.DriverInformation t
		ON t.IDDriver = i.DriverID
		INNER JOIN
		dbo.RegionNames f
		ON q.RegionCode = f.CodeOfRegion
		INNER JOIN
		dbo.RegionNames a
		ON  SUBSTRING(t.GovernmentNumber, 7, 3) = a.CodeOfRegion where f.FullNameOfRegion = a.FullNameOfRegion
		and  i.IDGBDD_IN = o.IDGBDD_OUT and i.DepartureTimeIN <= o.DepartureTimeOUT)
GO


/* Hometown Cars     post1 ---> post2 or post1 ---> post1    similar region */
SELECT DISTINCT i.DriverID, o.DriverID, i.IDGBDD_IN, o.IDGBDD_OUT, SUBSTRING(t.GovernmentNumber, 7, 3), q.RegionCode, 
				f.FullNameOfRegion, a.FullNameOfRegion FROM 
	dbo.ComeIN i
	INNER JOIN
	dbo.ComeOUT o
	ON i.DriverID = o.DriverID  and i.DepartureTimeIN >= o.DepartureTimeOUT
	INNER JOIN
	dbo.GBDDInfo q
	ON q.ID_GBDD = i.IDGBDD_IN
	INNER JOIN 
	dbo.DriverInformation t
		ON t.IDDriver = i.DriverID
	INNER JOIN
	dbo.RegionNames f
		ON q.RegionCode = f.CodeOfRegion
	INNER JOIN
	dbo.RegionNames a
		ON  SUBSTRING(t.GovernmentNumber, 7, 3) = a.CodeOfRegion where f.FullNameOfRegion = a.FullNameOfRegion
GO

/* Number of Hometown Cars */
select count(DriverID) from dbo.ComeIN as i
where DriverID in 
	(select DriverID from dbo.ComeOUT as o
		INNER JOIN
		dbo.GBDDInfo q
		ON q.ID_GBDD = i.IDGBDD_IN
		INNER JOIN 
		dbo.DriverInformation t
		ON t.IDDriver = i.DriverID
		INNER JOIN
		dbo.RegionNames f
		ON q.RegionCode = f.CodeOfRegion
		INNER JOIN
		dbo.RegionNames a
		ON  SUBSTRING(t.GovernmentNumber, 7, 3) = a.CodeOfRegion where f.FullNameOfRegion = a.FullNameOfRegion
		 and i.DepartureTimeIN >= o.DepartureTimeOUT)
GO

SELECT Model AS "Модель автомобиля", Colour AS 'Цвет', COUNT(Colour) AS 'Количество автомобилей, чей цвет начинается с "B"' FROM dbo.CarInformation
WHERE SUBSTRING(Colour, 1, 1) = 'B'
GROUP BY Model, Colour
GO

SELECT Model AS "Модель автомобиля", COUNT(Model) AS 'Количество автомобилей данной марки' FROM dbo.CarInformation
GROUP BY Model
ORDER BY 'Количество автомобилей данной марки'
GO

SELECT Model AS "Модель автомобиля", COUNT(Model) AS 'Количество автомобилей' FROM dbo.CarInformation AS t1
GROUP BY Model
HAVING COUNT(Model) >= 2
GO

--  Автомобили Свердловской области 
SELECT Model, Colour, di.GovernmentNumber
	FROM dbo.CarInformation AS ci
	JOIN dbo.DriverInformation AS di
	ON ci.IDDriver = di.IDDriver where exists (SELECT FullNameOfRegion FROM  dbo.RegionNames as e WHERE FullNameOfRegion = 'Свердловская область'
												and SUBSTRING(GovernmentNumber, 7, 3) = e.CodeOfRegion)
GROUP BY Model, Colour, di.GovernmentNumber
GO


--  Автомобили Свердловской области зеленого цвета
SELECT Model, Colour, di.GovernmentNumber
	FROM dbo.CarInformation AS ci
	JOIN dbo.DriverInformation AS di
	ON ci.IDDriver = di.IDDriver where exists (SELECT FullNameOfRegion FROM  dbo.RegionNames as e WHERE FullNameOfRegion = 'Свердловская область'
												and SUBSTRING(GovernmentNumber, 7, 3) = e.CodeOfRegion and ci.Colour='Green')
GROUP BY Model, Colour, di.GovernmentNumber
GO