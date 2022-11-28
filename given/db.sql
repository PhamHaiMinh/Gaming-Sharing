USE [master]
GO
/****** Object:  Database [GamingSharing]    Script Date: 11/28/2022 12:14:17 PM ******/
CREATE DATABASE [GamingSharing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GamingSharing', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GamingSharing.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GamingSharing_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\GamingSharing_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GamingSharing] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GamingSharing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GamingSharing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GamingSharing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GamingSharing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GamingSharing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GamingSharing] SET ARITHABORT OFF 
GO
ALTER DATABASE [GamingSharing] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GamingSharing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GamingSharing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GamingSharing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GamingSharing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GamingSharing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GamingSharing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GamingSharing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GamingSharing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GamingSharing] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GamingSharing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GamingSharing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GamingSharing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GamingSharing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GamingSharing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GamingSharing] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GamingSharing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GamingSharing] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GamingSharing] SET  MULTI_USER 
GO
ALTER DATABASE [GamingSharing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GamingSharing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GamingSharing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GamingSharing] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GamingSharing] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GamingSharing] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GamingSharing] SET QUERY_STORE = OFF
GO
USE [GamingSharing]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/28/2022 12:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nchar](10) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[roleid] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 11/28/2022 12:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[body] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/28/2022 12:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQ]    Script Date: 11/28/2022 12:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQ](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](50) NULL,
	[answer] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/28/2022 12:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[cost] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[categoryid] [int] NULL,
	[description] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/28/2022 12:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rolename] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/28/2022 12:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [int] NULL,
	[username] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 11/28/2022 12:14:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [rolename]) VALUES (1, N'Admin     ')
INSERT [dbo].[Role] ([id], [rolename]) VALUES (2, N'Staff     ')
INSERT [dbo].[Role] ([id], [rolename]) VALUES (3, N'User      ')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
USE [master]
GO
ALTER DATABASE [GamingSharing] SET  READ_WRITE 
GO
