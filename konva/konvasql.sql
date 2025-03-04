USE [DataNhaHang]
GO
/****** Object:  Table [dbo].[Warehouses]    Script Date: 09/29/2024 23:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[X] [float] NULL,
	[Y] [float] NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[Color] [nvarchar](20) NULL,
	[GroupName] [nvarchar](50) NULL,
	[StatusCheck] [nvarchar](1) NULL CONSTRAINT [DF_Warehouses_Status]  DEFAULT (0),
	[src] [nvarchar](300) NULL,
 CONSTRAINT [PK__Warehouses__55009F39] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DM_freelocation]    Script Date: 09/29/2024 23:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DM_freelocation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mahang] [nvarchar](50) NULL,
	[ModelName] [nvarchar](50) NULL,
	[Line] [nchar](10) NULL,
	[vitri] [nvarchar](50) NULL,
	[trangthaiOQC] [nvarchar](1) NULL,
	[ngaytao] [datetime] NULL,
	[nguoitao] [nvarchar](50) NULL
) ON [PRIMARY]
GO
