USE [master]
GO
/****** Object:  Database [AnServices]    Script Date: 5/3/2022 7:36:55 PM ******/
CREATE DATABASE [AnServices]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AnServices', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AnServices.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AnServices_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AnServices_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AnServices] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AnServices].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AnServices] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AnServices] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AnServices] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AnServices] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AnServices] SET ARITHABORT OFF 
GO
ALTER DATABASE [AnServices] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AnServices] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AnServices] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AnServices] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AnServices] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AnServices] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AnServices] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AnServices] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AnServices] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AnServices] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AnServices] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AnServices] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AnServices] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AnServices] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AnServices] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AnServices] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AnServices] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AnServices] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AnServices] SET  MULTI_USER 
GO
ALTER DATABASE [AnServices] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AnServices] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AnServices] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AnServices] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AnServices] SET DELAYED_DURABILITY = DISABLED 
GO
USE [AnServices]
GO
/****** Object:  Table [dbo].[tblContract]    Script Date: 5/3/2022 7:36:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblContract](
	[ContractID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ServiceRequestID] [int] NOT NULL,
	[ContractTitle] [nvarchar](50) NULL,
	[ContractUrl] [varchar](max) NULL,
	[ContractStartDate] [date] NULL,
	[ContractEndDate] [date] NULL,
	[ContractDeposit] [decimal](18, 2) NULL,
	[ContractTotalPrice] [decimal](18, 2) NULL,
	[ContractStatus] [int] NOT NULL,
	[ContractCreateDate] [datetime] NULL,
	[ContractUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_tblContact] PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblInviteCode]    Script Date: 5/3/2022 7:36:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblInviteCode](
	[InviteCodeID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Code] [varchar](10) NULL,
	[IsUsed] [bit] NULL,
	[ExpireDate] [datetime] NULL,
 CONSTRAINT [PK_tblInviteCode] PRIMARY KEY CLUSTERED 
(
	[InviteCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblInvoice]    Script Date: 5/3/2022 7:36:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInvoice](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceRequestID] [int] NOT NULL,
	[ContractID] [int] NOT NULL,
	[TotalCost] [decimal](18, 2) NULL,
	[TotalCostUpdate] [decimal](18, 2) NULL,
	[InvoiceDateCreate] [datetime] NULL,
	[InvoiceDateUpdate] [datetime] NULL,
	[PromotionID] [int] NULL,
 CONSTRAINT [PK_tblInvoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMaterial]    Script Date: 5/3/2022 7:36:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMaterial](
	[MaterialID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialName] [nvarchar](50) NULL,
	[Unit] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblMaterial] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMedia]    Script Date: 5/3/2022 7:36:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMedia](
	[MediaID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceRequestID] [int] NULL,
	[ReportID] [int] NULL,
	[MediaUrl] [varchar](max) NULL,
 CONSTRAINT [PK_tblMedia] PRIMARY KEY CLUSTERED 
(
	[MediaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPromotion]    Script Date: 5/3/2022 7:36:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPromotion](
	[PromotionID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PromotionCode] [varchar](10) NULL,
	[PromotionDescription] [nvarchar](50) NULL,
	[PromotionValue] [decimal](18, 2) NULL,
	[PromotionActive] [bit] NULL,
	[PromotionDateExpired] [datetime] NULL,
 CONSTRAINT [PK_tblPromotion] PRIMARY KEY CLUSTERED 
(
	[PromotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRepairDetail]    Script Date: 5/3/2022 7:36:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRepairDetail](
	[RepairDetailID] [int] IDENTITY(1,1) NOT NULL,
	[RequestDetailID] [int] NULL,
	[WorkerID] [int] NULL,
	[RepairDateBegin] [datetime] NULL,
	[RepairDateEnd] [datetime] NULL,
	[IsPrimary] [bit] NULL,
	[RequestDetailPriority] [int] NULL,
 CONSTRAINT [PK_tblRepairDetail] PRIMARY KEY CLUSTERED 
(
	[RepairDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblReport]    Script Date: 5/3/2022 7:36:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReport](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[RequestDetailID] [int] NOT NULL,
	[WorkerID] [int] NOT NULL,
	[ReportTitle] [nvarchar](50) NULL,
	[ReportDescription] [nvarchar](250) NULL,
	[ReportDate] [datetime] NULL,
 CONSTRAINT [PK_tblReport] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRequestDetails]    Script Date: 5/3/2022 7:36:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRequestDetails](
	[RequestDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceRequestID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[RequestDetailStatus] [int] NULL,
	[RequestDetailPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_tblRequestDetails] PRIMARY KEY CLUSTERED 
(
	[RequestDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 5/3/2022 7:36:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblServiceRequest]    Script Date: 5/3/2022 7:36:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblServiceRequest](
	[ServiceRequestID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[CustomerPhone] [varchar](10) NULL,
	[CustomerAddress] [nvarchar](150) NULL,
	[ServiceRequestDescription] [nvarchar](150) NULL,
	[ServiceRequestStatus] [int] NULL,
	[ServiceRequestCreateDate] [datetime] NULL,
	[ServiceRequestPackage] [int] NULL,
	[PromotionID] [int] NULL,
	[ServiceRequestReference] [int] NULL,
 CONSTRAINT [PK_tblRequestService] PRIMARY KEY CLUSTERED 
(
	[ServiceRequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblServices]    Script Date: 5/3/2022 7:36:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblServices](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](50) NULL,
	[ServiceDescription] [nvarchar](250) NULL,
	[ServiceStatus] [bit] NULL,
	[TypeWorkerJob] [int] NULL,
	[TypeService] [int] NULL,
	[ServiceImg] [varchar](250) NULL,
 CONSTRAINT [PK_tblServices] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTypeJobs]    Script Date: 5/3/2022 7:36:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTypeJobs](
	[TypeJobID] [int] IDENTITY(1,1) NOT NULL,
	[TypeJobName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRoleTypes] PRIMARY KEY CLUSTERED 
(
	[TypeJobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTypeService]    Script Date: 5/3/2022 7:36:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTypeService](
	[TypeServiceID] [int] IDENTITY(1,1) NOT NULL,
	[TypeServiceDecription] [nvarchar](100) NULL,
	[Value] [int] NULL,
 CONSTRAINT [PK_tblTypeService] PRIMARY KEY CLUSTERED 
(
	[TypeServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsedMaterial]    Script Date: 5/3/2022 7:36:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsedMaterial](
	[UsedMaterialID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NULL,
	[RequestDetailID] [int] NULL,
	[WorkerID] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[QuantityNew] [decimal](18, 2) NULL,
	[Status] [int] NULL,
	[Note] [nvarchar](50) NULL,
	[Message] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUsedMaterial] PRIMARY KEY CLUSTERED 
(
	[UsedMaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 5/3/2022 7:36:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](10) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[Email] [varchar](50) NULL,
	[Role] [int] NOT NULL,
	[TypeJob] [int] NULL,
	[CreateDate] [date] NULL,
	[UpdateDate] [date] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblContract] ON 

INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (64, 246, 291, N'Hợp đồng Hồ Văn Hữu Nghĩa', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1650889851032mau-hop-dong-thi-cong-xay-dung.docx.pdf?alt=media&token=698c488b-2799-4a69-91f0-381fdb6cd975', CAST(N'2022-05-01' AS Date), CAST(N'2022-05-17' AS Date), CAST(0.30 AS Decimal(18, 2)), CAST(6000000.00 AS Decimal(18, 2)), 3, CAST(N'2022-04-25 19:30:53.603' AS DateTime), CAST(N'2022-04-25 19:31:16.860' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (65, 246, 292, N'Hợp đồng Hồ Văn Hữu Nghĩa', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1650890551585SSC102%20Summer%20Semester%202021%20Assessments.pdf?alt=media&token=8e935087-8b93-4f0e-8cd4-c05aa787acfb', CAST(N'2022-05-11' AS Date), CAST(N'2022-05-25' AS Date), CAST(0.20 AS Decimal(18, 2)), CAST(900000.00 AS Decimal(18, 2)), 3, CAST(N'2022-04-25 19:42:33.713' AS DateTime), CAST(N'2022-04-25 19:42:53.877' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (66, 250, 308, N'Hợp đồng Test A', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651290774550IC-Business-Trip-Report-Template-9189_PDF.pdf?alt=media&token=5a30f5ec-7e9f-40c7-839a-671e8dc343c1', CAST(N'2022-04-28' AS Date), CAST(N'2022-05-07' AS Date), CAST(0.10 AS Decimal(18, 2)), CAST(13000000.00 AS Decimal(18, 2)), 3, CAST(N'2022-04-28 14:00:09.337' AS DateTime), CAST(N'2022-04-30 11:15:52.983' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (67, 250, 306, N'Hợp đồng Test A', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651495046777SSC102%20Summer%20Semester%202021%20Assessments.pdf?alt=media&token=c513ff9c-e33b-4cda-b364-19d8ce257ae9', CAST(N'2022-04-28' AS Date), CAST(N'2022-04-30' AS Date), CAST(0.10 AS Decimal(18, 2)), CAST(800000.00 AS Decimal(18, 2)), 3, CAST(N'2022-04-28 14:16:07.013' AS DateTime), CAST(N'2022-05-02 19:37:43.563' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (68, 249, 305, N'Hợp đồng Test A', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651130422091mau-hop-dong-thi-cong-xay-dung.pdf?alt=media&token=e372280a-b7c0-407d-9f49-d4dfb310c949', CAST(N'2022-04-28' AS Date), CAST(N'2022-05-07' AS Date), CAST(0.10 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), 3, CAST(N'2022-04-28 14:20:24.290' AS DateTime), CAST(N'2022-04-29 14:50:53.773' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (69, 249, 304, N'Hợp đồng Test A', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651131383531mau-hop-dong-thi-cong-xay-dung.pdf?alt=media&token=afeed516-e66f-484b-bc6c-1b70ee787310', CAST(N'2022-04-28' AS Date), CAST(N'2022-05-05' AS Date), CAST(0.10 AS Decimal(18, 2)), CAST(500000.00 AS Decimal(18, 2)), 3, CAST(N'2022-04-28 14:31:20.733' AS DateTime), CAST(N'2022-04-29 14:51:02.080' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (70, 249, 303, N'Hợp đồng Test A', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651131781555mau-hop-dong-thi-cong-xay-dung.pdf?alt=media&token=27507801-b9be-41d6-a716-d01bbcc585fc', CAST(N'2022-04-28' AS Date), CAST(N'2022-05-05' AS Date), CAST(0.10 AS Decimal(18, 2)), CAST(800000.00 AS Decimal(18, 2)), 3, CAST(N'2022-04-28 14:43:02.883' AS DateTime), CAST(N'2022-04-29 14:51:11.410' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (71, 248, 297, N'Hợp đồng Test A', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651222998700SSC102%20Summer%20Semester%202021%20Assessments.pdf?alt=media&token=2b040e5f-91be-4954-b1fc-4db8cc5098dc', CAST(N'2022-05-11' AS Date), CAST(N'2022-05-23' AS Date), CAST(0.30 AS Decimal(18, 2)), CAST(111222.00 AS Decimal(18, 2)), 3, CAST(N'2022-04-29 16:00:36.580' AS DateTime), CAST(N'2022-04-30 11:05:30.260' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (72, 246, 309, N'Hợp đồng Test A', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651288057533mau-hop-dong-thi-cong-xay-dung.pdf?alt=media&token=47b1eabf-c0e6-4bf4-9861-4479cdf0fbb8', CAST(N'2022-04-30' AS Date), CAST(N'2022-05-07' AS Date), CAST(0.50 AS Decimal(18, 2)), CAST(5000000.00 AS Decimal(18, 2)), 3, CAST(N'2022-04-30 10:07:39.820' AS DateTime), CAST(N'2022-04-30 10:24:02.347' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (73, 248, 302, N'Hợp đồng Test A', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651290317558mau-hop-dong-thi-cong-xay-dung-TH2.pdf?alt=media&token=cf21b9d2-261f-47b5-8573-02710db0dc96', CAST(N'2022-04-30' AS Date), CAST(N'2022-05-07' AS Date), CAST(0.20 AS Decimal(18, 2)), CAST(500000.00 AS Decimal(18, 2)), 3, CAST(N'2022-04-30 10:45:19.233' AS DateTime), CAST(N'2022-04-30 11:05:15.230' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (74, 246, 298, N'Hợp đồng Test A', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651291788849QUIZ%204_29.10.2021.pdf?alt=media&token=868b658c-e35f-4037-933a-f3c3bc19a810', CAST(N'2022-05-11' AS Date), CAST(N'2022-05-31' AS Date), CAST(0.60 AS Decimal(18, 2)), CAST(9000000.00 AS Decimal(18, 2)), 3, CAST(N'2022-04-30 11:09:51.693' AS DateTime), CAST(N'2022-04-30 11:24:55.990' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (75, 247, 310, N'Hợp đồng Trần Thị Kiều My', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651294243121mau-hop-dong-thi-cong-xay-dung.pdf?alt=media&token=608bf775-6960-40e8-8f3c-f9ba19b567ae', CAST(N'2022-04-30' AS Date), CAST(N'2022-05-03' AS Date), CAST(0.40 AS Decimal(18, 2)), CAST(4000000.00 AS Decimal(18, 2)), 3, CAST(N'2022-04-30 11:41:21.687' AS DateTime), CAST(N'2022-04-30 13:03:09.313' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (76, 257, 313, N'Hợp đồng Nguyễn Thành Phát', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651296199189mau-hop-dong-thi-cong-xay-dung.pdf?alt=media&token=530e5fdf-87ce-4903-a06f-2e72ea1e457f', CAST(N'2022-04-30' AS Date), CAST(N'2022-05-04' AS Date), CAST(0.10 AS Decimal(18, 2)), CAST(5500000.00 AS Decimal(18, 2)), 3, CAST(N'2022-04-30 12:23:20.940' AS DateTime), CAST(N'2022-04-30 14:15:53.560' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (77, 246, 299, N'Hợp đồng Test A', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651297370005mau-hop-dong-thi-cong-xay-dung-TH2.pdf?alt=media&token=f1da86c7-cc22-4905-8d7d-5a6c6e2d1c80', CAST(N'2022-04-30' AS Date), CAST(N'2022-05-03' AS Date), CAST(0.10 AS Decimal(18, 2)), CAST(5200000.00 AS Decimal(18, 2)), 3, CAST(N'2022-04-30 12:42:51.770' AS DateTime), CAST(N'2022-05-01 11:04:56.760' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (78, 247, 312, N'Hợp đồng Nguyễn Phú Quý', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651298391699mau-hop-dong-thi-cong-xay-dung-TH2.pdf?alt=media&token=87905f79-4fae-4c52-a7a9-ab1616a8c7af', CAST(N'2022-04-30' AS Date), CAST(N'2022-05-04' AS Date), CAST(0.10 AS Decimal(18, 2)), CAST(5000000.00 AS Decimal(18, 2)), 3, CAST(N'2022-04-30 12:59:53.733' AS DateTime), CAST(N'2022-04-30 13:01:11.370' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (79, 252, 314, N'Hợp đồng Ngô Tấn Hữu', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651303280887mau-hop-dong-thi-cong-xay-dung.pdf?alt=media&token=4a5d7da8-8f13-4f39-bd3f-e998e7a26af0', CAST(N'2022-04-30' AS Date), CAST(N'2022-05-04' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(600000.00 AS Decimal(18, 2)), 3, CAST(N'2022-04-30 14:21:23.040' AS DateTime), CAST(N'2022-04-30 14:21:34.457' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (80, 252, 315, N'Hợp đồng Ngô Tấn Hữu', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651306496668mau-hop-dong-thi-cong-xay-dung-TH2.pdf?alt=media&token=5f785904-6874-467d-9fc4-ac7514f01e69', CAST(N'2022-05-07' AS Date), CAST(N'2022-05-14' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(500000.00 AS Decimal(18, 2)), 3, CAST(N'2022-04-30 15:14:58.683' AS DateTime), CAST(N'2022-04-30 15:15:09.143' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (81, 259, 316, N'Hợp đồng Huỳnh Thanh Tài', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651383447680mau-hop-dong-thi-cong-xay-dung.pdf?alt=media&token=188cf136-5772-4ad9-9e96-9515e9afb441', CAST(N'2022-05-04' AS Date), CAST(N'2022-05-18' AS Date), CAST(0.10 AS Decimal(18, 2)), CAST(2200000.00 AS Decimal(18, 2)), 3, CAST(N'2022-05-01 12:37:31.107' AS DateTime), CAST(N'2022-05-01 12:41:20.727' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (82, 259, 317, N'Hợp đồng Huỳnh Thanh Tài', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651386499166mau-hop-dong-thi-cong-xay-dung-TH2.pdf?alt=media&token=a3b2ae1d-3271-42ae-a943-595084986313', CAST(N'2022-05-19' AS Date), CAST(N'2022-05-26' AS Date), CAST(0.00 AS Decimal(18, 2)), CAST(800000.00 AS Decimal(18, 2)), 3, CAST(N'2022-05-01 13:28:22.113' AS DateTime), CAST(N'2022-05-01 13:28:58.360' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (83, 246, 300, N'Hợp đồng Test A', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651494481914QUIZ%204_29.10.2021.pdf?alt=media&token=38625c26-9118-49ed-8ce9-9040e52db038', CAST(N'2022-05-05' AS Date), CAST(N'2022-05-24' AS Date), CAST(0.20 AS Decimal(18, 2)), CAST(9000000.00 AS Decimal(18, 2)), 3, CAST(N'2022-05-02 19:28:05.690' AS DateTime), CAST(N'2022-05-02 19:34:10.050' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (84, 250, 307, N'Hợp đồng Test A', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651494562599QUIZ%204_29.10.2021.pdf?alt=media&token=97eb51ae-7517-43e0-9fe1-00d75205d88f', CAST(N'2022-05-12' AS Date), CAST(N'2022-05-30' AS Date), CAST(0.40 AS Decimal(18, 2)), CAST(7300000.00 AS Decimal(18, 2)), 3, CAST(N'2022-05-02 19:29:26.030' AS DateTime), CAST(N'2022-05-02 19:36:57.930' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (85, 247, 311, N'Hợp đồng Nguyễn Thị Kim Ngân', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651494652468QUIZ%204_29.10.2021.pdf?alt=media&token=48d7380e-25b1-455b-b4a8-2b72fa82df43', CAST(N'2022-05-31' AS Date), CAST(N'2022-06-22' AS Date), CAST(0.50 AS Decimal(18, 2)), CAST(3950000.00 AS Decimal(18, 2)), 3, CAST(N'2022-05-02 19:30:55.877' AS DateTime), CAST(N'2022-05-02 19:31:14.447' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (86, 248, 301, N'Hợp đồng Test A', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651494929056SSC102%20Summer%20Semester%202021%20Assessments.pdf?alt=media&token=756f626d-2e79-4515-942e-535a2e061a9a', CAST(N'2022-05-26' AS Date), CAST(N'2022-05-31' AS Date), CAST(0.60 AS Decimal(18, 2)), CAST(5670000.00 AS Decimal(18, 2)), 3, CAST(N'2022-05-02 19:35:32.383' AS DateTime), CAST(N'2022-05-02 19:35:42.270' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (87, 263, 319, N'Hợp đồng Huỳnh Thanh Tài', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651569095596mau-hop-dong-thi-cong-xay-dungTH1.pdf?alt=media&token=9db3fa16-e698-40cf-b1c8-fa2fbe0926c9', CAST(N'2022-05-04' AS Date), CAST(N'2022-05-18' AS Date), CAST(0.10 AS Decimal(18, 2)), CAST(10600000.00 AS Decimal(18, 2)), 3, CAST(N'2022-05-03 16:11:38.973' AS DateTime), CAST(N'2022-05-03 16:12:55.447' AS DateTime))
INSERT [dbo].[tblContract] ([ContractID], [CustomerID], [ServiceRequestID], [ContractTitle], [ContractUrl], [ContractStartDate], [ContractEndDate], [ContractDeposit], [ContractTotalPrice], [ContractStatus], [ContractCreateDate], [ContractUpdateDate]) VALUES (88, 246, 320, N'Hợp đồng Nguyễn Văn Nguyên', N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/files%2F1651580144216mau-hop-dong-thi-cong-xay-dungTH1.pdf?alt=media&token=685f9f0e-b79f-4efa-8108-6d53ce780077', CAST(N'2022-05-05' AS Date), CAST(N'2022-05-23' AS Date), CAST(0.40 AS Decimal(18, 2)), CAST(7777000.00 AS Decimal(18, 2)), 2, CAST(N'2022-05-03 19:15:45.977' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblContract] OFF
SET IDENTITY_INSERT [dbo].[tblInviteCode] ON 

INSERT [dbo].[tblInviteCode] ([InviteCodeID], [CustomerID], [Code], [IsUsed], [ExpireDate]) VALUES (1, 259, N'LDJ5S6YW76', 0, CAST(N'2022-05-31 13:42:32.580' AS DateTime))
INSERT [dbo].[tblInviteCode] ([InviteCodeID], [CustomerID], [Code], [IsUsed], [ExpireDate]) VALUES (2, 247, N'KF5L1LDXSE', 1, CAST(N'2022-06-01 19:32:54.267' AS DateTime))
INSERT [dbo].[tblInviteCode] ([InviteCodeID], [CustomerID], [Code], [IsUsed], [ExpireDate]) VALUES (3, 263, N'QBACN3JYQK', 0, CAST(N'2022-06-02 16:31:51.630' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblInviteCode] OFF
SET IDENTITY_INSERT [dbo].[tblInvoice] ON 

INSERT [dbo].[tblInvoice] ([InvoiceID], [ServiceRequestID], [ContractID], [TotalCost], [TotalCostUpdate], [InvoiceDateCreate], [InvoiceDateUpdate], [PromotionID]) VALUES (46, 291, 64, CAST(4800000.00 AS Decimal(18, 2)), NULL, CAST(N'2022-04-26 11:48:18.487' AS DateTime), NULL, NULL)
INSERT [dbo].[tblInvoice] ([InvoiceID], [ServiceRequestID], [ContractID], [TotalCost], [TotalCostUpdate], [InvoiceDateCreate], [InvoiceDateUpdate], [PromotionID]) VALUES (47, 312, 78, CAST(5000000.00 AS Decimal(18, 2)), NULL, CAST(N'2022-04-30 14:55:04.347' AS DateTime), NULL, NULL)
INSERT [dbo].[tblInvoice] ([InvoiceID], [ServiceRequestID], [ContractID], [TotalCost], [TotalCostUpdate], [InvoiceDateCreate], [InvoiceDateUpdate], [PromotionID]) VALUES (48, 314, 79, CAST(110000.00 AS Decimal(18, 2)), NULL, CAST(N'2022-04-30 15:12:38.810' AS DateTime), NULL, NULL)
INSERT [dbo].[tblInvoice] ([InvoiceID], [ServiceRequestID], [ContractID], [TotalCost], [TotalCostUpdate], [InvoiceDateCreate], [InvoiceDateUpdate], [PromotionID]) VALUES (49, 316, 81, CAST(1320000.00 AS Decimal(18, 2)), NULL, CAST(N'2022-05-01 13:18:20.707' AS DateTime), NULL, NULL)
INSERT [dbo].[tblInvoice] ([InvoiceID], [ServiceRequestID], [ContractID], [TotalCost], [TotalCostUpdate], [InvoiceDateCreate], [InvoiceDateUpdate], [PromotionID]) VALUES (50, 317, 82, CAST(880000.00 AS Decimal(18, 2)), NULL, CAST(N'2022-05-01 13:31:33.730' AS DateTime), NULL, NULL)
INSERT [dbo].[tblInvoice] ([InvoiceID], [ServiceRequestID], [ContractID], [TotalCost], [TotalCostUpdate], [InvoiceDateCreate], [InvoiceDateUpdate], [PromotionID]) VALUES (51, 319, 87, CAST(10600000.00 AS Decimal(18, 2)), NULL, CAST(N'2022-05-03 16:26:54.307' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblInvoice] OFF
SET IDENTITY_INSERT [dbo].[tblMaterial] ON 

INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (1, N'Gạch bê tông', N'viên')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (2, N'Gạch block xây tường', N'viên')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (3, N'Gạch bông', N'viên')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (4, N'Gạch men', N'viên')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (5, N'Gạch lát nền', N'viên')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (6, N'Gạch ốp tường', N'viên')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (7, N'Dây điện đơn', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (8, N'Dây điện đơn mềm', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (9, N'Dây điên đôi', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (10, N'Dây điện xoắn mềm', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (11, N'Dây cáp', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (12, N'Dây cáp bọc nhựa', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (13, N'Dây điện ngoài trời - cáp ngầm 3 pha', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (14, N'Xi măng PC30', N'kg')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (15, N'Xi măng PC40', N'kg')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (16, N'Xi măng PC50', N'kg')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (17, N'Xi măng PCB30', N'kg')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (18, N'Xi măng PCB40', N'kg')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (19, N'Xi măng PCB50', N'kg')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (20, N'Sơn nước', N'kg')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (21, N'Sơn chống rỉ', N'kg')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (22, N'Sơn dầu', N'kg')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (23, N'Vôi gầy', N'kg')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (24, N'Vôi sữa', N'kg')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (25, N'Vôi béo', N'kg')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (26, N'Vôi thủy lực', N'kg')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (27, N'Cát đen', N'kg')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (28, N'Cát vàng', N'kg')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (29, N'Cát Xây Tô', N'kg')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (30, N'Cát bê tông', N'kg')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (31, N'Thép mạ kẽm', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (32, N'Thép hợp kim', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (33, N'Thép carbon', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (34, N'Thép không gỉ', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (35, N'Ống nhựa phi 21', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (36, N'Ống nhựa phi 27', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (37, N'Ống nhựa phi 34', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (38, N'Ống nhựa phi 42', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (39, N'Ống nhựa phi 60', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (40, N'Keo chống thấm', N'tuýp')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (41, N'Keo dán gạch', N'tuýp')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (42, N'Keo dán xây dựng', N'tuýp')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (43, N'Đinh rút nhôm', N'hộp')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (44, N'Đinh rút Inox', N'hộp')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (45, N'Đinh bê tông', N'hộp')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (46, N'Đinh đóng gỗ', N'hộp')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (47, N'Bản lề cửa sắt', N'cái')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (48, N'Bản lề cửa cổng sắt', N'cái')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (49, N'Bản lề cửa gỗ', N'cái')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (50, N'Bản lề cửa tự đóng', N'cái')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (51, N'Bản lề cửa kính', N'cái')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (52, N'Ống gen chịu nhiệt phi 1', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (53, N'Ống gen chịu nhiệt phi 2', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (54, N'Ống gen chịu nhiệt phi 3', N'm')
INSERT [dbo].[tblMaterial] ([MaterialID], [MaterialName], [Unit]) VALUES (55, N'Khác', NULL)
SET IDENTITY_INSERT [dbo].[tblMaterial] OFF
SET IDENTITY_INSERT [dbo].[tblMedia] ON 

INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (521, 290, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1650889345861rn_image_picker_lib_temp_e09ad6bc-4726-425e-b0ec-9c2f238fe4c7.jpg?alt=media&token=4be93a2f-f6be-491b-83a8-615a8785a3cd')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (522, 291, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1650889693944rn_image_picker_lib_temp_54d34b08-4400-4f9f-bada-b4d3ae43941b.jpg?alt=media&token=04bc22e9-6bf6-4e85-a5bf-f7b6be3d21a3')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (523, 292, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1650890480342rn_image_picker_lib_temp_6102cdd0-58e7-4471-9212-6b6c9fa2b830.jpg?alt=media&token=1acfc1c4-eb44-44da-8e70-5f58030c6cea')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (524, NULL, 129, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1650948091794rn_image_picker_lib_temp_c5ef9c2c-41c3-4ef3-9d4e-92416647b303.jpg?alt=media&token=60d591f6-b96b-45b4-9299-e5838765f4cd')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (525, 293, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651120699304rn_image_picker_lib_temp_b6e71ec9-a404-4b23-bda0-f7672f2676f1.jpg?alt=media&token=20d47721-9d2e-40fa-ba4a-292defccc3ce')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (526, 294, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651120742663rn_image_picker_lib_temp_8b9194e5-3a40-47b0-bb4d-e2bbe090a3ac.jpg?alt=media&token=f37adfa0-8d0d-4f53-9178-926171c74030')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (527, 295, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651120903722rn_image_picker_lib_temp_f071ff8a-6d06-432f-8b60-3a22bbaf1d1c.jpg?alt=media&token=afb9b161-5a56-421c-9629-f945588b5d52')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (528, 296, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651120982389rn_image_picker_lib_temp_f8baacef-de13-47c5-a700-47caa7ec1ca6.png?alt=media&token=2a41a324-b862-4cab-b8b7-a45e4cef9210')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (529, 297, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651121191777rn_image_picker_lib_temp_03faa009-f83a-4b34-94f8-b05616f8aaf5.jpg?alt=media&token=972fcf38-aa9a-4f2b-9219-fcaa3eb5c5fa')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (530, 298, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651123316152rn_image_picker_lib_temp_65f37d51-e619-4c0d-a449-c010c7d47f1c.jpg?alt=media&token=1c4c6756-355b-45bf-88be-b792acf3a523')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (531, 299, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651123396167rn_image_picker_lib_temp_49c1b00f-8114-4d1e-b057-9ae5ee9ad805.jpg?alt=media&token=d6f5af5f-29ab-4d0c-9bf4-257bf6a414f8')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (532, 300, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651123439731rn_image_picker_lib_temp_5869ba6f-c7c0-4834-99a1-3b68f2701208.jpg?alt=media&token=809c42c9-df33-4436-b033-5d5c9d9dc3f5')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (533, 301, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651124544708rn_image_picker_lib_temp_f348f7f3-b214-45c1-aa80-c058617684bf.jpg?alt=media&token=bdc2e9e1-4192-4aac-9086-26fb186058a8')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (534, 302, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651124586680rn_image_picker_lib_temp_50e04604-66f9-4550-9ba3-5b5caf49b60e.jpg?alt=media&token=e6b4d5f4-1bbc-488e-9ca3-8f16e3cfd4e0')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (535, 303, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651124782754rn_image_picker_lib_temp_8006b743-c698-4787-b624-685337a3b290.jpg?alt=media&token=8cff2b13-af97-44d3-8615-24c317246ce7')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (536, 304, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651124881157rn_image_picker_lib_temp_c036d8fc-a73f-4643-b57d-e3063690bef3.jpg?alt=media&token=49d1e426-be05-4598-951b-17a5a816727c')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (537, 305, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651124949168rn_image_picker_lib_temp_08bdc43a-7737-4f12-92d5-2cf7a8475810.jpg?alt=media&token=5a10fcd0-db55-4621-a53b-98ac1d44dbed')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (538, 306, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651125041494rn_image_picker_lib_temp_9325248a-3688-42b5-9414-ecc980e2db24.png?alt=media&token=e03f58ef-d01e-4755-adec-36198d6af622')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (539, 307, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651125103778rn_image_picker_lib_temp_c5b5d3e6-8151-49b5-a221-4da4a1e131ed.jpg?alt=media&token=4a21d8cf-4382-404f-a1e1-a5574514552a')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (540, 308, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651125148169rn_image_picker_lib_temp_b93a0c1e-7806-4d2f-b3eb-49a3d9f217e8.jpg?alt=media&token=dd5b6f70-f522-46e3-9438-09759e65e80a')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (541, 309, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651140890924rn_image_picker_lib_temp_9666be71-799e-4434-b98f-dc5159b9f611.jpg?alt=media&token=de87126f-8cbf-44fe-8861-cf6a9f7bcb1a')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (542, NULL, 130, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651226076852rn_image_picker_lib_temp_43af6feb-6bfd-415e-847f-7e90dac302a3.jpg?alt=media&token=2ee3526e-e19f-42b6-b995-57f5ebc284c5')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (543, 310, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651291240676rn_image_picker_lib_temp_79c3aa26-d546-4267-b9eb-7c8d15f96cd3.jpg?alt=media&token=339296eb-4ad7-420c-b010-891fae6a0096')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (544, 310, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651291240696rn_image_picker_lib_temp_f7e17c79-794d-40db-bd32-a77f5ca7839d.jpg?alt=media&token=7a1eae3a-0cff-4677-ba44-1fdb23f5c766')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (545, 311, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651291336733rn_image_picker_lib_temp_d706b485-b715-418a-8b9d-bb9b47ada40a.jpg?alt=media&token=8b50255c-d10b-4d11-948c-c7f7bb2a08c7')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (546, 312, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651291413413rn_image_picker_lib_temp_baa411f7-70d2-4505-923e-a2358619fad0.jpg?alt=media&token=44511462-51fa-41aa-b81b-77914613c473')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (547, NULL, 131, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651292092806rn_image_picker_lib_temp_c58546cc-024f-4601-98c0-19b0a1ccb3e1.jpg?alt=media&token=8a8174a0-8342-4002-b15c-1cac91e49849')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (548, 313, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651294640574rn_image_picker_lib_temp_9a091bdd-e0e5-430f-8e12-20df480cd81d.jpg?alt=media&token=7a379c77-8745-4a0f-aa7f-3756a6eed6ce')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (549, 313, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651294640562rn_image_picker_lib_temp_65af93b2-df11-4ae1-b0ff-9d1402e31f9f.jpg?alt=media&token=bd102c97-8f2d-4145-802b-b5df6e8834af')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (550, 314, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651303223159rn_image_picker_lib_temp_a64db5f5-6597-433d-bcef-b9942d22f20c.jpg?alt=media&token=7df0f49e-3421-4c91-acb2-098ecf2242fc')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (551, NULL, 132, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651305038411rn_image_picker_lib_temp_4de0a87f-a86f-4812-af1a-34abe6e9d2c7.jpg?alt=media&token=219409f6-10d1-493e-a9ab-5e5f44e3bbb8')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (552, NULL, 133, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651306093162rn_image_picker_lib_temp_3e893f7e-12b3-4118-ad74-35f5dd408b5f.png?alt=media&token=ca156f44-9f54-45ab-989c-9d750323439e')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (553, NULL, 134, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651306127876rn_image_picker_lib_temp_d03787a3-4265-4e05-9edf-e5c5ca8ebd78.png?alt=media&token=13f66bbe-b904-4f2e-af93-2f0210595e54')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (554, 315, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651306423392rn_image_picker_lib_temp_5e2da056-bd05-431b-9ba0-773ef1e64029.jpg?alt=media&token=25390315-cbf9-4fac-9c28-aa52e31d18b6')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (555, NULL, 135, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651306555110rn_image_picker_lib_temp_d55410e6-c81d-4663-946f-917d8b35a917.png?alt=media&token=7d4003c2-37dd-49d5-addd-657b49479f78')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (556, 316, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651382876202rn_image_picker_lib_temp_7fc29711-e1c6-402c-beae-feaeb8453556.jpg?alt=media&token=fdc2b92c-375e-4ec2-9bd8-3239347a1e21')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (557, 316, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651382876203rn_image_picker_lib_temp_8fb113c5-a5e0-47ef-ab8e-60ddf95c807b.jpg?alt=media&token=faabeaf6-16b8-4ef2-9c4b-5cbcadfb7f69')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (558, 316, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651382876188rn_image_picker_lib_temp_041aad55-d134-4c6c-ae94-c3000ba7f2c7.jpg?alt=media&token=a4c00656-7fa9-448a-bfae-5f3b3436f0e1')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (559, NULL, 136, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651384768139rn_image_picker_lib_temp_281d75fa-135e-4073-bef2-3439fdbd9b35.jpg?alt=media&token=d5fcb7b9-b570-4c9a-b2db-e07d35fe37a7')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (560, NULL, 137, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651385015104rn_image_picker_lib_temp_f20acc5e-f589-4929-830a-60700f1dbb50.jpg?alt=media&token=54c025f4-ff02-4975-a7a0-8a0306d01b9d')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (561, NULL, 138, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651385441071rn_image_picker_lib_temp_935e75bb-2c07-46a3-8594-e622658b097c.jpg?alt=media&token=d061e943-19a0-4ec9-a7d9-422487b2a573')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (562, NULL, 139, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651385502343rn_image_picker_lib_temp_2c07ce81-ba7b-445b-9c28-6f07e1fbdb5f.jpg?alt=media&token=b2535a80-bbdc-443f-9640-3059106bd23c')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (563, NULL, 140, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651385806617rn_image_picker_lib_temp_c8c5b6b6-a3db-4968-a2e0-543e8bab680a.jpg?alt=media&token=d314db89-045e-4d28-b288-093adf124c75')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (564, 317, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651386380216rn_image_picker_lib_temp_7eb5d102-7633-4def-9f7e-df613df1a90c.jpg?alt=media&token=465548a7-4149-47eb-8a98-06db446719f0')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (565, NULL, 141, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651386626769rn_image_picker_lib_temp_1c24ae99-b24d-40ba-831a-941b3204d803.jpg?alt=media&token=f45a8336-f9be-4d14-9371-23a74071118e')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (566, NULL, 142, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651495243570rn_image_picker_lib_temp_1da78e65-453b-4517-8d26-1cd6499ecafc.jpg?alt=media&token=84f09c55-1a8b-49e8-b395-26d09e19c8db')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (567, NULL, 143, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651495261610rn_image_picker_lib_temp_4b3b59f2-a8af-4ad6-b74c-1a30332351e3.jpg?alt=media&token=ef9113cd-937d-4505-905a-8e671dc7c7f9')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (568, NULL, 144, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651495276649rn_image_picker_lib_temp_0df6e134-ff9f-4cf6-bed3-3b4352f90d4f.jpg?alt=media&token=ac6cbf18-29d4-4726-80f3-1a1154b827c6')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (569, NULL, 145, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651495539974rn_image_picker_lib_temp_5263b2d4-6dfd-4c7e-8828-4cf7feb750a6.jpg?alt=media&token=cb3884a1-ce7b-4a16-9098-0c8c4518caba')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (570, NULL, 146, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651495586835rn_image_picker_lib_temp_b5094021-a501-4b1c-b74a-c2b496025bef.jpg?alt=media&token=50289962-aa37-4393-9911-f70592e45337')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (571, NULL, 147, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651495853354rn_image_picker_lib_temp_a8141c4b-beab-4453-8082-8af89955e2e5.jpg?alt=media&token=871dff5f-7a4e-47ae-9f07-894b85f0040b')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (572, NULL, 148, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651495867225rn_image_picker_lib_temp_42834eee-ecb7-4289-92d9-f9b493e5c23b.jpg?alt=media&token=3446d21b-6797-4c31-9c81-7902fe870d29')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (573, NULL, 149, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651495998473rn_image_picker_lib_temp_6c69d250-0daa-4dde-8dde-9fb24c7a8d7b.jpg?alt=media&token=a7a2d0c1-e388-4882-8633-1a41b5d7a59d')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (574, NULL, 150, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651496085694rn_image_picker_lib_temp_44b0bc7f-fc4f-400c-9092-9a32a2f2e94f.jpg?alt=media&token=64df1f5c-84f0-4574-93d0-4f4b7f0d7770')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (575, NULL, 151, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651496265291rn_image_picker_lib_temp_f5d52123-2e4f-416b-9de3-2cba2ac08d1d.jpg?alt=media&token=90862270-c0c5-4cdc-bdb1-6e30c7cc41c5')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (576, NULL, 152, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651563090843rn_image_picker_lib_temp_6346d1a7-9969-4f64-bfc6-0d7d1eb3e927.jpg?alt=media&token=bd6cb153-610c-4c1d-8e1c-6532115cf4c2')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (577, NULL, 153, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651563211158rn_image_picker_lib_temp_88f7e028-df4a-4061-8718-10d7ebc9ed5c.jpg?alt=media&token=644700f9-00b4-4770-a6c9-2a326f8edf7b')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (578, 318, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651565264491rn_image_picker_lib_temp_3fc9192b-e438-44b2-93f4-0be92f24a009.jpg?alt=media&token=b77c24bc-927a-4a5b-9ef6-3db78d54f17d')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (579, 318, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651565264501rn_image_picker_lib_temp_707671b7-4ae0-4961-a999-5dab641644c6.jpg?alt=media&token=632031e2-eb17-4cf2-9692-4b3aee4383b4')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (580, 319, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651568872921rn_image_picker_lib_temp_66da9869-5412-4809-91f7-21f2d00423db.jpg?alt=media&token=a463dc55-b2e2-41cd-8f7f-e9c7ed7d914b')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (581, 319, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651568872918rn_image_picker_lib_temp_58bef5e2-575d-485d-80b1-3bc019fe1672.jpg?alt=media&token=303cf2dc-7c32-4265-8c4d-985918cbb00f')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (582, NULL, 154, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651569664647rn_image_picker_lib_temp_cd5ef749-176d-4908-98cf-d03a0baab3b7.jpg?alt=media&token=d6e33203-d970-4554-aa73-2f0ab5fb439c')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (583, NULL, 155, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651569711454rn_image_picker_lib_temp_908e0f94-f1d8-4d0c-93f8-720306834271.jpg?alt=media&token=94c01309-c517-4e89-871e-0e8b5ef7ef96')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (584, NULL, 156, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651569771829rn_image_picker_lib_temp_e1d552bd-9ffc-483a-baaa-f58d987ea2e3.jpg?alt=media&token=eb5b6ef0-8076-4bb4-9339-af15234bd81d')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (585, NULL, 157, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Reports%2F1651569954131rn_image_picker_lib_temp_3f546fac-27ca-4f28-9b1a-d3f9344db37e.jpg?alt=media&token=a63c724d-e974-45d9-ad43-6f82e21a87df')
INSERT [dbo].[tblMedia] ([MediaID], [ServiceRequestID], [ReportID], [MediaUrl]) VALUES (586, 320, NULL, N'https://firebasestorage.googleapis.com/v0/b/anservices.appspot.com/o/RequestServices%2F1651580083102rn_image_picker_lib_temp_cc9fa2dc-a322-43aa-9ef5-4a7bba4a1993.jpg?alt=media&token=0c92379a-84d2-48e1-8ca4-db64568fd68c')
SET IDENTITY_INSERT [dbo].[tblMedia] OFF
SET IDENTITY_INSERT [dbo].[tblPromotion] ON 

INSERT [dbo].[tblPromotion] ([PromotionID], [CustomerID], [PromotionCode], [PromotionDescription], [PromotionValue], [PromotionActive], [PromotionDateExpired]) VALUES (1, 259, N'ZHBWL2Y3G2', N'Mã Giảm Giá Giới Thiệu - 5%', CAST(0.05 AS Decimal(18, 2)), 1, CAST(N'2022-05-31 13:43:22.180' AS DateTime))
INSERT [dbo].[tblPromotion] ([PromotionID], [CustomerID], [PromotionCode], [PromotionDescription], [PromotionValue], [PromotionActive], [PromotionDateExpired]) VALUES (2, 263, N'59VBL70S7R', N'Mã Giảm Giá Giới Thiệu - 5%', CAST(0.05 AS Decimal(18, 2)), 1, CAST(N'2022-06-02 16:32:31.210' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblPromotion] OFF
SET IDENTITY_INSERT [dbo].[tblRepairDetail] ON 

INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (292, 451, 232, CAST(N'2022-04-25 19:32:20.847' AS DateTime), NULL, 1, 3)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (293, 451, 235, CAST(N'2022-04-25 19:32:21.000' AS DateTime), NULL, 0, 3)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (295, 452, 213, CAST(N'2022-04-26 11:33:50.893' AS DateTime), NULL, 0, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (304, 452, 214, CAST(N'2022-04-29 14:24:11.510' AS DateTime), NULL, 1, 1)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (306, 463, 217, CAST(N'2022-04-29 14:52:58.323' AS DateTime), NULL, 1, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (307, 463, 220, CAST(N'2022-04-29 14:52:58.347' AS DateTime), NULL, 0, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (309, 464, 233, CAST(N'2022-04-29 15:53:23.133' AS DateTime), NULL, 1, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (311, 465, 245, CAST(N'2022-04-29 15:54:41.593' AS DateTime), NULL, 1, 1)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (314, 457, 233, CAST(N'2022-04-30 11:07:55.717' AS DateTime), NULL, 1, 1)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (316, 462, 222, CAST(N'2022-04-30 11:08:33.270' AS DateTime), NULL, 1, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (317, 462, 224, CAST(N'2022-04-30 11:08:33.277' AS DateTime), NULL, 0, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (318, 469, 233, CAST(N'2022-04-30 11:09:02.547' AS DateTime), NULL, 1, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (319, 469, 232, CAST(N'2022-04-30 11:09:02.550' AS DateTime), NULL, 0, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (323, 472, 253, CAST(N'2022-04-30 13:06:33.203' AS DateTime), NULL, 1, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (331, 472, 242, CAST(N'2022-04-30 13:57:04.710' AS DateTime), NULL, 0, 1)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (334, 475, 232, CAST(N'2022-04-30 14:21:55.733' AS DateTime), NULL, 1, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (335, 475, 231, CAST(N'2022-04-30 14:21:55.737' AS DateTime), NULL, 0, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (336, 476, 220, CAST(N'2022-04-30 15:06:18.400' AS DateTime), NULL, 1, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (337, 476, 218, CAST(N'2022-04-30 15:06:18.413' AS DateTime), NULL, 0, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (338, 477, 233, CAST(N'2022-04-30 15:15:28.020' AS DateTime), NULL, 1, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (339, 477, 231, CAST(N'2022-04-30 15:15:28.023' AS DateTime), NULL, 0, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (340, 478, 227, CAST(N'2022-05-01 12:44:43.790' AS DateTime), NULL, 1, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (341, 478, 226, CAST(N'2022-05-01 12:44:44.523' AS DateTime), NULL, 0, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (342, 479, 233, CAST(N'2022-05-01 12:44:58.277' AS DateTime), NULL, 1, 3)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (344, 480, 255, CAST(N'2022-05-01 12:45:42.507' AS DateTime), NULL, 1, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (345, 480, 212, CAST(N'2022-05-01 12:45:43.257' AS DateTime), NULL, 0, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (346, 479, 232, CAST(N'2022-05-01 13:13:53.607' AS DateTime), NULL, 0, 3)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (347, 481, 255, CAST(N'2022-05-01 13:29:21.200' AS DateTime), NULL, 1, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (348, 481, 212, CAST(N'2022-05-01 13:29:21.973' AS DateTime), NULL, 0, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (354, 474, 254, CAST(N'2022-05-02 00:11:18.410' AS DateTime), NULL, 1, 0)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (365, 470, 230, CAST(N'2022-05-02 02:12:26.380' AS DateTime), NULL, 0, 3)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (366, 458, 258, CAST(N'2022-05-02 02:12:46.593' AS DateTime), NULL, 0, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (382, 468, 260, CAST(N'2022-05-02 02:26:20.720' AS DateTime), NULL, 0, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (384, 458, 228, CAST(N'2022-05-02 02:32:23.670' AS DateTime), NULL, 1, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (385, 468, 235, CAST(N'2022-05-02 02:32:42.580' AS DateTime), NULL, 0, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (387, 468, 231, CAST(N'2022-05-02 02:33:36.973' AS DateTime), NULL, 1, 3)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (388, 468, 234, CAST(N'2022-05-02 02:33:38.497' AS DateTime), NULL, 0, 3)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (390, 470, 258, CAST(N'2022-05-02 02:34:59.287' AS DateTime), NULL, 0, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (391, 470, 226, CAST(N'2022-05-02 02:35:22.237' AS DateTime), NULL, 1, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (392, 474, 215, CAST(N'2022-05-02 02:35:46.303' AS DateTime), NULL, 0, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (395, 459, 222, CAST(N'2022-05-02 02:53:42.487' AS DateTime), NULL, 1, 1)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (404, 473, 233, CAST(N'2022-05-02 03:23:39.873' AS DateTime), NULL, 1, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (405, 473, 234, CAST(N'2022-05-02 03:25:12.070' AS DateTime), NULL, 0, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (406, 471, 221, CAST(N'2022-05-02 19:33:25.450' AS DateTime), NULL, 1, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (407, 471, 223, CAST(N'2022-05-02 19:33:26.227' AS DateTime), NULL, 0, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (408, 460, 256, CAST(N'2022-05-02 19:34:19.430' AS DateTime), NULL, 1, 3)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (409, 461, 255, CAST(N'2022-05-02 19:35:52.600' AS DateTime), NULL, 1, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (410, 461, 212, CAST(N'2022-05-02 19:35:53.350' AS DateTime), NULL, 0, 2)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (411, 466, 227, CAST(N'2022-05-02 19:38:15.637' AS DateTime), NULL, 1, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (412, 466, 228, CAST(N'2022-05-02 19:38:16.403' AS DateTime), NULL, 0, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (413, 467, 214, CAST(N'2022-05-02 19:38:33.807' AS DateTime), NULL, 1, 1)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (414, 467, 213, CAST(N'2022-05-02 19:38:34.570' AS DateTime), NULL, 0, 1)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (415, 459, 224, CAST(N'2022-05-02 19:47:47.250' AS DateTime), NULL, 0, 1)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (416, 484, 258, CAST(N'2022-05-03 16:13:32.117' AS DateTime), NULL, 1, 3)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (417, 484, 230, CAST(N'2022-05-03 16:13:32.123' AS DateTime), NULL, 0, 3)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (418, 484, 226, CAST(N'2022-05-03 16:13:32.123' AS DateTime), NULL, 0, 3)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (419, 485, 255, CAST(N'2022-05-03 16:14:04.100' AS DateTime), NULL, 1, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (420, 485, 211, CAST(N'2022-05-03 16:14:04.107' AS DateTime), NULL, 0, 4)
INSERT [dbo].[tblRepairDetail] ([RepairDetailID], [RequestDetailID], [WorkerID], [RepairDateBegin], [RepairDateEnd], [IsPrimary], [RequestDetailPriority]) VALUES (421, 485, 212, CAST(N'2022-05-03 16:14:04.107' AS DateTime), NULL, 0, 4)
SET IDENTITY_INSERT [dbo].[tblRepairDetail] OFF
SET IDENTITY_INSERT [dbo].[tblReport] ON 

INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (129, 451, 232, N'Báo cáo hoàn thành', N'Yui', CAST(N'2022-04-26 11:41:32.667' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (130, 452, 214, N'Báo cáo hoàn thành', N'Kio', CAST(N'2022-04-29 16:54:42.900' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (131, 457, 233, N'Báo cáo hoàn thành', N'Iop', CAST(N'2022-04-30 11:14:53.950' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (132, 472, 253, N'Báo cáo hoàn thành', N'Opp', CAST(N'2022-04-30 14:50:41.477' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (133, 476, 220, N'Báo cáo hoàn thành', N'Ok', CAST(N'2022-04-30 15:08:15.927' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (134, 475, 232, N'Báo cáo hoàn thành', N'Pkl', CAST(N'2022-04-30 15:08:50.217' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (135, 477, 233, N'Báo cáo hoàn thành', N'Pikk', CAST(N'2022-04-30 15:15:57.837' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (136, 478, 227, N'Báo cáo vấn đề', N'Mái tôn hư hỏng nặng', CAST(N'2022-05-01 12:59:29.823' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (137, 478, 227, N'Báo cáo hoàn thành', N'Đã xong', CAST(N'2022-05-01 13:03:35.980' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (138, 480, 255, N'Báo cáo hoàn thành', N'Xong', CAST(N'2022-05-01 13:10:42.163' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (139, 479, 233, N'Báo cáo hoàn thành', N'Xong', CAST(N'2022-05-01 13:11:42.897' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (140, 479, 233, N'Báo cáo hoàn thành', N'Done', CAST(N'2022-05-01 13:16:47.543' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (141, 481, 255, N'Báo cáo hoàn thành', N'Xong', CAST(N'2022-05-01 13:30:27.577' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (142, 473, 233, N'Báo cáo hoàn thành', N'Xong', CAST(N'2022-05-02 19:40:44.567' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (143, 469, 233, N'Báo cáo hoàn thành', N'Ok', CAST(N'2022-05-02 19:41:02.190' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (144, 464, 233, N'Báo cáo hoàn thành', N'Done', CAST(N'2022-05-02 19:41:17.440' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (145, 458, 228, N'Báo cáo hoàn thành', N'Xong', CAST(N'2022-05-02 19:45:41.020' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (146, 466, 227, N'Báo cáo hoàn thành', N'Xong', CAST(N'2022-05-02 19:46:27.267' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (147, 459, 222, N'Báo cáo hoàn thành', N'Iop', CAST(N'2022-05-02 19:50:54.163' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (148, 462, 222, N'Báo cáo hoàn thành', N'Pop', CAST(N'2022-05-02 19:51:07.837' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (149, 460, 256, N'Báo cáo hoàn thành', N'Lop', CAST(N'2022-05-02 19:53:18.967' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (150, 461, 255, N'Báo cáo hoàn thành', N'Xong', CAST(N'2022-05-02 19:54:46.247' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (151, 463, 217, N'Báo cáo hoàn thành', N'Pop', CAST(N'2022-05-02 19:57:46.030' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (152, 465, 245, N'Báo cáo hoàn thành', N'Xong', CAST(N'2022-05-03 14:31:30.383' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (153, 467, 214, N'Báo cáo hoàn thành', N'Ok', CAST(N'2022-05-03 14:34:02.377' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (154, 484, 258, N'Báo cáo vấn đề', N'Gạch hư hại', CAST(N'2022-05-03 16:21:03.627' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (155, 485, 255, N'Báo cáo vấn đề', N'Kính vỡ', CAST(N'2022-05-03 16:21:50.520' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (156, 485, 255, N'Báo cáo hoàn thành', N'Hoàn thành sửa chữa', CAST(N'2022-05-03 16:22:50.867' AS DateTime))
INSERT [dbo].[tblReport] ([ReportID], [RequestDetailID], [WorkerID], [ReportTitle], [ReportDescription], [ReportDate]) VALUES (157, 484, 258, N'Báo cáo hoàn thành', N'Xong', CAST(N'2022-05-03 16:25:53.247' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblReport] OFF
SET IDENTITY_INSERT [dbo].[tblRequestDetails] ON 

INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (450, 290, 4, 2, NULL)
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (451, 291, 4, 11, CAST(6000000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (452, 292, 8, 11, CAST(900000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (453, 293, 5, 2, NULL)
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (454, 294, 3, 2, NULL)
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (455, 295, 1, 2, NULL)
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (456, 296, 10, 2, NULL)
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (457, 297, 4, 11, CAST(111222.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (458, 298, 2, 11, CAST(9000000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (459, 299, 11, 11, CAST(5200000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (460, 300, 13, 11, CAST(9000000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (461, 301, 6, 11, CAST(5670000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (462, 302, 11, 11, CAST(500000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (463, 303, 13, 11, CAST(800000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (464, 304, 4, 11, CAST(500000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (465, 305, 10, 11, CAST(50000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (466, 306, 2, 11, CAST(800000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (467, 307, 5, 11, CAST(7300000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (468, 308, 3, 6, CAST(500000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (469, 309, 4, 11, CAST(5000000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (470, 310, 2, 6, CAST(500000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (471, 311, 11, 6, CAST(3950000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (472, 312, 10, 11, CAST(5000000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (473, 313, 4, 9, CAST(500000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (474, 313, 8, 6, CAST(5000000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (475, 314, 3, 16, CAST(500000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (476, 314, 13, 11, CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (477, 315, 3, 12, CAST(500000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (478, 316, 2, 11, CAST(600000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (479, 316, 4, 11, CAST(800000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (480, 316, 8, 16, CAST(800000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (481, 317, 8, 11, CAST(800000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (482, 318, 1, 2, NULL)
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (483, 318, 8, 2, NULL)
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (484, 319, 1, 11, CAST(600000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (485, 319, 8, 11, CAST(10000000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (486, 320, 2, 2, CAST(678000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (487, 320, 5, 2, CAST(5649000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblRequestDetails] ([RequestDetailID], [ServiceRequestID], [ServiceID], [RequestDetailStatus], [RequestDetailPrice]) VALUES (488, 320, 11, 2, CAST(1450000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[tblRequestDetails] OFF
SET IDENTITY_INSERT [dbo].[tblRoles] ON 

INSERT [dbo].[tblRoles] ([RoleID], [RoleName]) VALUES (1, N'Staff')
INSERT [dbo].[tblRoles] ([RoleID], [RoleName]) VALUES (2, N'Worker')
INSERT [dbo].[tblRoles] ([RoleID], [RoleName]) VALUES (3, N'Customer')
SET IDENTITY_INSERT [dbo].[tblRoles] OFF
SET IDENTITY_INSERT [dbo].[tblServiceRequest] ON 

INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (290, 246, N'Hồ Văn Hữu Nghĩa', N'0900000001', N'Bến Tre', N'Nước rò rỉ', 5, CAST(N'2022-04-25 19:22:28.303' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (291, 246, N'Hồ Văn Hữu Nghĩa', N'0900000001', N'Bến Tre', N'Nước bị rò rỉ', 13, CAST(N'2022-04-25 19:28:14.993' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (292, 246, N'Hồ Văn Hữu Nghĩa', N'0900000001', N'Bến Tre', N'Kính vỡ', 17, CAST(N'2022-04-25 19:41:21.733' AS DateTime), 1, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (293, 247, N'Test A', N'0999999999', N'Test A', N'Test 28-4 (1)', 8, CAST(N'2022-04-28 11:38:22.073' AS DateTime), 1, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (294, 247, N'Test A', N'0900000000', N'Test A', N'Test 28-4 (2)', 8, CAST(N'2022-04-28 11:39:05.153' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (295, 247, N'Test A', N'0900000000', N'Test A', N'Gạch hư', 1, CAST(N'2022-04-28 11:41:46.267' AS DateTime), 1, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (296, 247, N'Test A', N'0900000000', N'Test A', N'Trần nhà bị dột', 1, CAST(N'2022-04-28 11:43:05.427' AS DateTime), 1, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (297, 248, N'Test A', N'0900000001', N'Test A', N'Điện hư', 17, CAST(N'2022-04-28 11:46:34.430' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (298, 246, N'Test A', N'0900000000', N'Test A', N'Mái tôn hư', 17, CAST(N'2022-04-28 12:21:58.813' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (299, 246, N'Test A', N'0900000000', N'Test A', N'Tường nhà cần sơn mới', 17, CAST(N'2022-04-28 12:23:18.807' AS DateTime), 1, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (300, 246, N'Test A', N'0900000000', N'Test A', N'Cửa sắt hư', 17, CAST(N'2022-04-28 12:24:02.453' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (301, 248, N'Test A', N'0900000000', N'Test A', N'Kính hư', 17, CAST(N'2022-04-28 12:42:27.630' AS DateTime), 1, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (302, 248, N'Test A', N'0900000000', N'Test A', N'Sơn nhà', 17, CAST(N'2022-04-28 12:43:10.387' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (303, 249, N'Test A', N'0900000000', N'Test A', N'Thay cửa sắt', 17, CAST(N'2022-04-28 12:46:25.760' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (304, 249, N'Test A', N'0900000000', N'Test A', N'Sửa ống nước', 17, CAST(N'2022-04-28 12:48:03.787' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (305, 249, N'Test A', N'0900000000', N'Test A', N'Trần nhà thạch cao', 17, CAST(N'2022-04-28 12:49:12.063' AS DateTime), 1, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (306, 250, N'Test A', N'0900000000', N'Test A', N'Mái tôn nứt', 17, CAST(N'2022-04-28 12:50:44.797' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (307, 250, N'Test A', N'0900000000', N'Test A', N'Thay kính mới', 17, CAST(N'2022-04-28 12:51:46.340' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (308, 250, N'Test A', N'0900000000', N'Test A', N'Điện chập mạch', 6, CAST(N'2022-04-28 12:52:30.920' AS DateTime), 1, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (309, 246, N'Test A', N'0900000000', N'Test A', N'Ống nước hư', 17, CAST(N'2022-04-28 17:14:53.770' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (310, 247, N'Trần Thị Kiều My', N'0900000000', N'Tuyên Quang', N'Mái tôn ngả màu', 6, CAST(N'2022-04-30 11:00:43.057' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (311, 247, N'Nguyễn Thị Kim Ngân', N'0900000000', N'Thanh Hóa', N'Sơn cửa nhà', 6, CAST(N'2022-04-30 11:02:16.630' AS DateTime), 1, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (312, 247, N'Nguyễn Phú Quý', N'0900000000', N'Đà Nẵng', N'Trần nhà cũ hư hại nặng', 13, CAST(N'2022-04-30 11:03:33.450' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (313, 257, N'Nguyễn Thành Phát', N'0900000000', N'Vĩnh Long', N'Ống nước hư, kính bể', 6, CAST(N'2022-04-30 11:57:21.177' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (314, 252, N'Ngô Tấn Hữu', N'0900000000', N'Tiền Giang', N'Cửa bị vỡ nát', 13, CAST(N'2022-04-30 14:20:23.170' AS DateTime), 1, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (315, 252, N'Ngô Tấn Hữu', N'0900000000', N'Tiền Giang', N'Cửa bị vỡ nát (làm lại yêu cầu mới)', 13, CAST(N'2022-04-30 15:13:45.857' AS DateTime), 1, 0, 314)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (316, 259, N'Huỳnh Thanh Tài', N'0375250209', N'15 Võ Văn Kiệt, Phường 16, Quận 8, Tp.HCM', N'Mái tôn bị lủng, hệ thống nước rò rỉ, kính bể cần thay', 13, CAST(N'2022-05-01 12:27:59.633' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (317, 259, N'Huỳnh Thanh Tài', N'0375250209', N'15 Võ Văn Kiệt, Phường 16, Quận 8, Tp.HCM', N'Mái tôn bị lủng, hệ thống nước rò rỉ, kính bể cần thay (làm lại yêu cầu mới)', 13, CAST(N'2022-05-01 13:26:21.467' AS DateTime), 2, 0, 316)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (318, 246, N'Huỳnh', N'0966997799', N'Bến Tre', N'Nền gạch hư, kính vỡ', 15, CAST(N'2022-05-03 15:07:44.333' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (319, 263, N'Huỳnh Thanh Tài', N'0333390990', N'150 Võ Văn Kiệt, Phường 16, Quận 8, TpHCM', N'Nền gạch bị hư, kính vỡ nặng', 13, CAST(N'2022-05-03 16:08:01.853' AS DateTime), 2, 0, NULL)
INSERT [dbo].[tblServiceRequest] ([ServiceRequestID], [CustomerID], [CustomerName], [CustomerPhone], [CustomerAddress], [ServiceRequestDescription], [ServiceRequestStatus], [ServiceRequestCreateDate], [ServiceRequestPackage], [PromotionID], [ServiceRequestReference]) VALUES (320, 246, N'Nguyễn Văn Nguyên', N'0966997788', N'Bến Tre', N'Sửa mái tôn', 15, CAST(N'2022-05-03 19:14:42.787' AS DateTime), 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[tblServiceRequest] OFF
SET IDENTITY_INSERT [dbo].[tblServices] ON 

INSERT [dbo].[tblServices] ([ServiceID], [ServiceName], [ServiceDescription], [ServiceStatus], [TypeWorkerJob], [TypeService], [ServiceImg]) VALUES (1, N'Đục nền gạch cũ', N'40.000-60.000/m2', 1, 4, 1, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Services%2Fbrick-wall.png?alt=media&token=287c4a63-12e5-42df-8843-01a75a2e9c4e')
INSERT [dbo].[tblServices] ([ServiceID], [ServiceName], [ServiceDescription], [ServiceStatus], [TypeWorkerJob], [TypeService], [ServiceImg]) VALUES (2, N'Tháo dỡ mái tôn', N'40.000-65.000/m2', 1, 4, 3, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Services%2Froof.png?alt=media&token=dcd1a8e0-2dbe-4a01-80f8-cc14b4ab501b')
INSERT [dbo].[tblServices] ([ServiceID], [ServiceName], [ServiceDescription], [ServiceStatus], [TypeWorkerJob], [TypeService], [ServiceImg]) VALUES (3, N'Hệ thống điện âm tường', N'Báo giá sau khi khảo sát', 1, 5, 1, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Services%2Felectrical-energy.png?alt=media&token=6a9c146b-db43-4f85-9f42-4fe0cf8ff774')
INSERT [dbo].[tblServices] ([ServiceID], [ServiceName], [ServiceDescription], [ServiceStatus], [TypeWorkerJob], [TypeService], [ServiceImg]) VALUES (4, N'Hệ thống nước âm tường', N'Báo giá sau khi khảo sát', 1, 5, 1, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Services%2Fpipe.png?alt=media&token=a22a0770-2882-4380-8594-c6bf5ac19c74')
INSERT [dbo].[tblServices] ([ServiceID], [ServiceName], [ServiceDescription], [ServiceStatus], [TypeWorkerJob], [TypeService], [ServiceImg]) VALUES (5, N'Lắp kính cường lực 12ly', N'Báo giá sau khi khảo sát', 1, 1, 1, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Services%2Fglass.png?alt=media&token=1029d2c4-4ece-444f-92d2-edd8bf23fb73')
INSERT [dbo].[tblServices] ([ServiceID], [ServiceName], [ServiceDescription], [ServiceStatus], [TypeWorkerJob], [TypeService], [ServiceImg]) VALUES (6, N'Lắp kính cường lực 15ly', N'Báo giá sau khi khảo sát', 1, 1, 1, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Services%2Fglass.png?alt=media&token=1029d2c4-4ece-444f-92d2-edd8bf23fb73')
INSERT [dbo].[tblServices] ([ServiceID], [ServiceName], [ServiceDescription], [ServiceStatus], [TypeWorkerJob], [TypeService], [ServiceImg]) VALUES (8, N'Lắp kính cường lực 19ly', N'Báo giá sau khi khảo sát', 1, 1, 1, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Services%2Fglass.png?alt=media&token=1029d2c4-4ece-444f-92d2-edd8bf23fb73')
INSERT [dbo].[tblServices] ([ServiceID], [ServiceName], [ServiceDescription], [ServiceStatus], [TypeWorkerJob], [TypeService], [ServiceImg]) VALUES (10, N'Làm trần thạch cao nổi', N'130.000 – 260.000 /m2 phụ thuộc vào vật liệu nhà phân phối', 1, 7, 2, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Services%2F3501444.png?alt=media&token=fe54b84d-eaa8-43f0-b603-8586afe2f452')
INSERT [dbo].[tblServices] ([ServiceID], [ServiceName], [ServiceDescription], [ServiceStatus], [TypeWorkerJob], [TypeService], [ServiceImg]) VALUES (11, N'Thi công sơn', N'30.000 - 80.000/m2 phụ thuộc vào vật liệu nhà phân phối', 1, 3, 1, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Services%2Fpaint.png?alt=media&token=59a9ccfa-eca4-46b1-b233-6c1eb4ce6df2')
INSERT [dbo].[tblServices] ([ServiceID], [ServiceName], [ServiceDescription], [ServiceStatus], [TypeWorkerJob], [TypeService], [ServiceImg]) VALUES (13, N'Gia công cửa sắt', N'300.000 - 900.000/m2 Báo giá theo mẫu hoặc bản vẽ thiết kế', 1, 2, 1, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Services%2Fsingle-door.png?alt=media&token=4bb6c698-2114-4df0-87d1-034929fcaa55')
INSERT [dbo].[tblServices] ([ServiceID], [ServiceName], [ServiceDescription], [ServiceStatus], [TypeWorkerJob], [TypeService], [ServiceImg]) VALUES (14, N'Xây cầu thang', N'Giá giao động từ 1.200.000 /1 mét dài, cho đến 1.750.000 /1 mét dài, tùy thuộc vào kiểu dáng, mẫu mã và chất liệu của các loại gỗ, và kính', 1, 4, 1, N'https://firebasestorage.googleapis.com/v0/b/anservice-f4076.appspot.com/o/Services%2Fstairs.png?alt=media&token=fcd9f180-eb6a-48a1-a35a-a0c17ab0e669')
SET IDENTITY_INSERT [dbo].[tblServices] OFF
SET IDENTITY_INSERT [dbo].[tblTypeJobs] ON 

INSERT [dbo].[tblTypeJobs] ([TypeJobID], [TypeJobName]) VALUES (1, N'Thợ nhôm - kính')
INSERT [dbo].[tblTypeJobs] ([TypeJobID], [TypeJobName]) VALUES (2, N'Thợ cơ khí')
INSERT [dbo].[tblTypeJobs] ([TypeJobID], [TypeJobName]) VALUES (3, N'Thợ sơn')
INSERT [dbo].[tblTypeJobs] ([TypeJobID], [TypeJobName]) VALUES (4, N'Thợ xây')
INSERT [dbo].[tblTypeJobs] ([TypeJobID], [TypeJobName]) VALUES (5, N'Thợ điện - nước')
INSERT [dbo].[tblTypeJobs] ([TypeJobID], [TypeJobName]) VALUES (6, N'Thợ điện lạnh')
INSERT [dbo].[tblTypeJobs] ([TypeJobID], [TypeJobName]) VALUES (7, N'Thợ thạch cao')
SET IDENTITY_INSERT [dbo].[tblTypeJobs] OFF
SET IDENTITY_INSERT [dbo].[tblTypeService] ON 

INSERT [dbo].[tblTypeService] ([TypeServiceID], [TypeServiceDecription], [Value]) VALUES (1, N'Dịch vụ xác nhận HÀI LÒNG tự động sau 1 ngày', 1)
INSERT [dbo].[tblTypeService] ([TypeServiceID], [TypeServiceDecription], [Value]) VALUES (2, N'Dịch vụ xác nhận HÀI LÒNG tự động sau 7 ngày', 8)
INSERT [dbo].[tblTypeService] ([TypeServiceID], [TypeServiceDecription], [Value]) VALUES (3, N'Dịch vụ xác nhận HÀI LÒNG tự động sau 14 ngày', 15)
SET IDENTITY_INSERT [dbo].[tblTypeService] OFF
SET IDENTITY_INSERT [dbo].[tblUsedMaterial] ON 

INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (151, 8, 451, 232, CAST(33.00 AS Decimal(18, 2)), NULL, 3, N'Gui', NULL)
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (152, 11, 451, 232, CAST(69.00 AS Decimal(18, 2)), NULL, 1, N'Jahsh', N'ZZ')
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (153, 2, 451, 232, CAST(77.00 AS Decimal(18, 2)), CAST(123.00 AS Decimal(18, 2)), 3, N'Qqss', N'WW')
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (154, 20, 457, 233, CAST(369.00 AS Decimal(18, 2)), NULL, 3, N'Ghpppp', NULL)
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (155, 15, 457, 233, CAST(58.00 AS Decimal(18, 2)), NULL, 1, N'', N'pop')
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (156, 22, 457, 233, CAST(7.00 AS Decimal(18, 2)), CAST(90.00 AS Decimal(18, 2)), 3, N'Màu hồng', N'mkj')
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (157, 7, 472, 253, CAST(58.00 AS Decimal(18, 2)), NULL, 3, N'Uiio', NULL)
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (158, 49, 472, 253, CAST(33.00 AS Decimal(18, 2)), NULL, 1, N'Hvhko', N'Không phù hợp')
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (159, 39, 472, 253, CAST(800.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 3, N'Hgvh', N'dư vật liệu')
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (160, 14, 478, 227, CAST(10.00 AS Decimal(18, 2)), NULL, 3, N'Màu xanh', NULL)
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (161, 42, 478, 227, CAST(6.00 AS Decimal(18, 2)), NULL, 1, N'', N'Vật liệu không liên quan')
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (162, 32, 478, 227, CAST(5.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 3, N'', N'điều chỉnh lại')
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (163, 7, 479, 233, CAST(8.00 AS Decimal(18, 2)), NULL, 3, N'', NULL)
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (164, 26, 480, 255, CAST(369.00 AS Decimal(18, 2)), NULL, 3, N'Gấp', NULL)
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (165, 2, 485, 255, CAST(100.00 AS Decimal(18, 2)), NULL, 3, N'8x8x18', NULL)
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (166, 15, 485, 255, CAST(50.00 AS Decimal(18, 2)), NULL, 1, N'', N'Vật tư không phù hợp')
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (167, 41, 485, 255, CAST(4.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 3, N'Loại cao cấp', N'Điều chỉnh')
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (168, 51, 484, 258, CAST(1.00 AS Decimal(18, 2)), NULL, 3, N'', NULL)
INSERT [dbo].[tblUsedMaterial] ([UsedMaterialID], [MaterialID], [RequestDetailID], [WorkerID], [Quantity], [QuantityNew], [Status], [Note], [Message]) VALUES (169, 44, 484, 258, CAST(10.00 AS Decimal(18, 2)), NULL, 3, N'', NULL)
SET IDENTITY_INSERT [dbo].[tblUsedMaterial] OFF
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (7, N'string111', N'Aa123@', N'Hoàng', N'0123456779', N'Q1', N'hoang@gmail.com', 1, NULL, CAST(N'2022-01-22' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (138, N'staff123', N'Abc123A', N'Tài', N'0999997992', N'Q1', N'staff@gmail.com', 1, NULL, CAST(N'2022-04-09' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (211, NULL, NULL, N'Nguyễn Văn Đạt', N'0800000061', N'Tuy Hoà, Phú Yên', N'datupdate@gmail.com', 2, 1, CAST(N'2022-04-25' AS Date), CAST(N'2022-05-03' AS Date), 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (212, NULL, NULL, N'Trần Minh Huy', N'0800000062', N'Gia Lai', N'huy123@gmail.com', 2, 1, CAST(N'2022-04-25' AS Date), CAST(N'2022-05-03' AS Date), 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (213, NULL, NULL, N'Đặng Gia Bảo', N'0800000003', N'Hà Nội', N'bao123@gmail.com', 2, 1, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (214, NULL, NULL, N'Nguyễn Nhật Sơn', N'0800000004', N'Bắc Ninh', N'son123@gmail.com', 2, 1, CAST(N'2022-04-25' AS Date), CAST(N'2022-05-03' AS Date), 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (215, NULL, NULL, N'Nguyễn Phát Đạt', N'0800000005', N'Lai Châu', N'dat123@gmail.com', 2, 1, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (216, NULL, NULL, N'Phạm Nhật Duy', N'0800000006', N'Lào Cai', N'duy123@gmail.com', 2, 2, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (217, NULL, NULL, N'Đỗ Hùng Dũng', N'0800000007', N'Hà Giang', N'nam123@gmail.com', 2, 2, CAST(N'2022-04-25' AS Date), CAST(N'2022-04-26' AS Date), 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (218, NULL, NULL, N'Phạm Gia Hưng', N'0800000008', N'Cao Bằng', N'hung123@gmail.com', 2, 2, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (219, NULL, NULL, N'Nguyễn Minh Hiếu', N'0800000009', N'Điện Biên', N'hieu123@gmail.com', 2, 2, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (220, NULL, NULL, N'Nguyễn Nhật Phong', N'0800000010', N'Yên Bái', N'phong123@gmail.com', 2, 2, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (221, NULL, NULL, N'Nguyễn Văn Thành', N'0800000011', N'Tuyên Quang', N'thanh123@gmail.com', 2, 3, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (222, NULL, NULL, N'Nguyễn Văn Nguyên', N'0800000012', N'Lạng Sơn', N'nguyen123@gmail.com', 2, 3, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (223, NULL, NULL, N'Ngô Tấn Lộc', N'0800000013', N'Thái Nguyên', N'loc123@gmail.com', 2, 3, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (224, NULL, NULL, N'Phạm Hoàng Đức', N'0800000014', N'Phú Thọ', N'duc@gmail.com', 2, 3, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (225, NULL, NULL, N'Nguyễn Văn Cao Kỷ', N'0800000015', N'Phú Thọ', N'ky123@gmail.com', 2, 3, CAST(N'2022-04-25' AS Date), CAST(N'2022-05-03' AS Date), 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (226, NULL, NULL, N'Nguyễn Thế Vinh', N'0800000016', N'Sơn La', N'vinh123@gmail.com', 2, 4, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (227, NULL, NULL, N'Phạm Minh Tiến', N'0800000017', N'Bắc Ninh', N'tien123@gmail.com', 2, 4, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (228, NULL, NULL, N'Nguyễn Chí Thiện', N'0800000018', N'Bắc Giang', N'thien123@gmail.com', 2, 4, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (229, NULL, NULL, N'Nguyễn Thanh Hải', N'0800000019', N'Quảng Ninh', N'hai123@gmail.com', 2, 4, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (230, NULL, NULL, N'Trần Nhật Quang', N'0800000020', N'Hòa Bình', N'quang@gmail.com', 2, 4, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (231, NULL, NULL, N'Nguyễn Hoàng Lâm', N'0800000021', N'Hưng Yên', N'lam123@gmail.com', 2, 5, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (232, NULL, NULL, N'Nguyễn Văn Trung', N'0800000022', N'Hải Dương', N'trung123@gmail.com', 2, 5, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (233, NULL, NULL, N'Nguyễn Anh Tú', N'0800000023', N'Thái Bình', N'tu123@gmail.com', 2, 5, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (234, NULL, NULL, N'Nguyễn Thế Hùng', N'0800000024', N'Hà Nam', N'hung123@gmail.com', 2, 5, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (235, NULL, NULL, N'Nguyễn Văn Cường', N'0800000025', N'Nam Định', N'cuong123@gmail.com', 2, 5, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (236, NULL, NULL, N'Ngô Tấn Vũ', N'0800000026', N'Ninh Bình', N'vu123@gmail.com', 2, 6, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (237, NULL, NULL, N'Nguyễn Văn Toàn', N'0800000027', N'Thanh Hóa', N'toan123@gmail.com', 2, 6, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (238, NULL, NULL, N'Phạm Thiên Ân', N'0800000028', N'Nghệ An', N'an123@gmail.com', 2, 6, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (239, NULL, NULL, N'Nguyễn Văn Trường', N'0800000029', N'Hà Tĩnh', N'truong123@gmail.com', 2, 6, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (240, NULL, NULL, N'Nguyễn Trung Kiên', N'0800000030', N'Quảng Bình', N'kien@gmail.com', 2, 6, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (241, NULL, NULL, N'Nguyễn Tấn Phước', N'0800000031', N'Quảng Trị', N'phuoc123@gmail.com', 2, 7, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (242, NULL, NULL, N'Nguyễn Nhật Tân', N'0800000032', N'Đà Nẵng', N'tan123@gmail.com', 2, 7, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (243, NULL, NULL, N'Lương Minh Tùng', N'0800000033', N'Quảng Nam', N'tung123@gmail.com', 2, 7, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (244, NULL, NULL, N'Trần Ngọc Quý', N'0800000034', N'Quãng Ngãi', N'quy123@gmail.com', 2, 7, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (245, NULL, NULL, N'Ngô Trọng Hữu', N'0800000035', N'Kon Tum', N'huu123@gmail.com', 2, 7, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (246, NULL, NULL, N'Hồ Văn Hữu Nghĩa', N'0900000001', N'Bến Tre', N'Nghia123@gmail.com', 3, NULL, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (247, NULL, NULL, N'Nguyễn Tấn Đạt', N'0900000002', N'Tây Ninh', N'Dat123@gmail.com', 3, NULL, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (248, NULL, NULL, N'Hồ Thị Bích Hạnh', N'0900000003', N'Đồng Nai', N'Hanh123@gmail.com', 3, NULL, CAST(N'2022-04-25' AS Date), NULL, 10)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (249, NULL, NULL, N'Nguyễn Hoàng Giang', N'0900000004', N'Kiên Giang', N'Giang123@gmail.com', 3, NULL, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (250, NULL, NULL, N'Nguyễn Ngọc Quãng', N'0900000005', N'Cà Mau', N'Quang123@gmail.com', 3, NULL, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (251, NULL, NULL, N'Nguyễn Nhật Huy', N'0900000006', N'An Giang', N'Huy123@gmail.com', 3, NULL, CAST(N'2022-04-25' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (252, NULL, NULL, N'Ngô Tấn Hữu', N'0900000007', N'Tiền Giang', N'TanHuu123@gmail.com', 3, NULL, CAST(N'2022-04-25' AS Date), CAST(N'2022-04-30' AS Date), 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (253, NULL, NULL, N'Nguyễn Văn Luân', N'0800000040', N'Bắc Ninh', N'luan@gmail.com', 2, 7, CAST(N'2022-04-26' AS Date), CAST(N'2022-05-03' AS Date), 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (254, NULL, NULL, N'Hoàng Tuyết Anh', N'0900000100', N'Test_28042022', N'', 2, 1, CAST(N'2022-04-28' AS Date), CAST(N'2022-04-30' AS Date), 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (255, NULL, NULL, N'Mai Kim Trí', N'0800000001', N'Kiên Giang', N'tri123@gmail.com', 2, 1, CAST(N'2022-04-28' AS Date), CAST(N'2022-05-03' AS Date), 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (256, NULL, NULL, N'Nguyễn Trí Hùng', N'0900000102', N'Q9', N'chihung@gmail.com', 2, 2, CAST(N'2022-04-30' AS Date), CAST(N'2022-04-30' AS Date), 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (257, NULL, NULL, N'Nguyễn Thành Phát', N'0900000009', N'Vĩnh Long', N'Phat123@gmail.com', 3, NULL, CAST(N'2022-04-30' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (258, NULL, NULL, N'Hoàng Văn Khoa', N'0800000000', N'Tây Ninh', N'khoa@gmail.com', 2, 4, CAST(N'2022-04-30' AS Date), CAST(N'2022-05-03' AS Date), 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (259, NULL, NULL, N'Nguyễn Văn A', N'0375250210', N'Bến Tre', N'Yanohuynh1211@gmail.com', 3, NULL, CAST(N'2022-05-01' AS Date), CAST(N'2022-05-01' AS Date), 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (260, NULL, NULL, N'Phú Thương', N'0900000105', N'Nguyễn Oanh, Gò Vấp. HCM', N'phuthuong@gmail.com', 2, 5, CAST(N'2022-05-01' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (261, NULL, NULL, N'Phú Minh', N'0900000106', N'New York', N'phuthuong@gmail.com', 2, 5, CAST(N'2022-05-01' AS Date), CAST(N'2022-05-01' AS Date), 5)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (262, NULL, NULL, N'Nguyễn Văn B', N'0333390996', N'Đồng Tháp', N'Nguyen@gmail.com', 3, NULL, CAST(N'2022-05-01' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (263, NULL, NULL, N'Nguyễn Văn A', N'0333390990', N'Vĩnh Long', N'yanohuynh1211@gmail.com', 3, NULL, CAST(N'2022-05-03' AS Date), CAST(N'2022-05-03' AS Date), 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (264, NULL, NULL, N'Nguyễn Văn B', N'0333390991', N'Bến Tre', N'Abc@gmail.com', 3, NULL, CAST(N'2022-05-03' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (265, NULL, NULL, N'Lý Gia Hoàng', N'0938932440', N'Q12', N'hoanglg6699@gmail.com', 2, 1, CAST(N'2022-05-03' AS Date), NULL, 4)
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [FullName], [PhoneNumber], [Address], [Email], [Role], [TypeJob], [CreateDate], [UpdateDate], [Status]) VALUES (266, NULL, NULL, N'Nguyễn Mai Trí', N'0900000107', N'Q12', N'haaa@gmail.com', 2, 1, CAST(N'2022-05-03' AS Date), CAST(N'2022-05-03' AS Date), 5)
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
/****** Object:  Index [IX_tblInvoice]    Script Date: 5/3/2022 7:36:55 PM ******/
ALTER TABLE [dbo].[tblInvoice] ADD  CONSTRAINT [IX_tblInvoice] UNIQUE NONCLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tblUsers]    Script Date: 5/3/2022 7:36:55 PM ******/
ALTER TABLE [dbo].[tblUsers] ADD  CONSTRAINT [IX_tblUsers] UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblContract]  WITH CHECK ADD  CONSTRAINT [FK_tblContract_tblRequestServices] FOREIGN KEY([ServiceRequestID])
REFERENCES [dbo].[tblServiceRequest] ([ServiceRequestID])
GO
ALTER TABLE [dbo].[tblContract] CHECK CONSTRAINT [FK_tblContract_tblRequestServices]
GO
ALTER TABLE [dbo].[tblInviteCode]  WITH CHECK ADD  CONSTRAINT [FK_tblInviteCode_tblUsers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tblUsers] ([UserID])
GO
ALTER TABLE [dbo].[tblInviteCode] CHECK CONSTRAINT [FK_tblInviteCode_tblUsers]
GO
ALTER TABLE [dbo].[tblInvoice]  WITH CHECK ADD  CONSTRAINT [FK_tblInvoice_tblContract] FOREIGN KEY([ContractID])
REFERENCES [dbo].[tblContract] ([ContractID])
GO
ALTER TABLE [dbo].[tblInvoice] CHECK CONSTRAINT [FK_tblInvoice_tblContract]
GO
ALTER TABLE [dbo].[tblInvoice]  WITH CHECK ADD  CONSTRAINT [FK_tblInvoice_tblPromotion] FOREIGN KEY([PromotionID])
REFERENCES [dbo].[tblPromotion] ([PromotionID])
GO
ALTER TABLE [dbo].[tblInvoice] CHECK CONSTRAINT [FK_tblInvoice_tblPromotion]
GO
ALTER TABLE [dbo].[tblMedia]  WITH CHECK ADD  CONSTRAINT [FK_tblMedia_tblReport] FOREIGN KEY([ReportID])
REFERENCES [dbo].[tblReport] ([ReportID])
GO
ALTER TABLE [dbo].[tblMedia] CHECK CONSTRAINT [FK_tblMedia_tblReport]
GO
ALTER TABLE [dbo].[tblMedia]  WITH CHECK ADD  CONSTRAINT [FK_tblMedia_tblRequestServices] FOREIGN KEY([ServiceRequestID])
REFERENCES [dbo].[tblServiceRequest] ([ServiceRequestID])
GO
ALTER TABLE [dbo].[tblMedia] CHECK CONSTRAINT [FK_tblMedia_tblRequestServices]
GO
ALTER TABLE [dbo].[tblPromotion]  WITH CHECK ADD  CONSTRAINT [FK_tblPromotion_tblUsers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tblUsers] ([UserID])
GO
ALTER TABLE [dbo].[tblPromotion] CHECK CONSTRAINT [FK_tblPromotion_tblUsers]
GO
ALTER TABLE [dbo].[tblRepairDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblRepairDetail_tblRequestDetails] FOREIGN KEY([RequestDetailID])
REFERENCES [dbo].[tblRequestDetails] ([RequestDetailID])
GO
ALTER TABLE [dbo].[tblRepairDetail] CHECK CONSTRAINT [FK_tblRepairDetail_tblRequestDetails]
GO
ALTER TABLE [dbo].[tblRepairDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblRepairDetail_tblUsers] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[tblUsers] ([UserID])
GO
ALTER TABLE [dbo].[tblRepairDetail] CHECK CONSTRAINT [FK_tblRepairDetail_tblUsers]
GO
ALTER TABLE [dbo].[tblReport]  WITH CHECK ADD  CONSTRAINT [FK_tblReport_tblRequestDetails] FOREIGN KEY([RequestDetailID])
REFERENCES [dbo].[tblRequestDetails] ([RequestDetailID])
GO
ALTER TABLE [dbo].[tblReport] CHECK CONSTRAINT [FK_tblReport_tblRequestDetails]
GO
ALTER TABLE [dbo].[tblReport]  WITH CHECK ADD  CONSTRAINT [FK_tblReport_tblUsers] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[tblUsers] ([UserID])
GO
ALTER TABLE [dbo].[tblReport] CHECK CONSTRAINT [FK_tblReport_tblUsers]
GO
ALTER TABLE [dbo].[tblRequestDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblRequestDetails_tblRequestServices] FOREIGN KEY([ServiceRequestID])
REFERENCES [dbo].[tblServiceRequest] ([ServiceRequestID])
GO
ALTER TABLE [dbo].[tblRequestDetails] CHECK CONSTRAINT [FK_tblRequestDetails_tblRequestServices]
GO
ALTER TABLE [dbo].[tblRequestDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblRequestDetails_tblServices] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[tblServices] ([ServiceID])
GO
ALTER TABLE [dbo].[tblRequestDetails] CHECK CONSTRAINT [FK_tblRequestDetails_tblServices]
GO
ALTER TABLE [dbo].[tblServiceRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblRequestServices_tblUsers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tblUsers] ([UserID])
GO
ALTER TABLE [dbo].[tblServiceRequest] CHECK CONSTRAINT [FK_tblRequestServices_tblUsers]
GO
ALTER TABLE [dbo].[tblServiceRequest]  WITH CHECK ADD  CONSTRAINT [FK_tblServiceRequest_tblServiceRequest] FOREIGN KEY([ServiceRequestReference])
REFERENCES [dbo].[tblServiceRequest] ([ServiceRequestID])
GO
ALTER TABLE [dbo].[tblServiceRequest] CHECK CONSTRAINT [FK_tblServiceRequest_tblServiceRequest]
GO
ALTER TABLE [dbo].[tblServices]  WITH CHECK ADD  CONSTRAINT [FK_tblServices_tblTypeService] FOREIGN KEY([TypeService])
REFERENCES [dbo].[tblTypeService] ([TypeServiceID])
GO
ALTER TABLE [dbo].[tblServices] CHECK CONSTRAINT [FK_tblServices_tblTypeService]
GO
ALTER TABLE [dbo].[tblUsedMaterial]  WITH CHECK ADD  CONSTRAINT [FK_tblUsedMaterial_tblMaterial] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[tblMaterial] ([MaterialID])
GO
ALTER TABLE [dbo].[tblUsedMaterial] CHECK CONSTRAINT [FK_tblUsedMaterial_tblMaterial]
GO
ALTER TABLE [dbo].[tblUsedMaterial]  WITH CHECK ADD  CONSTRAINT [FK_tblUsedMaterial_tblRequestDetails] FOREIGN KEY([RequestDetailID])
REFERENCES [dbo].[tblRequestDetails] ([RequestDetailID])
GO
ALTER TABLE [dbo].[tblUsedMaterial] CHECK CONSTRAINT [FK_tblUsedMaterial_tblRequestDetails]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([Role])
REFERENCES [dbo].[tblRoles] ([RoleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblTypeJobs] FOREIGN KEY([TypeJob])
REFERENCES [dbo].[tblTypeJobs] ([TypeJobID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblTypeJobs]
GO
USE [master]
GO
ALTER DATABASE [AnServices] SET  READ_WRITE 
GO
