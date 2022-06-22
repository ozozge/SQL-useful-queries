SELECT *
FROM table
where conlineid in ( SELECT cl.[ConLineID]
FROM table2 as cl
	CROSS APPLY (
		SELECT d.*
		FROM (
		VALUES (cl.Monday,'Monday')
		,(cl.Tuesday,'Tuesday')
		,(cl.Wednesday,'Wednesday')
		,(cl.Thursday,'Thursday')
		,(cl.Friday,'Friday')
		,(cl.Saturday,'Saturday')
		,(cl.Sunday,'Sunday')
		) d([contractedDay], [ContractedDayName])
		) daycols
		join contract c on c.[ConLineID]=cl.[ConLineID]
Where ContractedDayName = DATENAME(weekday,DATEADD(day, 1, '06/20/2022')+1)
AND ContractedDay = 1