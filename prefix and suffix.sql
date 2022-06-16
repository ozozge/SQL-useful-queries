
--to pull alpha characters before numbers
Select col, PATINDEX('%[0-9]%',col ),
	LEFT(col ,(PATINDEX('%[0-9]%',col)-1)) as Prefix
From table
  Where col like '[a-zA-Z][a-zA-Z]%' AND (PATINDEX('%[0-9]%',col))>=1




Select col, 
	 RIGHT(col, COALESCE(NULLIF(Patindex('%[0-9]%', Reverse(col)), 0) -1, Len(col))) as suffix
From table
  Where col like '%[a-zA-Z][a-zA-Z]' --AND (PATINDEX('%[0-9]%',col))>=1


 