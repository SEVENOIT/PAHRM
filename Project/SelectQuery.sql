select * from Employee
select * from Company
select * from AddCompany
SELECT * FROM Roster
select * from Roster_Tracker
select * from MImage
select * from OTP
select * from PaymentInvoice
select * from ContactUs
select * from EmergencyContact
select * from JobContractCasual
select * from JobContractT
select * from Jobs
select * from AssignRoster
select * from DeclinedRoster
select * from PaymentHistory
select * from AddCompany
select * from Bundles 
select * from JobPublish
select * from ApplyJobs
select * from Business
select * from Industry
select * from Work
select * from Attendance
select * from Vacancy
select * from JobContractPermenent
select * from JobContractCasual
select * from EmployementTypes
select * from LeaveManagment
select * from EmployeeLeaves
select * from BankDetails
select * from Payments
select * from LeaveManagmentDetails
select * from Allowances
select * from ReportIncident
select * from ResourceFiles
select * from Package
select * from tblFiles


ALTER TABLE Vacancy ALTER COLUMN JobTitle VARCHAR (50);



drop table MImage


delete from LeaveManagment where CID = '1005'

CREATE TABLE Package
(
PID int IDENTITY(1,1) primary key,
Pname varchar(30),
PricePerEmp varchar(100),
);


select distinct e.EID,e.Ename,r.RosterID,r.JLocation,r.Job,r.JobStatus
            from Roster r,Employee e
            Where e.CompanyID = '1003' And CAST(r.Roster_Cycle AS DATE) = CAST('2022-04-24' AS DATE) and r.EID = e.EID



CREATE TABLE HRDocuments
(
DocID int IDENTITY(1,1) primary key,
CID int,
Name varchar(50) NOT NULL,
ContentType nvarchar(200) NULL,
Data varbinary (max) NULL,

FOREIGN KEY (CID) REFERENCES Company(CID)

);

 SELECT Top 1 l.EmpName,l.Date
                   FROM LeaveManagmentDetails l,Employee e 
                  Where l.EID = e.EID and e.CompanyID = '1003'
                  ORDER BY l.Date DESC
UPDATE ReportIncident
SET   Date='5.4.2022' 
WHERE EID = '1005'

SELECT Top 1 e.Ename 
            FROM ReportIncident r,Employee e 
            Where r.EID = e.EID and e.CompanyID = '1003'
            ORDER BY r.Date DESC

SELECT Top 1 a.Status,a.Ename
            FROM ApplyJobs a
            Where a.CID = '1003' and a.Status = 'pending'
            ORDER BY a.Modified DESC

select cast(getdate() as date)
SELECT DATEADD(dd,   DATEDIFF(dd,   GETDATE()));

Select count(a.S)
from Attendance a

SELECT  Convert(varchar,a.StartDateTime,111) as converted_Tran_Date from Attendance a
Where 

Select distinct count(e.EID) as emp 
From Employee e 
Where e.CompanyID = '1003'  


select sum(Amount) as amount from Allowances
where CID = '1003'

drop table Payments where AID = '64'
SELECT distinct Count(*) as count FROM Work WHERE EID = '1027'
SELECT j.Selected_Jobs 
FROM JobContractCasual j,Employee e

Select e.EID,e.Ename,p.NetPay,p.EPF,p.ETF,b.FullName,b.AccountNumber,b.BankName,b.Branck
From Employee e,Payments p, BankDetails b 
Where e.EID = p.EID AND e.EID = b.EID And p.Month = 'December' And e.CompanyID = '1004'

delete from EmployeeLeaves where EmpLeaveID = '1011'
Insert into BankDetails(EID ,BankName,FullName,AccountNumber,Branck) values('1020','Sampath Bank','Sadeera','10101010101010','Kottawa')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-3','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-4','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-5','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-6','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-7','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-8','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-9','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-10','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-11','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-12','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-13','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-14','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-15','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-16','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-17','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-18','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-19','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-20','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-21','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-22','08:00:00','17:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-23','08:00:00','20:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-24','08:00:00','22:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-25','08:00:00','20:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-26','08:00:00','20:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-27','08:00:00','20:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-28','08:00:00','20:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-29','08:00:00','20:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-30','08:00:00','20:00:00','1')
Insert into Attendance(WID,EID ,Date,StartTime,EndTime,Mark) values('1','1005','2021-12-31','08:00:00','20:00:00','1')

ALTER TABLE Vacancy
ADD Working_hours varchar(20);

delete from Attendance where AID = '50'

Select distinct DATEDIFF(hour,w.StartTime, w.EndTime)As diff,e.Ename,et.Type , lm.Sick as type, el.Sick as leaveType
From LeaveManagment lm,EmployeeLeaves el,Employee e,EmployementTypes et,Work w
Where e.EID = el.EID AND e.EID = '1005' And et.EmpTID = lm.EmpTID 
 

SELECT * FROM LeaveManagment WHERE EID = '1005' AND Date = '2021-12-28'
SELECT (EndTime-StartTime) As diff FROM Work WHERE EID = '1005'  
SELECT DATEDIFF(hour,StartTime, EndTime)As diff FROM Work WHERE EID = '1005'

Insert into Attendance(WID,EID,Date,StartTime) Values('1','1005','2021-12-18','08:00:00.0000000')
SELECT distinct JobType FROM Vacancy 

SELECT distinct COUNT(CID),Cname,JobRole,JobType FROM Vacancy GROUP BY Cname,JobRole,JobType

Select distinct i.*
from Business b,Industry i
where  b.BID = i.BID and b.Business = 'Retail & Hospitality'

Insert into Roster(EID,Job,JLocation,JLocation_lat,JLocation_longi,Instructions,Contact,Roster_Cycle,JobStatus,JobID,StartTime,EndTime)
Values ('1005','2','3','4','5','6','7','2021-08-22','1','1', '17:00:00.0000000','17:00:00.0000000')

select distinct JobName From Jobs where Cid ='1001'
select * from Jobs where cid = '1001'
select * from Attendance where EID = '1005'
SELECT distinct e.Ename,j.EID  FROM JobContract j, Employee e WHERE j.EID=e.EID and j.Selected_Jobs= 'Teaching'

UPDATE Employee
SET WeeklyAvailability ='Casual'
Where EID ='1007'

Select distinct c.ContacID,c.EID,c.Name,c.Email,c.ContactNumber,c.Message from ContactUs c,Employee e where e.CompanyID = '1001'
select distinct p.EID,p.Ename,p.GrossPayment,p.HourRate,p.InvoiceID,p.Job,p.Paycycle,p.RosterID,p.Tax,p.WorkedHours 
select distinct p.EID,p.Ename,p.GrossPayment,p.HourRate,p.InvoiceID,p.Job,p.Paycycle,p.RosterID,p.Tax,p.WorkedHours 
select * from PaymentInvoice where EID = '1001' 

select distinct Sum(p.GrossPayment)
from PaymentInvoice p,Company c
where c.CID = '1001' 

group by p.EID,p.Ename,p.GrossPayment,p.HourRate,p.InvoiceID,p.Job,p.Paycycle,p.RosterID,p.Tax,p.WorkedHours

Insert into PaymentInvoice(EID,RosterID,Ename,Job ,Paycycle,WorkedHours,HourRate,Tax,GrossPayment) values('1','2','3','4','5','6','7','8','9.0')

ALTER TABLE Company
ALTER COLUMN WorkingDays varchar(10);

Select distinct c.CID,c.Eaddress,r.EID,r.RosterID,e.Ename,r.JLocation
From Company c,Roster r, Employee e
Where e.EID=r.EID and  c.CID= '1001' and  r.Job = 'Driving' and r.JobStatus = 'Completed' and r.Roster_Cycle between '2021-08-22' and '2021-08-22'

Delete from Attendance where AID = '51'

Select distinct c.CID,c.Eaddress,r.EID,r.RosterID,e.Ename,r.JLocation 
            From Company c,Roster r, Employee e
            Where e.EID = r.EID and c.CID = '1001' and r.Job = 'Driving'
            and r.JobStatus = ''

