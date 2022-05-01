CREATE TABLE Company
(
CID int IDENTITY(1,1) PRIMARY KEY,
Company_name varchar(50) NOT NULL,
Country varchar(20) NOT NULL,
Reg_No varchar(20) NOT NULL,
ABN_ACN varchar(20) NULL,
Tel varchar(20) NOT NULL,
Email varchar(50) NOT NULL,
Eaddress varchar(50) NOT NULL,
City varchar(50) NOT NULL,
eState_Province varchar(50) NOT NULL,
Admin_Password varchar(8) NOT NULL,
Hr_Password varchar(8) NOT NULL,
Job_Preferences  varchar(20) NOT NULL,
Hourly_Rate varchar(10) NOT NULL,
Description varchar(200) NOT NULL,
PayCycle varchar(20) NOT NULL,
);






select * from Company

select * from JobContract

select * from MImage

select e.EID,j.Selected_Jobs
from JobContract j,Employee e
where e.EID=j.EID

DELETE FROM JobContract

DELETE FROM Employee