--Successful Gateway Payment transactions for which there are MISSING records in the Accounts Payments
SELECT gp.gatepayid 
FROM vwGatewayPayments gp 
LEFT JOIN vwAccountsPayments ap ON ap.PaymentID IS NULL 
WHERE gp.status = 'SUCCESS';

--Successful Gateway Payment transactions for which there are MISSING records in the Accounts Payments by Day
SELECT DATEADD(DAY, DATEDIFF(DAY, 0, StatusDT), 0) AS [Day]
	 , COUNT(gp.gatepayid)
FROM vwGatewayPayments gp 
LEFT JOIN vwAccountsPayments ap ON ap.PaymentID = gp.PaymentID
WHERE gp.status = 'SUCCESS'
	AND gp.FailureReason IS NULL
	AND ap.PaymentID IS NULL 
GROUP BY DATEADD(DAY, DATEDIFF(DAY, 0, StatusDT), 0)
ORDER BY DATEADD(DAY, DATEDIFF(DAY, 0, StatusDT), 0)

--Sum of payments to clients by day by Salary Interval
SELECT * FROM
(
SELECT ap.amount AS MoneyPaid,
        (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END) AS PaymentInterval,
        ap.PaymentDate AS PayDate 
FROM vwAccountsPayments ap 
INNER JOIN vwAccounts acc ON ap.ContractID = acc.ContractID 
INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
WHERE ap.PaymentType = 4 AND LEFT(ap.Description,20) = 'Salary Advance' + CHAR(13) + CHAR(10) + '[REF'
) p
PIVOT(
        SUM(MoneyPaid)
        FOR PaymentInterval IN(
            [Weekly], [Fortnightly], [Every 4 Weeks], [Monthy]
        )
) as pvt ORDER BY PayDate

--Sum of successful payments to clients by state
SELECT * FROM
	(
	SELECT ap.amount AS MoneyPaid,
	      addr.AddrState AS AddrState,
	      ap.PaymentDate AS PayDate 
	FROM vwAccountsPayments ap 
	INNER JOIN vwAccounts acc ON ap.ContractID = acc.ContractID 
	INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
	INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
	     AND addr.SourceTableID = 6 
    INNER JOIN vwGatewayPayments gp ON ap.PaymentID = gp.PaymentID
	WHERE ap.PaymentType = 4 AND LEFT(ap.Description,20) = 'Salary Advance' + CHAR(13) + CHAR(10) + '[REF'
	) p
	PIVOT(
	     SUM(MoneyPaid)
	     FOR AddrState IN(
	         [ACT] , [NSW] , [WA] , [SA] , [QLD] , [NT] , [VIC] , [TAS]
	     )
	) as pvt ORDER BY PayDate

--Sum of payments FROM clients by day by Salary Interval
SELECT * FROM
(
SELECT ap.amount AS MoneyPaid,
        (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END) AS PaymentInterval,
        ap.PaymentDate AS PayDate 
FROM vwAccountsPayments ap 
INNER JOIN vwAccounts acc ON ap.ContractID = acc.ContractID 
INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
WHERE ap.PaymentType = 0 AND LEFT(ap.Description,23) = 'PayGate Repayment' + CHAR(13) + CHAR(10) + '[REF'
) p
PIVOT(
        SUM(MoneyPaid)
        FOR PaymentInterval IN(
            [Weekly], [Fortnightly], [Every 4 Weeks], [Monthy]
        )
) as pvt ORDER BY PayDate

--Sum of successful payments FROM clients by state
SELECT * FROM
	(
	SELECT ap.amount AS MoneyPaid,
	      addr.AddrState AS AddrState,
	      ap.PaymentDate AS PayDate 
	FROM vwAccountsPayments ap 
	INNER JOIN vwAccounts acc ON ap.ContractID = acc.ContractID 
	INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
	INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
	     AND addr.SourceTableID = 6 
    INNER JOIN vwGatewayPayments gp ON ap.PaymentID = gp.PaymentID
	WHERE ap.PaymentType = 4 AND LEFT(ap.Description,20) = 'Salary Advance' + CHAR(13) + CHAR(10) + '[REF'
	) p
	PIVOT(
	     SUM(MoneyPaid)
	     FOR AddrState IN(
	         [ACT] , [NSW] , [WA] , [SA] , [QLD] , [NT] , [VIC] , [TAS]
	     )
	) as pvt ORDER BY PayDate

