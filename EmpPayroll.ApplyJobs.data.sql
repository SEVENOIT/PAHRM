SET IDENTITY_INSERT [EmpPayroll].[ApplyJobs] ON
INSERT INTO [EmpPayroll].[ApplyJobs] ([TEID], [VID], [CID], [Ename], [Email], [Introduction], [WorkingEx], [Edu], [Salary], [Resume], [Status], [Designation]) VALUES (15, 5, N'1001', N'Mishane', N'mishane1998@gmail.com', N'fgfdsfdsd', N'dsfdfds', N'dsfdsfdsf', N'30000', NULL, N'Pending', N'Rider')
SET IDENTITY_INSERT [EmpPayroll].[ApplyJobs] OFF

delete from ApplyJobs 
where TEID = 15
