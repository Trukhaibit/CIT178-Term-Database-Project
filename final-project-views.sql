/* Final Project Views */
/*  View #1 

USE myFictionalBusiness;
GO
-- updatable view --
CREATE VIEW WeeklySchedule
AS
SELECT EmployeeID, MondayTI, MondayTO, TuesdayTI, TuesdayTO, ThursdayTI, ThursdayTO, FridayTI, FridayTO
FROM Schedule;
GO

--original data--
SELECT * FROM WeeklySchedule;

-- updating price --

GO
UPDATE WeeklySchedule
SET MondayTI = '00:00'
WHERE EmployeeID = 301;

UPDATE WeeklySchedule
SET MondayTO = '00:00'
WHERE EmployeeID = 301;
GO

--new data--
SELECT * FROM WeeklySchedule;*/

/* View #2 

USE myFictionalBusiness;
GO
-- unupdatable view --
CREATE VIEW EmployeeJobAssignments
AS
SELECT EmployeeID, Station.StationName, Position.Title
FROM Employee JOIN Station ON Station.StationCode = Employee.StationCode JOIN Position ON Position.JobCode = Employee.JobCode;
GO

--show data--
SELECT * FROM EmployeeJobAssignments;*/

/* View #3 

USE myFictionalBusiness;
GO
-- unupdatable view --
CREATE VIEW WorkHours
AS
SELECT EmployeeID, DATEDIFF(HOUR, MondayTI, MondayTO) AS MondayHours, 
DATEDIFF(HOUR, TuesdayTI, TuesdayTO) AS TuesdayHours, 
DATEDIFF(HOUR, ThursdayTI, ThursdayTO) AS ThursdayHours, 
DATEDIFF(HOUR, FridayTI, FridayTO) AS FridayHours
FROM Schedule;
GO

--show data--
SELECT * FROM WorkHours;*/

/* View #4 

USE myFictionalBusiness;
GO
-- unupdatable view --
CREATE VIEW EmployeeNotifications
AS
SELECT EmployeeID, Comments
FROM Performance;
GO

--show data--
SELECT * FROM EmployeeNotifications;*/