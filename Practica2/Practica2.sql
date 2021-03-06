USE [master]
GO
/****** Object:  Database [BDProyecto]    Script Date: 24/02/2018 10:08:01 a.m. ******/
CREATE DATABASE [BDProyecto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDProyecto', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BDProyecto.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDProyecto_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BDProyecto_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BDProyecto] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDProyecto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDProyecto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDProyecto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDProyecto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDProyecto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDProyecto] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDProyecto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDProyecto] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BDProyecto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDProyecto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDProyecto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDProyecto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDProyecto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDProyecto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDProyecto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDProyecto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDProyecto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDProyecto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDProyecto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDProyecto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDProyecto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDProyecto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDProyecto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDProyecto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDProyecto] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDProyecto] SET  MULTI_USER 
GO
ALTER DATABASE [BDProyecto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDProyecto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDProyecto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDProyecto] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BDProyecto]
GO
/****** Object:  Table [dbo].[DEPARTAMENTS]    Script Date: 24/02/2018 10:08:01 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DEPARTAMENTS](
	[department_id] [int] NULL,
	[department_name] [varchar](50) NULL,
	[maneger_id] [nchar](10) NULL,
	[location_id] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 24/02/2018 10:08:01 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[employee_id] [int] NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone_number] [nchar](10) NULL,
	[hire_date] [date] NULL,
	[job_id] [int] NULL,
	[salary] [money] NULL,
	[commission_pct] [money] NULL,
	[manager_id] [int] NULL,
	[department_id] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JOBS]    Script Date: 24/02/2018 10:08:01 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOBS](
	[job_id] [uniqueidentifier] NULL,
	[job_title] [nvarchar](50) NULL,
	[min_salary] [nchar](10) NULL,
	[max_salary] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JOBS_HISORY]    Script Date: 24/02/2018 10:08:01 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JOBS_HISORY](
	[employee_id] [uniqueidentifier] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[job_id] [int] NULL,
	[department_id] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOCATIONS]    Script Date: 24/02/2018 10:08:01 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOCATIONS](
	[location_id] [int] NULL,
	[street_address] [varchar](50) NULL,
	[postal_code] [int] NULL,
	[city] [text] NULL,
	[state_province] [nvarchar](50) NULL,
	[country_id] [numeric](18, 0) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_JOBS_HISORY]    Script Date: 24/02/2018 10:08:01 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_JOBS_HISORY] ON [dbo].[JOBS_HISORY]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [BDProyecto] SET  READ_WRITE 
GO
