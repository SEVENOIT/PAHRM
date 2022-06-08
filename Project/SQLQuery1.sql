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
--ABN_ACN varchar(20) NULL,
--TFN varchar(20) NULL,
Tel varchar(20) NOT NULL,
Email varchar(50) NOT NULL,
Eaddress varchar(50) NOT NULL,
PayCycle varchar(20) NOT NULL,
WeeklyAvailability varchar(20) NULL,
AvailableDays varchar(20) NULL,
UploadResume varchar(20) NULL,
Epassword varchar(20) NULL

FOREIGN KEY (CompanyID) REFERENCES Company(CID)

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

CREATE TABLE OTP
(
TrackID int IDENTITY(1,1),
OTP int NOT NULL,
Userlevel varchar(20)

);
ALTER TABLE ApplyJobs
ADD Designation Varchar(100);
ALTER TABLE OTP
ALTER COLUMN Email Varchar(100); 


Select Count(Membership) as BasicMembership,Count(CID) as Count
From Company
Where Membership = 'Basic'

select * from Employee where Eid != '1001'
select * from Company
SELECT * FROM Employee WHERE EID = 1001
select * from MEmer
select * from MImage
select * from OTP
delete from OTP Where OTP = '1212'
select EId,pass from MLogin where ISJSON([Eid])>0
UPDATE Tax SET value WHERE different_column_value = some_value

UPDATE Roster
SET Roster_Cycle='2021-12-14'
Where JobID ='61'
insert into OTP(OTP) values('12345')

select e.EID,j.Selected_Jobs
from JobContract j,Employee e
where e.EID=j.EID

DELETE FROM OTP


DELETE FROM PaymentInvoice

DELETE FROM Employee where EID=1005

alter table JobContract nocheck constraint all
alter table Roster_tracker nocheck constraint all
delete from Employee
delete from JobContract 
delete from Roster_tracker 
delete from Roster 
alter table JobContract check constraint all
alter table Roster_tracker check constraint all

CREATE TABLE Payment
(
PaymentID int IDENTITY(1,1) primary key,
);

CREATE TABLE PaymentInvoice
(
InvoiceID int IDENTITY(1,1) Primary key,
EID varchar(50),
RosterID Varchar(50),
Ename Varchar(100),
Job varchar(50),
Paycycle varchar(20),
WorkedHours varchar(20),
HourRate varchar(20),
Tax varchar(20),
GrossPayment varchar(20)
);
Drop table PaymentInvoice
CREATE TABLE Jobs
(
JobId int IDENTITY(1,1),
JobName varchar(max) NOT NULL
);
ALTER TABLE Employee
ADD NopayDays varchar(10);

select * from Roster

CREATE TABLE Roster
(
RosterID int IDENTITY(1,1) primary key,
EID varchar(20),
Job varchar(50) NOT NULL,
JLocation varchar(100),
JLocation_lat float NOT NULL DEFAULT 0,
JLocation_longi float NOT NULL DEFAULT 0,
Instructions varchar(200) NOT NULL,
Special binary ( 1 ),
Contact varchar(20) NOT NULL,
Roster_Cycle Date NOT NULL,
 
StartTime Time NOT NULL,
EndTime Time NOT NULL
);

drop table AssignRoster
Select * from AssignRoster
SELECT* FROM Roster
Select * from JobContract
CREATE TABLE AssignRoster
(
AssignID int IDENTITY(1,1) primary key,
EID varchar(20),
Job varchar(50) NOT NULL,
JLocation varchar(100),
JLocation_lat float NOT NULL DEFAULT 0,
JLocation_longi float NOT NULL DEFAULT 0,
Instructions varchar(200) NOT NULL,
Special binary ( 1 ),
Contact varchar(20) NOT NULL,
Roster_Cycle Date NOT NULL,
StartTime Time NOT NULL,
EndTime Time NOT NULL,
JobID int,
Status varchar(20) NOT NULL

);

ALTER TABLE Employee
ADD BasicSalary varchar(50);

CREATE TABLE EmergencyContact
(
ECID int IDENTITY(1,1) primary key,
EID int,
Name varchar(50) NOT NULL,
Contact varchar(100),
Relationship varchar(100)

FOREIGN KEY (EID) REFERENCES Employee(EID)

);

CREATE TABLE Roster_tracker
(
TrackerID int IDENTITY(1,1),
RosterID int,
EID int,
JLocation varchar(100),
JLocation_lat varchar(50) NOT NULL,
JLocation_longi varchar(50) NOT NULL,
Start_lat varchar(50) NOT NULL,
Start_longi varchar(50) NOT NULL,
End_lat varchar(50) NOT NULL,
End_longi varchar(50) NOT NULL,
Start_time time,
End_time time ,
Sdate Date,
Edate Date,
FOREIGN KEY (RosterID) REFERENCES Roster(RosterID),
FOREIGN KEY (EID) REFERENCES Employee(EID)
);

SELECT* FROM Roster Where EID = '1049' or  EID = '1047' or  EID = '1048'
SELECT* FROM Company
SELECT* FROM Employee
SELECT* FROM JobContract where EID = '1048'
SELECT* FROM Roster
select * from Jobs
drop table Roster

SELECT End_time - Start_time FROM Roster_tracker
SELECT time(End_time , Start_time) AS dif FROM Roster_tracker

UPDATE Company
SET LeaveDays =  (LeaveDays-1)
WHERE CID='1002';

select End_time - Start_time as total_time 
from Roster_tracker

drop table Roster_tracker
INSERT INTO Resources(Title) values ("Resources 2");
SELECT * FROM JobContract
SELECT j.EID FROM JobContract j Where j.EID = '1048'
delete from Roster Where RosterID = '61'
delete from Roster Where EID = '1048'
delete from Employee Where Eid = '1010'
Select *  from Roster_tracker  
Select * from JobContract
delete from Roster_tracker

Insert into Roster_tracker(RosterID,EID,JLocation,JLocation_lat,JLocation_longi,Start_lat,Start_longi,End_lat,End_longi,Start_time,End_time,Sdate,Edate,PaymentStatus ) 
Values ('70','1007','Matara, Sri Lanka','5.95492','80.5549561','5.95492','80.5549561','5.95492','80.5549561','09:00','17:00','2021-09-12','2021-09-12','Not Paid');

Insert into Roster(EID,Job,JLocation,JLocation_lat,JLocation_longi,Instructions,Contact,Roster_Cycle,JobStatus,JobID) 
Values ('1007','Driving','Colombo','6.8602616','6.8602616','test','1234567','2021-08-20','Completed','63');

SELECT rt.EID,e.Ename,e.PayCycle,j.Hourly_rate,rt.Start_time,rt.End_time
FROM Employee e,JobContract j,Roster r,Roster_tracker rt
WHERE e.EID = rt.EID and e.EID = j.EID and r.RosterID = rt.RosterID 

SELECT distinct e.EID,e.Ename,e.PayCycle,j.Hourly_rate,rt.Start_time,rt.End_time
FROM JobContract j,Roster r,Employee e,Roster_tracker rt 
WHERE e.EID = j.EID and r.EID = e.EID and j.Selected_Jobs = r.Job and rt.RosterID = r.RosterID and r.Roster_Cycle between '2021-04-06' AND '2021-04-14' and PayCycle = 'Weekly' and e.CompanyID = '1001'


SELECT distinct e.EID,e.Ename,e.PayCycle,j.Hourly_rate,r.Job,rt.Start_time,rt.End_time
FROM JobContract j,Roster r,Employee e,Roster_tracker rt, Company c
WHERE e.EID = j.EID and r.EID = e.EID and j.Selected_Jobs = r.Job and rt.RosterID = r.RosterID and  PayCycle = 'Weekly' and c.CID = e.CompanyID and r.Roster_Cycle between '2021-04-06' AND '2021-04-12' 


SELECT e.EID,e.Ename,e.PayCycle,j.Hourly_rate,rt.Start_time,rt.End_time
FROM JobContract j, Roster r, Employee e, Roster_tracker rt
WHERE e.EID = j.EID and r.EID = e.EID and j.Selected_Jobs = r.Job and rt.RosterID = r.RosterID AND r.Roster_Cycle between '2021-04-06' AND '2021-04-12' and PayCycle = 'Weekly'

SELECT *
FROM JobContract 
WHERE EID = '1049'

SELECT * FROM Roster WHERE EID = '1047'
SELECT * FROM Roster_tracker WHERE PaymentStatus = 'Not Paid'
select title=Roster.JLocation,lat=Roster.JLocation_lat,lng=Roster.JLocation_longi,Roster.Job,Employee.Ename from Roster ,Employee where Roster.EID= Employee.EID AND Employee.CompanyID = 1001
ALTER TABLE Roster
DROP COLUMN Status;

