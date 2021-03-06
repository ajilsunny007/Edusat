USE [master]
GO
/****** Object:  Database [edusat]    Script Date: 9/26/2016 8:06:48 AM ******/
CREATE DATABASE [edusat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'edusat', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\edusat.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'edusat_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\edusat_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [edusat] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [edusat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [edusat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [edusat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [edusat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [edusat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [edusat] SET ARITHABORT OFF 
GO
ALTER DATABASE [edusat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [edusat] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [edusat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [edusat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [edusat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [edusat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [edusat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [edusat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [edusat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [edusat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [edusat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [edusat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [edusat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [edusat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [edusat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [edusat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [edusat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [edusat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [edusat] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [edusat] SET  MULTI_USER 
GO
ALTER DATABASE [edusat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [edusat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [edusat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [edusat] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'edusat', N'ON'
GO
USE [edusat]
GO
/****** Object:  Table [dbo].[tbl_course]    Script Date: 9/26/2016 8:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_course](
	[courseid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [varchar](50) NULL,
	[duration] [varchar](50) NULL,
	[class_type] [varchar](50) NULL,
	[fees] [float] NULL,
	[category] [varchar](50) NULL,
	[sem_count] [varchar](50) NULL,
	[abbrev] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_course] PRIMARY KEY CLUSTERED 
(
	[courseid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_course_classification]    Script Date: 9/26/2016 8:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_course_classification](
	[classid] [int] NULL,
	[class] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_exam_score]    Script Date: 9/26/2016 8:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_exam_score](
	[examid] [int] IDENTITY(1,1) NOT NULL,
	[exdate] [datetime] NULL,
	[score] [int] NULL,
	[rate] [int] NULL,
	[username] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_exam_score] PRIMARY KEY CLUSTERED 
(
	[examid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_login]    Script Date: 9/26/2016 8:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_login](
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[usertypeid] [int] NULL,
 CONSTRAINT [PK_tbl_login] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_note]    Script Date: 9/26/2016 8:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_note](
	[note_id] [int] IDENTITY(1,1) NOT NULL,
	[uploaded_by] [varchar](50) NULL,
	[uploaded_on] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[subject_id] [int] NULL,
	[type] [varchar](50) NULL,
	[preference] [varchar](50) NULL,
	[topic] [varchar](max) NULL,
	[note_path] [varchar](max) NULL,
	[image_file] [varchar](max) NULL,
	[download_type] [varchar](50) NULL,
	[rate] [float] NULL,
 CONSTRAINT [PK_tbl_note] PRIMARY KEY CLUSTERED 
(
	[note_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_note_pref]    Script Date: 9/26/2016 8:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_note_pref](
	[npid] [int] IDENTITY(1,1) NOT NULL,
	[preference] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_note-pref] PRIMARY KEY CLUSTERED 
(
	[npid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_options]    Script Date: 9/26/2016 8:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_options](
	[optid] [int] IDENTITY(1,1) NOT NULL,
	[optn] [varchar](50) NULL,
	[questionid] [int] NULL,
 CONSTRAINT [PK_tbl_options] PRIMARY KEY CLUSTERED 
(
	[optid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_qstnpaper]    Script Date: 9/26/2016 8:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_qstnpaper](
	[qstnid] [int] IDENTITY(1,1) NOT NULL,
	[subjectid] [int] NULL,
	[qstn_name] [varchar](max) NULL,
	[year] [int] NULL,
	[semester] [varchar](10) NULL,
	[setnum] [int] NULL,
	[filepath] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_question]    Script Date: 9/26/2016 8:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_question](
	[qstnid] [int] IDENTITY(1,1) NOT NULL,
	[qstn] [varchar](max) NULL,
	[subjectid] [int] NULL,
	[answer] [varchar](max) NULL,
 CONSTRAINT [PK_tbl_question] PRIMARY KEY CLUSTERED 
(
	[qstnid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_sem_category]    Script Date: 9/26/2016 8:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_sem_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_seminars]    Script Date: 9/26/2016 8:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_seminars](
	[seminarid] [int] IDENTITY(1,1) NOT NULL,
	[topic] [varchar](max) NULL,
	[description] [varchar](max) NULL,
	[img] [varchar](max) NULL,
	[abstractfile] [varchar](max) NULL,
	[uploadedby] [varchar](50) NULL,
	[status] [int] NULL,
	[uploadedon] [varchar](50) NULL,
	[catid] [int] NULL,
	[type] [varchar](50) NULL,
	[rate] [float] NULL,
 CONSTRAINT [PK_tbl_seminars] PRIMARY KEY CLUSTERED 
(
	[seminarid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_subject]    Script Date: 9/26/2016 8:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_subject](
	[subid] [int] IDENTITY(1,1) NOT NULL,
	[subname] [varchar](50) NULL,
	[courseid] [int] NULL,
	[sem] [int] NULL,
 CONSTRAINT [PK_tbl_subject] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_syllabus]    Script Date: 9/26/2016 8:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_syllabus](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[courseid] [int] NULL,
	[semester] [varchar](5) NULL,
	[spath] [varchar](max) NULL,
	[upload_date] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_syllabus] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 9/26/2016 8:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_user](
	[regid] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[phno] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[experiance] [varchar](50) NULL,
	[courseid] [int] NULL,
	[qualification] [int] NULL,
	[reg_date] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_teacher] PRIMARY KEY CLUSTERED 
(
	[regid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_usertype]    Script Date: 9/26/2016 8:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_usertype](
	[typeid] [int] IDENTITY(1,1) NOT NULL,
	[usertype] [varchar](10) NULL,
 CONSTRAINT [PK_tbl_usertype] PRIMARY KEY CLUSTERED 
(
	[typeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[textchat]    Script Date: 9/26/2016 8:06:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[textchat](
	[chatid] [int] IDENTITY(1,1) NOT NULL,
	[msg] [varchar](max) NULL,
	[course] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[chatdate] [datetime] NULL,
 CONSTRAINT [PK_textchat] PRIMARY KEY CLUSTERED 
(
	[chatid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_course] ON 

INSERT [dbo].[tbl_course] ([courseid], [cname], [duration], [class_type], [fees], [category], [sem_count], [abbrev]) VALUES (1, N'Master of Computer Application', N'3', N'Post Graduation', 50000, N'Semester', N'6', N'MCA')
INSERT [dbo].[tbl_course] ([courseid], [cname], [duration], [class_type], [fees], [category], [sem_count], [abbrev]) VALUES (2, N'Bachelor of Computer Application', N'3', N'Under Graduation', 25000, N'Semester', N'6', N'BCA')
INSERT [dbo].[tbl_course] ([courseid], [cname], [duration], [class_type], [fees], [category], [sem_count], [abbrev]) VALUES (3, N'MGU-Bachelor of commerce', N'3', N'Under Graduation', 56000, N'Semester', N'6', N'MGU-Bcom')
INSERT [dbo].[tbl_course] ([courseid], [cname], [duration], [class_type], [fees], [category], [sem_count], [abbrev]) VALUES (4, N'Master of commerce', N'2', N'Post Graduation', 8600, N'Semester', N'4', N'M.Com')
INSERT [dbo].[tbl_course] ([courseid], [cname], [duration], [class_type], [fees], [category], [sem_count], [abbrev]) VALUES (6, N'Bachelor of science in Physics', N'3', N'Under Graduation', 8900, N'Semester', N'6', N'Bsc. Phy')
INSERT [dbo].[tbl_course] ([courseid], [cname], [duration], [class_type], [fees], [category], [sem_count], [abbrev]) VALUES (7, N'Bachelor of science in Chemistry', N'3', N'Under Graduation', 5600, N'Semester', N'6', N'BSc. Che')
INSERT [dbo].[tbl_course] ([courseid], [cname], [duration], [class_type], [fees], [category], [sem_count], [abbrev]) VALUES (8, N'MGU-Master In Computer Application', N'3', N'Post Graduation', 150000, N'Semester', N'6', N'MGU-MCA')
INSERT [dbo].[tbl_course] ([courseid], [cname], [duration], [class_type], [fees], [category], [sem_count], [abbrev]) VALUES (9, N'KLU-Bachelor Computer Application', N'3', N'Under Graduation', 60000, N'Semester', N'6', N'KLU-BCA')
SET IDENTITY_INSERT [dbo].[tbl_course] OFF
SET IDENTITY_INSERT [dbo].[tbl_exam_score] ON 

INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (3, CAST(0x0000A64E00000000 AS DateTime), 1, 4, N'anujoseph@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (4, CAST(0x0000A65700000000 AS DateTime), 0, 3, N'anujoseph@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (5, CAST(0x0000A65F00000000 AS DateTime), 0, 3, N'anujoseph@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (6, CAST(0x0000A68600000000 AS DateTime), 0, 3, N'anujoseph@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (7, CAST(0x0000A68600000000 AS DateTime), 0, 3, N'anujoseph@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (8, CAST(0x0000A68600000000 AS DateTime), 0, 3, N'anujoseph@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (9, CAST(0x0000A68B00000000 AS DateTime), 0, 3, N'anujoseph@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (10, CAST(0x0000A68B00000000 AS DateTime), 1, 4, N'anujoseph@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (11, CAST(0x0000A68B00000000 AS DateTime), 0, 3, N'anujoseph@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (12, CAST(0x0000A68B00000000 AS DateTime), 0, 3, N'anujoseph@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (13, CAST(0x0000A68C00000000 AS DateTime), 0, 1, N'akhil@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (14, CAST(0x0000A68C00000000 AS DateTime), 0, 1, N'akhil@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (15, CAST(0x0000A68C00000000 AS DateTime), 0, 1, N'akhil@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (16, CAST(0x0000A68C00000000 AS DateTime), 0, 1, N'akhil@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (17, CAST(0x0000A68C00000000 AS DateTime), 0, 1, N'akhil@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (18, CAST(0x0000A68C00000000 AS DateTime), 1, 3, N'akhil@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (19, CAST(0x0000A68C00000000 AS DateTime), 2, 4, N'akhil@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (20, CAST(0x0000A68C00000000 AS DateTime), 1, 3, N'akhil@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (21, CAST(0x0000A68C00000000 AS DateTime), 1, 3, N'akhil@gmail.com')
INSERT [dbo].[tbl_exam_score] ([examid], [exdate], [score], [rate], [username]) VALUES (22, CAST(0x0000A68C00000000 AS DateTime), 1, 3, N'akhil@gmail.com')
SET IDENTITY_INSERT [dbo].[tbl_exam_score] OFF
INSERT [dbo].[tbl_login] ([email], [password], [usertypeid]) VALUES (N'admin@gmail.com', N'11', 1)
INSERT [dbo].[tbl_login] ([email], [password], [usertypeid]) VALUES (N'akhil@gmail.com', N'aa', 2)
INSERT [dbo].[tbl_login] ([email], [password], [usertypeid]) VALUES (N'amal@gmail.com', N'11', 3)
INSERT [dbo].[tbl_login] ([email], [password], [usertypeid]) VALUES (N'amapl@gmail.com', N'11', 3)
INSERT [dbo].[tbl_login] ([email], [password], [usertypeid]) VALUES (N'anujoseph@gmail.com', N'aa', 2)
INSERT [dbo].[tbl_login] ([email], [password], [usertypeid]) VALUES (N'ge@gmail.com', N'11', 3)
INSERT [dbo].[tbl_login] ([email], [password], [usertypeid]) VALUES (N'jibin@gmail.com', N'11', 3)
INSERT [dbo].[tbl_login] ([email], [password], [usertypeid]) VALUES (N'jibinp@gmail.com', N'11', 3)
SET IDENTITY_INSERT [dbo].[tbl_note] ON 

INSERT [dbo].[tbl_note] ([note_id], [uploaded_by], [uploaded_on], [status], [subject_id], [type], [preference], [topic], [note_path], [image_file], [download_type], [rate]) VALUES (3, N'Admin', N'01-09-2016 11:50:58', N'1', 1, N'PDF', N'3', N'round robin technique', N'~/notes_file/472218814.pdf', N'~/notes_img/146489104.jpg', N'Premium', 50)
INSERT [dbo].[tbl_note] ([note_id], [uploaded_by], [uploaded_on], [status], [subject_id], [type], [preference], [topic], [note_path], [image_file], [download_type], [rate]) VALUES (4, N'Admin', N'01-09-2016 11:54:21', N'1', 1, N'PDF', N'2', N'Shortest path algorithm', N'~/notes_file/588845082.pdf', N'~/notes_img/214152502.jpg', N'Premium', 75)
INSERT [dbo].[tbl_note] ([note_id], [uploaded_by], [uploaded_on], [status], [subject_id], [type], [preference], [topic], [note_path], [image_file], [download_type], [rate]) VALUES (5, N'Admin', N'01-09-2016 11:56:20', N'1', 1, N'TextBook', N'4', N'Operatng system techniques', N'notes_file/1666831416.pdf', N'~/notes_img/856765574.jpg', N'Free', 0)
INSERT [dbo].[tbl_note] ([note_id], [uploaded_by], [uploaded_on], [status], [subject_id], [type], [preference], [topic], [note_path], [image_file], [download_type], [rate]) VALUES (6, N'Admin', N'9/25/2016 8:09:26 PM', N'1', 8, N'PDF', N'3', N'Sem3-DBMSModule1', N'~/notes_file/245912006.pdf', N'~/notes_img/232999101.png', N'Free', 0)
INSERT [dbo].[tbl_note] ([note_id], [uploaded_by], [uploaded_on], [status], [subject_id], [type], [preference], [topic], [note_path], [image_file], [download_type], [rate]) VALUES (7, N'Admin', N'9/25/2016 8:09:35 PM', N'1', 8, N'PDF', N'3', N'Sem3-DBMSModule1', N'~/notes_file/1513388924.pdf', N'~/notes_img/858583185.png', N'Free', 0)
INSERT [dbo].[tbl_note] ([note_id], [uploaded_by], [uploaded_on], [status], [subject_id], [type], [preference], [topic], [note_path], [image_file], [download_type], [rate]) VALUES (8, N'Admin', N'9/25/2016 8:54:45 PM', N'1', 9, N'TextBook', N'3', N'java', N'~/notes_file/1657341342.pdf', N'~/notes_img/1042474748.png', N'Free', 0)
INSERT [dbo].[tbl_note] ([note_id], [uploaded_by], [uploaded_on], [status], [subject_id], [type], [preference], [topic], [note_path], [image_file], [download_type], [rate]) VALUES (9, N'Admin', N'9/25/2016 8:59:18 PM', N'1', 8, N'PPT', N'3', N'Android ', N'~/notes_file/1015715483.ppt', N'~/notes_img/46230933.png', N'Free', 0)
SET IDENTITY_INSERT [dbo].[tbl_note] OFF
SET IDENTITY_INSERT [dbo].[tbl_note_pref] ON 

INSERT [dbo].[tbl_note_pref] ([npid], [preference]) VALUES (1, N'Below Avarage')
INSERT [dbo].[tbl_note_pref] ([npid], [preference]) VALUES (2, N'Avarage')
INSERT [dbo].[tbl_note_pref] ([npid], [preference]) VALUES (3, N'Good')
INSERT [dbo].[tbl_note_pref] ([npid], [preference]) VALUES (4, N'Excellent')
SET IDENTITY_INSERT [dbo].[tbl_note_pref] OFF
SET IDENTITY_INSERT [dbo].[tbl_options] ON 

INSERT [dbo].[tbl_options] ([optid], [optn], [questionid]) VALUES (5, N'Operation code', 5)
INSERT [dbo].[tbl_options] ([optid], [optn], [questionid]) VALUES (6, N'Address', 5)
INSERT [dbo].[tbl_options] ([optid], [optn], [questionid]) VALUES (7, N'Locator', 5)
INSERT [dbo].[tbl_options] ([optid], [optn], [questionid]) VALUES (8, N'Flip-Flop', 5)
INSERT [dbo].[tbl_options] ([optid], [optn], [questionid]) VALUES (9, N'method', 6)
INSERT [dbo].[tbl_options] ([optid], [optn], [questionid]) VALUES (10, N'native', 6)
INSERT [dbo].[tbl_options] ([optid], [optn], [questionid]) VALUES (11, N'subclasses', 6)
INSERT [dbo].[tbl_options] ([optid], [optn], [questionid]) VALUES (12, N'reference', 6)
INSERT [dbo].[tbl_options] ([optid], [optn], [questionid]) VALUES (13, N'interface', 7)
INSERT [dbo].[tbl_options] ([optid], [optn], [questionid]) VALUES (14, N'string', 7)
INSERT [dbo].[tbl_options] ([optid], [optn], [questionid]) VALUES (15, N'Float', 7)
INSERT [dbo].[tbl_options] ([optid], [optn], [questionid]) VALUES (16, N'unsigned', 7)
SET IDENTITY_INSERT [dbo].[tbl_options] OFF
SET IDENTITY_INSERT [dbo].[tbl_qstnpaper] ON 

INSERT [dbo].[tbl_qstnpaper] ([qstnid], [subjectid], [qstn_name], [year], [semester], [setnum], [filepath]) VALUES (1, 1, N'Design and Analysis of Algorithm', 2013, N'second', 1, N'~/qstPaper/2098788740.pdf')
INSERT [dbo].[tbl_qstnpaper] ([qstnid], [subjectid], [qstn_name], [year], [semester], [setnum], [filepath]) VALUES (2, 1, N'Design and Analysis of Algorithm', 2013, N'second', 2, N'~/qstPaper/1331942518.pdf')
INSERT [dbo].[tbl_qstnpaper] ([qstnid], [subjectid], [qstn_name], [year], [semester], [setnum], [filepath]) VALUES (3, 1, N'Design and Analysis of Algorithm', 2015, N'second', 1, N'~/qstPaper/565003127.pdf')
INSERT [dbo].[tbl_qstnpaper] ([qstnid], [subjectid], [qstn_name], [year], [semester], [setnum], [filepath]) VALUES (4, 1, N'Design and Analysis of Algorithm', 2012, N'second', 1, N'~/qstPaper/962619102.pdf')
INSERT [dbo].[tbl_qstnpaper] ([qstnid], [subjectid], [qstn_name], [year], [semester], [setnum], [filepath]) VALUES (5, 6, N'Financial Accounting', 2004, N'first', 1, N'~/qstPaper/1621645668.pdf')
INSERT [dbo].[tbl_qstnpaper] ([qstnid], [subjectid], [qstn_name], [year], [semester], [setnum], [filepath]) VALUES (6, 4, N'Applicable Mathematics', 2004, N'first', 1, N'~/qstPaper/1883208400.pdf')
INSERT [dbo].[tbl_qstnpaper] ([qstnid], [subjectid], [qstn_name], [year], [semester], [setnum], [filepath]) VALUES (7, 9, N'Java', 2011, N'third', 1, N'~/qstPaper/913040998.pdf')
INSERT [dbo].[tbl_qstnpaper] ([qstnid], [subjectid], [qstn_name], [year], [semester], [setnum], [filepath]) VALUES (8, 6, N'Financial Accounting', 2008, N'fourth', 1, N'~/qstPaper/766316874.pdf')
SET IDENTITY_INSERT [dbo].[tbl_qstnpaper] OFF
SET IDENTITY_INSERT [dbo].[tbl_question] ON 

INSERT [dbo].[tbl_question] ([qstnid], [qstn], [subjectid], [answer]) VALUES (5, N'The part of machine level instruction, which tells the central processor what has to be done, is', 1, N'Operation code')
INSERT [dbo].[tbl_question] ([qstnid], [qstn], [subjectid], [answer]) VALUES (6, N'Which is a reserved word in the Java programming language?', 8, N'native')
INSERT [dbo].[tbl_question] ([qstnid], [qstn], [subjectid], [answer]) VALUES (7, N'Which is a valid keyword in java?', 9, N'string')
SET IDENTITY_INSERT [dbo].[tbl_question] OFF
SET IDENTITY_INSERT [dbo].[tbl_sem_category] ON 

INSERT [dbo].[tbl_sem_category] ([id], [category]) VALUES (1, N'Civil')
INSERT [dbo].[tbl_sem_category] ([id], [category]) VALUES (2, N'Electronics')
INSERT [dbo].[tbl_sem_category] ([id], [category]) VALUES (3, N'Computer Science')
SET IDENTITY_INSERT [dbo].[tbl_sem_category] OFF
SET IDENTITY_INSERT [dbo].[tbl_seminars] ON 

INSERT [dbo].[tbl_seminars] ([seminarid], [topic], [description], [img], [abstractfile], [uploadedby], [status], [uploadedon], [catid], [type], [rate]) VALUES (1, N'3D Glasses', N'The first generation modified the games themselves to make them compatible with stereoscopic 3-D. The games'' creators had to specifically support each type of LCD glasses -- hardly an ideal situation. There was no guarantee that the glasses you''d bought would work with your favorite game.

As you can imagine, that didn''t appeal to many people; so a second solution was developed. This second solution was to override the game, actually taking over the computer''s screen and altering what was displayed. As far as the game was concerned, it was just doing what it normally did, except, of course, that some of the computer''s time was taken up processing the image to make it 3-D. The result was slower performance and low-resolution, blocky images. It did work with hundreds of games, though, and that was a definite improvement.', N'~/seminar_img/510458120.jpg', N'~/seminar_file/1142734794.pdf', N'admin', 1, N'29-06-2016 15:18:23', 1, N'Premium', 150)
INSERT [dbo].[tbl_seminars] ([seminarid], [topic], [description], [img], [abstractfile], [uploadedby], [status], [uploadedon], [catid], [type], [rate]) VALUES (2, N'Corrosion Of Reinforcement In Hvfa Concrete', N'Corrosion of reinforcements has been one of the major challenges that the civil engineers have been facing. Corrosion leads to the formation of rust which results in the spalling of concrete which in turn leads to the exposure of rebars to the aggressive environment. This will accelerate the ill effects and ultimately leads to the break down of the structure. Corrosion mainly occurs in areas of aggressive environment such as coastal regions. It is very important that corrosion of reinforcement must be prevented in order to have a durable structure. Even though there are many methods to prevent corrosion, most of them are uneconomical and requires great skill. Some of the recent studies in various parts of the world have revealed that High Volume Fly Ash (HVFA) concrete can protect the steel reinforcement more efficiently, so that it can resist corrosion, and thus the structure as a whole. HVFA concrete is a type of concrete in which a part of the cement is replaced b', N'~/seminar_img/249358741.jpg', N'~/seminar_file/149998030.pdf', N'admin', 1, N'29-06-2016 15:19:48', 2, N'Free', 0)
INSERT [dbo].[tbl_seminars] ([seminarid], [topic], [description], [img], [abstractfile], [uploadedby], [status], [uploadedon], [catid], [type], [rate]) VALUES (3, N'Audio Spotlighting', N'This acoustic device comprises a speaker that fires inaudible ultrasound pulses with very small wavelength which act in a manner very similar to that of a narrow column.

The ultra sound beam acts as an airborne speaker and as the beam moves through the air gradual distortion takes place in a predictable way due to the property of non-linearity of air. This gives rise to audible components that can be accurately predicted and precisely controlled. Joseph Pompei’s Holosonic Research Labs invented the Audio Spotlight that is made of a sound processor, an amplifier and the transducer. The American Technology Corporation developed the Hyper Sonic Sound-based Directed Audio Sound System. Both use ultrasound based solutions to beam sound into a focused beam. Audio spotlight can be either directed at a particular listener or to a point where it is reflected', N'~/seminar_img/1382304443.jpg', N'~/seminar_file/1172755682.pdf', N'admin', 1, N'29-06-2016 15:21:20', 1, N'Free', 0)
INSERT [dbo].[tbl_seminars] ([seminarid], [topic], [description], [img], [abstractfile], [uploadedby], [status], [uploadedon], [catid], [type], [rate]) VALUES (4, N'Android ', N'              Android is a software platform and operating system for mobile devices, based on the Linux kernel, and developed by Google and later the Open Handset Alliance. It allows developers to write managed code in the Java language, controlling the device via Google-developed Java libraries. Applications written in C and other languages can be compiled to ARM native code and run, but this development path isn''t officially supported by Google. 
                  Android is available as open source. Google threw open the entire source code (including network and telephony stacks) that were not available previously, under an Apache license. Certain parts that relate to a specific hardware can''t be made open and are not considered part of the Android platform. With Apache License, vendors are free to add proprietary extensions without submitting those back to the open source community. While Google''s contributions to this platform are expected to remain open-sourced, the branches could explode using varieties of licenses.
', N'~/seminar_img/449362993.jpg', N'~/seminar_file/1859718920.pdf', N'admin', 1, N'9/25/2016 8:15:02 PM', 3, N'Free', 0)
SET IDENTITY_INSERT [dbo].[tbl_seminars] OFF
SET IDENTITY_INSERT [dbo].[tbl_subject] ON 

INSERT [dbo].[tbl_subject] ([subid], [subname], [courseid], [sem]) VALUES (1, N'Design and Analysis of Algorithm', 2, 2)
INSERT [dbo].[tbl_subject] ([subid], [subname], [courseid], [sem]) VALUES (2, N'Software Engineering', 2, 4)
INSERT [dbo].[tbl_subject] ([subid], [subname], [courseid], [sem]) VALUES (4, N'Applicable Mathematics', 2, 4)
INSERT [dbo].[tbl_subject] ([subid], [subname], [courseid], [sem]) VALUES (6, N'Financial Accounting', 3, 2)
INSERT [dbo].[tbl_subject] ([subid], [subname], [courseid], [sem]) VALUES (7, N'qqqq', 1, 4)
INSERT [dbo].[tbl_subject] ([subid], [subname], [courseid], [sem]) VALUES (8, N'DataBase Management System', 8, 3)
INSERT [dbo].[tbl_subject] ([subid], [subname], [courseid], [sem]) VALUES (9, N'Java', 8, 3)
SET IDENTITY_INSERT [dbo].[tbl_subject] OFF
SET IDENTITY_INSERT [dbo].[tbl_syllabus] ON 

INSERT [dbo].[tbl_syllabus] ([sid], [courseid], [semester], [spath], [upload_date]) VALUES (3, 2, N'2', N'~/syllabus/997356411.pdf', N'30-06-2016 11:18:34')
INSERT [dbo].[tbl_syllabus] ([sid], [courseid], [semester], [spath], [upload_date]) VALUES (4, 2, N'3', N'~/syllabus/1556176579.pdf', N'24-09-2016 11:00:25')
INSERT [dbo].[tbl_syllabus] ([sid], [courseid], [semester], [spath], [upload_date]) VALUES (5, 8, N'3', N'~/syllabus/579319013.pdf', N'9/25/2016 8:06:42 PM')
SET IDENTITY_INSERT [dbo].[tbl_syllabus] OFF
SET IDENTITY_INSERT [dbo].[tbl_user] ON 

INSERT [dbo].[tbl_user] ([regid], [fname], [lname], [phno], [email], [experiance], [courseid], [qualification], [reg_date]) VALUES (1, N'Geethu', N'Soman', N'9876987622', N'ge@gmail.com', N'3', 2, 1, N'17-06-2016')
INSERT [dbo].[tbl_user] ([regid], [fname], [lname], [phno], [email], [experiance], [courseid], [qualification], [reg_date]) VALUES (2, N'Anu', N'Joseph', N'9876549512', N'anujoseph@gmail.com', NULL, 2, NULL, N'28-06-2016')
INSERT [dbo].[tbl_user] ([regid], [fname], [lname], [phno], [email], [experiance], [courseid], [qualification], [reg_date]) VALUES (3, N'Akhil', N'P B', N'7736243625', N'akhil@gmail.com', NULL, 8, NULL, N'9/25/2016')
SET IDENTITY_INSERT [dbo].[tbl_user] OFF
SET IDENTITY_INSERT [dbo].[tbl_usertype] ON 

INSERT [dbo].[tbl_usertype] ([typeid], [usertype]) VALUES (1, N'Admin')
INSERT [dbo].[tbl_usertype] ([typeid], [usertype]) VALUES (2, N'Student')
INSERT [dbo].[tbl_usertype] ([typeid], [usertype]) VALUES (3, N'Teacher')
SET IDENTITY_INSERT [dbo].[tbl_usertype] OFF
SET IDENTITY_INSERT [dbo].[textchat] ON 

INSERT [dbo].[textchat] ([chatid], [msg], [course], [email], [chatdate]) VALUES (2, N'hai', N'2', N'anujoseph@gmail.com', CAST(0x0000A686003EE0E0 AS DateTime))
INSERT [dbo].[textchat] ([chatid], [msg], [course], [email], [chatdate]) VALUES (3, N'gud eveng', N'2', N'anujoseph@gmail.com', CAST(0x0000A6860036E778 AS DateTime))
INSERT [dbo].[textchat] ([chatid], [msg], [course], [email], [chatdate]) VALUES (4, N'no', N'2', N'anujoseph@gmail.com', CAST(0x0000A686003A7988 AS DateTime))
INSERT [dbo].[textchat] ([chatid], [msg], [course], [email], [chatdate]) VALUES (5, N'oh no', N'2', N'ge@gmail.com', CAST(0x0000A68600512250 AS DateTime))
INSERT [dbo].[textchat] ([chatid], [msg], [course], [email], [chatdate]) VALUES (6, N'are you free now', N'2', N'ge@gmail.com', CAST(0x0000A686004EAAAC AS DateTime))
INSERT [dbo].[textchat] ([chatid], [msg], [course], [email], [chatdate]) VALUES (7, N'k', N'2', N'ge@gmail.com', CAST(0x0000A6860050E308 AS DateTime))
INSERT [dbo].[textchat] ([chatid], [msg], [course], [email], [chatdate]) VALUES (8, N'hai', N'2', N'ge@gmail.com', CAST(0x0000A686004980CC AS DateTime))
INSERT [dbo].[textchat] ([chatid], [msg], [course], [email], [chatdate]) VALUES (9, N'helo', N'2', N'ge@gmail.com', CAST(0x0000A686004CCC8C AS DateTime))
SET IDENTITY_INSERT [dbo].[textchat] OFF
USE [master]
GO
ALTER DATABASE [edusat] SET  READ_WRITE 
GO
