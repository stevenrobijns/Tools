USE master  
GO  

declare @Db nvarchar(50) = '$(DataBase)';

DECLARE @kill varchar(8000) = '';  
SELECT @kill = @kill + 'kill ' + CONVERT(varchar(5), spid) + ';'  
FROM master..sysprocesses  
WHERE dbid = db_id(@Db)

EXEC(@kill); 

PRINT('Killed open connections for: $(DataBase)');