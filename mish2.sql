CREATE TABLE Roster
(
EID int IDENTITY(1,1) PRIMARY KEY,
Job varchar(50) NOT NULL,
Instructions varchar(200) NOT NULL,
Special binary ( 1 ),
Contact varchar(20) NOT NULL,
Roster_Cycle Date NOT NULL,
);

select * from Roster