select count(EID) as count from JobContract where EID = '1001'

select distinct l.* from Leave l, Employee e where e.CompanyID = '1001'

Create table ab(name varchar(10))

INSERT INTO ab (name) VALUES (NEWID(),'name')
drop table ab

 
SELECT v.JobRole,a.Ename FROM Vacancy v,ApplyJobs a WHERE v.VID = a.VID

SELECT distinct e.EID,e.Ename,c.WorkingDays,COUNT(a.Date) as WorkedDays,jp.Salary, hde.TotWorkedHours, hd.TotWorkHours*c.WorkingDays as TotWorkHours,e.NopayDays,
CASE WHEN hde.TotWorkedHours - hd.TotWorkHours*c.WorkingDays <=0 THEN 0
WHEN hde.TotWorkedHours - hd.TotWorkHours * c.WorkingDays >= 1 THEN hde.TotWorkedHours - hd.TotWorkHours * c.WorkingDays 
END AS OT
FROM HourDiffTotWorkHours hd,HourDiffTotWorkedHours hde, Employee e, Company c, Attendance a, Work w ,JobContractPermenent jp
WHERE  e.JobRole = 'Permanent' and a.EID = e.EID and c.CID = e.CompanyID And c.CID = '1003' 
And a.Date between '2021-12-01' and '2021-12-30'
group by  e.EID,e.Ename,c.WorkingDays,jp.Salary,hde.TotWorkedHours,TotWorkHours,e.NopayDays

select distinct Count(Date) from Attendance where EID = '1005' and Date between '2021-12-01' and '2021-12-31' and mark = '1'
select * from Attendance where EID = '1005' and Date between '2021-12-01' and '2021-12-30' and mark = '1'

SELECT distinct e.EID,e.Ename,c.WorkingDays,COUNT(a.Mark) as WorkedDays,jp.Salary, Sum(DATEDIFF(HOUR, a.StartTime,a.EndTime))  as Work_Hours, hd.TotWorkHours*c.WorkingDays as Tot_Work_Hours,c.Company_name, YEAR('2021-12-01') AS Year,DATENAME(MONTH,'2021-12-01') AS Month, jp.Hourly_rate,
            CASE WHEN jp.Salary >= 100000 THEN CAST(((jp.Salary-1200)*0 / 100)AS decimal(10, 2)) 
            WHEN jp.Salary <= 100000 THEN 0
            END AS TaxDeduction,
            CASE WHEN jp.Salary >= 100000 THEN CAST(((jp.Salary-((jp.Salary - 1200) * 0 / 100)))AS decimal(10, 2))
            WHEN jp.Salary <= 100000 THEN CAST((Sum(DATEDIFF(HOUR, a.StartTime,a.EndTime))*jp.Hourly_rate) AS decimal(10,2))
            END AS NetPay, 
            CASE WHEN Sum(DATEDIFF(HOUR, a.StartTime,a.EndTime)) - hd.TotWorkHours*c.WorkingDays <=0 THEN 0 
            WHEN Sum(DATEDIFF(HOUR, a.StartTime,a.EndTime)) - hd.TotWorkHours * c.WorkingDays >= 1 THEN Sum(DATEDIFF(HOUR, a.StartTime,a.EndTime)) - hd.TotWorkHours * c.WorkingDays 
            END AS OT, 
            CASE WHEN Sum(DATEDIFF(HOUR, a.StartTime,a.EndTime)) - hd.TotWorkHours*c.WorkingDays <=0 THEN 0 
            WHEN Sum(DATEDIFF(HOUR, a.StartTime,a.EndTime)) - hd.TotWorkHours * c.WorkingDays >= 1 THEN (Sum(DATEDIFF(HOUR, a.StartTime,a.EndTime)) - hd.TotWorkHours * c.WorkingDays)*jp.Hourly_rate 
            END AS OT_Hours
            FROM HourDiffTotWorkHours hd, Employee e, Company c, Attendance a, Work w , JobContractPermenent jp
            WHERE e.ContractType = 'Permanent' and a.EID = e.EID and e.CompanyID = c.CID And c.CID = '1004' and a.mark = '1' and E.EID = '1020'
            And a.Date between '2021-12-01' and '2021-12-30' and a.WID = w.WID AND jp.EID = w.EID AND w.EID = e.EID and e.EID = jp.EID  and hd.EID =  w.EID
            group by  e.EID,e.Ename,c.WorkingDays,jp.Salary,TotWorkHours,e.NopayDays,c.Company_name, jp.Hourly_rate


