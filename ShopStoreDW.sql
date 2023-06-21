CREATE DATABASE [Store_Project_DW]
GO
USE [Store_Project_DW]

GO
/****** Object:  Table [dbo].[Dim_Brand]    Script Date: 3/15/2023 10:18:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Brand](
	[BrandKey] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Dim_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Category]    Script Date: 3/15/2023 10:18:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Category](
	[CategoryKey] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Dim_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_City]    Script Date: 3/15/2023 10:18:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_City](
	[CityKey] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Dim_City] PRIMARY KEY CLUSTERED 
(
	[CityKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Customer]    Script Date: 3/15/2023 10:18:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Customer](
	[CustomerKey] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 3/15/2023 10:18:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[DateKey] [nvarchar](8) NOT NULL,
	[MonthKey] [nvarchar](6) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Dim_Date] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Employee]    Script Date: 3/15/2023 10:18:40 AM ******/
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
	[StoreKey] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Month]    Script Date: 3/15/2023 10:18:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Month](
	[MonthKey] [nvarchar](6) NOT NULL,
	[YearKey] [nvarchar](4) NOT NULL,
	[Month] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Month] PRIMARY KEY CLUSTERED 
(
	[MonthKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Product]    Script Date: 3/15/2023 10:18:40 AM ******/
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
	[Price] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_Dim_Product] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Source_Online]    Script Date: 3/15/2023 10:18:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Source_Online](
	[SourceOnlineKey] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Dim_Source_Online] PRIMARY KEY CLUSTERED 
(
	[SourceOnlineKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Store]    Script Date: 3/15/2023 10:18:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Store](
	[StoreKey] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[CityKey] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Dim_Store] PRIMARY KEY CLUSTERED 
(
	[StoreKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Year]    Script Date: 3/15/2023 10:18:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Year](
	[YearKey] [nvarchar](4) NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Year] PRIMARY KEY CLUSTERED 
(
	[YearKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Product]    Script Date: 3/15/2023 10:18:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [nvarchar](8) NOT NULL,
	[StoreKey] [nvarchar](50) NOT NULL,
	[ProductKey] [nvarchar](50) NOT NULL,
	[Qty] [int] NOT NULL,
	[Revenue] [numeric](18, 2) NULL,
 CONSTRAINT [PK_Fact_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_SalesOrder]    Script Date: 3/15/2023 10:18:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_SalesOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [nvarchar](8) NOT NULL,
	[CustomerKey] [nvarchar](50) NOT NULL,
	[EmployeeKey] [nvarchar](50) NOT NULL,
	[SourceOnlineKey] [nvarchar](50) NOT NULL,
	[Revenue] [decimal](18, 2) NOT NULL,
	[RevenueOnline] [decimal](18, 2) NOT NULL,
	[RevenueOffline] [decimal](18, 2) NOT NULL,
	[StandardCost] [decimal](18, 2) NOT NULL,
	[Profit] [decimal](18, 2) NOT NULL,
	[NumberOrder] [int] NOT NULL,
	[NumberOrderOnline] [int] NOT NULL,
	[NumberOrderOffline] [int] NOT NULL,
 CONSTRAINT [PK_Fact_SalesOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dim_Date]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Date_Dim_Month] FOREIGN KEY([MonthKey])
REFERENCES [dbo].[Dim_Month] ([MonthKey])
GO
ALTER TABLE [dbo].[Dim_Date] CHECK CONSTRAINT [FK_Dim_Date_Dim_Month]
GO
ALTER TABLE [dbo].[Dim_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Employee_Dim_Store] FOREIGN KEY([StoreKey])
REFERENCES [dbo].[Dim_Store] ([StoreKey])
GO
ALTER TABLE [dbo].[Dim_Employee] CHECK CONSTRAINT [FK_Dim_Employee_Dim_Store]
GO
ALTER TABLE [dbo].[Dim_Month]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Month_Dim_Year] FOREIGN KEY([YearKey])
REFERENCES [dbo].[Dim_Year] ([YearKey])
GO
ALTER TABLE [dbo].[Dim_Month] CHECK CONSTRAINT [FK_Dim_Month_Dim_Year]
GO
ALTER TABLE [dbo].[Dim_Product]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Product_Dim_Brand] FOREIGN KEY([BrandKey])
REFERENCES [dbo].[Dim_Brand] ([BrandKey])
GO
ALTER TABLE [dbo].[Dim_Product] CHECK CONSTRAINT [FK_Dim_Product_Dim_Brand]
GO
ALTER TABLE [dbo].[Dim_Product]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Product_Dim_Category] FOREIGN KEY([CategoryKey])
REFERENCES [dbo].[Dim_Category] ([CategoryKey])
GO
ALTER TABLE [dbo].[Dim_Product] CHECK CONSTRAINT [FK_Dim_Product_Dim_Category]
GO
ALTER TABLE [dbo].[Dim_Store]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Store_Dim_City] FOREIGN KEY([CityKey])
REFERENCES [dbo].[Dim_City] ([CityKey])
GO
ALTER TABLE [dbo].[Dim_Store] CHECK CONSTRAINT [FK_Dim_Store_Dim_City]
GO
ALTER TABLE [dbo].[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Product_Dim_Date] FOREIGN KEY([DateKey])
REFERENCES [dbo].[Dim_Date] ([DateKey])
GO
ALTER TABLE [dbo].[Fact_Product] CHECK CONSTRAINT [FK_Fact_Product_Dim_Date]
GO
ALTER TABLE [dbo].[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Product_Dim_Product] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[Dim_Product] ([ProductKey])
GO
ALTER TABLE [dbo].[Fact_Product] CHECK CONSTRAINT [FK_Fact_Product_Dim_Product]
GO
ALTER TABLE [dbo].[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Product_Dim_Store] FOREIGN KEY([StoreKey])
REFERENCES [dbo].[Dim_Store] ([StoreKey])
GO
ALTER TABLE [dbo].[Fact_Product] CHECK CONSTRAINT [FK_Fact_Product_Dim_Store]
GO
ALTER TABLE [dbo].[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_Customer] FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[Dim_Customer] ([CustomerKey])
GO
ALTER TABLE [dbo].[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_Customer]
GO
ALTER TABLE [dbo].[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_Date] FOREIGN KEY([DateKey])
REFERENCES [dbo].[Dim_Date] ([DateKey])
GO
ALTER TABLE [dbo].[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_Date]
GO
ALTER TABLE [dbo].[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_Employee] FOREIGN KEY([EmployeeKey])
REFERENCES [dbo].[Dim_Employee] ([EmployeeKey])
GO
ALTER TABLE [dbo].[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_Employee]
GO
ALTER TABLE [dbo].[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_SourceOnline] FOREIGN KEY([SourceOnlineKey])
REFERENCES [dbo].[Dim_Source_Online] ([SourceOnlineKey])
GO
ALTER TABLE [dbo].[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_SourceOnline]
GO

-- index
USE Store_Project_DW
GO
CREATE NONCLUSTERED INDEX IX_Dim_Customer_Name ON [dbo].Dim_Customer
	(
	Name,
	Phone
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX IX_Fact_Product ON [dbo].Fact_Product
	(
	DateKey,
	ProductKey,
	StoreKey
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX IX_Fact_SalesOrder ON [dbo].Fact_SalesOrder
	(
	SourceOnlineKey,
	CustomerKey,
	EmployeeKey,
	DateKey
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO