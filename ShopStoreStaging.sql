CREATE DATABASE [Store_Project_Stag]
GO
USE [Store_Project_Stag]
GO

/****** Object:  Table [dbo].[Brand]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Brand_Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[City_Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Brand]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Brand](
	[BrandKey] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Category]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Category](
	[CategoryKey] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_City]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_City](
	[CityKey] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Customer]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Customer](
	[CustomerKey] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[OrderDate] [date] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Employee]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Employee](
	[EmployeeKey] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[DOB] [date] NULL,
	[HireDate] [date] NULL,
	[IdentityNumber] [nvarchar](50) NULL,
	[StoreKey] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Product]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Product](
	[ProductKey] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Size] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[BrandKey] [nvarchar](50) NULL,
	[CategoryKey] [nvarchar](50) NULL,
	[StandardPrice] [numeric](18, 2) NOT NULL,
	[Price] [numeric](18, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Source_Online]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Source_Online](
	[Source_OnlineKey] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Store]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Store](
	[StoreKey] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[CityKey] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_Id] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[DOB] [date] NULL,
	[HireDate] [date] NULL,
	[IdentityNumber] [nvarchar](50) NULL,
	[Store_Id] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Product]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Product](
	[OrderDate] [date] NOT NULL,
	[StoreKey] [nvarchar](50) NOT NULL,
	[ProductKey] [nvarchar](50) NOT NULL,
	[Qty] [int] NOT NULL,
	[Revenue] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_SalesOrder]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_SalesOrder](
	[OrderDate] [date] NOT NULL,
	[Customer_Id] [nvarchar](50) NOT NULL,
	[Employee_Id] [nvarchar](50) NOT NULL,
	[Source_Online_Id] [nvarchar](50) NOT NULL,
	[Revenue] [decimal](18, 2) NOT NULL,
	[RevenueOnline] [decimal](18, 2) NOT NULL,
	[RevenueOffline] [decimal](18, 2) NOT NULL,
	[StandardCost] [decimal](18, 2) NOT NULL,
	[Profit] [decimal](18, 2) NOT NULL,
	[NumberOrder] [int] NOT NULL,
	[NumberOrderOnline] [int] NOT NULL,
	[NumberOrderOffline] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[Order_Detail_Id] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Product_Id] [nvarchar](50) NULL,
	[Qty] [numeric](8, 0) NOT NULL,
	[Price] [numeric](18, 2) NOT NULL,
	[Total] [numeric](18, 2) NOT NULL,
	[Order_Header_Id] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Header]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Header](
	[Order_Header_Id] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[Status] [int] NOT NULL,
	[IsOnline] [bit] NOT NULL,
	[Source_Online_Id] [nvarchar](50) NULL,
	[Customer_Id] [nvarchar](50) NULL,
	[Employee_Id] [nvarchar](50) NULL,
	[Store_Id] [nvarchar](50) NULL,
	[StandardCost] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_Id] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Size] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[Brand_Id] [nvarchar](50) NULL,
	[Category_Id] [nvarchar](50) NULL,
	[StandardPrice] [numeric](18, 2) NOT NULL,
	[Price] [numeric](18, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Source_Online]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Source_Online](
	[Source_Online_Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[Store_Id] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[City_Id] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

USE [Store_Project_Stag]
GO
/****** Object:  StoredProcedure [dbo].[truncate_stag]    Script Date: 3/15/2023 10:19:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER procedure [truncate_stag]
as
begin
	truncate table [dbo].Dim_Brand
	truncate table [dbo].Dim_Category
	truncate table [dbo].Dim_City
	truncate table [dbo].Dim_Customer
	truncate table [dbo].Dim_Date
	truncate table [dbo].Dim_Employee
	truncate table [dbo].Dim_Product
	truncate table [dbo].Dim_Source_Online
	truncate table [dbo].Dim_Store
	truncate table [dbo].Fact_SalesOrder
	truncate table [dbo].Fact_Product

end
GO

-- index

CREATE NONCLUSTERED INDEX IX_Customer ON [dbo].Customer
	(
	Customer_Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX IX_Customer_Name ON [dbo].Customer
	(
	Phone,
	Name
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX IX_Order_Header ON [dbo].Order_Header
	(
	Order_Header_Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX IX_Order_Header_1 ON [dbo].Order_Header
	(
	Source_Online_Id,
	Employee_Id,
	Customer_Id,
	Store_Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX IX_Order_Detail ON [dbo].Order_Detail
	(
	Order_Detail_Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX IX_Order_Detail_1 ON [dbo].Order_Detail
	(
	Order_Header_Id,
	Product_Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO