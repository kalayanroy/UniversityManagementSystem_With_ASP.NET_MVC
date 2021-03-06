USE [master]
GO
/****** Object:  Database [UniversitySystem]    Script Date: 9/25/2018 7:20:53 PM ******/
CREATE DATABASE [UniversitySystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversitySystem', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversitySystem.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversitySystem_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversitySystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversitySystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversitySystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversitySystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversitySystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversitySystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversitySystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversitySystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversitySystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversitySystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversitySystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversitySystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversitySystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversitySystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversitySystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversitySystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversitySystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversitySystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversitySystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversitySystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversitySystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversitySystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversitySystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversitySystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversitySystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversitySystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversitySystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversitySystem] SET  MULTI_USER 
GO
ALTER DATABASE [UniversitySystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversitySystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversitySystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversitySystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversitySystem]
GO
/****** Object:  Table [dbo].[AllocateClassrooms]    Script Date: 9/25/2018 7:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllocateClassrooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[FromTime] [datetime] NOT NULL,
	[ToTime] [datetime] NOT NULL,
	[Action] [int] NOT NULL,
 CONSTRAINT [PK_AllocateClassrooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AutoId]    Script Date: 9/25/2018 7:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AutoId](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[Date] [datetime2](7) NULL,
 CONSTRAINT [PK_test] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 9/25/2018 7:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Credit] [float] NOT NULL,
	[Descrition] [varchar](250) NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssign]    Script Date: 9/25/2018 7:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourseAssign](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherId] [int] NULL,
	[CourseCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CourseAssign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Day]    Script Date: 9/25/2018 7:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Day](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Day] [varchar](50) NULL,
 CONSTRAINT [PK_Day] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/25/2018 7:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](100) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_SaveDepartment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 9/25/2018 7:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Designation] [varchar](50) NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollCourse]    Script Date: 9/25/2018 7:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrollCourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationNo] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_EnrollCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GradeLetter]    Script Date: 9/25/2018 7:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GradeLetter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GradeLetter] [varchar](50) NULL,
 CONSTRAINT [PK_GradeLetter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 9/25/2018 7:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 9/25/2018 7:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester](
	[Id] [int] NOT NULL,
	[Semester] [varchar](100) NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 9/25/2018 7:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Date] [date] NULL,
	[Address] [varchar](150) NULL,
	[DepartmentId] [int] NULL,
	[RegistrationNo] [varchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 9/25/2018 7:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationNo] [varchar](50) NOT NULL,
	[CourseId] [int] NOT NULL,
	[GradeLetterId] [int] NOT NULL,
 CONSTRAINT [PK_StudentResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 9/25/2018 7:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CreditToken] [float] NOT NULL,
	[ReminingCredit] [float] NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AllocateClassrooms] ON 

INSERT [dbo].[AllocateClassrooms] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Action]) VALUES (7, 2, 4, 1, 1, CAST(0x0000A96400A4CB80 AS DateTime), CAST(0x0000A96400B54640 AS DateTime), 1)
INSERT [dbo].[AllocateClassrooms] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Action]) VALUES (8, 2, 4, 2, 1, CAST(0x0000A96400A4CB80 AS DateTime), CAST(0x0000A96400BD83A0 AS DateTime), 1)
INSERT [dbo].[AllocateClassrooms] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Action]) VALUES (9, 2, 4, 3, 1, CAST(0x0000A964009450C0 AS DateTime), CAST(0x0000A96400BD83A0 AS DateTime), 1)
INSERT [dbo].[AllocateClassrooms] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Action]) VALUES (10, 2, 1, 1, 1, CAST(0x0000A96500A4CB80 AS DateTime), CAST(0x0000A96500B54640 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AllocateClassrooms] OFF
SET IDENTITY_INSERT [dbo].[AutoId] ON 

INSERT [dbo].[AutoId] ([Id], [name], [Date]) VALUES (1, N'kalyan', CAST(0x070000000000B53E0B AS DateTime2))
SET IDENTITY_INSERT [dbo].[AutoId] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId]) VALUES (1, N'CSE-11', N'CSE', 3, N'Well Done', 2, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId]) VALUES (4, N'EEE-10', N'EEE', 3, N'Well', 2, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId]) VALUES (5, N'ET-10', N'ET', 2, N'Well', 3, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId]) VALUES (8, N'AB', N'AB', 2.5, N'wel', 3, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId]) VALUES (9, N'abc-001', N'ICT', 3, N'well', 3, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId]) VALUES (10, N'abc-002', N'CT', 4, N'good', 3, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId]) VALUES (11, N'abc-003', N'kljdg', 4, N'good', 1004, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId]) VALUES (13, N'ICTPC-301', N'Android Mobile Appication Development', 4, N'Developing a fully automated mobile application in the Android platform is a challenging and passionate task.', 1003, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId]) VALUES (15, N'ICTPC-302', N'Web Appication Development', 4, N'Developing a fully integrated and automated website is a challenging and passionate task. ', 1003, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId]) VALUES (18, N'ICTPC-304', N'Fundamentals of Object Oriented', 3, N'The fundamentals of object oriented programming in java', 1003, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId]) VALUES (19, N'Bng-101', N'Bangla Grammer', 5, N'Well', 2006, 1)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CourseAssign] ON 

INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (2, 2, 2, N'4')
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (5, 2, 2, N'1')
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (6, 2, 2, N'5')
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (7, 1003, 1, N'4')
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (8, 1003, 1, N'5')
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (9, 1003, 6, N'1')
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (10, 1003, 5, N'15')
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (11, 2, 3, N'4')
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (12, 2, 6, N'4')
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (13, 2006, 10, N'19')
SET IDENTITY_INSERT [dbo].[CourseAssign] OFF
SET IDENTITY_INSERT [dbo].[Day] ON 

INSERT [dbo].[Day] ([Id], [Day]) VALUES (7, N'Firday')
INSERT [dbo].[Day] ([Id], [Day]) VALUES (3, N'Monday')
INSERT [dbo].[Day] ([Id], [Day]) VALUES (1, N'Saturday')
INSERT [dbo].[Day] ([Id], [Day]) VALUES (2, N'Sunday')
INSERT [dbo].[Day] ([Id], [Day]) VALUES (6, N'Thursday')
INSERT [dbo].[Day] ([Id], [Day]) VALUES (4, N'Tuesday')
INSERT [dbo].[Day] ([Id], [Day]) VALUES (5, N'Wednessday')
SET IDENTITY_INSERT [dbo].[Day] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1, N'csc-001', N'CSC')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2, N'EEE-001', N'EEE')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (3, N'ET-001', N'ET')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1003, N'CSE-101', N'CSE')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1004, N'MT-101', N'MT')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2002, N'EET-001', N'EET')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2003, N'abc', N'ICT')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2004, N'Phy', N' Physics')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2005, N'Phy-1', N'Physics')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2006, N'Bng', N'Bangla')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([Id], [Designation]) VALUES (1, N'Professor')
INSERT [dbo].[Designation] ([Id], [Designation]) VALUES (2, N'Principal')
INSERT [dbo].[Designation] ([Id], [Designation]) VALUES (3, N'Lecturer')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[EnrollCourse] ON 

INSERT [dbo].[EnrollCourse] ([Id], [RegistrationNo], [CourseId], [Date]) VALUES (1, 3, 9, CAST(0x363E0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [RegistrationNo], [CourseId], [Date]) VALUES (2, 1, 10, CAST(0xBD3E0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [RegistrationNo], [CourseId], [Date]) VALUES (3, 3, 8, CAST(0xBD3E0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [RegistrationNo], [CourseId], [Date]) VALUES (4, 18, 13, CAST(0xBF3E0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [RegistrationNo], [CourseId], [Date]) VALUES (5, 14, 9, CAST(0xC13E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[EnrollCourse] OFF
SET IDENTITY_INSERT [dbo].[GradeLetter] ON 

INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (1, N'A+')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (2, N'A')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (3, N'A-')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (4, N'B+')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (5, N'B')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (6, N'B-')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (7, N'C+')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (8, N'C')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (9, N'C-')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (10, N'D+')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (11, N'D')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (12, N'D-')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (13, N'F')
SET IDENTITY_INSERT [dbo].[GradeLetter] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (1, N'Room-101')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (2, N'Room-102')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (3, N'Room-103')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (4, N'Room-104')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (5, N'Room-105')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (6, N'Room-106')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (7, N'Room-107')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (8, N'Room-108')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (9, N'Room-109')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (10, N'Room-110')
SET IDENTITY_INSERT [dbo].[Room] OFF
INSERT [dbo].[Semester] ([Id], [Semester]) VALUES (1, N'1st')
INSERT [dbo].[Semester] ([Id], [Semester]) VALUES (2, N'2nd')
INSERT [dbo].[Semester] ([Id], [Semester]) VALUES (3, N'3rd')
INSERT [dbo].[Semester] ([Id], [Semester]) VALUES (4, N'4th')
INSERT [dbo].[Semester] ([Id], [Semester]) VALUES (5, N'5th')
INSERT [dbo].[Semester] ([Id], [Semester]) VALUES (6, N'6th')
INSERT [dbo].[Semester] ([Id], [Semester]) VALUES (7, N'7th')
INSERT [dbo].[Semester] ([Id], [Semester]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Name], [Email], [Contact], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (1, N'rakib', N'rakib123@gmail.com', N'01836129318', CAST(0xB93E0B00 AS Date), N'450/a', 1, N'CSE-2018-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contact], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (2, N'admin', N'admin@gmail.com', N'018234234', CAST(0x493C0B00 AS Date), N'muradpur', 2, N'ET-2018-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contact], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (3, N'sajib', N'sajib@gmail.com', N'01823523524', CAST(0xDB3A0B00 AS Date), N'hathazari', 3, N'MT-2018-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contact], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (5, N'sanjoy', N'sanjoy@gmail.com', N'0182324235', CAST(0xC53C0B00 AS Date), N'khiram', 2, N'EEE-2018-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contact], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (7, N'choton', N'choton', N'018145244', CAST(0x8E390B00 AS Date), N'khiram', 2, N'EEE-2018-003')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contact], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (9, N'purabi', N'purabi@yahoo.com', N'0186436126', CAST(0x953D0B00 AS Date), N'khiram', 3, N'ET-2017-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contact], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (11, N'salauddi', N'salauddin@gmail.com', N'01832453465', CAST(0xBC3E0B00 AS Date), N'muradpur', 1003, N'CSE-2018-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contact], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (12, N'rajib', N'rajib@gmail.com', N'018456950', CAST(0xBA3E0B00 AS Date), N'hathazari', 1004, N'MT-2018-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contact], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (14, N'popy', N'popy@gmail.com', N'01835346355', CAST(0xAB3E0B00 AS Date), N'dider market', 1004, N'MT-2018-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contact], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (17, N'pop', N'pop@gmail.com', N'03252345456', CAST(0xB23E0B00 AS Date), N'muradpur', 1003, N'CSE-2018-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contact], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (18, N'Sanu', N'sanju@gmail.com', N'01823242312', CAST(0xB23E0B00 AS Date), N'muradpur', 2005, N'Physics-2018-001')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentResult] ON 

INSERT [dbo].[StudentResult] ([Id], [RegistrationNo], [CourseId], [GradeLetterId]) VALUES (3, N'1', 9, 1)
INSERT [dbo].[StudentResult] ([Id], [RegistrationNo], [CourseId], [GradeLetterId]) VALUES (4, N'3', 9, 1)
INSERT [dbo].[StudentResult] ([Id], [RegistrationNo], [CourseId], [GradeLetterId]) VALUES (5, N'3', 8, 1)
SET IDENTITY_INSERT [dbo].[StudentResult] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToken], [ReminingCredit]) VALUES (1, N'kalyan', N'450/a momin road', N'kalyan@gmail.com', N'01836129318', 1, 1003, 40, 35)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToken], [ReminingCredit]) VALUES (2, N'Rakib', N'muradpur', N'rakib@gmail.com', N'+880182345623', 2, 2, 30, 22)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToken], [ReminingCredit]) VALUES (3, N'rajib', N'hathazri', N'rajib@gmail.com', N'084523545', 1, 2, 50.5, 47.5)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToken], [ReminingCredit]) VALUES (4, N'habib', N'NULLhabib', N'h@gmail.com', N'212212', 1, 2, 20, 20)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToken], [ReminingCredit]) VALUES (5, N'abir', N'muradpur', N'abir@gmail.com', N'01821324235', 3, 1003, 30, 26)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToken], [ReminingCredit]) VALUES (6, N'ovi', N'khiram', N'ovi@yahoo.com', N'01823453461', 2, 2, 40, 34)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToken], [ReminingCredit]) VALUES (7, N'Bismadeb Chowdhury', N'Dhaka', N'bdarpi@yahoo.com', N'01715547113', 1, 2006, 50, 50)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToken], [ReminingCredit]) VALUES (8, N'Soumitra Sekhar Dey', N'Dhaka', N'scpcdu@gmail.com', N'+8801732102103', 1, 2006, 45, 45)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToken], [ReminingCredit]) VALUES (9, N'Sohana Mahboob', N'Dhaka', N'sohanamhb@yahoo.com', N'+8801737154663', 3, 2004, 40, 40)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToken], [ReminingCredit]) VALUES (10, N'Sanju', N'Khulna', N'abc@gmail.com', N'01823523524', 2, 2006, 10, 5)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Course]    Script Date: 9/25/2018 7:20:53 PM ******/
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [IX_Course] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Course_1]    Script Date: 9/25/2018 7:20:53 PM ******/
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [IX_Course_1] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Day]    Script Date: 9/25/2018 7:20:53 PM ******/
ALTER TABLE [dbo].[Day] ADD  CONSTRAINT [IX_Day] UNIQUE NONCLUSTERED 
(
	[Day] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SaveDepartment]    Script Date: 9/25/2018 7:20:53 PM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [IX_SaveDepartment] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SaveDepartment_1]    Script Date: 9/25/2018 7:20:53 PM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [IX_SaveDepartment_1] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Table_1]    Script Date: 9/25/2018 7:20:53 PM ******/
ALTER TABLE [dbo].[Room] ADD  CONSTRAINT [IX_Table_1] UNIQUE NONCLUSTERED 
(
	[RoomCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Student]    Script Date: 9/25/2018 7:20:53 PM ******/
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [IX_Student] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Teacher]    Script Date: 9/25/2018 7:20:53 PM ******/
ALTER TABLE [dbo].[Teacher] ADD  CONSTRAINT [IX_Teacher] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Course] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Course]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Semester] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semester] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Semester]
GO
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_CourseAssign_Department]
GO
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_CourseAssign_Teacher]
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[EnrollCourse] CHECK CONSTRAINT [FK_EnrollCourse_Course]
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse_Student] FOREIGN KEY([RegistrationNo])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[EnrollCourse] CHECK CONSTRAINT [FK_EnrollCourse_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Course]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_GradeLetter] FOREIGN KEY([GradeLetterId])
REFERENCES [dbo].[GradeLetter] ([Id])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_GradeLetter]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Department]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Designation]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Teacher] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Teacher]
GO
USE [master]
GO
ALTER DATABASE [UniversitySystem] SET  READ_WRITE 
GO