--Count of UNsuccessful payments from clients by state 
-- I don't know why the first line is 30k with no date
SELECT * FROM
	(
	SELECT gp.gatepayid AS PayID,
	      addr.AddrState AS AddrState,
	      CAST(gp.ProcessedDT AS DATE) AS PayDate 
	FROM vwGatewayPayments gp 
	INNER JOIN vwAccounts acc ON gp.ContractID = acc.ContractID 
	INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
	INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
	     AND addr.SourceTableID = 6 
    LEFT JOIN vwAccountsPayments ap ON ap.PaymentID IS NULL
	WHERE gp.DrCr = 'Dr'
	) p
	PIVOT(
	     COUNT(PayID)
	     FOR AddrState IN(
	         [ACT] , [NSW] , [WA] , [SA] , [QLD] , [NT] , [VIC] , [TAS]
	     )
	) as pvt ORDER BY PayDate

--Per capita
SELECT PayDate
	, [ACT] / (
				SELECT CAST(COUNT(cl.ClientID) AS FLOAT)
				FROM vwClients cl 
				INNER JOIN vwClientsAddresses addr ON addr.SourceTableID = 6 
					AND addr.SourceID = cl.ClientID 
					AND addr.AddrState = 'ACT'
				) AS [ACT]
	, [NSW] / (
				SELECT CAST(COUNT(cl.ClientID) AS FLOAT)
				FROM vwClients  cl 
				INNER JOIN vwClientsAddresses addr ON addr.SourceTableID = 6 
					AND addr.SourceID = cl.ClientID 
					AND addr.AddrState = 'NSW'
				)AS [NSW]
	, [WA] / (
				SELECT CAST(COUNT(cl.ClientID) AS FLOAT)
				FROM vwClients  cl 
				INNER JOIN vwClientsAddresses addr ON addr.SourceTableID = 6 
					AND addr.SourceID = cl.ClientID 
					AND addr.AddrState = 'WA'
				)AS [WA]
	, [SA] / (
				SELECT CAST(COUNT(cl.ClientID) AS FLOAT)
				FROM vwClients  cl 
				INNER JOIN vwClientsAddresses addr ON addr.SourceTableID = 6 
					AND addr.SourceID = cl.ClientID 
					AND addr.AddrState = 'SA'
				)AS [SA]
	, [QLD] / (
				SELECT CAST(COUNT(cl.ClientID) AS FLOAT)
				FROM vwClients  cl 
				INNER JOIN vwClientsAddresses addr ON addr.SourceTableID = 6 
					AND addr.SourceID = cl.ClientID 
					AND addr.AddrState = 'QLD'
				)AS [QLD]
	, [NT] / (
				SELECT CAST(COUNT(cl.ClientID) AS FLOAT)
				FROM vwClients  cl 
				INNER JOIN vwClientsAddresses addr ON addr.SourceTableID = 6 
					AND addr.SourceID = cl.ClientID 
					AND addr.AddrState = 'NT'
				)AS [NT]
	, [VIC] / (
				SELECT CAST(COUNT(cl.ClientID) AS FLOAT)
				FROM vwClients  cl 
				INNER JOIN vwClientsAddresses addr ON addr.SourceTableID = 6 
					AND addr.SourceID = cl.ClientID 
					AND addr.AddrState = 'VIC'
				)AS [VIC]
	, [TAS] / (
				SELECT CAST(COUNT(cl.ClientID) AS FLOAT)
				FROM vwClients  cl 
				INNER JOIN vwClientsAddresses addr ON addr.SourceTableID = 6 
					AND addr.SourceID = cl.ClientID 
					AND addr.AddrState = 'TAS'
				)AS [TAS] 
FROM
	(
	SELECT ap.amount AS MoneyPaid,
	      addr.AddrState AS AddrState,
	      ap.PaymentDate AS PayDate 
	FROM vwAccountsPayments ap 
	INNER JOIN vwAccounts acc ON ap.ContractID = acc.ContractID 
	INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
	INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
	     AND addr.SourceTableID = 6 
    INNER JOIN vwGatewayPayments gp ON ap.PaymentID = gp.PaymentID
	WHERE ap.PaymentType = 0
	) p
	PIVOT(
	     SUM(MoneyPaid)
	     FOR AddrState IN(
	         [ACT] , [NSW] , [WA] , [SA] , [QLD] , [NT] , [VIC] , [TAS]
	     )
	) as pvt ORDER BY PayDate