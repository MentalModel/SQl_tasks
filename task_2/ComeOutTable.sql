USE [Alexander Dobrunov]

IF OBJECT_ID('dbo.ComeOUT', 'U') IS NOT NULL
  DROP TABLE dbo.ComeOUT
GO

CREATE TABLE dbo.ComeOUT
(
	DepartureTimeOUT TIME NOT NULL, 
	IDGBDD_OUT INT NOT NULL,
	CONSTRAINT FK_IDGBDD_OUT FOREIGN KEY (IDGBDD_OUT)
	REFERENCES dbo.GBDDInfo(ID_GBDD),

	DriverID INT NOT NULL,
	CONSTRAINT FK_Driver__ID PRIMARY KEY (DriverID, IDGBDD_OUT),
)
GO

INSERT INTO [dbo].[ComeOUT]([DriverID], [DepartureTimeOUT], [IDGBDD_OUT])
     VALUES
			/* TRANSITE CARS */ 
			(1, '01:01:00', 2),
			(2, '01:23:00', 1),
			(3, '06:12:00', 3),
			(4, '07:55:00', 4),
			/* ------------------- */

			/* DIFFERENT TOWN CARS */
			(5, '08:55:00', 1),
			(6, '09:32:00', 2),
			(7, '10:33:00', 3),
			(8, '11:01:00', 4),
			(9, '12:13:01', 2),
			(10, '13:46:00', 3),
			(11, '14:32:00', 4),
			/* ------------------- */
			
			/* HOMETOWN CARS */
			(12, '14:35:00', 1),
			(13, '15:01:00', 2),
			(14, '16:46:00', 3),
			(15, '15:55:00', 3),
			(16, '13:54:00', 4),
			(17, '12:11:00', 1),
			/* --------------------- */


			/* OTHER CARS */
			(18, '22:16:00', 1),
			--(19, '22:55:00', 2),
			(20, '23:55:00', 3),
			(20, '23:57:00', 4)
			/* --------------------- */
GO

SELECT TOP 1000 [DepartureTimeOUT]
      ,[IDGBDD_OUT]
      ,[DriverID]
FROM [Alexander Dobrunov].[dbo].[ComeOUT]
GO