SELECT distinct e.EID,e.Ename,c.WorkingDays,COUNT(a.Mark) as WorkedDays,jp.Salary, Sum(DATEDIFF(HOUR, a.StartTime,a.EndTime))  as Work_Hours, hd.TotWorkHours*c.WorkingDays as Tot_Work_Hours,c.Company_name, YEAR('2021-12-01') AS Year,DATENAME(MONTH,'2021-12-01') AS Month, jp.Hourly_rate,b.BankName,b.FullName,b.AccountNumber,b.Branck,c.EPF,C.ETF,e.NopayDays,   
            CASE WHEN jp.Salary >= 100000 THEN CAST(((jp.Salary - 1200) * 0 / 100)AS decimal(10, 2))  
            WHEN jp.Salary <= 100000 THEN 0  
            END AS TaxDeduction,  
            CASE WHEN jp.Salary >= 100000 THEN CAST(((jp.Salary - ((jp.Salary - 1200) * 0 / 100)))AS decimal(10, 2))  
            WHEN jp.Salary <= 100000 THEN CAST((Sum(DATEDIFF(HOUR, a.StartTime, a.EndTime)) * jp.Hourly_rate) AS decimal(10, 2))  
            END AS NetPay,  
            CASE WHEN Sum(DATEDIFF(HOUR, a.StartTime, a.EndTime)) - hd.TotWorkHours * c.WorkingDays <= 0 THEN 0  
            WHEN Sum(DATEDIFF(HOUR, a.StartTime, a.EndTime)) - hd.TotWorkHours * c.WorkingDays >= 1 THEN Sum(DATEDIFF(HOUR, a.StartTime, a.EndTime)) - hd.TotWorkHours * c.WorkingDays  
            END AS OT,  
            CASE WHEN Sum(DATEDIFF(HOUR, a.StartTime, a.EndTime)) - hd.TotWorkHours * c.WorkingDays <= 0 THEN 0  
            WHEN Sum(DATEDIFF(HOUR, a.StartTime, a.EndTime)) - hd.TotWorkHours * c.WorkingDays >= 1 THEN(Sum(DATEDIFF(HOUR, a.StartTime, a.EndTime)) - hd.TotWorkHours * c.WorkingDays) * jp.Hourly_rate  
            END AS OT_Hours  
            FROM HourDiffTotWorkHours hd, Employee e, Company c, Attendance a, Work w, JobContractPermenent jp,BankDetails b   
            WHERE e.ContractType = 'Permanent' and a.EID = e.EID and e.CompanyID = c.CID And c.CID = '1004' and a.mark = '1' and E.EID = '1020'  
            And a.Date between '2022-01-01' and '2022-01-30' and a.WID = w.WID AND jp.EID = w.EID AND w.EID = e.EID and e.EID = jp.EID And b.EID = e.EID  and hd.EID =  w.EID
            group by  e.EID, e.Ename, c.WorkingDays, jp.Salary, hd.TotWorkHours, e.NopayDays, c.Company_name, jp.Hourly_rate,b.BankName,b.FullName,b.AccountNumber,b.Branck,c.EPF,C.ETF