ALTER TABLE Employee
ADD Leaves varchar(50)

ALTER TABLE Vacancy RENAME COLUMN JobCategory TO Position;
EXEC sp_RENAME 'Vacancy.JobType' , 'ContractType', 'COLUMN'

select sum()

CREATE TABLE tblFiles
(
id int IDENTITY(1,1),
Name varchar(50),
ContentType nvarchar(200),
Data varbinary(MAX)
);


CREATE TABLE ResourceFiles
(
CID int,
ID int IDENTITY(1,1),
Name varchar(50),
ContentType nvarchar(200),
Data varbinary(MAX)
);
drop table Resources

Select r.Name from ResourceFiles r, Employee e Where r.CID = 1001  AND e.EID = 1001

ALTER TABLE Employee
DROP COLUMN TaxNumber;

CREATE TABLE UploadResume
(
EID int,
ID int IDENTITY(1,1),
Name varchar(50),
ContentType nvarchar(200),
Data varbinary(MAX)
);

Select * from UploadResume where EID = 1053

Select CompanyID,EID,Ename,DOB,Country,DriversLicense_NIC,Tel,Email,PayCycle,WeeklyAvailability From Employee Where EID = 1003

CREATE TABLE ContactUs
(
ContacID  int IDENTITY(1,1),
EID int,
Name varchar(50),
Email varchar (50),
ContactNumber int,
Message nvarchar(200)
);

Select * from Employee;
Delete from Employee
drop table ContactUs
Insert into ContactUs(EID,Name,Email,ContactNumber,Message) Values (1,2,3,4,5)

CREATE TABLE ReportIncident
(
ReportID  int IDENTITY(1,1),
EID int,
Isinvolved varchar(10),
Date varchar(20),
Time varchar(20),
Location varchar(20),
Description nvarchar(250)
);

Select * from ReportIncident
delete from Jobs where JobName = 'aaaaa' and Cid = 1001

Select * from Roster_tracker

SELECT distinct e.EID,e.Ename,e.PayCycle,j.Hourly_rate,rt.Start_time,rt.End_time ,j.Selected_Jobs,concat(t.H,'.',t.M) AS WorkedHours,Cast(concat(t.H,'.',t.M) * Cast(j.Hourly_rate as decimal(10,2))as decimal(10,2)) as Payment 
            FROM JobContract j, Roster r, Employee e, Roster_tracker rt, rosterT t
            WHERE e.EID = j.EID and r.EID = e.EID and j.Selected_Jobs = r.Job and rt.RosterID = r.RosterID and t.EID =e.EID and t.PaymentStatus = 'Not Paid' and
            e.CompanyID =  '1001' AND r.Roster_Cycle between ' 2021 - 07 - 01 ' AND ' 2021 - 08-07' and PayCycle = 'Weekly'AND rt.PaymentStatus = 'Not Paid';

Select Start_time, End_time from Roster_tracker


Insert into Roster_tracker(RosterID,EID,JLocation_lat,JLocation_longi,Start_lat,Start_longi,End_lat,End_longi,Start_time,End_time,Sdate,Edate,PaymentStatus) 
Values ('44','1046','6.8602616','6.8602616','6.8602616','6.8602616','6.8602616','6.8602616','09:00','10:45','2021-08-07','2021-08-07','Not Paid');

SELECT concat(RosterID,'',EID) as time
From Roster_tracker ;



SELECT  DATEDIFF(MINUTE, Start_time, End_time)/60 as H,DATEDIFF(MINUTE, Start_time, End_time)%60  AS M
From Roster_tracker

CREATE VIEW rosterT 
as
SELECT distinct (DATEDIFF(MINUTE, rt.Start_time, rt.End_time))/60 as H,DATEDIFF(MINUTE, rt.Start_time, rt.End_time)%60  AS M,rt.EID,rt.PaymentStatus,j.JID,rt.RosterID
FROM Roster_tracker rt, Roster r,JobContract j
Where rt.PaymentStatus = 'Not Paid' and r.RosterID= rt.RosterID and j.JID = r.JobID ;

select distinct * from Roster_tracker rt,rosterT t Where rt.Sdate between '2021-07-01' AND '2021-07-04' and rt.Edate between '2021-07-01' AND '2021-07-04' and t.PaymentStatus='Not Paid' and t.PaymentStatus='Not Paid'
select * from Roster_tracker

