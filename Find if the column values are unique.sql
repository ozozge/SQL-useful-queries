SELECT CASE WHEN count(distinct col1)= count(col1)
THEN 'column values are unique' ELSE 'column values are NOT unique' END
FROM tbl_name;