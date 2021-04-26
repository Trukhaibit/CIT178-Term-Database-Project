/*USE myFictionalBusiness;

SELECT Station.StationCode, 
		COUNT(Employee.EmployeeID) AS [Number of Employees Stationed]
FROM Employee JOIN Station ON Employee.StationCode = Station.StationCode
GROUP BY Station.StationCode
ORDER BY Station.StationCode ASC;

SELECT MIN(Employee.EmployeeID) AS [Longest Serving Counseler],
		MAX(Employee.EmployeeID) AS [Most Recent Camp Manager],
		COUNT(Employee.EmployeeID) AS [Current Total of Employees]
FROM Employee;

SELECT COUNT(Employee.EmployeeID) AS [Number of Employees],
		AVG(DATALENGTH(Employee.FirstName)) AS [Average First Name Length (Rounded Down)],
		AVG(DATALENGTH(Employee.LastName)) AS [Average Last Name Length (Rounded Down)]
FROM Employee;

SELECT COUNT(Employee.EmployeeID) AS [Number of Employees],
		SUM(DATALENGTH(Employee.FirstName)) AS [Total Letters of All Employee First Names],
		SUM(DATALENGTH(Employee.MiddleInitial)) AS [Total Letters of All Employee Middle Initials (Should Match First Column)],
		SUM(DATALENGTH(Employee.LastName)) AS [Total Letters of All Employee Last Names]
FROM Employee;
SELECT * FROM Employee;*/
