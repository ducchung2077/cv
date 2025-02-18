USE [master]
GO
/****** Object:  Database [cv]    Script Date: 12/15/2023 11:36:32 PM ******/
CREATE DATABASE [cv]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cinema', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\cinema.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cinema_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\cinema_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [cv] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cv].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cv] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cv] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cv] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cv] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cv] SET ARITHABORT OFF 
GO
ALTER DATABASE [cv] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cv] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cv] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cv] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cv] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cv] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cv] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cv] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cv] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cv] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cv] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cv] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cv] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cv] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cv] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cv] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cv] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cv] SET RECOVERY FULL 
GO
ALTER DATABASE [cv] SET  MULTI_USER 
GO
ALTER DATABASE [cv] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cv] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cv] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cv] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cv] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [cv] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'cv', N'ON'
GO
ALTER DATABASE [cv] SET QUERY_STORE = ON
GO
ALTER DATABASE [cv] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [cv]
GO
/****** Object:  Table [dbo].[administrative_regions]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrative_regions](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[name_en] [nvarchar](255) NOT NULL,
	[code_name] [nvarchar](255) NULL,
	[code_name_en] [nvarchar](255) NULL,
 CONSTRAINT [administrative_regions_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[administrative_units]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrative_units](
	[id] [int] NOT NULL,
	[full_name] [nvarchar](255) NULL,
	[full_name_en] [nvarchar](255) NULL,
	[short_name] [nvarchar](255) NULL,
	[short_name_en] [nvarchar](255) NULL,
	[code_name] [nvarchar](255) NULL,
	[code_name_en] [nvarchar](255) NULL,
 CONSTRAINT [administrative_units_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[applicant]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applicant](
	[id] [int] IDENTITY(-2147483648,1) NOT NULL,
	[avatar_path] [varchar](max) NULL,
	[name] [nvarchar](100) NULL,
	[birthdate] [date] NULL,
	[gender] [bit] NULL,
	[phone] [varchar](15) NULL,
	[address] [nvarchar](255) NULL,
	[email] [varchar](100) NOT NULL,
	[password_hashed] [varchar](255) NOT NULL,
	[facebook] [varchar](100) NULL,
	[github] [varchar](100) NULL,
	[self_introduction] [nvarchar](max) NULL,
	[education_school_name] [nvarchar](100) NULL,
	[education_major] [nvarchar](100) NULL,
	[education_school_start_date] [date] NULL,
	[education_school_end_date] [date] NULL,
	[internship_enterprise_name] [nvarchar](100) NULL,
	[internship_position] [nvarchar](100) NULL,
	[internship_start_date] [date] NULL,
	[internship_end_date] [date] NULL,
 CONSTRAINT [applicant_pk] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [applicant_pk2] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [applicant_id_uindex]    Script Date: 12/15/2023 11:36:33 PM ******/
CREATE UNIQUE CLUSTERED INDEX [applicant_id_uindex] ON [dbo].[applicant]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[applicant_certificate]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applicant_certificate](
	[id] [int] IDENTITY(-2147483648,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[received_date] [date] NULL,
	[applicant_id] [int] NOT NULL,
 CONSTRAINT [applicant_certificate_pk] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [applicant_certificate_id_uindex]    Script Date: 12/15/2023 11:36:33 PM ******/
CREATE UNIQUE CLUSTERED INDEX [applicant_certificate_id_uindex] ON [dbo].[applicant_certificate]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[applicant_certificate_image]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applicant_certificate_image](
	[certificate_id] [int] NOT NULL,
	[image_path] [varchar](max) NULL,
	[id] [int] IDENTITY(-2147483648,1) NOT NULL,
 CONSTRAINT [applicant_certificate_image_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[applicant_project]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applicant_project](
	[id] [int] IDENTITY(-2147483648,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](max) NULL,
	[video_link] [varchar](255) NULL,
	[project_link] [varchar](255) NULL,
	[applicant_id] [int] NOT NULL,
 CONSTRAINT [applicant_project_pk] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [applicant_project_id_uindex]    Script Date: 12/15/2023 11:36:33 PM ******/
CREATE UNIQUE CLUSTERED INDEX [applicant_project_id_uindex] ON [dbo].[applicant_project]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[applicant_project_image]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applicant_project_image](
	[project_id] [int] NOT NULL,
	[image_path] [varchar](max) NULL,
	[id] [int] IDENTITY(-2147483648,1) NOT NULL,
 CONSTRAINT [applicant_project_image_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[applicant_skill]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applicant_skill](
	[applicant_id] [int] NOT NULL,
	[skill_id] [int] NOT NULL,
	[experience_id] [int] NOT NULL,
	[id] [int] IDENTITY(-2147483648,1) NOT NULL,
 CONSTRAINT [applicant_skill_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[application_record]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[application_record](
	[applicant_id] [int] NOT NULL,
	[recruiment_id] [int] NOT NULL,
	[application_status_id] [int] NOT NULL,
	[submit_date] [date] NULL,
	[id] [int] IDENTITY(-2147483648,1) NOT NULL,
 CONSTRAINT [application_record_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[application_status]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[application_status](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [application_status_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[districts]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[districts](
	[code] [nvarchar](20) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[name_en] [nvarchar](255) NULL,
	[full_name] [nvarchar](255) NULL,
	[full_name_en] [nvarchar](255) NULL,
	[code_name] [nvarchar](255) NULL,
	[province_code] [nvarchar](20) NULL,
	[administrative_unit_id] [int] NULL,
 CONSTRAINT [districts_pkey] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[enterprise]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enterprise](
	[id] [int] IDENTITY(-2147483648,1) NOT NULL,
	[avatar] [varbinary](max) NULL,
	[name] [nvarchar](100) NULL,
	[introduction] [nvarchar](max) NULL,
	[homepage] [varchar](100) NULL,
 CONSTRAINT [enterprise_pk] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[enterprise_admin]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enterprise_admin](
	[name] [nvarchar](100) NULL,
	[email] [varchar](100) NOT NULL,
	[password_hashed] [varchar](255) NOT NULL,
	[role] [int] NOT NULL,
	[enterprise_id] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [enterprise_admin_email_uindex]    Script Date: 12/15/2023 11:36:33 PM ******/
CREATE UNIQUE CLUSTERED INDEX [enterprise_admin_email_uindex] ON [dbo].[enterprise_admin]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[experience]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[experience](
	[id] [int] IDENTITY(-2147483648,1) NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [experience_pk] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [experience_id_uindex]    Script Date: 12/15/2023 11:36:33 PM ******/
CREATE UNIQUE CLUSTERED INDEX [experience_id_uindex] ON [dbo].[experience]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provinces]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provinces](
	[code] [nvarchar](20) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[name_en] [nvarchar](255) NULL,
	[full_name] [nvarchar](255) NOT NULL,
	[full_name_en] [nvarchar](255) NULL,
	[code_name] [nvarchar](255) NULL,
	[administrative_unit_id] [int] NULL,
	[administrative_region_id] [int] NULL,
 CONSTRAINT [provinces_pkey] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recruiment]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recruiment](
	[id] [int] IDENTITY(-2147483648,1) NOT NULL,
	[banner_path] [varchar](max) NULL,
	[job_name] [nvarchar](100) NULL,
	[job_description] [nvarchar](max) NULL,
	[position] [nvarchar](100) NULL,
	[applicant_requirement] [nvarchar](max) NULL,
	[benefit] [nvarchar](max) NULL,
	[min_salary] [float] NULL,
	[max_salary] [float] NULL,
	[enterprise_id] [int] NOT NULL,
	[deadline] [date] NULL,
 CONSTRAINT [recruiment_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recruiment_skill]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recruiment_skill](
	[recruiment_id] [int] NOT NULL,
	[skill_id] [int] NOT NULL,
	[experience_id] [int] NOT NULL,
	[id] [int] IDENTITY(-2147483648,1) NOT NULL,
 CONSTRAINT [recruiment_skill_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[skill]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[skill](
	[id] [int] IDENTITY(-2147483648,1) NOT NULL,
	[skill_type_id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [skill_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[skill_type]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[skill_type](
	[id] [int] IDENTITY(-2147483648,1) NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [skill_type_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wards]    Script Date: 12/15/2023 11:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wards](
	[code] [nvarchar](20) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[name_en] [nvarchar](255) NULL,
	[full_name] [nvarchar](255) NULL,
	[full_name_en] [nvarchar](255) NULL,
	[code_name] [nvarchar](255) NULL,
	[district_code] [nvarchar](20) NULL,
	[administrative_unit_id] [int] NULL,
 CONSTRAINT [wards_pkey] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_districts_province]    Script Date: 12/15/2023 11:36:33 PM ******/
CREATE NONCLUSTERED INDEX [idx_districts_province] ON [dbo].[districts]
(
	[province_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_districts_unit]    Script Date: 12/15/2023 11:36:33 PM ******/
CREATE NONCLUSTERED INDEX [idx_districts_unit] ON [dbo].[districts]
(
	[administrative_unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [enterprise_id_uindex]    Script Date: 12/15/2023 11:36:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [enterprise_id_uindex] ON [dbo].[enterprise]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_provinces_region]    Script Date: 12/15/2023 11:36:33 PM ******/
CREATE NONCLUSTERED INDEX [idx_provinces_region] ON [dbo].[provinces]
(
	[administrative_region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_provinces_unit]    Script Date: 12/15/2023 11:36:33 PM ******/
CREATE NONCLUSTERED INDEX [idx_provinces_unit] ON [dbo].[provinces]
(
	[administrative_unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_wards_district]    Script Date: 12/15/2023 11:36:33 PM ******/
CREATE NONCLUSTERED INDEX [idx_wards_district] ON [dbo].[wards]
(
	[district_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_wards_unit]    Script Date: 12/15/2023 11:36:33 PM ******/
CREATE NONCLUSTERED INDEX [idx_wards_unit] ON [dbo].[wards]
(
	[administrative_unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[applicant_certificate]  WITH CHECK ADD  CONSTRAINT [applicant_certificate_applicant_id_fk] FOREIGN KEY([applicant_id])
REFERENCES [dbo].[applicant] ([id])
GO
ALTER TABLE [dbo].[applicant_certificate] CHECK CONSTRAINT [applicant_certificate_applicant_id_fk]
GO
ALTER TABLE [dbo].[applicant_certificate_image]  WITH CHECK ADD  CONSTRAINT [applicant_certificate_image_applicant_certificate_id_fk] FOREIGN KEY([certificate_id])
REFERENCES [dbo].[applicant_certificate] ([id])
GO
ALTER TABLE [dbo].[applicant_certificate_image] CHECK CONSTRAINT [applicant_certificate_image_applicant_certificate_id_fk]
GO
ALTER TABLE [dbo].[applicant_project]  WITH CHECK ADD  CONSTRAINT [applicant_project_applicant_id_fk] FOREIGN KEY([applicant_id])
REFERENCES [dbo].[applicant] ([id])
GO
ALTER TABLE [dbo].[applicant_project] CHECK CONSTRAINT [applicant_project_applicant_id_fk]
GO
ALTER TABLE [dbo].[applicant_project_image]  WITH CHECK ADD  CONSTRAINT [applicant_project_image_applicant_project_id_fk] FOREIGN KEY([project_id])
REFERENCES [dbo].[applicant_project] ([id])
GO
ALTER TABLE [dbo].[applicant_project_image] CHECK CONSTRAINT [applicant_project_image_applicant_project_id_fk]
GO
ALTER TABLE [dbo].[applicant_skill]  WITH CHECK ADD  CONSTRAINT [applicant_skill_applicant_id_fk] FOREIGN KEY([applicant_id])
REFERENCES [dbo].[applicant] ([id])
GO
ALTER TABLE [dbo].[applicant_skill] CHECK CONSTRAINT [applicant_skill_applicant_id_fk]
GO
ALTER TABLE [dbo].[applicant_skill]  WITH CHECK ADD  CONSTRAINT [applicant_skill_experience_id_fk] FOREIGN KEY([experience_id])
REFERENCES [dbo].[experience] ([id])
GO
ALTER TABLE [dbo].[applicant_skill] CHECK CONSTRAINT [applicant_skill_experience_id_fk]
GO
ALTER TABLE [dbo].[applicant_skill]  WITH CHECK ADD  CONSTRAINT [applicant_skill_skill_id_fk] FOREIGN KEY([skill_id])
REFERENCES [dbo].[skill] ([id])
GO
ALTER TABLE [dbo].[applicant_skill] CHECK CONSTRAINT [applicant_skill_skill_id_fk]
GO
ALTER TABLE [dbo].[application_record]  WITH CHECK ADD  CONSTRAINT [application_record_applicant_id_fk] FOREIGN KEY([applicant_id])
REFERENCES [dbo].[applicant] ([id])
GO
ALTER TABLE [dbo].[application_record] CHECK CONSTRAINT [application_record_applicant_id_fk]
GO
ALTER TABLE [dbo].[application_record]  WITH CHECK ADD  CONSTRAINT [application_record_application_status_id_fk] FOREIGN KEY([application_status_id])
REFERENCES [dbo].[application_status] ([id])
GO
ALTER TABLE [dbo].[application_record] CHECK CONSTRAINT [application_record_application_status_id_fk]
GO
ALTER TABLE [dbo].[application_record]  WITH CHECK ADD  CONSTRAINT [application_record_recruiment_id_fk] FOREIGN KEY([recruiment_id])
REFERENCES [dbo].[recruiment] ([id])
GO
ALTER TABLE [dbo].[application_record] CHECK CONSTRAINT [application_record_recruiment_id_fk]
GO
ALTER TABLE [dbo].[districts]  WITH CHECK ADD  CONSTRAINT [districts_administrative_unit_id_fkey] FOREIGN KEY([administrative_unit_id])
REFERENCES [dbo].[administrative_units] ([id])
GO
ALTER TABLE [dbo].[districts] CHECK CONSTRAINT [districts_administrative_unit_id_fkey]
GO
ALTER TABLE [dbo].[districts]  WITH CHECK ADD  CONSTRAINT [districts_province_code_fkey] FOREIGN KEY([province_code])
REFERENCES [dbo].[provinces] ([code])
GO
ALTER TABLE [dbo].[districts] CHECK CONSTRAINT [districts_province_code_fkey]
GO
ALTER TABLE [dbo].[enterprise_admin]  WITH CHECK ADD  CONSTRAINT [enterprise_admin_enterprise_id_fk] FOREIGN KEY([enterprise_id])
REFERENCES [dbo].[enterprise] ([id])
GO
ALTER TABLE [dbo].[enterprise_admin] CHECK CONSTRAINT [enterprise_admin_enterprise_id_fk]
GO
ALTER TABLE [dbo].[provinces]  WITH CHECK ADD  CONSTRAINT [provinces_administrative_region_id_fkey] FOREIGN KEY([administrative_region_id])
REFERENCES [dbo].[administrative_regions] ([id])
GO
ALTER TABLE [dbo].[provinces] CHECK CONSTRAINT [provinces_administrative_region_id_fkey]
GO
ALTER TABLE [dbo].[provinces]  WITH CHECK ADD  CONSTRAINT [provinces_administrative_unit_id_fkey] FOREIGN KEY([administrative_unit_id])
REFERENCES [dbo].[administrative_units] ([id])
GO
ALTER TABLE [dbo].[provinces] CHECK CONSTRAINT [provinces_administrative_unit_id_fkey]
GO
ALTER TABLE [dbo].[recruiment]  WITH CHECK ADD  CONSTRAINT [recruiment_enterprise_id_fk] FOREIGN KEY([enterprise_id])
REFERENCES [dbo].[enterprise] ([id])
GO
ALTER TABLE [dbo].[recruiment] CHECK CONSTRAINT [recruiment_enterprise_id_fk]
GO
ALTER TABLE [dbo].[recruiment_skill]  WITH CHECK ADD  CONSTRAINT [recruiment_skill_experience_id_fk] FOREIGN KEY([experience_id])
REFERENCES [dbo].[experience] ([id])
GO
ALTER TABLE [dbo].[recruiment_skill] CHECK CONSTRAINT [recruiment_skill_experience_id_fk]
GO
ALTER TABLE [dbo].[recruiment_skill]  WITH CHECK ADD  CONSTRAINT [recruiment_skill_recruiment_id_fk] FOREIGN KEY([recruiment_id])
REFERENCES [dbo].[recruiment] ([id])
GO
ALTER TABLE [dbo].[recruiment_skill] CHECK CONSTRAINT [recruiment_skill_recruiment_id_fk]
GO
ALTER TABLE [dbo].[recruiment_skill]  WITH CHECK ADD  CONSTRAINT [recruiment_skill_skill_id_fk] FOREIGN KEY([skill_id])
REFERENCES [dbo].[skill] ([id])
GO
ALTER TABLE [dbo].[recruiment_skill] CHECK CONSTRAINT [recruiment_skill_skill_id_fk]
GO
ALTER TABLE [dbo].[skill]  WITH CHECK ADD  CONSTRAINT [skill_skill_type_id_fk] FOREIGN KEY([skill_type_id])
REFERENCES [dbo].[skill_type] ([id])
GO
ALTER TABLE [dbo].[skill] CHECK CONSTRAINT [skill_skill_type_id_fk]
GO
ALTER TABLE [dbo].[wards]  WITH CHECK ADD  CONSTRAINT [wards_administrative_unit_id_fkey] FOREIGN KEY([administrative_unit_id])
REFERENCES [dbo].[administrative_units] ([id])
GO
ALTER TABLE [dbo].[wards] CHECK CONSTRAINT [wards_administrative_unit_id_fkey]
GO
ALTER TABLE [dbo].[wards]  WITH CHECK ADD  CONSTRAINT [wards_district_code_fkey] FOREIGN KEY([district_code])
REFERENCES [dbo].[districts] ([code])
GO
ALTER TABLE [dbo].[wards] CHECK CONSTRAINT [wards_district_code_fkey]
GO
USE [master]
GO
ALTER DATABASE [cv] SET  READ_WRITE 
GO
