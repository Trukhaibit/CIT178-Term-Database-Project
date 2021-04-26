/*CREATE DATABASE myFictionalBusiness;
GO

USE myFictionalBusiness;
CREATE TABLE Position(
	JobCode varchar(5) NOT NULL,
	Title varchar(20),
	JobDescription varchar(20),
	PRIMARY KEY(JobCode)
);
GO
CREATE TABLE Station(
	StationCode varchar(5) NOT NULL,
	StationName varchar(20),
	PRIMARY KEY(StationCode)
);
GO
CREATE TABLE Employee(
	EmployeeID int NOT NULL,
	FirstName varchar(20),
	MiddleInitial varchar(5),
	LastName varchar(20),
	JobCode varchar(5),
	StationCode varchar(5),
	PRIMARY KEY(EmployeeID)
);
GO*/
CREATE TABLE Manager(
	ManagerID int NOT NULL,
	EmployeeID int NOT NULL,
	PRIMARY KEY(EmployeeID)
);/*
GO
CREATE TABLE Performance(
	EmployeeID int NOT NULL,
	ReviewDate date,
	Assessment varchar(10),
	Approval varchar(5),
	Comments varchar(50),
	Reviewer int,
	PRIMARY KEY(EmployeeID)
);
GO
CREATE TABLE Schedule(
	PayPeriod date NOT NULL,
	EmployeeID int NOT NULL,
	MondayTI time,
	MondayTO time,
	TuesdayTI time,
	TuesdayTO time,
	ThursdayTI time,
	ThursdayTO time,
	FridayTI time,
	FridayTO time,
	PRIMARY KEY(PayPeriod)
);
GO */