SELECT distinct e.EID,e.Ename,c.WorkingDays,COUNT(a.Mark) as WorkedDays,jp.Salary, Sum(DATEDIFF(HOUR, a.StartTime,a.EndTime))  as Work_Hours, hd.TotWorkHours*c.WorkingDays as Tot_Work_Hours,jp.Designation,
            CASE WHEN Sum(DATEDIFF(HOUR, a.StartTime,a.EndTime)) - hd.TotWorkHours * c.WorkingDays <= 0 THEN 0
            WHEN Sum(DATEDIFF(HOUR, a.StartTime,a.EndTime)) - hd.TotWorkHours * c.WorkingDays >= 1 THEN Sum(DATEDIFF(HOUR, a.StartTime,a.EndTime)) - hd.TotWorkHours * c.WorkingDays
            END AS OT 
            FROM HourDiffTotWorkHours hd, HourDiffTotWorkedHours hde, Employee e, Company c, Attendance a, Work w ,JobContractPermenent jp
            WHERE e.ContractType = 'Permanent' and a.EID = e.EID and e.CompanyID = c.CID And c.CID = '1004' and a.mark = '1'
            And a.Date between '2021-12-01' and '2021-12-30' and a.WID = w.WID AND jp.EID = w.EID AND w.EID = e.EID and e.EID = jp.EID  and hde.EID =  w.EID and hd.EID =  w.EID
            group by  e.EID,e.Ename,c.WorkingDays,jp.Salary,hde.TotWorkedHours,TotWorkHours,jp.Designation

SELECT distinct e.EID,e.Ename,c.WorkingDays,COUNT(a.Mark) as WorkedDays,jp.Salary, jp.Designation          
            FROM HourDiffTotWorkHours hd, HourDiffTotWorkedHours hde, Employee e, Company c, Attendance a, Work w ,JobContractPermenent jp
            WHERE e.ContractType = 'Permanent' and a.EID = e.EID and e.CompanyID = c.CID And c.CID = '1003'
            And a.Date between '2021-12-01' and '2021-12-30' and a.WID = w.WID AND jp.EID = w.EID AND w.EID = e.EID and e.EID = jp.EID
            group by  e.EID,e.Ename,c.WorkingDays,jp.Salary,jp.Designation


Select * from HourDiffTotWorkHours 
Select * from HourDiffTotWorkedHours

select e.EID,e.Ename,Count(a.Date) as AttendanceCount,DATENAME(MONTH,'2021-12-01') AS Month 
from Employee e, Attendance a
Where a.EID = e.EID AND e.CompanyID = '1004' And a.Mark='1'
group by e.EID,e.Ename

select e.EID,e.Ename,a.Date,a.StartTime,a.EndTime
from Employee e, Attendance a
Where a.EID = e.EID AND e.CompanyID = '1004' And a.Date Between '2022-01-03' and '2022-01-05'

SELECT distinct e.EID,e.Ename,jp.Salary,jp.Designation          
            FROM Employee e, Company c,Work w ,JobContractPermenent jp, Attendance a 
            WHERE e.ContractType = 'Permanent' and e.CompanyID = c.CID And c.CID = '1004'
            And a.Date between '2021-12-01' and '2021-12-30' and a.WID = w.WID AND jp.EID = w.EID AND w.EID = e.EID and e.EID = jp.EID
            group by  e.EID,e.Ename,jp.Salary,jp.Designation


INSERT INTO [EmpPayroll].[LeaveManagment] ( [CID], [EmpTID], [Casual], [Annual], [Sick], [Maternity], [NoPay]) VALUES ( 1004, 1001, 80, 80, 80, 80, 80)
INSERT INTO [EmpPayroll].[LeaveManagment] ( [CID], [EmpTID], [Casual], [Annual], [Sick], [Maternity], [NoPay]) VALUES ( 1004, 1002, 80, 80, 80, 80, 80)
INSERT INTO [EmpPayroll].[LeaveManagment] ([CID], [EmpTID], [Casual], [Annual], [Sick], [Maternity], [NoPay]) VALUES ( 1004, 1003,80, 80, 80, 80, 80)
INSERT INTO [EmpPayroll].[LeaveManagment] ([CID], [EmpTID], [Casual], [Annual], [Sick], [Maternity], [NoPay]) VALUES ( 1004, 1004, 80, 80, 80, 80, 80)
INSERT INTO [EmpPayroll].[LeaveManagment] ( [CID], [EmpTID], [Casual], [Annual], [Sick], [Maternity], [NoPay]) VALUES ( 1004, 1005, 80, 80, 80, 80, 80)
INSERT INTO [EmpPayroll].[LeaveManagment] ( [CID], [EmpTID], [Casual], [Annual], [Sick], [Maternity], [NoPay]) VALUES ( 1004, 1006, 80, 80, 80, 80, 80)
INSERT INTO [EmpPayroll].[LeaveManagment] ([CID], [EmpTID], [Casual], [Annual], [Sick], [Maternity], [NoPay]) VALUES ( 1004, 1008, 80, 80, 80, 80, 80)
INSERT INTO [EmpPayroll].[LeaveManagment] ([CID], [EmpTID], [Casual], [Annual], [Sick], [Maternity], [NoPay]) VALUES ( 1004, 1009,80, 80, 80, 80, 80)


