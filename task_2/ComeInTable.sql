USE [Alexander Dobrunov]

IF OBJECT_ID('dbo.ComeIN', 'U') IS NOT NULL
  DROP TABLE dbo.ComeIN
GO

CREATE TABLE dbo.ComeIN
(
	DepartureTimeIN TIME NOT NULL, 
	IDGBDD_IN INT NOT NULL,
	CONSTRAINT FK_IDGBDD_IN FOREIGN KEY (IDGBDD_IN)
	REFERENCES dbo.GBDDInfo(ID_GBDD),

	DriverID INT NOT NULL,
	CONSTRAINT FK_Driver_ID PRIMARY KEY (DriverID, IDGBDD_IN),
)
GO

INSERT INTO [dbo].[ComeIN]([DriverID], [DepartureTimeIN], [IDGBDD_IN])
     VALUES
			/* TRANSITE CARS */ 
			(1, '01:00:00', 1),
			(2, '01:11:00', 4),
			(3, '06:00:00', 2),
			(4, '07:00:00', 3),
			/* ------------------- */

			/* DIFFERENT TOWN CARS */
			(5, '08:00:00', 1),
			(6, '09:00:00', 2),
			(7, '10:00:00', 3),
			(8, '11:00:00', 4),
			(9, '12:00:00', 2),
			(10, '13:00:00', 3),
			(11, '14:00:00', 4),
			/* ------------------- */
			
			/* HOMETOWN CARS */
			(12, '15:00:00', 1),
			(13, '16:00:00', 2),
			(14, '17:00:00', 3),
			(15, '18:00:00', 4),
			(16, '19:00:00', 3),
			(17, '20:00:00', 2),
			/* --------------------- */

			/* OTHER CARS */
			--(18, '21:00:00', 1),
			(19, '22:00:00', 2),
			(19, '23:00:00', 4)
			--(20, '23:00:00', 3)
			/* --------------------- */
GO

SELECT TOP 1000 [DepartureTimeIN]
      ,[IDGBDD_IN]
      ,[DriverID]
FROM [Alexander Dobrunov].[dbo].[ComeIN]
GO