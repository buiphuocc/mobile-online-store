USE [master]
GO
/****** Object:  Database [Workshop1PRJ]    Script Date: 11/1/2023 11:59:07 PM ******/
CREATE DATABASE [Workshop1PRJ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Workshop1PRJ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.BUIPHUOCPROVJP\MSSQL\DATA\Workshop1PRJ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Workshop1PRJ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.BUIPHUOCPROVJP\MSSQL\DATA\Workshop1PRJ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Workshop1PRJ] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Workshop1PRJ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Workshop1PRJ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET ARITHABORT OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Workshop1PRJ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Workshop1PRJ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Workshop1PRJ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Workshop1PRJ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Workshop1PRJ] SET  MULTI_USER 
GO
ALTER DATABASE [Workshop1PRJ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Workshop1PRJ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Workshop1PRJ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Workshop1PRJ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Workshop1PRJ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Workshop1PRJ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Workshop1PRJ] SET QUERY_STORE = ON
GO
ALTER DATABASE [Workshop1PRJ] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Workshop1PRJ]
GO
/****** Object:  Table [dbo].[tbl_Mobile]    Script Date: 11/1/2023 11:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Mobile](
	[mobileId] [varchar](10) NOT NULL,
	[description] [varchar](250) NOT NULL,
	[price] [float] NULL,
	[mobileName] [varchar](20) NOT NULL,
	[yearOfProduction] [int] NULL,
	[quantity] [int] NULL,
	[notSale] [bit] NULL,
 CONSTRAINT [PK_tbl_Mobile] PRIMARY KEY CLUSTERED 
(
	[mobileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 11/1/2023 11:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[userId] [varchar](20) NOT NULL,
	[password] [int] NOT NULL,
	[fullName] [varchar](50) NOT NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'M02', N'Apple''s product', 510, N'iPhone 5', 2012, 500, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'M03', N'Apple''s product', 520, N'iPhone 6', 2014, 500, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'M10', N'Apple''s product', 920, N'iPhone 13 Pro Max', 2021, 500, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'M11', N'Apple''s product', 530, N'iPhone 7', 2015, 500, 0)
GO
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'U01', 12345, N'Bui Phuoc', 1)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'U02', 12345, N'Le Hung', 0)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'U03', 12345, N'Le Khang', 2)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'U04', 12345, N'Nguyen Tin', 0)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'U05', 12345, N'Le Thinh', 1)
GO
USE [master]
GO
ALTER DATABASE [Workshop1PRJ] SET  READ_WRITE 
GO