UPDATE ApplyJobs 
SET Salary = '35000' ,Status = 'ABC' 
WHERE CID = '1004' AND TEID = '7'

SELECT * FROM Attendance WHERE EmpTID = '1001' and CID = '1004'

SELECT count(*) as EID FROM EmployeeLeaves WHERE EID ='7' 

Select distinct j.*
from JobContractCasual j,Employee e
where e.CompanyID = '1001' and e.EID = j.EID

SELECT distinct e.Ename,j.EID
            FROM JobContractCasual j, Employee e
            WHERE j.EID=e.EID and j.Selected_Jobs= 'System.Web.UI.WebControls.TextBox' and e.CompanyID = '1001'

DECLARE @STOP_TIME DATETIME = '2016-05-10 03:31:00.000',
        @Start_Time DATETIME = '2016-05-10 02:25:34.000'
SELECT 
     RIGHT('0' + CAST(DATEDIFF(S, @Start_Time, @STOP_TIME) / 3600 AS VARCHAR(2)),2) + ':'
   + RIGHT('0' + CAST(DATEDIFF(S, @Start_Time, @STOP_TIME) % 3600/60 AS VARCHAR(2)),2) + ':'
   + RIGHT('0' + CAST(DATEDIFF(S, @Start_Time, @STOP_TIME) % 60 AS VARCHAR(2)),2)
select distinct  Sum(DATEDIFF(HOUR, a.StartTime,a.EndTime))
from Attendance a , Employee e
where a.Date between '2022-01-01' and '2022-01-05' and a.EID = '1020' and a.EID = e.EID

SELECT * FROM Attendance WHERE EID = '1027' AND StartDateTime = '2022-01-19 16:27:12.000'

Create view DateDiff
as 
SELECT distinct convert(varchar(10), a.StartDateTime, 120) as StartDate,convert(varchar(10), a.StartDateTime, 120) as EndDate,e.EID,a.AID
from Attendance a,Employee e
Where a.EID = e.EID

drop view DateDiff

SELECT a.* from Attendance a,DateDiff d     
where a.EID = '1005' AND d.AID=a.AID AND d.StartDate = convert(varchar(10), '2021-12-01  21:17:33.000', 120)

SELECT * FROM Attendance WHERE EID = '1005' AND StartDateTime = convert(varchar(10), '2021-12-01 21:17:33.933', 120)
select convert(varchar(10), '2011-02-25 21:17:33.933', 120) as fff

SELECT DATEDIFF(hour, StartDateTime,EndDateTime) AS DateDiff
from Attendance


