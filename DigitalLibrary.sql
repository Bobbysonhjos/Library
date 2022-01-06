USE [master]
GO
/****** Object:  Database [DigitalLibrary]    Script Date: 2022-01-06 12:50:50 ******/
CREATE DATABASE [DigitalLibrary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DigitalLibrary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DigitalLibrary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DigitalLibrary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DigitalLibrary_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DigitalLibrary] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DigitalLibrary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DigitalLibrary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DigitalLibrary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DigitalLibrary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DigitalLibrary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DigitalLibrary] SET ARITHABORT OFF 
GO
ALTER DATABASE [DigitalLibrary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DigitalLibrary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DigitalLibrary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DigitalLibrary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DigitalLibrary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DigitalLibrary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DigitalLibrary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DigitalLibrary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DigitalLibrary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DigitalLibrary] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DigitalLibrary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DigitalLibrary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DigitalLibrary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DigitalLibrary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DigitalLibrary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DigitalLibrary] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DigitalLibrary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DigitalLibrary] SET RECOVERY FULL 
GO
ALTER DATABASE [DigitalLibrary] SET  MULTI_USER 
GO
ALTER DATABASE [DigitalLibrary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DigitalLibrary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DigitalLibrary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DigitalLibrary] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DigitalLibrary] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DigitalLibrary] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DigitalLibrary', N'ON'
GO
ALTER DATABASE [DigitalLibrary] SET QUERY_STORE = OFF
GO
USE [DigitalLibrary]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2022-01-06 12:50:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 2022-01-06 12:50:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookattribute]    Script Date: 2022-01-06 12:50:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookattribute](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pages] [int] NOT NULL,
	[Weight] [int] NOT NULL,
 CONSTRAINT [PK_Bookattribute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 2022-01-06 12:50:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[AuthorId] [int] NULL,
	[Genre] [int] NOT NULL,
	[BookattributeId] [int] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211229081500_Initial', N'5.0.13')
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 
GO
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (1, N'J.R.R Tolkien')
GO
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (2, N'Henning Mankell')
GO
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (3, N'Stieg Larsson')
GO
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (4, N'Daniel Defoe')
GO
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (5, N'Kalle Anka')
GO
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[Bookattribute] ON 
GO
INSERT [dbo].[Bookattribute] ([Id], [Pages], [Weight]) VALUES (1, 589, 0)
GO
INSERT [dbo].[Bookattribute] ([Id], [Pages], [Weight]) VALUES (3, 600, 0)
GO
INSERT [dbo].[Bookattribute] ([Id], [Pages], [Weight]) VALUES (4, 1000, 2000)
GO
INSERT [dbo].[Bookattribute] ([Id], [Pages], [Weight]) VALUES (5, 345, 346)
GO
INSERT [dbo].[Bookattribute] ([Id], [Pages], [Weight]) VALUES (6, 123, 3)
GO
INSERT [dbo].[Bookattribute] ([Id], [Pages], [Weight]) VALUES (7, 234, 1)
GO
INSERT [dbo].[Bookattribute] ([Id], [Pages], [Weight]) VALUES (8, 342, 2)
GO
INSERT [dbo].[Bookattribute] ([Id], [Pages], [Weight]) VALUES (9, 478, 110)
GO
INSERT [dbo].[Bookattribute] ([Id], [Pages], [Weight]) VALUES (10, 377, 670)
GO
INSERT [dbo].[Bookattribute] ([Id], [Pages], [Weight]) VALUES (11, 345, 200)
GO
SET IDENTITY_INSERT [dbo].[Bookattribute] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 
GO
INSERT [dbo].[Books] ([Id], [Title], [AuthorId], [Genre], [BookattributeId]) VALUES (6, N'Silmarillion', 1, 5, 4)
GO
INSERT [dbo].[Books] ([Id], [Title], [AuthorId], [Genre], [BookattributeId]) VALUES (7, N'aaa', 2, 1, 5)
GO
INSERT [dbo].[Books] ([Id], [Title], [AuthorId], [Genre], [BookattributeId]) VALUES (8, N'bbb', 2, 3, 6)
GO
INSERT [dbo].[Books] ([Id], [Title], [AuthorId], [Genre], [BookattributeId]) VALUES (9, N'ccc', 1, 5, 7)
GO
INSERT [dbo].[Books] ([Id], [Title], [AuthorId], [Genre], [BookattributeId]) VALUES (10, N'ddd', 2, 0, 8)
GO
INSERT [dbo].[Books] ([Id], [Title], [AuthorId], [Genre], [BookattributeId]) VALUES (11, N'Män som hatar kvinnor', 3, 1, 9)
GO
INSERT [dbo].[Books] ([Id], [Title], [AuthorId], [Genre], [BookattributeId]) VALUES (12, N'Count of Montecristo', 4, 2, 10)
GO
INSERT [dbo].[Books] ([Id], [Title], [AuthorId], [Genre], [BookattributeId]) VALUES (13, N'hhh', 5, 1, 11)
GO
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
/****** Object:  Index [IX_Books_AuthorId]    Script Date: 2022-01-06 12:50:51 ******/
CREATE NONCLUSTERED INDEX [IX_Books_AuthorId] ON [dbo].[Books]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_BookattributeId]    Script Date: 2022-01-06 12:50:51 ******/
CREATE NONCLUSTERED INDEX [IX_Books_BookattributeId] ON [dbo].[Books]
(
	[BookattributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors_AuthorId]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Bookattribute_BookattributeId] FOREIGN KEY([BookattributeId])
REFERENCES [dbo].[Bookattribute] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Bookattribute_BookattributeId]
GO
USE [master]
GO
ALTER DATABASE [DigitalLibrary] SET  READ_WRITE 
GO
