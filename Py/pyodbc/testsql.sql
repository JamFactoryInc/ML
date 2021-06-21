SELECT DATEDIFF(day, PaymentDate, GETDATE()) - MIN(DATEDIFF(day, PaymentDate, GETDATE())) OVER() [Time]
	,  SUM(Amount) [Amount]
FROM vwAccountsPayments
WHERE PaymentType = 4
GROUP BY PaymentDate
ORDER BY DATEDIFF(day, PaymentDate, GETDATE())
 SELECT DATEDIFF(day, CreateDate, GETDATE()) - MIN(DATEDIFF(day, CreateDate, GETDATE())) OVER()
 	,  COUNT(ContractID)
 FROM vwAccounts
 GROUP BY DATEDIFF(day, CreateDate, GETDATE())
 ORDER BY DATEDIFF(day, CreateDate, GETDATE())