USE [Library]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 4/21/2020 1:59:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Book]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Book](
	[bookNumber] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[authors] [nvarchar](50) NULL,
	[publisher] [nvarchar](50) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[bookNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Borrower]    Script Date: 4/21/2020 1:59:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Borrower]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Borrower](
	[borrowerNumber] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[sex] [char](1) NULL,
	[address] [nvarchar](50) NULL,
	[telephone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Borrower] PRIMARY KEY CLUSTERED 
(
	[borrowerNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CirculatedCopy]    Script Date: 4/21/2020 1:59:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CirculatedCopy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CirculatedCopy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[copyNumber] [int] NOT NULL,
	[borrowerNumber] [int] NOT NULL,
	[borrowedDate] [datetime] NOT NULL,
	[dueDate] [datetime] NULL,
	[returnedDate] [datetime] NULL,
	[fineAmount] [float] NULL,
 CONSTRAINT [PK_CirculatedCopy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Copy]    Script Date: 4/21/2020 1:59:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Copy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Copy](
	[copyNumber] [int] IDENTITY(1,1) NOT NULL,
	[bookNumber] [int] NOT NULL,
	[sequenceNumber] [int] NOT NULL,
	[type] [char](1) NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_Copy] PRIMARY KEY CLUSTERED 
(
	[copyNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 4/21/2020 1:59:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reservation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[borrowerNumber] [int] NOT NULL,
	[bookNumber] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[status] [char](1) NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (2, N't2', N'a2', N'p2')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (3, N't3', N'a3', N'p3')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (7, N't7', N'a7', N'p7')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (10, N'Test', N'Andrew', N'Pub')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (11, N't12', N't12', N't12')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (12, N'', N'', N'')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (15, N'12', N'12', N'12')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (16, N'123 danh roi nhip', N'Phan Anh', N'CucCoperation')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (51, N'Hello World Is Fukcu', N'123', N'123')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (52, N't100', N'a99', N'')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (53, N'Hello World Is Fukcu', N'123', N'123')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (55, N'xxx', N'123', N'1')
INSERT [dbo].[Book] ([bookNumber], [title], [authors], [publisher]) VALUES (56, N'Hello World Is Fukcu', N'123', N'123')
SET IDENTITY_INSERT [dbo].[Book] OFF
SET IDENTITY_INSERT [dbo].[Borrower] ON 

INSERT [dbo].[Borrower] ([borrowerNumber], [name], [sex], [address], [telephone], [email]) VALUES (1, N'Huong', N'F', N'', N'', N'')
INSERT [dbo].[Borrower] ([borrowerNumber], [name], [sex], [address], [telephone], [email]) VALUES (2, N'Kien', N'M', N'a2', N't2', N'e2')
INSERT [dbo].[Borrower] ([borrowerNumber], [name], [sex], [address], [telephone], [email]) VALUES (3, N'Hoa', N'F', N'', N'', N'')
INSERT [dbo].[Borrower] ([borrowerNumber], [name], [sex], [address], [telephone], [email]) VALUES (5, N'Cuc', N'F', N'Le Van Huu', N'0911285253', N'anhthphe130193@fpt.edu.vn')
INSERT [dbo].[Borrower] ([borrowerNumber], [name], [sex], [address], [telephone], [email]) VALUES (8, N'12', N'M', N'1', N'1', N'')
INSERT [dbo].[Borrower] ([borrowerNumber], [name], [sex], [address], [telephone], [email]) VALUES (9, N'12', N'M', N'1', N'1', N'')
SET IDENTITY_INSERT [dbo].[Borrower] OFF
SET IDENTITY_INSERT [dbo].[CirculatedCopy] ON 

INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (8, 1, 1, CAST(N'2013-10-02T00:00:00.000' AS DateTime), CAST(N'2013-10-16T00:00:00.000' AS DateTime), CAST(N'2013-10-22T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (9, 1, 1, CAST(N'2013-10-02T00:00:00.000' AS DateTime), CAST(N'2013-10-16T00:00:00.000' AS DateTime), CAST(N'2013-10-23T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (10, 2, 1, CAST(N'2013-10-02T00:00:00.000' AS DateTime), CAST(N'2013-10-16T00:00:00.000' AS DateTime), CAST(N'2013-10-22T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (11, 2, 3, CAST(N'2013-10-03T00:00:00.000' AS DateTime), CAST(N'2013-10-17T00:00:00.000' AS DateTime), CAST(N'2017-06-14T00:00:00.000' AS DateTime), 1336)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (15, 1, 1, CAST(N'2013-10-03T00:00:00.000' AS DateTime), CAST(N'2013-10-17T00:00:00.000' AS DateTime), CAST(N'2013-10-23T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (16, 1, 1, CAST(N'2013-10-03T00:00:00.000' AS DateTime), CAST(N'2013-10-17T00:00:00.000' AS DateTime), CAST(N'2013-10-23T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (22, 1, 1, CAST(N'2013-10-03T00:00:00.000' AS DateTime), CAST(N'2013-10-17T00:00:00.000' AS DateTime), CAST(N'2013-10-24T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (24, 1, 1, CAST(N'2013-10-05T00:00:00.000' AS DateTime), CAST(N'2013-10-19T00:00:00.000' AS DateTime), CAST(N'2013-10-25T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (54, 1, 2, CAST(N'2020-03-14T00:00:00.000' AS DateTime), CAST(N'2020-03-28T00:00:00.000' AS DateTime), CAST(N'2020-03-14T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (55, 1, 2, CAST(N'2020-03-14T00:00:00.000' AS DateTime), CAST(N'2020-03-28T00:00:00.000' AS DateTime), CAST(N'2020-03-14T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (56, 1, 2, CAST(N'2020-03-14T00:00:00.000' AS DateTime), CAST(N'2020-03-28T00:00:00.000' AS DateTime), CAST(N'2020-03-26T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (63, 1, 3, CAST(N'2020-03-12T00:00:00.000' AS DateTime), CAST(N'2020-03-26T00:00:00.000' AS DateTime), CAST(N'2020-03-26T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (65, 1, 3, CAST(N'2020-03-13T00:00:00.000' AS DateTime), CAST(N'2020-03-27T00:00:00.000' AS DateTime), CAST(N'2020-03-29T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (68, 1, 3, CAST(N'2020-03-12T00:00:00.000' AS DateTime), CAST(N'2020-03-26T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (76, 2, 2, CAST(N'2020-03-30T00:00:00.000' AS DateTime), CAST(N'2020-04-13T00:00:00.000' AS DateTime), CAST(N'2020-04-30T00:00:00.000' AS DateTime), 17)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (77, 1, 2, CAST(N'2020-03-31T00:00:00.000' AS DateTime), CAST(N'2020-04-14T00:00:00.000' AS DateTime), CAST(N'2020-04-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (78, 2, 3, CAST(N'2020-03-27T00:00:00.000' AS DateTime), CAST(N'2020-04-10T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (79, 1, 3, CAST(N'2020-03-26T00:00:00.000' AS DateTime), CAST(N'2020-04-09T00:00:00.000' AS DateTime), CAST(N'2020-03-30T16:02:33.227' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (80, 62, 2, CAST(N'2020-03-10T00:00:00.000' AS DateTime), CAST(N'2020-03-24T00:00:00.000' AS DateTime), CAST(N'2020-03-18T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (81, 40, 3, CAST(N'2020-03-19T00:00:00.000' AS DateTime), CAST(N'2020-04-02T00:00:00.000' AS DateTime), CAST(N'2020-03-30T16:03:13.603' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (82, 41, 3, CAST(N'2020-03-11T00:00:00.000' AS DateTime), CAST(N'2020-03-25T00:00:00.000' AS DateTime), CAST(N'2020-03-30T16:04:23.097' AS DateTime), 5)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (83, 42, 3, CAST(N'2020-03-11T00:00:00.000' AS DateTime), CAST(N'2020-03-25T00:00:00.000' AS DateTime), CAST(N'2020-03-30T16:04:23.097' AS DateTime), 5)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (84, 60, 2, CAST(N'2020-03-26T00:00:00.000' AS DateTime), CAST(N'2020-04-09T00:00:00.000' AS DateTime), CAST(N'2020-03-30T15:35:39.097' AS DateTime), 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (85, 60, 1, CAST(N'2020-03-30T15:36:37.290' AS DateTime), CAST(N'2020-04-13T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[CirculatedCopy] ([ID], [copyNumber], [borrowerNumber], [borrowedDate], [dueDate], [returnedDate], [fineAmount]) VALUES (86, 43, 1, CAST(N'2020-03-31T00:00:00.000' AS DateTime), CAST(N'2020-04-14T00:00:00.000' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[CirculatedCopy] OFF
SET IDENTITY_INSERT [dbo].[Copy] ON 

INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (1, 2, 1, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (2, 2, 2, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (38, 10, 1, N'A', 1)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (40, 10, 2, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (41, 10, 3, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (42, 10, 4, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (43, 10, 5, N'B', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (46, 10, 8, N'A', 0)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (51, 10, 9, N'A', 2)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (60, 15, 1, N'B', 1)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (61, 11, 1, N'A', 2)
INSERT [dbo].[Copy] ([copyNumber], [bookNumber], [sequenceNumber], [type], [price]) VALUES (62, 7, 2, N'A', 1000)
SET IDENTITY_INSERT [dbo].[Copy] OFF
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (18, 3, 2, CAST(N'2020-03-30T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (19, 2, 2, CAST(N'2020-03-31T00:00:00.000' AS DateTime), N'R')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (20, 3, 7, CAST(N'2020-03-28T00:00:00.000' AS DateTime), N'R')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (28, 5, 7, CAST(N'2020-03-26T00:00:00.000' AS DateTime), N'R')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (29, 1, 15, CAST(N'2020-03-26T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (30, 9, 15, CAST(N'2020-03-30T15:35:12.407' AS DateTime), N'R')
INSERT [dbo].[Reservation] ([ID], [borrowerNumber], [bookNumber], [date], [status]) VALUES (31, 1, 3, CAST(N'2020-03-31T00:00:00.000' AS DateTime), N'R')
SET IDENTITY_INSERT [dbo].[Reservation] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CirculatedCopy_Borrower]') AND parent_object_id = OBJECT_ID(N'[dbo].[CirculatedCopy]'))
ALTER TABLE [dbo].[CirculatedCopy]  WITH CHECK ADD  CONSTRAINT [FK_CirculatedCopy_Borrower] FOREIGN KEY([borrowerNumber])
REFERENCES [dbo].[Borrower] ([borrowerNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CirculatedCopy_Borrower]') AND parent_object_id = OBJECT_ID(N'[dbo].[CirculatedCopy]'))
ALTER TABLE [dbo].[CirculatedCopy] CHECK CONSTRAINT [FK_CirculatedCopy_Borrower]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CirculatedCopy_Copy]') AND parent_object_id = OBJECT_ID(N'[dbo].[CirculatedCopy]'))
ALTER TABLE [dbo].[CirculatedCopy]  WITH CHECK ADD  CONSTRAINT [FK_CirculatedCopy_Copy] FOREIGN KEY([copyNumber])
REFERENCES [dbo].[Copy] ([copyNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CirculatedCopy_Copy]') AND parent_object_id = OBJECT_ID(N'[dbo].[CirculatedCopy]'))
ALTER TABLE [dbo].[CirculatedCopy] CHECK CONSTRAINT [FK_CirculatedCopy_Copy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Copy_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[Copy]'))
ALTER TABLE [dbo].[Copy]  WITH CHECK ADD  CONSTRAINT [FK_Copy_Book] FOREIGN KEY([bookNumber])
REFERENCES [dbo].[Book] ([bookNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Copy_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[Copy]'))
ALTER TABLE [dbo].[Copy] CHECK CONSTRAINT [FK_Copy_Book]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservation_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservation]'))
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Book] FOREIGN KEY([bookNumber])
REFERENCES [dbo].[Book] ([bookNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservation_Book]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservation]'))
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Book]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservation_Borrower]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservation]'))
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Borrower] FOREIGN KEY([borrowerNumber])
REFERENCES [dbo].[Borrower] ([borrowerNumber])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservation_Borrower]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservation]'))
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Borrower]
GO
