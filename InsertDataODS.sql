Use [Store_Project]
SET NOCOUNT ON;  
--- ### Insert City
exec City_create  N'Hà Nội'
exec City_create  N'TP Hồ Chí Minh'
exec City_create  N'Đà Nẵng'
exec City_create  N'Hải Phòng'
exec City_create  N'Cần Thơ'
exec City_create  N'Hà Nam'
exec City_create  N'Vĩnh Phúc'
exec City_create  N'Thanh Hóa'
exec City_create  N'Nghệ An'
exec City_create  N'Bình Dương'

-- select * from City
-- select count (*) from City

--- ### Insert Brand 
exec Brand_create  N'Samsung'
exec Brand_create  N'Xiaomi'
exec Brand_create  N'Apple'
exec Brand_create  N'Remax'
exec Brand_create  N'Anker'
exec Brand_create  N'Sony'
exec Brand_create  N'Nokia'
exec Brand_create  N'Oppo'
exec Brand_create  N'Huawei'
-- select * from Brand
-- select count (*) from Brand

--- ### Insert Source_Online 
exec Source_Online_create  N'Tiki'
exec Source_Online_create  N'Shopee'
exec Source_Online_create  N'Lazada'
exec Source_Online_create  N'Sendo'
exec Source_Online_create  N'Tiktok'
-- select * from Source_Online
-- select count (*) from Source_Online


Go

--- ### Insert Store
declare @noStore int = 60
declare @storeIndex int = 1
declare @storeName nvarchar(250)
declare @storeCode nvarchar(250)
declare @city_Id nvarchar(50)
while (@storeIndex <=@noStore)
	begin
		set @storeName = (Select CONCAT('Store ', @storeIndex))
		set @storeCode = (Select CONCAT('ST', @storeIndex))
		set @city_Id = (Select Top 1 City_Id from City order by newId())
		exec Store_create @storeCode, @storeName, @city_Id
		set @storeIndex = @storeIndex + 1
	end
-- select * from Store
-- select count (*) from Store 
GO

--- ### Insert Employee
declare @minEmployee int = 2
declare @maxEmployee int = 5
declare @noEmployee int
declare @employeeIndex int = 1
declare @employeeAllIndex int = 1
declare @employeeName nvarchar(250)
declare @employeeCode nvarchar(50)
declare @store_Id nvarchar(50) 

DECLARE store_cursor CURSOR FOR SELECT Store_Id from Store;
OPEN store_cursor  
FETCH NEXT FROM store_cursor INTO @store_Id
WHILE @@FETCH_STATUS = 0  
  begin
	set @employeeIndex = 1
	set @noEmployee = (SELECT FLOOR(RAND()*(@maxEmployee-@minEmployee+1))+ @minEmployee);
	while (@employeeIndex <=@noEmployee)
		begin
			set @employeeName = (Select CONCAT('Employee ', @employeeAllIndex))
			set @employeeCode = (Select CONCAT('Emp', @employeeAllIndex))
			exec Employee_create  @employeeCode,@employeeName, null, null, null, @store_Id
			set @employeeIndex = @employeeIndex + 1
			set @employeeAllIndex = @employeeAllIndex + 1
		end
	FETCH NEXT FROM store_cursor INTO @store_Id
  end
CLOSE store_cursor;  
DEALLOCATE store_cursor;  

-- select * from Employee
-- select count (*) from Employee 
-- select store_id, count (*) count from Employee group by store_id
GO


--- ### Insert Category
declare @noCategory int = 25
declare @catIndex int = 1
declare @categoryName nvarchar(250)
while (@catIndex <=@noCategory)
	begin
		set @categoryName = (Select CONCAT('Category ', @catIndex))
		exec Category_create @categoryName
		set @catIndex = @catIndex + 1
	end

-- select * from Category
-- select count (*) from Category
GO


--- ### Insert Product
declare @noProduct int = 1020
declare @productIndex int = 1
declare @productName nvarchar(250)
declare @productCode nvarchar(250)
declare @category_Id nvarchar(50)
declare @brand_Id nvarchar(50)
declare @StandardPrice numeric(18,2)
declare @Price numeric(18,2)
declare @Min_Price int = 10 --000
declare @Max_Price int = 10000 --000
declare @Min_Rate_Price numeric = 60
declare @Max_Rate_Price numeric = 90
while (@productIndex <=@noProduct)
	begin
		print @productIndex
		set @productName = (Select CONCAT('Product ', @productIndex))
		set @productCode = (Select CONCAT('Prod', @productIndex))
		set @category_Id = (Select Top 1 Category_Id from Category order by newId())
		set @brand_Id = (Select Top 1 Brand_Id from Brand order by newId())

		set @Price = (SELECT FLOOR(RAND()*(@Max_Price-@Min_Price+1))+ @Min_Price) * 1000;
		set @StandardPrice = Floor((SELECT FLOOR(RAND()*(@Max_Price-@Min_Price+1))+ @Min_Price)/100 * @Price/1000)*1000;

		exec Product_create @productCode, @productName, null, null, null, @brand_Id, @category_Id, @StandardPrice, @Price

		set @productIndex = @productIndex + 1
	end
-- select * from Product
-- select count (*) from Product 
GO

--- ### Insert Customer
declare @noCustomer int = 100000 -- 
declare @customerIndex int = 1
declare @customerName nvarchar(250)

while (@customerIndex <=@noCustomer)
	begin
		set @customerName = (Select CONCAT('Customer ', @customerIndex))
		exec Customer_create @customerName, null
		set @customerIndex = @customerIndex + 1
	end
-- select * from Customer
-- select count (*) from Customer 

GO


--- insert Order Header 
declare @noOrder int = 500000
declare @orderIndex int = 1
declare @orderCode nvarchar(50)
declare @OrderDate date
declare @isOnline bit 
declare @source_online_id nvarchar(50)
declare @customer_id nvarchar(50)
declare @employee_id nvarchar(50)
declare @store_id nvarchar(50)
declare @fromDate date, @toDate date
declare @days_between int
declare @days_rand int

set @fromDate = '2022-01-01'
set @todate = GetDate()

while (@orderIndex <=@noOrder)
	begin

		set @orderCode = (Select CONCAT('SO', @orderIndex))

		set @days_between = datediff(day,@fromDate,@toDate)
		set @days_rand  = cast(RAND()*10000 as int)  % @days_between
		set @OrderDate = dateadd( day, @days_rand, @fromDate )

		set @isOnline = CAST(ROUND(RAND(),0) AS BIT)
		if (@isOnline = 1)
			set @source_online_id = (Select Top 1 Source_Online_Id from Source_Online order by newId())
		else 
			set @source_online_id = null

		set @customer_id = (Select Top 1 Customer_Id from Customer order by newId())
		Select Top 1 @employee_id= Employee_Id, @store_id = Store_Id from Employee order by newId()

		exec Order_Header_create @orderCode, @OrderDate, 0, 0, 3, @isOnline , @source_online_id, @customer_id, @employee_id, @store_id
		set @orderIndex = @orderIndex + 1
	end
GO
-- select * from Order_Header 
-- select count (*) from Order_Header  



--- insert Order Detail

declare @minProduct int = 1
declare @maxProduct int = 5
declare @minQty int = 1
declare @maxQty int = 10
declare @noProduct int
declare @prodIndex int = 1
declare @qty int
declare @price numeric
declare @standardPrice numeric
declare @total numeric
declare @totalAll numeric
declare @standardCost numeric
declare @standardCostAll numeric
declare @product_Id nvarchar(50)
declare @Order_Header_Id nvarchar(50)

DECLARE header_cursor CURSOR FOR SELECT Order_Header_Id from Order_Header where Total = 0;
OPEN header_cursor  
FETCH NEXT FROM header_cursor INTO @Order_Header_Id
WHILE @@FETCH_STATUS = 0  
  begin
	set @prodIndex = 1
	set @totalAll = 0
	set @standardCostAll = 0
	set @noProduct = (SELECT FLOOR(RAND()*(@maxProduct-@minProduct+1))+ @minProduct);
	while (@prodIndex <= @noProduct)
		begin
			set @Product_Id = (Select Top 1 Product_Id from Product order by newId())
			Select Top 1 @Product_Id= Product_Id, @price = Price,@StandardPrice = StandardPrice  from Product order by newId()
			set @qty = (SELECT FLOOR(RAND()*(@maxQty-@minQty+1))+ @minQty);
			set @total = @qty * @price
			set @standardCost = @qty * @standardPrice
			exec Order_Detail_create @Product_Id, @qty, @price , @total, @Order_Header_Id
			set @prodIndex = @prodIndex + 1
			set @totalAll = @totalAll + @total
			set @standardCostAll = @standardCostAll + @standardCost
			
		end
	update Order_Header set total = @totalAll, StandardCost = @standardCostAll where Order_Header_Id =  @Order_Header_Id
	FETCH NEXT FROM header_cursor INTO @Order_Header_Id
  end
CLOSE header_cursor;  
DEALLOCATE header_cursor;
GO
-- select * from Order_Detail 
-- select count (*) from Order_Detail  

