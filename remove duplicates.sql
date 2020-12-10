WITH cte AS 
(SELECT *, ROW_NUMBER() OVER(PARTITION BY ColumnNames 
			ORDER BY ColumnNames)'RowRank'
             FROM TableName)
Select *
From CTE
WHERE RowRank > 1