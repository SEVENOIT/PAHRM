
/****** Object:  Table [AddCompany]    Script Date: 4/21/2022 10:01:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AddCompany](
	[TrackID] [int] IDENTITY(1,1) NOT NULL,
	[Userlevel] [varchar](20) NULL,
	[CompanyReg] [varchar](100) NULL,
	[CompanyName] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[StartDate] [varchar](20) NULL,
	[EndDate] [varchar](20) NULL,
	[EmpPrice] [varchar](20) NULL,
	[Count] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Allowances]    Script Date: 4/21/2022 10:01:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Allowances](
	[AllowancesID] [int] IDENTITY(1,1) NOT NULL,
	[CID] [int] NOT NULL,
	[AllowancesName] [varchar](100) NULL,
	[Amount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[AllowancesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ApplyJobs]    Script Date: 4/21/2022 10:01:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ApplyJobs](
	[TEID] [int] IDENTITY(1,1) NOT NULL,
	[VID] [int] NULL,
	[CID] [varchar](100) NULL,
	[Ename] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Introduction] [varchar](500) NULL,
	[WorkingEx] [varchar](500) NULL,
	[Edu] [varchar](500) NULL,
	[Salary] [varchar](500) NULL,
	[Resume] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Designation] [varchar](100) NULL,
	[Modified] [datetime2](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[TEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AssignRoster]    Script Date: 4/21/2022 10:01:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AssignRoster](
	[AssignID] [int] IDENTITY(1,1) NOT NULL,
	[EID] [varchar](20) NULL,
	[Job] [varchar](50) NOT NULL,
	[JLocation] [varchar](100) NULL,
	[JLocation_lat] [float] NOT NULL,
	[JLocation_longi] [float] NOT NULL,
	[Instructions] [varchar](200) NOT NULL,
	[Special] [binary](1) NULL,
	[Contact] [varchar](20) NOT NULL,
	[Roster_Cycle] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[JobID] [int] NULL,
	[Status] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AssignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Attendance]    Script Date: 4/21/2022 10:01:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Attendance](
	[AID] [int] IDENTITY(1,1) NOT NULL,
	[WID] [int] NULL,
	[EID] [int] NOT NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[Mark] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [BankDetails]    Script Date: 4/21/2022 10:01:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [BankDetails](
	[BID] [int] IDENTITY(1,1) NOT NULL,
	[EID] [int] NULL,
	[BankName] [varchar](50) NOT NULL,
	[FullName] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NULL,
	[Branck] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[BID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Bundles]    Script Date: 4/21/2022 10:01:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Bundles](
	[BID] [int] IDENTITY(1,1) NOT NULL,
	[Bname] [varchar](100) NULL,
	[Btype] [varchar](100) NULL,
	[EmpPrice] [varchar](50) NULL,
	[EmpCount] [int] NULL,
	[Duration] [varchar](100) NULL,
	[Comments] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Business]    Script Date: 4/21/2022 10:01:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Business](
	[BID] [int] IDENTITY(1,1) NOT NULL,
	[Business] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Company]    Script Date: 4/21/2022 10:01:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Company](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[Company_name] [varchar](50) NOT NULL,
	[Country] [varchar](20) NOT NULL,
	[Reg_No] [varchar](20) NOT NULL,
	[Tax] [varchar](20) NULL,
	[Tel] [varchar](20) NOT NULL,
	[CompanyEmail] [varchar](50) NOT NULL,
	[Eaddress] [varchar](50) NOT NULL,
	[Admin_Password] [varchar](8) NOT NULL,
	[Hr_Password] [varchar](8) NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[PayCycle] [varchar](20) NOT NULL,
	[AdminEmail] [varchar](50) NULL,
	[HREmail] [varchar](50) NULL,
	[FinanceEmail] [varchar](50) NULL,
	[OTP] [varchar](20) NULL,
	[Membership] [varchar](50) NULL,
	[StartDate] [varchar](20) NULL,
	[EndDate] [varchar](20) NULL,
	[WorkingDays] [varchar](10) NULL,
	[EPF1] [varchar](10) NULL,
	[EPF2] [varchar](10) NULL,
	[ETF] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ContactUs]    Script Date: 4/21/2022 10:01:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ContactUs](
	[ContacID] [int] IDENTITY(1,1) NOT NULL,
	[EID] [int] NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[ContactNumber] [int] NULL,
	[Message] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [DeclinedRoster]    Script Date: 4/21/2022 10:01:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DeclinedRoster](
	[DID] [int] IDENTITY(1,1) NOT NULL,
	[EID] [varchar](20) NULL,
	[Job] [varchar](50) NOT NULL,
	[JLocation] [varchar](100) NULL,
	[JLocation_lat] [float] NOT NULL,
	[JLocation_longi] [float] NOT NULL,
	[Instructions] [varchar](200) NOT NULL,
	[Special] [binary](1) NULL,
	[Contact] [varchar](20) NOT NULL,
	[Roster_Cycle] [date] NOT NULL,
	[JobStatus] [varchar](20) NULL,
	[JobID] [varchar](20) NULL,
	[StartTime] [varchar](20) NULL,
	[EndTime] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[DID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [EmergencyContact]    Script Date: 4/21/2022 10:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [EmergencyContact](
	[ECID] [int] IDENTITY(1,1) NOT NULL,
	[EID] [int] NULL,
	[Name] [varchar](50) NOT NULL,
	[Contact] [varchar](100) NULL,
	[Relationship] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ECID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Employee]    Script Date: 4/21/2022 10:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Employee](
	[CompanyID] [int] NULL,
	[EID] [int] NOT NULL,
	[Ename] [varchar](50) NOT NULL,
	[DOB] [varchar](50) NOT NULL,
	[Country] [varchar](20) NOT NULL,
	[VisaStatus] [varchar](20) NULL,
	[OtherReasons] [varchar](255) NULL,
	[DriversLicense_NIC] [varchar](20) NULL,
	[Tel] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Eaddress] [varchar](50) NULL,
	[EmployeementType] [varchar](20) NULL,
	[ContractType] [varchar](20) NULL,
	[AvailableDays] [varchar](20) NULL,
	[Epassword] [varchar](20) NULL,
	[Gender] [varchar](20) NULL,
	[Language] [varchar](20) NULL,
	[MaritalStatus] [varchar](20) NULL,
	[Hqualification] [varchar](20) NULL,
	[Qname] [varchar](20) NULL,
	[otherQ] [varchar](500) NULL,
	[bloodGrp] [varchar](10) NULL,
	[specialReq] [varchar](20) NULL,
	[otherReq] [varchar](500) NULL,
	[Leaves] [varchar](50) NULL,
	[NopayDays] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[EID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [EmployeeLeaves]    Script Date: 4/21/2022 10:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [EmployeeLeaves](
	[EmpLeaveID] [int] IDENTITY(1001,1) NOT NULL,
	[LID] [int] NULL,
	[EID] [varchar](50) NULL,
	[Casual] [int] NULL,
	[Annual] [int] NULL,
	[Sick] [int] NULL,
	[Maternity] [int] NULL,
	[NoPay] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpLeaveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [EmployementTypes]    Script Date: 4/21/2022 10:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [EmployementTypes](
	[EmpTID] [int] IDENTITY(1001,1) NOT NULL,
	[Type] [varchar](50) NULL,
	[ContractType] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Industry]    Script Date: 4/21/2022 10:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Industry](
	[IID] [int] IDENTITY(1,1) NOT NULL,
	[BID] [int] NOT NULL,
	[Industry] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [JobContract]    Script Date: 4/21/2022 10:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JobContract](
	[JID] [int] IDENTITY(1,1) NOT NULL,
	[EID] [int] NOT NULL,
	[Selected_Jobs] [varchar](100) NULL,
	[Experiance] [varchar](50) NULL,
	[Hourly_rate] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[JID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [JobContractCasual]    Script Date: 4/21/2022 10:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JobContractCasual](
	[JID] [int] IDENTITY(1,1) NOT NULL,
	[EID] [int] NOT NULL,
	[Selected_Jobs] [varchar](100) NULL,
	[Experiance] [varchar](50) NULL,
	[Hourly_rate] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [JobContractPermenent]    Script Date: 4/21/2022 10:01:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JobContractPermenent](
	[JID] [int] IDENTITY(1,1) NOT NULL,
	[EID] [int] NOT NULL,
	[Designation] [varchar](100) NULL,
	[Experiance] [varchar](50) NULL,
	[Salary] [varchar](50) NULL,
	[Hourly_rate] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [JobContractT]    Script Date: 4/21/2022 10:01:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JobContractT](
	[JID] [int] IDENTITY(1,1) NOT NULL,
	[TEID] [int] NOT NULL,
	[Selected_Jobs] [varchar](100) NULL,
	[Experiance] [varchar](50) NULL,
	[Hourly_rate] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [JobPublish]    Script Date: 4/21/2022 10:01:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JobPublish](
	[PublishID] [int] IDENTITY(1,1) NOT NULL,
	[CID] [varchar](20) NULL,
	[EID] [varchar](20) NULL,
	[Job] [varchar](50) NOT NULL,
	[JLocation] [varchar](100) NULL,
	[JLocation_lat] [float] NOT NULL,
	[JLocation_longi] [float] NOT NULL,
	[Instructions] [varchar](200) NOT NULL,
	[Special] [binary](1) NULL,
	[Contact] [varchar](20) NOT NULL,
	[Roster_Cycle] [date] NOT NULL,
	[JobStatus] [varchar](20) NULL,
	[JobID] [varchar](20) NULL,
	[StartTime] [varchar](20) NULL,
	[EndTime] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[PublishID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Jobs]    Script Date: 4/21/2022 10:01:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Jobs](
	[JobId] [int] IDENTITY(1,1) NOT NULL,
	[JobName] [varchar](max) NOT NULL,
	[Cid] [varchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Leave]    Script Date: 4/21/2022 10:01:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Leave](
	[LID] [int] IDENTITY(1,1) NOT NULL,
	[EID] [int] NOT NULL,
	[Ename] [varchar](100) NULL,
	[Date] [varchar](50) NULL,
	[NumberOfDays] [varchar](50) NULL,
	[Reason] [varchar](500) NULL,
	[Comments] [varchar](500) NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [LeaveManagment]    Script Date: 4/21/2022 10:01:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LeaveManagment](
	[LID] [int] IDENTITY(1001,1) NOT NULL,
	[CID] [int] NULL,
	[EmpTID] [int] NOT NULL,
	[Casual] [int] NULL,
	[Annual] [int] NULL,
	[Sick] [int] NULL,
	[Maternity] [int] NULL,
	[NoPay] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [LeaveManagmentDetails]    Script Date: 4/21/2022 10:01:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LeaveManagmentDetails](
	[LMID] [int] IDENTITY(1001,1) NOT NULL,
	[EID] [int] NOT NULL,
	[EmpName] [varchar](100) NULL,
	[Department] [varchar](50) NULL,
	[Manager] [varchar](50) NULL,
	[LeaveType] [varchar](50) NULL,
	[NoOfDays] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[Reason] [varchar](200) NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [MEmer]    Script Date: 4/21/2022 10:01:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MEmer](
	[EId] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Lat] [varchar](50) NULL,
	[Lng] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [MFace]    Script Date: 4/21/2022 10:01:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MFace](
	[Eid] [varchar](50) NULL,
	[Photo] [varchar](max) NULL,
	[Status] [varchar](max) NULL,
	[Message] [varchar](max) NULL,
	[Pid] [varchar](max) NULL,
	[PGid] [varchar](max) NULL,
	[Faceid] [varchar](max) NULL,
	[Faceuri] [varchar](max) NULL,
	[Faceatt] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [MImage]    Script Date: 4/21/2022 10:01:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MImage](
	[EId] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Time] [varchar](50) NULL,
	[Image1] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [MLog]    Script Date: 4/21/2022 10:01:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MLog](
	[EId] [varchar](50) NULL,
	[Lat] [varchar](50) NULL,
	[Longi] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Time] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [MLogin]    Script Date: 4/21/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MLogin](
	[EId] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Pass] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [OTP]    Script Date: 4/21/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [OTP](
	[TrackID] [int] IDENTITY(1,1) NOT NULL,
	[OTP] [varchar](10) NOT NULL,
	[Userlevel] [varchar](20) NULL,
	[CompanyReg] [varchar](20) NULL,
	[CompanyName] [varchar](20) NULL,
	[StartDate] [varchar](20) NULL,
	[EndDate] [varchar](20) NULL,
	[Price] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[Count] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [PaymentInvoice]    Script Date: 4/21/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PaymentInvoice](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[EID] [varchar](50) NULL,
	[RosterID] [varchar](50) NULL,
	[Ename] [varchar](100) NULL,
	[Job] [varchar](50) NULL,
	[Paycycle] [varchar](20) NULL,
	[WorkedHours] [varchar](20) NULL,
	[HourRate] [varchar](20) NULL,
	[Tax] [varchar](20) NULL,
	[GrossPayment] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Payments]    Script Date: 4/21/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Payments](
	[PID] [int] IDENTITY(1001,1) NOT NULL,
	[EID] [int] NOT NULL,
	[Basic] [int] NOT NULL,
	[Allowances] [int] NOT NULL,
	[Deductions] [int] NOT NULL,
	[NetPay] [int] NULL,
	[ETF3] [int] NULL,
	[EPF8] [int] NULL,
	[EPF12] [int] NULL,
	[Month] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [ReportIncident]    Script Date: 4/21/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ReportIncident](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[EID] [int] NULL,
	[Isinvolved] [varchar](10) NULL,
	[Date] [varchar](20) NULL,
	[Time] [varchar](20) NULL,
	[Location] [varchar](20) NULL,
	[Description] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Resign]    Script Date: 4/21/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Resign](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[EID] [int] NOT NULL,
	[Ename] [varchar](100) NULL,
	[To_] [varchar](100) NULL,
	[From_] [varchar](100) NULL,
	[Subject_] [varchar](100) NULL,
	[Body] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [ResourceFiles]    Script Date: 4/21/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ResourceFiles](
	[CID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ContentType] [nvarchar](200) NULL,
	[Data] [varbinary](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Roster]    Script Date: 4/21/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Roster](
	[RosterID] [int] IDENTITY(1,1) NOT NULL,
	[EID] [varchar](20) NULL,
	[Job] [varchar](50) NOT NULL,
	[JLocation] [varchar](100) NULL,
	[JLocation_lat] [float] NOT NULL,
	[JLocation_longi] [float] NOT NULL,
	[Instructions] [varchar](200) NOT NULL,
	[Special] [binary](1) NULL,
	[Contact] [varchar](20) NOT NULL,
	[Roster_Cycle] [date] NOT NULL,
	[JobStatus] [varchar](20) NULL,
	[JobID] [varchar](20) NULL,
	[StartTime] [varchar](20) NULL,
	[EndTime] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[RosterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Roster_tracker]    Script Date: 4/21/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Roster_tracker](
	[TrackerID] [int] IDENTITY(1,1) NOT NULL,
	[RosterID] [int] NULL,
	[EID] [int] NULL,
	[JLocation] [varchar](100) NULL,
	[JLocation_lat] [varchar](50) NOT NULL,
	[JLocation_longi] [varchar](50) NOT NULL,
	[Start_lat] [varchar](50) NOT NULL,
	[Start_longi] [varchar](50) NOT NULL,
	[End_lat] [varchar](50) NOT NULL,
	[End_longi] [varchar](50) NOT NULL,
	[Start_time] [time](7) NULL,
	[End_time] [time](7) NULL,
	[Sdate] [date] NULL,
	[Edate] [date] NULL,
	[PaymentStatus] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[TrackerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [tblFiles]    Script Date: 4/21/2022 10:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tblFiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ContentType] [nvarchar](200) NULL,
	[Data] [varbinary](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [UploadResume]    Script Date: 4/21/2022 10:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UploadResume](
	[EID] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ContentType] [nvarchar](200) NULL,
	[Data] [varbinary](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Vacancy]    Script Date: 4/21/2022 10:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vacancy](
	[VID] [int] IDENTITY(1,1) NOT NULL,
	[CID] [int] NULL,
	[Cname] [varchar](100) NULL,
	[JobTitle] [varchar](100) NULL,
	[Description] [varchar](500) NULL,
	[Location] [varchar](50) NULL,
	[Position] [varchar](100) NULL,
	[EmployementType] [varchar](50) NULL,
	[ContractType] [varchar](20) NULL,
	[SpecialReq] [varchar](500) NULL,
	[Skills] [varchar](500) NULL,
	[ReqWorkingEx] [varchar](50) NULL,
	[RequredEdu] [varchar](50) NULL,
	[Salary] [varchar](20) NULL,
	[Working_hours] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[VID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Work]    Script Date: 4/21/2022 10:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Work](
	[WID] [int] IDENTITY(1,1) NOT NULL,
	[EID] [int] NOT NULL,
	[Location] [varchar](100) NULL,
	[LocationLat] [varchar](100) NULL,
	[LocationLongi] [varchar](100) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[WID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [rosterT]    Script Date: 4/21/2022 10:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [rosterT] 
as
SELECT distinct (DATEDIFF(MINUTE, rt.Start_time, rt.End_time))/60 as H,DATEDIFF(MINUTE, rt.Start_time, rt.End_time)%60  AS M,rt.EID,rt.PaymentStatus,j.JID,rt.RosterID
FROM Roster_tracker rt, Roster r,JobContract j
Where rt.PaymentStatus = 'Not Paid' and r.RosterID= rt.RosterID and j.JID = r.JobID ;
GO
/****** Object:  View [Payment]    Script Date: 4/21/2022 10:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [Payment]
as 
SELECT distinct
            concat(t.H,'.',t.M) AS WorkedHours,Cast(concat(t.H,'.',t.M) * Cast(j.Hourly_rate as decimal(10,2))as decimal(10,2)) as Payment,j.JID,rt.RosterID
             FROM rosterT t,JobContract j,Roster_tracker rt
where j.JID = t.JID and t.RosterID = rt.RosterID
GO
/****** Object:  View [DateDiff]    Script Date: 4/21/2022 10:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create view [DateDiff]
as 
SELECT distinct convert(varchar(10), a.StartDateTime, 120) as StartDate,convert(varchar(10), a.StartDateTime, 120) as EndDate,e.EID,a.AID
from Attendance a,Employee e
Where a.EID = e.EID
GO
/****** Object:  View [HourDiffTotWorkHours]    Script Date: 4/21/2022 10:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [HourDiffTotWorkHours]
as 
SELECT Distinct Sum(DATEDIFF(HOUR, w.StartTime,w.EndTime))  AS TotWorkHours,e.EID
from Work w, Employee e
Where w.EID = e.EID
group by e.EID
GO
/****** Object:  View [Hourw]    Script Date: 4/21/2022 10:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Hourw] 
as
SELECT RosterID, EID
FROM Roster_tracker
GO
ALTER TABLE [ApplyJobs] ADD  DEFAULT (sysdatetime()) FOR [Modified]
GO
ALTER TABLE [AssignRoster] ADD  DEFAULT ((0)) FOR [JLocation_lat]
GO
ALTER TABLE [AssignRoster] ADD  DEFAULT ((0)) FOR [JLocation_longi]
GO
ALTER TABLE [DeclinedRoster] ADD  DEFAULT ((0)) FOR [JLocation_lat]
GO
ALTER TABLE [DeclinedRoster] ADD  DEFAULT ((0)) FOR [JLocation_longi]
GO
ALTER TABLE [JobPublish] ADD  DEFAULT ((0)) FOR [JLocation_lat]
GO
ALTER TABLE [JobPublish] ADD  DEFAULT ((0)) FOR [JLocation_longi]
GO
ALTER TABLE [Roster] ADD  DEFAULT ((0)) FOR [JLocation_lat]
GO
ALTER TABLE [Roster] ADD  DEFAULT ((0)) FOR [JLocation_longi]
GO
ALTER TABLE [Attendance]  WITH CHECK ADD FOREIGN KEY([WID])
REFERENCES [Work] ([WID])
GO
ALTER TABLE [Employee]  WITH CHECK ADD FOREIGN KEY([CompanyID])
REFERENCES [Company] ([CID])
GO
ALTER TABLE [Industry]  WITH CHECK ADD FOREIGN KEY([BID])
REFERENCES [Business] ([BID])
GO
ALTER TABLE [JobContract]  WITH CHECK ADD FOREIGN KEY([EID])
REFERENCES [Employee] ([EID])
GO
ALTER TABLE [LeaveManagment]  WITH CHECK ADD FOREIGN KEY([EmpTID])
REFERENCES [EmployementTypes] ([EmpTID])
GO
ALTER TABLE [Roster_tracker]  WITH CHECK ADD FOREIGN KEY([RosterID])
REFERENCES [Roster] ([RosterID])
GO
ALTER TABLE [Roster_tracker]  WITH CHECK ADD FOREIGN KEY([EID])
REFERENCES [Employee] ([EID])
GO
ALTER TABLE [Vacancy]  WITH CHECK ADD FOREIGN KEY([CID])
REFERENCES [Company] ([CID])
GO
