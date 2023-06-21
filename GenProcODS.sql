USE [Store_Project]
GO

create or alter procedure [dbo].[_app_aspnet_procedure] 
(
	@TableName varchar(max)
	,@Template varchar(max)
)
as
begin

	declare @TableSchema varchar(max) = 'dbo' -- Replace 'dbo' with your schema name
	declare @result varchar(max) = ''

	declare @newline varchar(max) = CHAR(13)+CHAR(10)
	declare @tab varchar(max) = '    '
	
	DECLARE @column_list varchar(max) = ''

	DECLARE @param_list varchar(max) = ''

	DECLARE @create_statement varchar(max) = ''
	DECLARE @update_statement varchar(max) = ''
	DECLARE @delete_statement varchar(max) = ''
	DECLARE @find_statement varchar(max) = ''
	DECLARE @findbyid_statement varchar(max) = ''

	DECLARE @primary_key_col varchar(max) = ''

	SET @primary_key_col  = isnull ((SELECT  
		K.COLUMN_NAME  
	FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS C
			JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS K ON C.TABLE_NAME = K.TABLE_NAME
																AND C.CONSTRAINT_CATALOG = K.CONSTRAINT_CATALOG
																AND C.CONSTRAINT_SCHEMA = K.CONSTRAINT_SCHEMA
																AND C.CONSTRAINT_NAME = K.CONSTRAINT_NAME
	WHERE   C.CONSTRAINT_TYPE = 'PRIMARY KEY'
			AND K.TABLE_NAME = @TableName ) , '')
 
	-- xu ly param_list 
	if @Template = 'SP_CREATE' or  @Template =  'SP_UPDATE'
		begin
			SELECT @param_list = @param_list + @newline + @tab
					 
				+ case when RowIndex =1 then '' else ',' end + '@' + ColumnName + ' ' + ColumnType + case when MaxLen = '' then '' else '(' + MaxLen + ')' end  --+  CHAR(13) 
					
			FROM
			(
				SELECT  c.COLUMN_NAME   AS ColumnName 
					,count(*) over() as total_row  
					,ROW_NUMBER() OVER (ORDER BY c.ORDINAL_POSITION ) AS RowIndex
					, c.DATA_TYPE   AS ColumnType
					,	c.IS_NULLABLE AS bRequired,
						CASE c.DATA_TYPE             
						WHEN 'char' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
						WHEN 'nchar' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
						WHEN 'nvarchar' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
						WHEN 'varchar' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
						WHEN 'numeric' THEN   CONVERT(varchar(10),c.NUMERIC_PRECISION) + ',' + CONVERT(varchar(10),c.NUMERIC_SCALE) 
						ELSE ''
					END AS MaxLen,
					c.ORDINAL_POSITION 
			FROM    INFORMATION_SCHEMA.COLUMNS c
			WHERE   c.TABLE_NAME = @TableName and ISNULL(@TableSchema, c.TABLE_SCHEMA) = c.TABLE_SCHEMA  
			) t
			ORDER BY t.ORDINAL_POSITION
		end
	if @Template = 'SP_DELETE' or @Template = 'SP_GETBYID'
		begin
			SELECT @param_list = @param_list + @newline + @tab
	 
				+ case when RowIndex =1 then '' else ',' end + '@' + ColumnName + ' ' + ColumnType + case when MaxLen = '' then '' else '(' + MaxLen + ')' end  --+  CHAR(13) 
					
			FROM
			(
				SELECT  c.COLUMN_NAME   AS ColumnName 
					,count(*) over() as total_row  
					,ROW_NUMBER() OVER (ORDER BY c.ORDINAL_POSITION ) AS RowIndex
					, c.DATA_TYPE   AS ColumnType
					,	c.IS_NULLABLE AS bRequired,
						CASE c.DATA_TYPE             
						WHEN 'char' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
						WHEN 'nchar' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
						WHEN 'nvarchar' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
						WHEN 'varchar' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
						WHEN 'numeric' THEN   CONVERT(varchar(10),c.NUMERIC_PRECISION) + ',' + CONVERT(varchar(10),c.NUMERIC_SCALE) 
						ELSE ''
					END AS MaxLen,
					c.ORDINAL_POSITION 
			FROM    INFORMATION_SCHEMA.COLUMNS c
			WHERE   c.TABLE_NAME = @TableName and ISNULL(@TableSchema, c.TABLE_SCHEMA) = c.TABLE_SCHEMA  
			 and c.COLUMN_NAME = @primary_key_col
			) t
			ORDER BY t.ORDINAL_POSITION
			set @param_list = @param_list + @newline
		end
	
	if @Template = 'SP_GETPAGING' 
		begin
			set @param_list = @param_list + @newline + @tab + '@pageIndex int'  
			set @param_list = @param_list + @newline + @tab + ',@pageSize int'
		end	

	--- noi dung procedure
	SET @result = @result + '/*** auto generate code ***/ ' + @newline
	SET @result = @result + 'SET ANSI_NULLS ON ' + @newline
	SET @result = @result + '' + @newline
	SET @result = @result + 'GO' + @newline
	SET @result = @result + '' + @newline
	SET @result = @result + 'SET QUOTED_IDENTIFIER ON' + @newline
    SET @result = @result + '' + @newline
	SET @result = @result + 'GO' + @newline
	SET @result = @result + '' + @newline
	 
	if @Template = 'SP_CREATE' 
		begin 
				   
				SET @result = @result + 'create procedure [dbo].[' + @TableName + '_create]' + @newline
				SET @result = @result + '(' 
				SET @result = @result + @param_list + @newline 
				SET @result = @result + ')' + @newline  
				SET @result = @result + 'as' + @newline
				SET @result = @result + 'begin' + @newline
				SET @result = @result + @tab + 'set nocount on' + @newline + @newline
				SET @result = @result + @tab + 'declare @temp nvarchar(50) = lower(newid())' + @newline + @newline
				SET @result = @result + @tab + 'insert into ' + @TableName + @newline
				SET @result = @result + @tab + '('  

				-- column list
				SELECT @result = @result + @newline + @tab + @tab      
				+ case when RowIndex =1 then '' else ',' end + ColumnName  --+  CHAR(13) 
					
				FROM
				(
					SELECT  c.COLUMN_NAME   AS ColumnName 
						,count(*) over() as total_row  
						,ROW_NUMBER() OVER (ORDER BY c.ORDINAL_POSITION ) AS RowIndex
						, c.DATA_TYPE   AS ColumnType
						,	c.IS_NULLABLE AS bRequired,
							CASE c.DATA_TYPE             
							WHEN 'char' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
							WHEN 'nchar' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
							WHEN 'nvarchar' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
							WHEN 'varchar' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
							WHEN 'numeric' THEN   CONVERT(varchar(10),c.NUMERIC_PRECISION) + ',' + CONVERT(varchar(10),c.NUMERIC_SCALE) 
							ELSE ''
						END AS MaxLen,
						c.ORDINAL_POSITION 
				FROM    INFORMATION_SCHEMA.COLUMNS c
				WHERE   c.TABLE_NAME = @TableName and ISNULL(@TableSchema, c.TABLE_SCHEMA) = c.TABLE_SCHEMA  
				 
				) t
				ORDER BY t.ORDINAL_POSITION

				SET @result = @result + @newline + @tab + ')'
				SET @result = @result + @newline + @tab + 'values ('
				-- value list
				SELECT @result = @result + @newline + @tab + @tab       
				+ case when RowIndex =1 then '' else ',' end + case when ColumnName = @primary_key_col then '@temp' when lower(ColumnName) = ('created_date') then 'getdate()'  else '@' + ColumnName end --+  CHAR(13) 
				FROM
				(
					SELECT  c.COLUMN_NAME   AS ColumnName 
						,count(*) over() as total_row  
						,ROW_NUMBER() OVER (ORDER BY c.ORDINAL_POSITION ) AS RowIndex
						, c.DATA_TYPE   AS ColumnType
						,	c.IS_NULLABLE AS bRequired,
							CASE c.DATA_TYPE             
							WHEN 'char' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
							WHEN 'nchar' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
							WHEN 'nvarchar' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
							WHEN 'varchar' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
							WHEN 'numeric' THEN   CONVERT(varchar(10),c.NUMERIC_PRECISION) + ',' + CONVERT(varchar(10),c.NUMERIC_SCALE) 
							ELSE ''
						END AS MaxLen,
						c.ORDINAL_POSITION 
				FROM    INFORMATION_SCHEMA.COLUMNS c
				WHERE   c.TABLE_NAME = @TableName and ISNULL(@TableSchema, c.TABLE_SCHEMA) = c.TABLE_SCHEMA  
				 
				) t
				ORDER BY t.ORDINAL_POSITION

				SET @result = @result + @newline + @tab + ')' 

				IF (@TableSchema IS NOT NULL) 
				BEGIN
				    SET @result = @result + @newline + @tab + 'select @temp' 
					SET @result = @result + @newline + 'end' 
					--SET @result = @result + CHAR(13)
					SET @result = @result + @newline + 'GO' 
				END

				PRINT @result
		end

	 if @Template = 'SP_UPDATE' 
		begin
			SET @result = @result + 'create procedure [dbo].[' + @TableName + '_update]' + @newline
			SET @result = @result + '(' --+ CHAR(13) 
				   
			SET @result = @result + @param_list + @newline 

			SET @result = @result + ')' + @newline  

			SET @result = @result + 'as' + @newline
			SET @result = @result + 'begin' + @newline
			SET @result = @result + @tab + 'set nocount on' + @newline + @newline
			SET @result = @result + @tab + 'update ' + @TableName + ' set ' --+ @newline
			-- column list
			SELECT @result = @result + @newline + @tab + @tab      
			+ case when RowIndex =1 then '' else ',' end + case when ColumnName not in (lower('updated_date')) then ColumnName + '=@' + ColumnName else ColumnName + '=getdate()' end--+  CHAR(13) 
					
			FROM
			(
				SELECT  c.COLUMN_NAME   AS ColumnName 
					,count(*) over() as total_row  
					,ROW_NUMBER() OVER (ORDER BY c.ORDINAL_POSITION ) AS RowIndex
					, c.DATA_TYPE   AS ColumnType
					,	c.IS_NULLABLE AS bRequired,
						CASE c.DATA_TYPE             
						WHEN 'char' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
						WHEN 'nchar' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
						WHEN 'nvarchar' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
						WHEN 'varchar' THEN  CONVERT(varchar(10),c.CHARACTER_MAXIMUM_LENGTH)
						WHEN 'numeric' THEN   CONVERT(varchar(10),c.NUMERIC_PRECISION) + ',' + CONVERT(varchar(10),c.NUMERIC_SCALE) 
						ELSE ''
					END AS MaxLen,
					c.ORDINAL_POSITION 
			FROM    INFORMATION_SCHEMA.COLUMNS c
			WHERE   c.TABLE_NAME = @TableName and ISNULL(@TableSchema, c.TABLE_SCHEMA) = c.TABLE_SCHEMA  
				 and (c.COLUMN_NAME <> @primary_key_col)
				 and (lower(c.COLUMN_NAME) not in( lower('created_date'), lower('created_user')))
				 
			) t
			ORDER BY t.ORDINAL_POSITION
			 
			SET @result = @result + @newline + @tab + ' where ' + @primary_key_col + '=@' + @primary_key_col
			SET @result = @result + @newline + 'end' 
			--SET @result = @result + CHAR(13)
			SET @result = @result + @newline + 'GO' 

			PRINT @result
		end


	 
	 if @Template = 'SP_DELETE' 
		begin 
			SET @result = @result + 'create procedure [dbo].[' + @TableName + '_delete]' + @newline
			SET @result = @result + '('
			SET @result = @result + @param_list  
			SET @result = @result + ')' + @newline  
			SET @result = @result + 'as' + @newline
			SET @result = @result + 'begin' + @newline
			SET @result = @result + @tab + 'set nocount on' + @newline + @newline
			SET @result = @result + @tab + 'delete from ' + @TableName + ' where ' + @primary_key_col + '=@' + @primary_key_col + @newline

			SET @result = @result + @newline + 'end' 
			--SET @result = @result + CHAR(13)
			SET @result = @result + @newline + 'GO' 

			PRINT @result
		end

     if @Template = 'SP_GETBYID' 
		begin 
			SET @result = @result + 'create procedure [dbo].[' + @TableName + '_getbyid]' + @newline
			SET @result = @result + '('
				   
			SET @result = @result + @param_list  

			SET @result = @result + ')' + @newline  

			SET @result = @result + 'as' + @newline
			SET @result = @result + 'begin' + @newline
			SET @result = @result + @tab + 'set nocount on' + @newline + @newline
			SET @result = @result + @tab + 'select * from ' + @TableName + ' where ' + @primary_key_col + '=@' + @primary_key_col + @newline
			SET @result = @result + @newline + 'end' 
			--SET @result = @result + CHAR(13)
			SET @result = @result + @newline + 'GO' 

			PRINT @result
		end

	if @Template = 'SP_GETPAGING' 
		begin 
			SET @result = @result + 'create procedure [dbo].[' + @TableName + '_getpaging]' + @newline
			SET @result = @result + '(' --+ CHAR(13) 
				   
			SET @result = @result + @param_list + @newline  

			SET @result = @result + ')' + @newline  
			SET @result = @result + 'as' + @newline
			SET @result = @result + 'begin' + @newline
			SET @result = @result + @tab + 'set nocount on' + @newline + @newline
			SET @result = @result + @tab + 'select' + @newline
			SET @result = @result + @tab + '    a.* ' + @newline
			SET @result = @result + @tab + '    ,count(*) over() as TotalCount' + @newline
			SET @result = @result + @tab + 'from ' + @TableName + ' a ' + @newline
			SET @result = @result + @tab + 'where 1=1 ' + @newline
			SET @result = @result + @tab + 'order by ' + @primary_key_col + @newline
			SET @result = @result + @tab + @tab + 'offset @pageSize * @pageIndex rows ' + @newline
			SET @result = @result + @tab + 'fetch next @pageSize rows only' + @newline
			SET @result = @result + @tab + '' + @newline
			SET @result = @result + @newline + 'end'   
			--SET @result = @result + CHAR(13)
			SET @result = @result + @newline + 'GO'  
 
			PRINT @result
		end
	if @Template = 'SP_GETALL' 
		begin 
			SET @result = @result + 'create procedure [dbo].[' + @TableName + '_getall]' + @newline
			SET @result = @result + 'as' + @newline
			SET @result = @result + 'begin' + @newline
			SET @result = @result + @tab + 'set nocount on' + @newline + @newline
			SET @result = @result + @tab + 'select a.* from ' + @TableName + ' a ' + @newline
			SET @result = @result + @tab + @newline
			SET @result = @result + 'end' + @newline
			SET @result = @result + 'GO'  
 
			PRINT @result
		end

end
go

---- thuc thi
--exec _app_aspnet_procedure 'Brand','SP_CREATE'
--exec _app_aspnet_procedure 'Brand','SP_UPDATE'
--exec _app_aspnet_procedure 'Brand','SP_FINDBYID'
--exec _app_aspnet_procedure 'Brand','SP_FIND'
--exec _app_aspnet_procedure 'Brand','SP_DELETE'
--exec _app_aspnet_procedure 'Brand','SP_LISTALL'

--exec _app_aspnet_procedure 'Category','SP_CREATE'
--exec _app_aspnet_procedure 'Category','SP_UPDATE'
--exec _app_aspnet_procedure 'Category','SP_FINDBYID'
--exec _app_aspnet_procedure 'Category','SP_FIND'
--exec _app_aspnet_procedure 'Category','SP_DELETE'
--exec _app_aspnet_procedure 'Category','SP_LISTALL'

--exec _app_aspnet_procedure 'Customer','SP_CREATE'
--exec _app_aspnet_procedure 'Customer','SP_UPDATE'
--exec _app_aspnet_procedure 'Customer','SP_FINDBYID'
--exec _app_aspnet_procedure 'Customer','SP_FIND'
--exec _app_aspnet_procedure 'Customer','SP_DELETE'
--exec _app_aspnet_procedure 'Customer','SP_LISTALL'

--exec _app_aspnet_procedure 'Employee','SP_CREATE'
--exec _app_aspnet_procedure 'Employee','SP_UPDATE'
--exec _app_aspnet_procedure 'Employee','SP_FINDBYID'
--exec _app_aspnet_procedure 'Employee','SP_FIND'
--exec _app_aspnet_procedure 'Employee','SP_DELETE'
--exec _app_aspnet_procedure 'Employee','SP_LISTALL'

--exec _app_aspnet_procedure 'Order_Detail','SP_CREATE'
--exec _app_aspnet_procedure 'Order_Detail','SP_UPDATE'
--exec _app_aspnet_procedure 'Order_Detail','SP_FINDBYID'
--exec _app_aspnet_procedure 'Order_Detail','SP_FIND'
--exec _app_aspnet_procedure 'Order_Detail','SP_DELETE'
--exec _app_aspnet_procedure 'Order_Detail','SP_LISTALL'

--exec _app_aspnet_procedure 'Order_Header','SP_CREATE'
--exec _app_aspnet_procedure 'Order_Header','SP_UPDATE'
--exec _app_aspnet_procedure 'Order_Header','SP_FINDBYID'
--exec _app_aspnet_procedure 'Order_Header','SP_FIND'
--exec _app_aspnet_procedure 'Order_Header','SP_DELETE'
--exec _app_aspnet_procedure 'Order_Header','SP_LISTALL'

--exec _app_aspnet_procedure 'Product','SP_CREATE'
--exec _app_aspnet_procedure 'Product','SP_UPDATE'
--exec _app_aspnet_procedure 'Product','SP_FINDBYID'
--exec _app_aspnet_procedure 'Product','SP_FIND'
--exec _app_aspnet_procedure 'Product','SP_DELETE'
--exec _app_aspnet_procedure 'Product','SP_LISTALL'

--exec _app_aspnet_procedure 'Source_Online','SP_CREATE'
--exec _app_aspnet_procedure 'Source_Online','SP_UPDATE'
--exec _app_aspnet_procedure 'Source_Online','SP_FINDBYID'
--exec _app_aspnet_procedure 'Source_Online','SP_FIND'
--exec _app_aspnet_procedure 'Source_Online','SP_DELETE'
--exec _app_aspnet_procedure 'Source_Online','SP_LISTALL'

--exec _app_aspnet_procedure 'Store','SP_CREATE'
--exec _app_aspnet_procedure 'Store','SP_UPDATE'
--exec _app_aspnet_procedure 'Store','SP_FINDBYID'
--exec _app_aspnet_procedure 'Store','SP_FIND'
--exec _app_aspnet_procedure 'Store','SP_DELETE'
--exec _app_aspnet_procedure 'Store','SP_LISTALL'