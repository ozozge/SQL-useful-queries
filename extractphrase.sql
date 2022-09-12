SUBSTRING (SUBSTRING(column, CHARINDEX('beginning',column) + LEN('beginning'), LEN(column)),0,CHARINDEX('ending',SUBSTRING(column, CHARINDEX('beginning',column) + 
LEN('beginning'), LEN(column)))) as extractr
