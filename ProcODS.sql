USE [Store_Project]
GO

CREATE or alter procedure [dbo].[Brand_create]
(
	@Name nvarchar(50)
)
as
begin
    set nocount on

    declare @temp nvarchar(50) = lower(newid())

    insert into Brand
    (
        Brand_Id
        ,Name
        ,CreatedDate
        ,UpdatedDate
    )
    values (
        @temp
        ,@Name
        ,GETDATE()
        ,null
    )
    select @temp
end
GO
/****** Object:  StoredProcedure [dbo].[Brand_delete]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Brand_delete]
(
    @Brand_Id nvarchar(50)
)
as
begin
    set nocount on

    delete from Brand where Brand_Id=@Brand_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Brand_getall]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Brand_getall]
as
begin
    set nocount on

    select a.* from Brand a 
    
end
GO
/****** Object:  StoredProcedure [dbo].[Brand_getbyid]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Brand_getbyid]
(
    @Brand_Id nvarchar(50)
)
as
begin
    set nocount on

    select * from Brand where Brand_Id=@Brand_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Brand_getpaging]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Brand_getpaging]
(
    @pageIndex int
    ,@pageSize int
)
as
begin
    set nocount on

    select
        a.* 
        ,count(*) over() as TotalCount
    from Brand a 
    where 1=1 
    order by Brand_Id
        offset @pageSize * @pageIndex rows 
    fetch next @pageSize rows only
    

end
GO
/****** Object:  StoredProcedure [dbo].[Brand_update]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Brand_update]
(
    @Brand_Id nvarchar(50)
    ,@Name nvarchar(50)
)
as
begin
    set nocount on

    update Brand set 
        Name=@Name
        ,UpdatedDate=GetDate()
     where Brand_Id=@Brand_Id
end
GO
/****** Object:  StoredProcedure [dbo].[Category_create]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Category_create]
(
    @Name nvarchar(250)
)
as
begin
    set nocount on

    declare @temp nvarchar(50) = lower(newid())

    insert into Category
    (
        Category_Id
        ,Name
        ,CreatedDate
        ,UpdatedDate
    )
    values (
        @temp
        ,@Name
        ,GETDATE()
        ,null
    )
    select @temp
end
GO
/****** Object:  StoredProcedure [dbo].[Category_delete]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Category_delete]
(
    @Category_Id nvarchar(50)
)
as
begin
    set nocount on

    delete from Category where Category_Id=@Category_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Category_getall]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Category_getall]
as
begin
    set nocount on

    select a.* from Category a 
    
end
GO
/****** Object:  StoredProcedure [dbo].[Category_getbyid]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Category_getbyid]
(
    @Category_Id nvarchar(50)
)
as
begin
    set nocount on

    select * from Category where Category_Id=@Category_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Category_getpaging]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Category_getpaging]
(
    @pageIndex int
    ,@pageSize int
)
as
begin
    set nocount on

    select
        a.* 
        ,count(*) over() as TotalCount
    from Category a 
    where 1=1 
    order by Category_Id
        offset @pageSize * @pageIndex rows 
    fetch next @pageSize rows only
    

end
GO
/****** Object:  StoredProcedure [dbo].[Category_update]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Category_update]
(
    @Category_Id nvarchar(50)
    ,@Name nvarchar(250)
)
as
begin
    set nocount on

    update Category set 
        Name=@Name
        ,UpdatedDate=GetDate()
     where Category_Id=@Category_Id
end
GO
/****** Object:  StoredProcedure [dbo].[City_create]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[City_create]
(
    @Name nvarchar(250)
)
as
begin
    set nocount on

    declare @temp nvarchar(50) = lower(newid())

    insert into City
    (
        City_Id
        ,Name
        ,CreatedDate
        ,UpdatedDate
    )
    values (
        @temp
        ,@Name
        ,GETDATE()
        ,null
    )
    select @temp
end
GO
/****** Object:  StoredProcedure [dbo].[City_delete]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[City_delete]
(
    @City_Id nvarchar(50)
)
as
begin
    set nocount on

    delete from City where City_Id=@City_Id

end
GO
/****** Object:  StoredProcedure [dbo].[City_getall]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[City_getall]
as
begin
    set nocount on

    select a.* from City a 
    
end
GO
/****** Object:  StoredProcedure [dbo].[City_getbyid]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[City_getbyid]
(
    @City_Id nvarchar(50)
)
as
begin
    set nocount on

    select * from City where City_Id=@City_Id

end
GO
/****** Object:  StoredProcedure [dbo].[City_getpaging]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[City_getpaging]
(
    @pageIndex int
    ,@pageSize int
)
as
begin
    set nocount on

    select
        a.* 
        ,count(*) over() as TotalCount
    from City a 
    where 1=1 
    order by City_Id
        offset @pageSize * @pageIndex rows 
    fetch next @pageSize rows only
    

end
GO
/****** Object:  StoredProcedure [dbo].[City_update]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[City_update]
(
    @City_Id nvarchar(50)
    ,@Name nvarchar(250)
)
as
begin
    set nocount on

    update City set 
        Name=@Name
        ,UpdatedDate=GetDate()
     where City_Id=@City_Id
end
GO
/****** Object:  StoredProcedure [dbo].[Customer_create]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Customer_create]
(

    @Name nvarchar(250)
    ,@Phone nvarchar(50)
)
as
begin
    set nocount on

    declare @temp nvarchar(50) = lower(newid())

    insert into Customer
    (
        Customer_Id
        ,Name
        ,Phone
        ,CreatedDate
        ,UpdatedDate
    )
    values (
        @temp
        ,@Name
        ,@Phone
		,GETDATE()
        ,null
    )
end
GO
/****** Object:  StoredProcedure [dbo].[Customer_delete]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Customer_delete]
(
    @Customer_Id nvarchar(50)
)
as
begin
    set nocount on

    delete from Customer where Customer_Id=@Customer_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Customer_getall]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Customer_getall]
as
begin
    set nocount on

    select a.* from Customer a 
    
end
GO
/****** Object:  StoredProcedure [dbo].[Customer_getbyid]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Customer_getbyid]
(
    @Customer_Id nvarchar(50)
)
as
begin
    set nocount on

    select * from Customer where Customer_Id=@Customer_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Customer_getpaging]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Customer_getpaging]
(
    @pageIndex int
    ,@pageSize int
)
as
begin
    set nocount on

    select
        a.* 
        ,count(*) over() as TotalCount
    from Customer a 
    where 1=1 
    order by Customer_Id
        offset @pageSize * @pageIndex rows 
    fetch next @pageSize rows only
    

end
GO
/****** Object:  StoredProcedure [dbo].[Customer_update]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Customer_update]
(
    @Customer_Id nvarchar(50)
    ,@Name nvarchar(250)
    ,@Phone nvarchar(50)
)
as
begin
    set nocount on

    update Customer set 
        Name=@Name
        ,Phone=@Phone
        ,UpdatedDate=GetDate()
     where Customer_Id=@Customer_Id
end
GO
/****** Object:  StoredProcedure [dbo].[Employee_create]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Employee_create]
(
    @Code nvarchar(10)
    ,@Name nvarchar(250)
    ,@DOB date
    ,@HireDate date
    ,@IdentityNumber nvarchar(50)
    ,@Store_Id nvarchar(50)
)
as
begin
    set nocount on

    declare @temp nvarchar(50) = lower(newid())

    insert into Employee
    (
        Employee_Id
        ,Code
        ,Name
        ,DOB
        ,HireDate
        ,IdentityNumber
        ,Store_Id
        ,CreatedDate
        ,UpdatedDate
    )
    values (
        @temp
        ,@Code
        ,@Name
        ,@DOB
        ,@HireDate
        ,@IdentityNumber
        ,@Store_Id
        ,GETDATE()
        ,null
    )
    select @temp
end
GO
/****** Object:  StoredProcedure [dbo].[Employee_delete]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Employee_delete]
(
    @Employee_Id nvarchar(50)
)
as
begin
    set nocount on

    delete from Employee where Employee_Id=@Employee_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Employee_getall]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Employee_getall]
as
begin
    set nocount on

    select a.* from Employee a 
    
end
GO
/****** Object:  StoredProcedure [dbo].[Employee_getbyid]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Employee_getbyid]
(
    @Employee_Id nvarchar(50)
)
as
begin
    set nocount on

    select * from Employee where Employee_Id=@Employee_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Employee_getpaging]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Employee_getpaging]
(
    @pageIndex int
    ,@pageSize int
)
as
begin
    set nocount on

    select
        a.* 
        ,count(*) over() as TotalCount
    from Employee a 
    where 1=1 
    order by Employee_Id
        offset @pageSize * @pageIndex rows 
    fetch next @pageSize rows only
    

end
GO
/****** Object:  StoredProcedure [dbo].[Employee_update]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Employee_update]
(
    @Employee_Id nvarchar(50)
    ,@Code nvarchar(10)
    ,@Name nvarchar(250)
    ,@DOB date
    ,@HireDate date
    ,@IdentityNumber nvarchar(50)
    ,@Store_Id nvarchar(50)
)
as
begin
    set nocount on

    update Employee set 
        Code=@Code
        ,Name=@Name
        ,DOB=@DOB
        ,HireDate=@HireDate
        ,IdentityNumber=@IdentityNumber
        ,Store_Id=@Store_Id
        ,UpdatedDate=GetDate()
     where Employee_Id=@Employee_Id
end
GO
/****** Object:  StoredProcedure [dbo].[Order_Detail_create]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Order_Detail_create]
(
    @Product_Id nvarchar(50)
    ,@Qty numeric(8,0)
    ,@Price numeric(18,2)
    ,@Total numeric(18,2)
    ,@Order_Header_Id nvarchar(50)
)
as
begin
    set nocount on

    declare @temp nvarchar(50) = lower(newid())

    insert into Order_Detail
    (
        Order_Detail_Id
        ,Product_Id
        ,Qty
        ,Price
        ,Total
        ,Order_Header_Id
        ,CreatedDate
        ,UpdatedDate
    )
    values (
        @temp
        ,@Product_Id
        ,@Qty
        ,@Price
        ,@Total
        ,@Order_Header_Id
		,GETDATE()
        ,null
    )
end
GO
/****** Object:  StoredProcedure [dbo].[Order_Detail_delete]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Order_Detail_delete]
(
    @Order_Detail_Id nvarchar(50)
)
as
begin
    set nocount on

    delete from Order_Detail where Order_Detail_Id=@Order_Detail_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Order_Detail_getall]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Order_Detail_getall]
as
begin
    set nocount on

    select a.* from Order_Detail a 
    
end
GO
/****** Object:  StoredProcedure [dbo].[Order_Detail_getbyid]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Order_Detail_getbyid]
(
    @Order_Detail_Id nvarchar(50)
)
as
begin
    set nocount on

    select * from Order_Detail where Order_Detail_Id=@Order_Detail_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Order_Detail_getpaging]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Order_Detail_getpaging]
(
    @pageIndex int
    ,@pageSize int
)
as
begin
    set nocount on

    select
        a.* 
        ,count(*) over() as TotalCount
    from Order_Detail a 
    where 1=1 
    order by Order_Detail_Id
        offset @pageSize * @pageIndex rows 
    fetch next @pageSize rows only
    

end
GO
/****** Object:  StoredProcedure [dbo].[Order_Detail_update]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Order_Detail_update]
(
    @Order_Detail_Id nvarchar(50)
    ,@Product_Id nvarchar(50)
    ,@Qty numeric(8,0)
    ,@Price numeric(18,2)
    ,@Total numeric(18,2)
    ,@Order_Header_Id nvarchar(50)
)
as
begin
    set nocount on

    update Order_Detail set 
        Product_Id=@Product_Id
        ,Qty=@Qty
        ,Price=@Price
        ,Total=@Total
        ,Order_Header_Id=@Order_Header_Id
        ,UpdatedDate=GetDate()
     where Order_Detail_Id=@Order_Detail_Id
end
GO
/****** Object:  StoredProcedure [dbo].[Order_Header_create]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Order_Header_create]
(
    @Code nvarchar(50)
    ,@OrderDate date
    ,@Total decimal
	,@StandardCost decimal
    ,@Status int
    ,@IsOnline bit
    ,@Source_Online_Id nvarchar(50)
    ,@Customer_Id nvarchar(50)
    ,@Employee_Id nvarchar(50)
    ,@Store_Id nvarchar(50)
)
as
begin
    set nocount on

    declare @temp nvarchar(50) = lower(newid())

    insert into Order_Header
    (
        Order_Header_Id
        ,Code
        ,OrderDate
        ,Total
		,StandardCost 
        ,Status
        ,IsOnline
        ,Source_Online_Id
        ,Customer_Id
        ,Employee_Id
        ,Store_Id
        ,CreatedDate
        ,UpdatedDate
    )
    values (
        @temp
        ,@Code
        ,@OrderDate
        ,@Total
		,@StandardCost
        ,@Status
        ,@IsOnline
        ,@Source_Online_Id
        ,@Customer_Id
        ,@Employee_Id
        ,@Store_Id
        ,GETDATE()
        ,null
    )
end
GO
/****** Object:  StoredProcedure [dbo].[Order_Header_delete]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Order_Header_delete]
(
    @Order_Header_Id nvarchar(50)
)
as
begin
    set nocount on

    delete from Order_Header where Order_Header_Id=@Order_Header_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Order_Header_getall]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Order_Header_getall]
as
begin
    set nocount on

    select a.* from Order_Header a 
    
end
GO
/****** Object:  StoredProcedure [dbo].[Order_Header_getbyid]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Order_Header_getbyid]
(
    @Order_Header_Id nvarchar(50)
)
as
begin
    set nocount on

    select * from Order_Header where Order_Header_Id=@Order_Header_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Order_Header_getpaging]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Order_Header_getpaging]
(
    @pageIndex int
    ,@pageSize int
)
as
begin
    set nocount on

    select
        a.* 
        ,count(*) over() as TotalCount
    from Order_Header a 
    where 1=1 
    order by Order_Header_Id
        offset @pageSize * @pageIndex rows 
    fetch next @pageSize rows only
    

end
GO
/****** Object:  StoredProcedure [dbo].[Order_Header_update]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Order_Header_update]
(
    @Order_Header_Id nvarchar(50)
    ,@Code nvarchar(50)
    ,@OrderDate date
    ,@Total decimal
	,@StandardCost decimal
    ,@Status int
    ,@IsOnline bit
    ,@Source_Online_Id nvarchar(50)
    ,@Customer_Id nvarchar(50)
    ,@Employee_Id nvarchar(50)
    ,@Store_Id nvarchar(50)
)
as
begin
    set nocount on

    update Order_Header set 
        Code=@Code
        ,OrderDate=@OrderDate
        ,Total=@Total
		,StandardCost =@StandardCost
        ,Status=@Status
        ,IsOnline=@IsOnline
        ,Source_Online_Id=@Source_Online_Id
        ,Customer_Id=@Customer_Id
        ,Employee_Id=@Employee_Id
        ,Store_Id=@Store_Id
        ,UpdatedDate=GetDate()
     where Order_Header_Id=@Order_Header_Id
end
GO
/****** Object:  StoredProcedure [dbo].[Product_create]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Product_create]
(
	@Code nvarchar(50)
    , @Name nvarchar(255)
    ,@Description nvarchar(500)
    ,@Size nvarchar(50)
    ,@Color nvarchar(50)
    ,@Brand_Id nvarchar(50)
    ,@Category_Id nvarchar(50)
    ,@StandardPrice numeric(18,2)
    ,@Price numeric(18,2)
)
as
begin
    set nocount on

    declare @temp nvarchar(50) = lower(newid())

    insert into Product
    (
		Product_Id
		, Code 
        ,Name
        ,Description
        ,Size
        ,Color
        ,Brand_Id
        ,Category_Id
        ,StandardPrice
        ,Price
        ,CreatedDate
        ,UpdatedDate
    )
    values (
        @temp
		, @Code
        ,@Name
        ,@Description
        ,@Size
        ,@Color
        ,@Brand_Id
        ,@Category_Id
        ,@StandardPrice
        ,@Price
        ,GETDATE()
        ,null
    )
    select @temp
end
GO
/****** Object:  StoredProcedure [dbo].[Product_delete]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Product_delete]
(
    @Product_Id nvarchar(50)
)
as
begin
    set nocount on

    delete from Product where Product_Id=@Product_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Product_getall]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Product_getall]
as
begin
    set nocount on

    select a.* from Product a 
    
end
GO
/****** Object:  StoredProcedure [dbo].[Product_getbyid]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Product_getbyid]
(
    @Product_Id nvarchar(50)
)
as
begin
    set nocount on

    select * from Product where Product_Id=@Product_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Product_getpaging]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Product_getpaging]
(
    @pageIndex int
    ,@pageSize int
)
as
begin
    set nocount on

    select
        a.* 
        ,count(*) over() as TotalCount
    from Product a 
    where 1=1 
    order by Product_Id
        offset @pageSize * @pageIndex rows 
    fetch next @pageSize rows only
    

end
GO
/****** Object:  StoredProcedure [dbo].[Product_update]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Product_update]
(
    @Product_Id nvarchar(50)
	,@Code  nvarchar(50)
    ,@Name nvarchar(255)
    ,@Description nvarchar(500)
    ,@Size nvarchar(50)
    ,@Color nvarchar(50)
    ,@Brand_Id nvarchar(50)
    ,@Category_Id nvarchar(50)
    ,@StandardPrice numeric(18,2)
    ,@Price numeric(18,2)
)
as
begin
    set nocount on

    update Product set 
		Code =@Code
        , Name=@Name
        ,Description=@Description
        ,Size=@Size
        ,Color=@Color
        ,Brand_Id=@Brand_Id
        ,Category_Id=@Category_Id
        ,StandardPrice=@StandardPrice
        ,Price=@Price
        ,UpdatedDate=GetDate()
     where Product_Id=@Product_Id
end
GO
/****** Object:  StoredProcedure [dbo].[Source_Online_create]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Source_Online_create]
(
    @Name nvarchar(250)
)
as
begin
    set nocount on

    declare @temp nvarchar(50) = lower(newid())

    insert into Source_Online
    (
        Source_Online_Id
        ,Name
        ,CreatedDate
        ,UpdatedDate
    )
    values (
        @temp
        ,@Name
        ,GETDATE()
        ,null
    )
    select @temp
end
GO
/****** Object:  StoredProcedure [dbo].[Source_Online_delete]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Source_Online_delete]
(
    @Source_Online_Id nvarchar(50)
)
as
begin
    set nocount on

    delete from Source_Online where Source_Online_Id=@Source_Online_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Source_Online_getall]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Source_Online_getall]
as
begin
    set nocount on

    select a.* from Source_Online a 
    
end
GO
/****** Object:  StoredProcedure [dbo].[Source_Online_getbyid]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Source_Online_getbyid]
(
    @Source_Online_Id nvarchar(50)
)
as
begin
    set nocount on

    select * from Source_Online where Source_Online_Id=@Source_Online_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Source_Online_getpaging]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Source_Online_getpaging]
(
    @pageIndex int
    ,@pageSize int
)
as
begin
    set nocount on

    select
        a.* 
        ,count(*) over() as TotalCount
    from Source_Online a 
    where 1=1 
    order by Source_Online_Id
        offset @pageSize * @pageIndex rows 
    fetch next @pageSize rows only
    

end
GO
/****** Object:  StoredProcedure [dbo].[Source_Online_update]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Source_Online_update]
(
    @Source_Online_Id nvarchar(50)
    ,@Name nvarchar(250)
)
as
begin
    set nocount on

    update Source_Online set 
        Name=@Name
        ,UpdatedDate=GetDate()
     where Source_Online_Id=@Source_Online_Id
end
GO
/****** Object:  StoredProcedure [dbo].[Store_create]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Store_create]
(
    @Code nvarchar(50)
    ,@Name nvarchar(250)
    ,@City_Id nvarchar(50)
)
as
begin
    set nocount on

    declare @temp nvarchar(50) = lower(newid())

    insert into Store
    (
        Store_Id
        ,Code
        ,Name
        ,City_Id
        ,CreatedDate
        ,UpdatedDate
    )
    values (
        @temp
        ,@Code
        ,@Name
        ,@City_Id
        ,GETDATE()
        ,null
    )
    select @temp
end
GO
/****** Object:  StoredProcedure [dbo].[Store_delete]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Store_delete]
(
    @Store_Id nvarchar(50)
)
as
begin
    set nocount on

    delete from Store where Store_Id=@Store_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Store_getall]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Store_getall]
as
begin
    set nocount on

    select a.* from Store a 
    
end
GO
/****** Object:  StoredProcedure [dbo].[Store_getbyid]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Store_getbyid]
(
    @Store_Id nvarchar(50)
)
as
begin
    set nocount on

    select * from Store where Store_Id=@Store_Id

end
GO
/****** Object:  StoredProcedure [dbo].[Store_getpaging]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Store_getpaging]
(
    @pageIndex int
    ,@pageSize int
)
as
begin
    set nocount on

    select
        a.* 
        ,count(*) over() as TotalCount
    from Store a 
    where 1=1 
    order by Store_Id
        offset @pageSize * @pageIndex rows 
    fetch next @pageSize rows only
    

end
GO
/****** Object:  StoredProcedure [dbo].[Store_update]    Script Date: 3/15/2023 10:16:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create or alter procedure [dbo].[Store_update]
(
    @Store_Id nvarchar(50)
    ,@Code nvarchar(50)
    ,@Name nvarchar(250)
    ,@City_Id nvarchar(50)
)
as
begin
    set nocount on

    update Store set 
        Code=@Code
        ,Name=@Name
        ,City_Id=@City_Id
        ,UpdatedDate=GetDate()
     where Store_Id=@Store_Id
end
GO
