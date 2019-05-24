-- USE YOUR DB
-- alter table Library add cultureInfo2 varchar(20) default('zh-cn')
 
declare @tableName varchar(100)='TVIPMarketSchemes'
declare @columnName varchar(100)='SCMonthOnceDay'
 
declare @constraintName varchar(200)
 
 
select @constraintName=b.name from syscolumns a,sysobjects b where a.id=object_id(@tableName) 
and b.id=a.cdefault and a.name=@columnName and b.name like 'DF%'
--select @constraintName
 
exec('alter table '+@tableName+' drop constraint '+@constraintName)
exec ('alter table ' + @tableName + ' drop column ' + @columnName )