Drop View rosterT
SELECT * from rosterT

DECLARE @m INT
SET @m = 150%7
SELECT @m

SELECT distinct e.EID,e.Ename,e.PayCycle,j.Hourly_rate,rt.Start_time,rt.End_time
            FROM JobContract j, Roster r, Employee e, Roster_tracker rt
            WHERE e.EID = j.EID and r.EID = e.EID and j.Selected_Jobs = r.Job and rt.RosterID = r.RosterID and
            e.CompanyID =  '1001' AND  
rt.Sdate between '2021-08-20' and '2021-08-20' and   rt.Edate between '2021-08-20' and '2021-08-20' and 
 PayCycle = 'Weekly'AND rt.PaymentStatus = 'Not Paid' select h from rosterT;

SELECT distinct e.EID,e.Ename,e.PayCycle,j.Hourly_rate,rt.Start_time,rt.End_time,j.Selected_Jobs,concat(t.H,'.',t.M) AS WorkedHours,Cast(concat(t.H,'.',t.M) * Cast(j.Hourly_rate as decimal(10,2))as decimal(10,2)) as Payment
             FROM JobContract j, Roster r, Employee e, Roster_tracker rt,rosterT t
             WHERE e.EID = j.EID and r.EID = e.EID and j.Selected_Jobs = r.Job and rt.RosterID = r.RosterID and rt.EID=t.EID and j.JID = r.JobID and
             e.CompanyID = '1001' AND
            rt.Sdate between '2021-08-20' and '2021-08-20' and   rt.Edate between '2021-08-20' and '2021-08-20' and  
             e.PayCycle = 'Weekly'AND t.PaymentStatus = 'Not Paid';

SELECT distinct e.EID,e.Ename,e.PayCycle,j.Hourly_rate,rt.Start_time,rt.End_time,j.Selected_Jobs,concat(t.H,'.',t.M) AS WorkedHours,Cast(concat(t.H,'.',t.M) * Cast(j.Hourly_rate as decimal(10,2))as decimal(10,2)) as Payment
             FROM JobContract j, Roster r, Employee e, Roster_tracker rt,rosterT t
             WHERE e.EID = j.EID and r.EID = e.EID and j.Selected_Jobs = r.Job and rt.RosterID = r.RosterID and rt.EID=t.EID and
             e.CompanyID = '1001' AND
             rt.Sdate between '2021-08-20' and '2021-08-20' and   rt.Edate between '2021-08-20' and '2021-08-20' and 
             e.PayCycle = 'Weekly'AND t.PaymentStatus = 'Not Paid';

SELECT distinct e.EID,e.Ename,e.PayCycle,j.Hourly_rate,rt.Start_time,rt.End_time,j.Selected_Jobs,concat(t.H,'.',t.M) AS WorkedHours,Cast(concat(t.H,'.',t.M) * Cast(j.Hourly_rate as decimal(10,2))as decimal(10,2)) as Payment
             FROM JobContract j, Roster r, Employee e, Roster_tracker rt,rosterT t
             WHERE e.EID = j.EID and r.EID = e.EID and
             e.CompanyID = '1001' AND
             rt.Sdate between '2021-04-07' and '2021-04-07' and   rt.Edate between '2021-04-07' and '2021-04-07' and
             e.PayCycle = 'Weekly'AND t.PaymentStatus = 'Not Paid';

SELECT distinct rt.RosterID,e.EID,e.Ename,e.PayCycle,j.Hourly_rate,rt.Start_time,rt.End_time,j.Selected_Jobs,x.WorkedHours,x.Payment
             FROM JobContract j, Roster r, Employee e, Roster_tracker rt,rosterT t,x x
             WHERE e.EID = rt.EID and r.RosterID = rt.RosterID and j.JID=r.JobID and j.JID = t.JID and 
             e.CompanyID = '1001' AND
             rt.Sdate between '2021-08-20' and '2021-08-20' and   rt.Edate between '2021-08-20' and '2021-08-20' and
             e.PayCycle = 'Weekly'AND rt.PaymentStatus = 'Not Paid'

Create view Payment
as 
SELECT distinct
            concat(t.H,'.',t.M) AS WorkedHours,Cast(concat(t.H,'.',t.M) * Cast(j.Hourly_rate as decimal(10,2))as decimal(10,2)) as Payment,j.JID,rt.RosterID
             FROM rosterT t,JobContract j,Roster_tracker rt
where j.JID = t.JID and t.RosterID = rt.RosterID
           
drop view Payment
Select * from Payment
SELECT distinct e.EID,e.Ename,e.PayCycle,j.Hourly_rate,rt.Start_time,rt.End_time,j.Selected_Jobs,p.WorkedHours,p.Payment,e.Tax,p.Payment-1200 as TaxPayment,p.Payment-((p.Payment-1200)*20/100) as GrossPay
             FROM JobContract j, Roster r, Employee e, Roster_tracker rt,rosterT t,Payment p
             WHERE e.EID = rt.EID and r.RosterID = rt.RosterID and j.JID=r.JobID and j.JID = t.JID and p.JID = j.JID and j.EID = rt.EID and t.RosterID = rt.RosterID and
             p.RosterID = rt.RosterID and
             e.CompanyID = '1001' AND
             rt.Sdate between '2021-08-22' and '2021-08-22' and   rt.Edate between '2021-08-22' and '2021-08-22' and
             e.Tax = 'Other'AND rt.PaymentStatus = 'Not Paid' and e.EID = '1003'

CAST(25.65 AS decimal(10,2));
SELECT distinct e.EID,e.Ename,e.PayCycle,j.Hourly_rate,rt.Start_time,rt.End_time,j.Selected_Jobs,p.WorkedHours,p.Payment,e.Tax, 
CASE WHEN p.Payment <=1200 THEN CAST(((p.Payment-1200)*0/100)AS decimal(10,2))
WHEN p.Payment <=1700 THEN CAST(((p.Payment-1200)*20/100)AS decimal(10,2))
END AS TaxDeduction,
CASE WHEN p.Payment <=1200 THEN CAST(((p.Payment-((p.Payment-1200)*0/100)))AS decimal(10,2))
WHEN p.Payment <=1700 THEN CAST(((p.Payment-((p.Payment-1200)*20/100)))AS decimal(10,2))
END AS NetPay          
  FROM JobContract j, Roster r, Employee e, Roster_tracker rt,rosterT t,Payment p
             WHERE e.EID = rt.EID and r.RosterID = rt.RosterID and j.JID=r.JobID and j.JID = t.JID and p.JID = j.JID and j.EID = rt.EID and t.RosterID = rt.RosterID and
             p.RosterID = rt.RosterID and
             e.CompanyID = '1003' AND
             rt.Sdate between '2021-08-10' and '2021-10-22' and   rt.Edate between '2021-08-10' and '2021-10-22' AND rt.PaymentStatus = 'Not Paid'  

SELECT distinct e.EID,e.Ename,e.PayCycle,j.Hourly_rate,rt.Start_time,rt.End_time,j.Selected_Jobs,p.WorkedHours,p.Payment,e.JobRole, 
CASE WHEN p.Payment <=1200 THEN CAST(((p.Payment-1200)*0/100)AS decimal(10,2))
WHEN p.Payment <=1700 THEN CAST(((p.Payment-1200)*20/100)AS decimal(10,2))
END AS TaxDeduction,
CASE WHEN p.Payment <=1200 THEN CAST(((p.Payment-((p.Payment-1200)*0/100)))AS decimal(10,2))
WHEN p.Payment <=1700 THEN CAST(((p.Payment-((p.Payment-1200)*20/100)))AS decimal(10,2))
END AS NetPay          
  FROM JobContract j, Roster r, Employee e, Roster_tracker rt,rosterT t,Payment p
             WHERE e.EID = rt.EID and r.RosterID = rt.RosterID and j.JID=r.JobID and j.JID = t.JID and p.JID = j.JID and j.EID = rt.EID and t.RosterID = rt.RosterID and
             p.RosterID = rt.RosterID and e.JobRole = 'Casual'
 

SELECT distinct   e.EID,e.Ename,c.WorkingDays,COUNT(a.Date) as WorkedDays,jp.Salary,
CASE WHEN jp.Salary >=100000 THEN CAST(((jp.Salary-1200)*0/100)AS decimal(10,2))
WHEN jp.Salary<=100000 THEN CAST((jp.Salary)AS decimal(10,2))
END AS TaxDeduction,
CASE WHEN jp.Salary >=100000 THEN CAST(((jp.Salary-((jp.Salary-1200)*0/100)))AS decimal(10,2))
WHEN jp.Salary<=100000 THEN CAST((jp.Salary)AS decimal(10,2))
END AS NetPay          
  FROM  Employee e,Company c, Attendance a,Work w , JobContractPermenent jp
             WHERE  e.JobRole = 'Permanent' and a.EID = e.EID  and c.CID = e.CompanyID
