/* Final Project Procedures 

USE MyFictionalBusiness;
GO
CREATE PROC spRollCall
AS
SELECT EmployeeID, FirstName, MiddleInitial, LastName
FROM Employee
WHERE EmployeeID < 500
ORDER BY EmployeeID;

GO
EXEC spRollCall

USE myFictionalBusiness;
GO
CREATE PROC spStatusReport
	@empID varchar(20) = NULL
AS
BEGIN
IF @empID IS NULL
	SELECT EmployeeID, Comments FROM Performance;
ELSE
	SELECT EmployeeID, Comments FROM Performance
	WHERE EmployeeID = @empID;
END

GO
EXEC spStatusReport;
EXEC spStatusReport '301';

USE myFictionalBusiness;
GO
CREATE PROC spNamedReport
	@empID varchar(20) = NULL,
	@name varchar(50) = NULL OUTPUT,
	@comment varchar(50) = NULL OUTPUT
AS
BEGIN
IF @empID IS NULL
	SELECT @name = (left(FirstName, 1) + ' ' + LastName), @comment = Comments FROM Performance
	JOIN Employee ON Employee.EmployeeID = Performance.EmployeeID;
ELSE
	SELECT @name = (left(FirstName, 1) + ' ' + LastName), @comment = Comments FROM Performance
	JOIN Employee ON Employee.EmployeeID = Performance.EmployeeID
	WHERE Employee.EmployeeID = @empID;
END
GO

DECLARE @name varchar(50), @comment varchar(50)
EXEC spNamedReport '302', @name OUTPUT, @comment OUTPUT
PRINT @name + ' | ' + @comment;

USE AP;
GO
CREATE PROC spInvCount @DateVar smalldatetime = NULL, @VendorVar varchar(40) = '%'
AS
IF @DateVar IS NULL
    SELECT @DateVar = MIN(InvoiceDate) FROM Invoices;

DECLARE @InCount int;

SELECT @InCount = COUNT(InvoiceID)
FROM Invoices
JOIN Vendors ON Invoices.VendorID = Vendors.VendorID
WHERE (InvoiceDate >= @DateVar) AND (VendorName LIKE @VendorVar);
RETURN @InCount;

DECLARE @InCount int;
EXEC @InCount = spInvCount '2016-02-01', 'P%';
PRINT 'Invoice count: ' + CONVERT(varchar, @InCount);

USE myFictionalBusiness;
GO
CREATE PROC spHeadCount
AS
DECLARE @empCount int;

SELECT @empCount = COUNT(EmployeeID)
FROM Employee
WHERE EmployeeID < 500;

RETURN @empCount;
GO

DECLARE @empCount int;
EXEC @empCount = spHeadCount;
PRINT 'Head Count: ' +CONVERT(varchar, @empCount);*/

/* Final Project User Defined Functions 

USE myFictionalBusiness;
GO
CREATE FUNCTION fnEmployeeID
	(@EmployeeName varchar(50))
	RETURNS int
BEGIN
	RETURN (SELECT EmployeeID FROM Employee WHERE Lastname = @EmployeeName);
END;
GO
SELECT EmployeeID, FirstName, MiddleInitial, LastName
FROM Employee
WHERE EmployeeID = dbo.fnEmployeeID('Squidgicum');

USE myFictionalBusiness;
GO
CREATE FUNCTION fnEmployees
	(@EmployeeID int)
	RETURNS table
RETURN
	(SELECT * FROM Employee WHERE @EmployeeID = Employee.EmployeeID);
GO
SELECT * FROM dbo.fnEmployees(301);
SELECT * FROM dbo.fnEmployees(304);
SELECT * FROM dbo.fnEmployees(307);*/

/* Final Project Triggers 

USE myFictionalBusiness;
SELECT EmployeeID, FirstName, LastName, JobCode, StationCode INTO TestEmployees
FROM Employee;

CREATE TABLE EmployeeArchive(
	EmployeeID nchar(5),
	status varchar(30)
);

CREATE TRIGGER TestEmployees_DELETE ON TestEmployees
	AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @EmployeeID int
	SELECT @EmployeeID = DELETED.EmployeeID
	FROM DELETED

	INSERT INTO EmployeeArchive
	VALUES(@EmployeeID, 'Deleted')
END

DELETE FROM TestEmployees WHERE EmployeeID = 306;

SELECT * FROM EmployeeArchive;

CREATE TRIGGER TestEmployees_INSERT ON TestEmployees
	AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @EmployeeID int
	SELECT @EmployeeID = DELETED.EmployeeID
	FROM DELETED

	INSERT INTO EmployeeArchive
	VALUES(@EmployeeID, 'Inserted')
END

INSERT INTO TestEmployees(EmployeeID, FirstName, LastName, JobCode, StationCode) VALUES ('401', 'Terri', 'Mountain', 'BC', 'CP');

SELECT * FROM EmployeeArchive;

CREATE TRIGGER TestCustomers_UPDATE ON TestEmployees
	AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @EmployeeID int

	DECLARE @Action varchar(50)
	SELECT @EmployeeID = INSERTED.EmployeeID
	FROM INSERTED 

	IF UPDATE(EmployeeID)
		SET @Action = 'Updated ID'

	IF UPDATE(FirstName)
		SET @Action = 'Updated First Name'

	IF UPDATE(LastName)
		SET @Action = 'Updated Last Name'

	IF UPDATE(JobCode)
		SET @Action = 'Updated Position'

	IF UPDATE(StationCode)
		SET @Action = 'Updated Station'

	INSERT INTO EmployeeArchive
	VALUES(@EmployeeID, @Action)
END

UPDATE TestEmployees SET JobCode = 'LGC' WHERE EmployeeID = '303';
UPDATE TestEmployees SET StationCode = 'WF' WHERE EmployeeID = '303';

SELECT * FROM EmployeeArchive;

SELECT * FROM TestEmployees;*/