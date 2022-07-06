SELECT JSON_VALUE(ErrorLines.[value], '$.LineId') as LineID, 
		JSON_VALUE(ErrorLines.[value], '$.Rate') as Rate,
		JSON_VALUE(ErrorLines.[value], '$.Spots') as Spots,
		JSON_VALUE(ErrorLines.[value], '$.TotalCost') as TotalCost,*
       --JSON_VALUE(ErrorDetails.[value], '$.ExpressionId')  as ExpressionID , 
       --JSON_VALUE(ErrorDetails.[value], '$.ErrorString') as LineValidationError, *
FROM InputOrderFiles iof
    CROSS APPLY OPENJSON (ValidationErrors,'$.ErrorLines') as ErrorLines
       --CROSS APPLY OPENJSON(ErrorLines.[value], '$.ErrorDetails') AS ErrorDetails
       where ValidationErrors is not null
	   AND id in (1,2)
Order by iof.Id


--{"IsValid":false,"ErrorLines":[{"LineId":28,"Rate":0.07,"Spots":2,"TotalCost":0.14,"ErrorDetails":[{"ErrorType":2,"ErrorString":"Invalid Net-sysCode combination : NetId=131|NwName=HALL sysCode=3648|ZoneName=CRESTVIEW","ExpressionId":0}]},