SELECT distinct e.EID,e.Ename,c.WorkingDays,COUNT(a.Mark) as WorkedDays,jp.Salary, Sum(DATEDIFF(hour, a.StartDateTime,a.EndDateTime))  as Work_Hours, hd.TotWorkHours*c.WorkingDays as Tot_Work_Hours,c.Company_name, YEAR('2021-12-01') AS Year,DATENAME(MONTH,'2021-12-01') AS Month, jp.Hourly_rate,b.BankName,b.FullName,b.AccountNumber,b.Branck,c.EPF1,C.ETF,e.NopayDays,
            CASE WHEN jp.Salary >= 100000 THEN CAST(((jp.Salary - 1200) * 0 / 100)AS decimal(10, 2))
            WHEN jp.Salary <= 100000 THEN 0
            END AS TaxDeduction, 
            CASE WHEN Count(a.Mark) = c.WorkingDays THEN jp.Salary
            WHEN Count(a.Mark) != c.WorkingDays THEN CAST((Sum(DATEDIFF(HOUR, a.StartDateTime, a.EndDateTime)) * jp.Hourly_rate) AS decimal(10, 2))
            END AS NetPay,
            CASE WHEN Sum(DATEDIFF(HOUR, a.StartDateTime, a.EndDateTime)) - hd.TotWorkHours * c.WorkingDays <= 0 THEN 0 
            WHEN Sum(DATEDIFF(HOUR, a.StartDateTime, a.EndDateTime)) - hd.TotWorkHours * c.WorkingDays >= 1 THEN Sum(DATEDIFF(HOUR, a.StartDateTime, a.EndDateTime)) - hd.TotWorkHours * c.WorkingDays 
            END AS OT,
            CASE WHEN Sum(DATEDIFF(HOUR, a.StartDateTime, a.EndDateTime)) - hd.TotWorkHours * c.WorkingDays <= 0 THEN 0 
            WHEN Sum(DATEDIFF(HOUR, a.StartDateTime, a.EndDateTime)) - hd.TotWorkHours * c.WorkingDays >= 1 THEN(Sum(DATEDIFF(HOUR, a.StartDateTime, a.EndDateTime)) - hd.TotWorkHours * c.WorkingDays) * jp.Hourly_rate 
            END AS OT_Hours 
            FROM DateDiff d, HourDiffTotWorkHours hd, Employee e, Company c, Attendance a, Work w, JobContractPermenent jp,BankDetails b 
            WHERE e.ContractType = 'Permanent' and a.EID = e.EID and e.CompanyID = c.CID And c.CID = '1003' and a.mark = '1' and E.EID = '1005'
            And d.StartDate between '2021-12-01' and '2021-12-30' and a.WID = w.WID AND jp.EID = w.EID AND w.EID = e.EID and e.EID = jp.EID And b.EID = e.EID and hd.EID =  w.EID and d.AID=a.AID 
            group by  e.EID, e.Ename, c.WorkingDays, jp.Salary, hd.TotWorkHours, e.NopayDays, c.Company_name, jp.Hourly_rate,b.BankName,b.FullName,b.AccountNumber,b.Branck,c.EPF1,C.ETF


SELECT distinct rt.RosterID,e.EID,e.Ename,j.Selected_Jobs,p.Payment,e.ContractType,c.Company_name, YEAR('2021-12-01') AS Year,DATENAME(MONTH,'2021-12-01') AS Month, b.BankName,b.FullName,b.AccountNumber,b.Branck,c.EPF1,c.ETF
            FROM JobContract j, Roster r, Employee e, Roster_tracker rt,rosterT t,Payment p,BankDetails b ,Company c
            WHERE e.EID = rt.EID and r.RosterID = rt.RosterID and j.JID=r.JobID and j.JID = t.JID and p.JID = j.JID and j.EID = rt.EID and t.RosterID = rt.RosterID and p.RosterID = rt.RosterID and 
            e.CompanyID = '1003'AND e.EID = '1007' and c.CID = e.CompanyID and b.EID = e.EID and 
           
            e.ContractType = 'Casual' AND rt.PaymentStatus = 'Not Paid'
select * from DateDiff

select distinct a.AID, e.EID,e.Ename,a.StartDateTime,a.EndDateTime
            from Employee e, Attendance a 
            Where a.EID = e.EID and e.CompanyID = '1003' And a.StartDateTime Between '2021-12-01' and  '2021-12-05'  and e.Ename ='Nipuni Gamage'



select distinct e.EID,e.Ename,r.RosterID,r.JLocation,r.Job,r.JobStatus
            from Roster r,Employee e
            Where  e.CompanyID = '1003' And CAST(r.Roster_Cycle AS DATE) = CAST(GETDATE() AS DATE) and r.EID = e.EID
 
SELECT distinct r.*,e.Ename From Roster r,Employee e WHERE 
                     
                      r.EID = e.EID

SELECT distinct r.*,e.Ename From Roster r,Employee e 


Select * 
from AddCompany
FOR JSON AUTO