group by  e.EID,e.Ename,c.WorkingDays,jp.Salary
 


select * from Roster_tracker
select * from JobContract
SELECT SUM(Payment) as p
FROM Payment;
SELECT ROUND(235.415, 2) AS RoundValue;

CREATE TABLE [EmpPayroll].[DeclinedRoster] (
    [DID]        INT  IDENTITY (1, 1) NOT NULL,
    [EID]             VARCHAR (20)  NULL,
    [Job]             VARCHAR (50)  NOT NULL,
    [JLocation]       VARCHAR (100) NULL,
    [JLocation_lat]   FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [JLocation_longi] FLOAT (53)    DEFAULT ((0)) NOT NULL,
    [Instructions]    VARCHAR (200) NOT NULL,
    [Special]         BINARY (1)    NULL,
    [Contact]         VARCHAR (20)  NOT NULL,
    [Roster_Cycle]    DATE          NOT NULL,
    [JobStatus]       VARCHAR (20)  NULL,
    [JobID]           VARCHAR (20)  NULL,
    [StartTime]       VARCHAR (20)  NULL,
    [EndTime]         VARCHAR (20)  NULL,
    PRIMARY KEY CLUSTERED ([DID] ASC)
);


Select * from PaymentInvoice Where Tax = 'ABN' Or Tax =  'Other'
Select * from Roster_Tracker Where PaymentStatus = 'Paid'


Select rt.RosterID,rt.EID,e.Ename,rt.Jlocation,rt.Sdate from Roster_Tracker rt, Employee e Where PaymentStatus = 'Paid' AND rt.EID = e.EID

CREATE TABLE JobPublish
(
publishID int IDENTITY(1,1) primary key,
Job varchar(50) NOT NULL,
JLocation varchar(100),
Date Date NOT NULL,
Time Time NOT NULL,
Comments varchar(500) NOT NULL
);

CREATE TABLE [EmpPayroll].[AddCompany] (
    [TrackID]     INT          IDENTITY (1, 1) NOT NULL,
    [Userlevel]   VARCHAR (20) NULL,
    [CompanyReg]  VARCHAR (20) NULL,
    [CompanyName] VARCHAR (20) NULL,
    [StartDate]   VARCHAR (20) NULL,
    [EndDate]     VARCHAR (20) NULL,
EmpPrice VARCHAR (20) Null
);

Select Count(TrackID) as New From AddCompany

CREATE TABLE Bundles
(
BID int IDENTITY(1,1),
Bname varchar(100),
Btype varchar(100),
EmpPrice varchar(50),
EmpCount int,
Duration Varchar(100),
Comments Varchar(500)

);

Drop table JobPublish

CREATE TABLE Leave
(
LID int IDENTITY(1,1),
EID int NOT NULL,
Ename varchar(100),
Date varchar(50),
NumberOfDays varchar(50),
Reason varchar(500),
Comments varchar(500),
Status varchar(50)
);
Drop table ApplyJobs

CREATE TABLE ApplyJobs
(
TEID int IDENTITY(1,1) primary key,
VID int,
CID varchar(100),
Ename varchar(100),
Email varchar(100),
Introduction varchar(500),
WorkingEx varchar(500),
Edu varchar(500),
Salary varchar(500),
Resume varchar(50),
Status varchar(50)
);
CREATE TABLE JobContractCasual
(
JID int IDENTITY(1,1),
EID int NOT NULL,
Selected_Jobs varchar(100),
Experiance varchar(50),
Hourly_rate varchar(50),
);
CREATE TABLE JobContractPermenent
(
JID int IDENTITY(1,1),
EID int NOT NULL,
Designation varchar(100),
Experiance varchar(50),
Salary varchar(50),
Hourly_rate varchar(50),
);
Insert into ApplyJobs(CompanyName,Ename,Resume,Status) 
Values ('Nature Lovers','Namal Perera','Resume.pdf','Interview')

Insert into Leave(EID,Ename,Date,NumberOfDays,Reason,Comments,Status) 
Values ('1006','Rashmi Perera','2021-11-27','7','Study leave for exam','I Approved this leave ','Approved')

