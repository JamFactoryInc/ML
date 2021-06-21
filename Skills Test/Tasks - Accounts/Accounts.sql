---------------------------------------------------------------------------------------------------------------------------------
--Growth of New Accounts ... total and by state.
---------------------------------------------------------------------------------------------------------------------------------
--Total:

SELECT COUNT(acc.ContractID) - LAG(COUNT(acc.ContractID)) 
		OVER (ORDER BY CAST(acc.CreateDate AS DATE)), 
	CAST(acc.CreateDate AS DATE) 
FROM vwAccounts as acc
INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
		AND addr.SourceTableID = 6 
	GROUP BY CAST(acc.CreateDate AS DATE) 
	ORDER BY CAST(acc.CreateDate AS DATE);

--By State:

SELECT a.CreateDate
       , a.NSW - IsNull(b.NSW,0) as NSW
       , a.ACT - IsNull(b.ACT,0) as ACT
       , a.WA - IsNull(b.WA,0) as WA
       , a.QLD - IsNull(b.QLD,0) as QLD
       , a.NT - IsNull(b.NT,0) as NT
       , a.VIC - IsNull(b.VIC,0) as VIC
       , a.TAS - IsNull(b.TAS,0) as TAS
       , a.SA - IsNull(b.SA,0) as SA
  FROM (
          SELECT* FROM
          (
          SELECT acc.ContractID,
               addr.addrState AS AddrState,
               CAST(acc.CreateDate AS DATE) AS CreateDate
		FROM vwAccounts as acc
		INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
		INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
		AND addr.SourceTableID = 6  
          ) p
          PIVOT(
                    Count(ContractID)
                    FOR AddrState IN(
                         [ACT] , [NSW] , [WA] , [SA] , [QLD] , [NT] , [VIC] , [TAS]
                    )
          ) as pvt
  ) a
LEFT JOIN (

     SELECT * FROM
     (
     SELECT acc.ContractID,
               addr.addrState AS AddrState,
               CAST(acc.CreateDate AS DATE) AS CreateDate
	FROM vwAccounts as acc
	INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
	INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
		AND addr.SourceTableID = 6 
     ) p
     PIVOT(
               Count(ContractID)
               FOR AddrState IN(
                    [ACT] , [NSW] , [WA] , [SA] , [QLD] , [NT] , [VIC] , [TAS]
               )
     ) as pvt

) b ON a.CreateDate = DATEADD(day,1, b.CreateDate)
ORDER BY a.CreateDate
---------------------------------------------------------------------------------------------------------------------------------
--Age of Existing Accounts ... total and by state
---------------------------------------------------------------------------------------------------------------------------------
--Total with STDEV:
SELECT AVG(sel.Lifespan), 
     STDEV(sel.Lifespan)
FROM
(
     SELECT DATEDIFF(DAY, acc.CreateDate, GETDATE()) AS Lifespan 
     FROM vwAccounts AS acc
) AS sel;

--By State with STDEV:
SELECT sel.AddrState AS 'State',
     AVG(sel.Lifespan) AS 'Average Account Age', 
     STDEV(sel.Lifespan) AS 'Standard Dev'
     
FROM
(
     SELECT DATEDIFF(DAY, acc.CreateDate, GETDATE()) AS Lifespan,
     addr.addrState AS AddrState
     FROM vwAccounts AS acc
     INNER JOIN vwClients cl ON cl.ClientID = acc.ClientID1
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
	     AND addr.SourceTableID = 6 
) AS sel GROUP BY sel.AddrState;

---------------------------------------------------------------------------------------------------------------------------------
--Average No of Draws Per Month, for each state, for Weekly salary interval accounts created before Jan 1st
---------------------------------------------------------------------------------------------------------------------------------
DECLARE @CreatedBefore DATE = '1-Jan-2021'
DECLARE @Interval INTEGER = 7

SELECT *
  FROM (
        SELECT acc.ContractID
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , addr.addrState
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
          AND acc.RegularPaymentInterval = @Interval
          AND acc.CreateDate < @CreatedBefore
      GROUP BY acc.ContractID
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             addr.addrState
       ) as datasrc

PIVOT(
     COUNT(datasrc.ContractID)
     FOR AddrState IN(
          [ACT] , [NSW] , [WA] , [SA] , [QLD] , [NT] , [VIC] , [TAS]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)


---------------------------------------------------------------------------------------------------------------------------------
--Frequency Distribution of draws vs account age for accounts created before Jan 1 2021
---------------------------------------------------------------------------------------------------------------------------------
DECLARE @CreatedBefore DATE = '1-Jan-2021'

SELECT COUNT(ap.PaymentID)
     , DATEDIFF(DAY, acc.CreateDate, GETDATE())
FROM vwAccounts acc
LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
WHERE acc.CreateDate < @CreatedBefore
     AND ap.PaymentType = 4
GROUP BY acc.ContractID

--------------------------------------------------------------------------------------------------------------------------
--Growth Forecast
--------------------------------------------------------------------------------------------------------------------------
--Total
SELECT DATEADD(WEEK, DATEDIFF(WEEK, 0, PaymentDate), 0) [Week Of]
		, ISNULL(CASE WHEN LEFT(ap.Description, 6) = 'Salary' AND ap.PaymentType = 4 THEN Amount WHEN LEFT(ap.Description, 6) = 'PayGat' AND ap.PaymentType = 0 THEN -1 * Amount END, 0 ) [Revenue]
		, addr.AddrState
	FROM vwAccountsPayments ap
	INNER JOIN vwAccounts acc ON acc.ContractID = ap.ContractID
	INNER JOIN vwClients cl ON cl.ClientID = acc.ClientID1
	INNER JOIN vwClientsAddresses addr ON addr.SourceID = cl.ClientID AND addr.SourceTableID = 6


--BY state
SELECT *
FROM
(
	SELECT DATEADD(WEEK, DATEDIFF(WEEK, 0, PaymentDate), 0) [Week Of]
		, ISNULL(CASE WHEN LEFT(ap.Description, 6) = 'Salary' AND ap.PaymentType = 4 THEN Amount WHEN LEFT(ap.Description, 6) = 'PayGat' AND ap.PaymentType = 0 THEN -1 * Amount END, 0 ) [Revenue]
		, addr.AddrState
	FROM vwAccountsPayments ap
	INNER JOIN vwAccounts acc ON acc.ContractID = ap.ContractID
	INNER JOIN vwClients cl ON cl.ClientID = acc.ClientID1
	INNER JOIN vwClientsAddresses addr ON addr.SourceID = cl.ClientID AND addr.SourceTableID = 6
) res
PIVOT(
        SUM([Revenue])
        FOR AddrState IN(
            [ACT] , [NSW] , [WA] , [SA] , [QLD] , [NT] , [VIC] , [TAS]
        )
) as pvt
ORDER BY [Week Of]