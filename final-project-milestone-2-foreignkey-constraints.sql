USE myFictionalBusiness;
GO
/*ALTER TABLE employee WITH CHECK
ADD CONSTRAINT FK_JobCode FOREIGN KEY(Jobcode) REFERENCES position(JobCode)
ON UPDATE CASCADE
GO
ALTER TABLE employee WITH CHECK
ADD CONSTRAINT FK_StationCode FOREIGN KEY(StationCode) REFERENCES Station(StationCode)
ON UPDATE CASCADE
GO */
ALTER TABLE manager WITH CHECK
ADD CONSTRAINT FK_EmployeeID FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID)
ON UPDATE CASCADE/*
GO
ALTER TABLE performance WITH CHECK
ADD CONSTRAINT FK_Reviewer FOREIGN KEY(Reviewer) REFERENCES Employee(EmployeeID)
ON UPDATE CASCADE
GO
ALTER TABLE schedule WITH CHECK
ADD CONSTRAINT FK_EmployeeIDSchedule FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID)
ON UPDATE CASCADE
GO*/