create table Business(
BID int IDENTITY(1,1) primary key,
Business  varchar(100) NOT NULL

)
drop table JobContractCasual
create table Industry (
IID int IDENTITY(1,1) ,
BID  int NOT NULL,
Industry varchar(100) NOT NULL
FOREIGN KEY (BID) REFERENCES Business(BID)

)

CREATE TABLE Attendance
(
AID int IDENTITY(1,1)  Primary key,
WID int,
EID int NOT NULL,
Date varchar(50),
StartTime varchar(50),
EndTime varchar(50),
Mark varchar(50)
FOREIGN KEY (WID) REFERENCES Work(WID)

);
CREATE TABLE Work
(
WID int IDENTITY(1,1) Primary key,
EID int NOT NULL,
Location varchar(100),
LocationLat varchar(100),
LocationLongi varchar(100),
StartTime varchar(50),
EndTime varchar(50)

);

drop table Attendance

Select COUNT(Date) from Attendance Where  EID = '1005' 
ALTER TABLE Employee RENAME COLUMN WeeklyAvailability TO JobRole;
EXEC sp_RENAME 'Employee.WeeklyAvailability' , 'JobRole', 'COLUMN'

ALTER TABLE Employee
RENAME COLUMN WeeklyAvailability TO JobRole;

Select Sum(EndTime - StartTime) from Attendance Where  EID = '1005' And Date between '2021-12-14' and '2021-12-18'

SELECT Sum(DATEDIFF(HOUR, StartTime,EndTime)) AS MinuteDiff from Attendance Where  EID = '1005' And Date between '2021-12-14' and '2021-12-18'


SELECT Distinct 
CASE WHEN hde.TotWorkedHours - hd.TotWorkHours*c.WorkingDays <=0 THEN 0 /*Methanata no ot enna one*/
WHEN  hde.TotWorkedHours - hd.TotWorkHours*c.WorkingDays >=1 THEN   hde.TotWorkedHours - hd.TotWorkHours*c.WorkingDays
END AS OT
from  HourDiffTotWorkHours hd,HourDiffTotWorkedHours hde,Company c

SELECT DATENAME(MONTH,a.sdate) AS Month from Roster_tracker a;

Create view HourDiffTotWorkHours
as 
SELECT Distinct Sum(DATEDIFF(HOUR, w.StartTime,w.EndTime))  AS TotWorkHours,e.EID
from Work w, Employee e
Where w.EID = e.EID
group by e.EID

SELECT
  AID,
  DATEDIFF(second, departure, arrival) AS difference
FROM Attendance;

Create view HourDiffTotWorkedHours
as 
SELECT Distinct Sum(DATEDIFF(HOUR, a.StartDateTime,a.EndDateTime)) AS TotWorkedHours ,e.EID
from Attendance a , Employee e
Where a.EID = e.EID
group by e.EID


Drop view HourDiffTotWorkedHours

SELECT Distinct a.TotWorkedHours ,b.TotWorkHours*c.WorkingDays from HourDiffTotWorkedHours a,HourDiffTotWorkHours b,Company c
SELECT Distinct * from HourDiffTotWorkHours

CREATE TABLE Vacancy
(
VID int IDENTITY(1,1) Primary key,
CID int,
Cname Varchar(100),
JobTitle Varchar(100),
Description varchar(500),
Location Varchar(50),
JobCategory Varchar(100),
JobRole varchar(50),
JobType varchar(20),
SpecialReq varchar(100),
Skills varchar(100),
ReqWorkingEx varchar(50),
RequredEdu varchar(50),
Salary varchar(20)

FOREIGN KEY (CID) REFERENCES Company(CID)
);

drop table LeaveManagment

 SELECT a.*,v.JobType,c.LeaveDays FROM ApplyJobs a,Vacancy v,Company c WHERE TEID = '5' And v.VID = a.VID AND c.CID = a.CID

CREATE TABLE BankDetails
(
BID int IDENTITY(1,1)  Primary key,
EID int,
BankName int NOT NULL,
FullName varchar(50),
AccountNumber varchar(50),
Branck varchar(50)
 
);

CREATE TABLE EmployementTypes
(
EmpTID int IDENTITY(1001,1)  Primary key,
Type varchar(50)
 
);

insert into EmployementTypes Values('Outworkers')

