CREATE TABLE Employee
(
CompanyID int,
EID int IDENTITY(1,1) primary key,
Ename varchar(50) NOT NULL,
DOB varchar(50) NOT NULL,
Country varchar(20) NOT NULL,
VisaStatus varchar(20) NULL,
OtherReasons varchar(255) NULL,
DriversLicense_NIC varchar(20) NULL,
ABN_ACN varchar(20) NULL,
TFN varchar(20) NULL,
Tel varchar(20) NOT NULL,
Email varchar(50) NOT NULL,
Eaddress varchar(50) NOT NULL,
City varchar(50) NOT NULL,
eState_Province varchar(50) NOT NULL,
PayCycle varchar(20) NOT NULL,
WeeklyAvailability varchar(20) NULL,
AvailableDays varchar(20) NULL,
UploadResume varchar(20) NULL,
Epassword varchar(20) NULL

);

SET IDENTITY_INSERT Employee on
GO

drop table Employee
drop table JobContract

CREATE TABLE JobContract
(
JID int IDENTITY(1,1),
EID int NOT NULL,
Selected_Jobs varchar(100),
Experiance varchar(50),
Hourly_rate varchar(50),

FOREIGN KEY (EID) REFERENCES Employee(EID)
);

select * from Employee
select * from Company


select * from JobContract

select EId,pass from MLogin where ISJSON([Eid])>0

select e.EID,j.Selected_Jobs
from JobContract j,Employee e
where e.EID=j.EID

DELETE FROM JobContract

DELETE FROM PaymentInvoice

DELETE FROM Employee

CREATE TABLE Payment
(
PaymentID int IDENTITY(1,1) primary key,
);

CREATE TABLE PaymentInvoice
(
InvoiceID int IDENTITY(1,1),
Invoice varchar(max) NOT NULL
);

CREATE TABLE Jobs
(
JobId int IDENTITY(1,1),
JobName varchar(max) NOT NULL
);

select * from Resources

select * from Jobs

INSERT INTO Resources(Title) values ("Resources 2");
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);