CREATE TABLE LeaveManagment
(
LID int IDENTITY(1001,1)  Primary key,
CID int,
EmpTID int NOT NULL,
Personal varchar(50),
Annual varchar(50),
Sick varchar(50),
Maternity varchar(50),
NoPay varchar(50),
 
FOREIGN KEY (EmpTID) REFERENCES EmployementTypes(EmpTID)

);

CREATE TABLE EmployeeLeaves
(
LID int ,
EID varchar(50)
);

CREATE TABLE LeaveManagmentDetails
(
LMID int IDENTITY(1001,1),
EID int NOT NULL,
EmpName varchar(100),
Department varchar(50),
Manager varchar(50),
LeaveType varchar(50),
NoOfDays varchar(50),
Date varchar(50),
Reason varchar(200),
);

Select distinct sum(lm.Annual+lm.Maternity+lm.NoPay+lm.Casual+lm.Sick) as count, e.Ename,et.Type,lm.Annual,lm.Maternity,lm.NoPay,lm.Casual,lm.Sick
From LeaveManagment lm,EmployeeLeaves el,Employee e,EmployementTypes et
Where e.EID = el.EID AND e.EID = '1005'and et.EmpTID = lm.EmpTID
Group by  e.Ename,et.Type,lm.Annual,lm.Maternity,lm.NoPay,lm.Casual,lm.Sick


CREATE TABLE Payments
(
PID int IDENTITY(1001,1),
EID int NOT NULL,
NetPay int,
ETF int,
EPF int
);

select distinct EID, count(date) from Attendance
group by EID 

CREATE TABLE Allowances
(
AllowancesID int IDENTITY(1,1) primary key,
CID int NOT NULL,
AllowancesName varchar(100),
Amount varchar(50)
);

Select count(r.EID) as roster,
    COUNT(CASE WHEN r.JobStatus = 'Completed' THEN 'Completed' END) as Completed,
     COUNT(CASE WHEN r.JobStatus = 'Not Completed' THEN 'Not Completed' END) as NotCompleted
From Roster r, Employee e
Where DATEADD(dd, 0, DATEDIFF(dd, 0, r.Roster_Cycle)) = DATEADD(dd, 0, DATEDIFF(dd, 0,  '2021-12-14')) and r.EID =e.EID and e.CompanyID = '1003' and r.JobStatus = ''

SELECT DATEADD(dd, 0, DATEDIFF(dd, 0, StartDateTime))
from Attendance

SELECT
  COUNT(CASE WHEN JobStatus = 'Completed' THEN 'Completed' END) as Completed,
  COUNT(CASE WHEN JobStatus = 'Not Completed' THEN 'Not Completed' END) as NotCompleted
FROM
  Roster
;

SELECT Top 1 a.Status,a.Ename
FROM ApplyJobs a, Employee e
where  a.TEID = e.EID and e.CompanyID = '1003'
ORDER BY a.Modified DESC;

FROM Attendance 
ORDER BY EID DESC

Select (CASE WHEN r.JobStatus = 'Completed' THEN 'Completed' END) as Completed,
     COUNT(CASE WHEN r.JobStatus = 'Not Completed' THEN 'Not Completed' END) as NotCompleted
From Roster r, Employee e

CREATE TRIGGER updateModified
ON [EmpPayroll].[ApplyJobs]
AFTER UPDATE 
AS
   UPDATE [EmpPayroll].[ApplyJobs]
   SET Modified = SYSDATETIME()
   FROM Inserted i
   WHERE [EmpPayroll].[ApplyJobs].TEID = i.TEID

drop trigger updateModified

UPDATE ApplyJobs
SET   Status='Employee Filled The Form' 
WHERE TEID = '11'

CREATE TABLE Planner
(
PID int IDENTITY(1,1) primary key,
CID int NOT NULL,
Task varchar(500),
Subtask varchar(500),
Dailytarget varchar(500),
StartDate Date,
EndDate Date,
Assignto varchar(500)

FOREIGN KEY (CID) REFERENCES Company(CID)
);

Select * from Employee

ALTER TABLE Work
ADD FOREIGN KEY (EID) REFERENCES Employee(EID);

alter table Employee nocheck constraint all
delete from [UploadResume]
alter table Employee check constraint all


select *
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='JobContractCasual'

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = N'JobPublish'

SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE  TABLE_CATALOG='EmpPayroll'

USE EmpPayroll
GO 
SELECT *
FROM sys.Tables
GO

Drop table Business
Drop table JobContract
Drop table JobContractT
Drop table JobPublish
Drop table Jobs
Drop table Leave
