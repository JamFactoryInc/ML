-----------------------------------------------------------------------------------------------------------------------------------
--Gender
-----------------------------------------------------------------------------------------------------------------------------------

--Sizes:
SELECT Gender, COUNT(Gender)
FROM vwClients
GROUP BY Gender;

--Emp Basis
SELECT *
FROM
(
     SELECT CASE ce.empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END AS [Employment Basis]
          , cl.ClientID AS ClientID
		  , cl.Gender

     FROM vwClientsEmployment ce
     INNER JOIN vwClients cl
     ON ce.SourceID = cl.ClientID
     WHERE ce.ModifiedDT =
     (
          SELECT MAX(ce2.ModifiedDT)
          FROM vwClientsEmployment ce2
          WHERE ce2.SourceID = cl.ClientID
     )
) res
PIVOT(
     COUNT(ClientID)
     FOR Gender IN(
		[Male], [Female]
	)
) as pvt


--Dishonour
SELECT *
FROM
(
     SELECT gp.Status
          , cl.ClientID AS ClientID
		  , cl.Gender

     FROM vwClientsEmployment ce
     INNER JOIN vwClients cl
     ON ce.SourceID = cl.ClientID
	 INNER JOIN vwGatewayPayments gp ON cl.ClientID = gp.ClientID AND (gp.Status = 'Dishonour' OR gp.Status = 'Success') AND gp.DrCr = 'Dr'
     WHERE ce.ModifiedDT =
     (
          SELECT MAX(ce2.ModifiedDT)
          FROM vwClientsEmployment ce2
          WHERE ce2.SourceID = cl.ClientID
     )
) res
PIVOT(
     COUNT(ClientID)
     FOR Gender IN(
		[Male], [Female]
	)
) as pvt


--Draws per Month per Bracket:
SELECT *
  FROM (
        SELECT acc.ContractID
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , cl.Gender
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
      GROUP BY acc.ContractID
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             cl.Gender
       ) as datasrc

PIVOT(
     COUNT(datasrc.ContractID)
     FOR Gender IN(
          [Male], [Female]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)

 


--Avg Draw Amount:
SELECT *
  FROM (
        SELECT ap.Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , cl.Gender
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
      GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             cl.Gender
       ) as datasrc

PIVOT(
     AVG(datasrc.Amount)
     FOR Gender IN(
          [Male], [Female]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)

--Total Withdrawn per Month
SELECT *
  FROM (
        SELECT ap.Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , cl.Gender
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
      GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             cl.Gender
       ) as datasrc

PIVOT(
     SUM(datasrc.Amount)
     FOR Gender IN(
          [Male], [Female]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)

--Total drawn monthly per Capita
SELECT PaymentDate
	, [Male] / (
				SELECT CAST(COUNT(cl.ClientID) AS FLOAT)
				FROM vwClients cl 
				WHERE cl.Gender = 'Male'
				) AS [Male]
	, [Female] / (
				SELECT CAST(COUNT(cl.ClientID) AS FLOAT)
				FROM vwClients cl 
				WHERE cl.Gender = 'Female'
				) AS [Female]
  FROM (
        SELECT ap.Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , cl.Gender
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
      GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             cl.Gender
       ) as datasrc

PIVOT(
     SUM(datasrc.Amount)
     FOR Gender IN(
          [Male], [Female]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)


 --New Accounts per day by each bracket
SELECT* FROM
          (
          SELECT acc.ContractID,
               cl.Gender AS Gender,
               CAST(acc.CreateDate AS DATE) AS CreateDate
		FROM vwAccounts as acc
		INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
		INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
		AND addr.SourceTableID = 6  
          ) p
          PIVOT(
                    Count(ContractID)
                    FOR Gender IN(
                         [Male], [Female]
                    )
          ) as pvt

ORDER BY pvt.CreateDate

--Growth in account creation:
SELECT a.CreateDate
       , a.Male - IsNull(b.Male,0) as Male
       , a.Female - IsNull(b.Female,0) as Female

  FROM (
          SELECT* FROM
          (
          SELECT acc.ContractID,
               cl.Gender AS Gender,
               CAST(acc.CreateDate AS DATE) AS CreateDate
		FROM vwAccounts as acc
		INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
		INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
		AND addr.SourceTableID = 6  
          ) p
          PIVOT(
                    Count(ContractID)
                    FOR Gender IN(
                         [Male], [Female]
                    )
          ) as pvt
  ) a
LEFT JOIN (

     SELECT * FROM
     (
     SELECT acc.ContractID,
               cl.Gender AS Gender,
               CAST(acc.CreateDate AS DATE) AS CreateDate
	FROM vwAccounts as acc
	INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
	INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
		AND addr.SourceTableID = 6 
     ) p
     PIVOT(
               Count(ContractID)
               FOR Gender IN(
                    [Male], [Female]
               )
     ) as pvt

) b ON a.CreateDate = DATEADD(day,1, b.CreateDate)
ORDER BY a.CreateDate
-----------------------------------------------------------------------------------------------------------------------------------
--Age (10-yr intervals)
-----------------------------------------------------------------------------------------------------------------------------------

--Sizes:
SELECT CONCAT( 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 8, '-', 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 17) AS Age, COUNT(cl.ClientID) AS 'Count'
FROM vwClients cl
GROUP BY CONCAT( 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 8, '-', 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 17);

--Emp Basis
SELECT *
FROM
(
     SELECT CASE ce.empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END AS [Employment Basis]
          , cl.ClientID AS ClientID
		  , CONCAT( 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 8, '-', 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 17) AS Age

     FROM vwClientsEmployment ce
     INNER JOIN vwClients cl
     ON ce.SourceID = cl.ClientID
     WHERE ce.ModifiedDT =
     (
          SELECT MAX(ce2.ModifiedDT)
          FROM vwClientsEmployment ce2
          WHERE ce2.SourceID = cl.ClientID
     )
) res
PIVOT(
     COUNT(ClientID)
     FOR Age IN(
		[18-27],[28-37],[38-47],[48-57],[58-67],[68-77],[78-87],[88-97]
	)
) as pvt

--Dishonour
SELECT *
FROM
(
     SELECT gp.Status
          , cl.ClientID AS ClientID
		  , CONCAT( 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 8, '-', 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 17) AS Age

     FROM vwClientsEmployment ce
     INNER JOIN vwClients cl
     ON ce.SourceID = cl.ClientID
	 INNER JOIN vwGatewayPayments gp ON cl.ClientID = gp.ClientID AND (gp.Status = 'Dishonour' OR gp.Status = 'Success') AND gp.DrCr = 'Dr'
     WHERE ce.ModifiedDT =
     (
          SELECT MAX(ce2.ModifiedDT)
          FROM vwClientsEmployment ce2
          WHERE ce2.SourceID = cl.ClientID
     )
) res
PIVOT(
     COUNT(ClientID)
     FOR Age IN(
		[18-27],[28-37],[38-47],[48-57],[58-67],[68-77],[78-87],[88-97]
	)
) as pvt

--Draws per Month per Bracket:
SELECT *
  FROM (
        SELECT acc.ContractID
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , CONCAT( 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 8, '-', 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 17) AS Age
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
      GROUP BY acc.ContractID
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             CONCAT( 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 8, '-', 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 17)
       ) as datasrc

PIVOT(
     COUNT(datasrc.ContractID)
     FOR Age IN(
          [18-27],[28-37],[38-47],[48-57],[58-67],[68-77],[78-87],[88-97]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)

 


--Avg Draw Amount:
SELECT *
  FROM (
        SELECT ap.Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , CONCAT( 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 8, '-', 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 17) AS Age
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
      GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             5*(DATEDIFF(YEAR, DOB, GETDATE())/5)
       ) as datasrc

PIVOT(
     AVG(datasrc.Amount)
     FOR Age IN(
          [18-27],[28-37],[38-47],[48-57],[58-67],[68-77],[78-87],[88-97]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)

--Total Withdrawn per Month
SELECT *
  FROM (
        SELECT ap.Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , CONCAT( 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 8, '-', 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 17) AS Age
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
      GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             CONCAT( 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 8, '-', 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 17)
       ) as datasrc

PIVOT(
     SUM(datasrc.Amount)
     FOR Age IN(
          [18-27],[28-37],[38-47],[48-57],[58-67],[68-77],[78-87],[88-97]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)

--Total drawn per month per capita

SELECT PaymentDate
	, [18-27] / (
		SELECT COUNT(cl.ClientID)
		FROM vwClients cl
		WHERE DATEDIFF(YEAR, cl.DOB, GETDATE()) BETWEEN 18 AND 27
		) AS [18-27]
	,[28-37]/ (
		SELECT COUNT(cl.ClientID)
		FROM vwClients cl
		WHERE DATEDIFF(YEAR, cl.DOB, GETDATE()) BETWEEN 28 AND 37
		) AS [28-37]
	,[38-47]/ (
		SELECT COUNT(cl.ClientID)
		FROM vwClients cl
		WHERE DATEDIFF(YEAR, cl.DOB, GETDATE()) BETWEEN 38 AND 47
		) AS [38-47]
	,[48-57]/ (
		SELECT COUNT(cl.ClientID)
		FROM vwClients cl
		WHERE DATEDIFF(YEAR, cl.DOB, GETDATE()) BETWEEN 48 AND 57
		) AS [48-57]
	,[58-67]/ (
		SELECT COUNT(cl.ClientID)
		FROM vwClients cl
		WHERE DATEDIFF(YEAR, cl.DOB, GETDATE()) BETWEEN 58 AND 67
		) AS [58-67]
	,[68-77]/ (
		SELECT COUNT(cl.ClientID)
		FROM vwClients cl
		WHERE DATEDIFF(YEAR, cl.DOB, GETDATE()) BETWEEN 68 AND 77
		) AS [68-77]
	,[78-87]/ (
		SELECT COUNT(cl.ClientID)
		FROM vwClients cl
		WHERE DATEDIFF(YEAR, cl.DOB, GETDATE()) BETWEEN 78 AND 87
		) AS [78-87]

  FROM (
        SELECT ap.Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , CONCAT( 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 8, '-', 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 17) AS Age
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
      GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw
			 , PaymentDate
			 , CONCAT( 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 8, '-', 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 17)
             
       ) as datasrc

PIVOT(
     SUM(datasrc.Amount)
     FOR Age IN(
          [18-27],[28-37],[38-47],[48-57],[58-67],[68-77],[78-87],[88-97]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)

 --New Accounts per day by each bracket
SELECT* FROM
          (
          SELECT acc.ContractID,
               CONCAT( 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 8, '-', 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 17) AS Age,
               CAST(acc.CreateDate AS DATE) AS CreateDate
		FROM vwAccounts as acc
		INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
		INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
		AND addr.SourceTableID = 6  
          ) p
          PIVOT(
                    Count(ContractID)
                    FOR Age IN(
                        [18-27],[28-37],[38-47],[48-57],[58-67],[68-77],[78-87],[88-97]
                    )
          ) as pvt

ORDER BY pvt.CreateDate

--Growth in account creation:
SELECT a.CreateDate
       , a.[18-27] - IsNull(b.[18-27],0) as [18-27]
       , a.[28-37] - IsNull(b.[28-37],0) as [28-37]
       , a.[38-47] - IsNull(b.[38-47],0) as [38-47]
       , a.[48-57] - IsNull(b.[48-57],0) as [48-57]
       , a.[58-67] - IsNull(b.[58-67],0) as [58-67]
       , a.[68-77] - IsNull(b.[68-77],0) as [68-77]
       , a.[78-87] - IsNull(b.[78-87],0) as [78-87]
       , a.[88-97] - IsNull(b.[88-97],0) as [88-97]
  FROM (
          SELECT* FROM
          (
          SELECT acc.ContractID,
               CONCAT( 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 8, '-', 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 17) AS Age,
               DATEADD(MONTH, DATEDIFF(MONTH, 0, acc.CreateDate), 0) AS CreateDate
		FROM vwAccounts as acc
		INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
		INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
		AND addr.SourceTableID = 6  
          ) p
          PIVOT(
                    Count(ContractID)
                    FOR Age IN(
                         [18-27],[28-37],[38-47],[48-57],[58-67],[68-77],[78-87],[88-97]
                    )
          ) as pvt
  ) a
LEFT JOIN (

     SELECT * FROM
     (
     SELECT acc.ContractID,
               CONCAT( 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 8, '-', 10*(DATEDIFF(YEAR, DOB, GETDATE())/10) + 17) AS Age,
               DATEADD(MONTH, DATEDIFF(MONTH, 0, acc.CreateDate), 0) AS CreateDate
	FROM vwAccounts as acc
	INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
	INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
		AND addr.SourceTableID = 6 
     ) p
     PIVOT(
               Count(ContractID)
               FOR Age IN(
                    [18-27],[28-37],[38-47],[48-57],[58-67],[68-77],[78-87],[88-97]
               )
     ) as pvt

) b ON a.CreateDate = DATEADD(MONTH,1, b.CreateDate)
ORDER BY a.CreateDate

-----------------------------------------------------------------------------------------------------------------------------------
--Salary Interval
-----------------------------------------------------------------------------------------------------------------------------------

--Sizes:
SELECT (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END) AS Interval
     , COUNT(*) AS 'Count'
FROM vwAccounts acc
GROUP BY (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END);

--Emp Basis
SELECT *
FROM
(
     SELECT CASE ce.empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END AS [Employment Basis]
          , cl.ClientID AS ClientID
		  , (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END) AS Interval

     FROM vwClientsEmployment ce
     INNER JOIN vwClients cl
     ON ce.SourceID = cl.ClientID
	 INNER JOIN vwAccounts acc
	 ON acc.ClientID1 = cl.ClientID
     WHERE ce.ModifiedDT =
     (
          SELECT MAX(ce2.ModifiedDT)
          FROM vwClientsEmployment ce2
          WHERE ce2.SourceID = cl.ClientID
     )
) res
PIVOT(
     COUNT(ClientID)
     FOR Interval IN(
		[Weekly], [Fortnightly], [Every 4 Weeks], [Monthy]
	)
) as pvt


--Dishonour
SELECT *
  FROM (
        SELECT acc.ContractID
             , gp.Status
             , (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END) AS Interval
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
	INNER JOIN vwGatewayPayments gp ON cl.ClientID = gp.ClientID AND (gp.Status = 'Dishonour' OR gp.Status = 'Success') AND gp.DrCr = 'Dr'
     WHERE  ap.PaymentType = 4
      GROUP BY acc.ContractID
             , acc.ContractDraw 
             , ap.ContractDraw,
             gp.Status,
             (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END)
       ) as datasrc

PIVOT(
     COUNT(datasrc.ContractID)
     FOR Interval IN(
          [Weekly], [Fortnightly], [Every 4 Weeks], [Monthy]
     )
) as pvt
ORDER BY pvt.Status DESC

--Draws per Month per Bracket:
SELECT *
  FROM (
        SELECT acc.ContractID
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END) AS Interval
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
      GROUP BY acc.ContractID
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END)
       ) as datasrc

PIVOT(
     COUNT(datasrc.ContractID)
     FOR Interval IN(
          [Weekly], [Fortnightly], [Every 4 Weeks], [Monthy]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)

 


--Avg Draw Amount by Month:
SELECT *
  FROM (
        SELECT ap.Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END) AS Interval
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
      GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END)
       ) as datasrc

PIVOT(
     AVG(datasrc.Amount)
     FOR Interval IN(
          [Weekly], [Fortnightly], [Every 4 Weeks], [Monthy]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)

--Total Withdrawn per Month
SELECT *
  FROM (
        SELECT ap.Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END) AS Interval
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
      GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END)
       ) as datasrc

PIVOT(
     SUM(datasrc.Amount)
     FOR Interval IN(
          [Weekly], [Fortnightly], [Every 4 Weeks], [Monthy]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)

--Total withdrawn per Month per Capita
SELECT PaymentDate
	, [Weekly] / (
		SELECT COUNT(cl.ClientID)
		FROM vwClients cl 
		INNER JOIN vwAccounts acc ON cl.ClientID = acc.ClientID1
			AND acc.RegularPaymentInterval = 7
	) AS [Weekly]
	, [Fortnightly]/ (
		SELECT COUNT(cl.ClientID)
		FROM vwClients cl 
		INNER JOIN vwAccounts acc ON cl.ClientID = acc.ClientID1
			AND acc.RegularPaymentInterval = 14
	) AS [Fortnightly]
	, [Every 4 Weeks]/ (
		SELECT COUNT(cl.ClientID)
		FROM vwClients cl 
		INNER JOIN vwAccounts acc ON cl.ClientID = acc.ClientID1
			AND acc.RegularPaymentInterval = 28
	) AS [Every 4 Weeks]
	, [Monthy]/ (
		SELECT COUNT(cl.ClientID)
		FROM vwClients cl 
		INNER JOIN vwAccounts acc ON cl.ClientID = acc.ClientID1
			AND acc.RegularPaymentInterval = 60
	) AS [Monthy]
  FROM (
        SELECT ap.Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END) AS Interval
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
      GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END)
       ) as datasrc

PIVOT(
     SUM(datasrc.Amount)
     FOR Interval IN(
          [Weekly], [Fortnightly], [Every 4 Weeks], [Monthy]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)

 --New Accounts per day by each bracket
SELECT* FROM
          (
          SELECT acc.ContractID
               , (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END) AS Interval
               , CAST(acc.CreateDate AS DATE) AS CreateDate
		FROM vwAccounts as acc
		INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
		INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
		AND addr.SourceTableID = 6  
          ) p
          PIVOT(
                    Count(ContractID)
                         FOR Interval IN(
                              [Weekly], [Fortnightly], [Every 4 Weeks], [Monthy]
                         )
          ) as pvt

ORDER BY pvt.CreateDate

--Growth in account creation:
SELECT a.CreateDate
       , a.[Weekly] - IsNull(b.[Weekly],0) as 'Weekly'
       , a.[Fortnightly] - IsNull(b.[Fortnightly],0) as 'Fortnightly'
       , a.[Every 4 Weeks] - IsNull(b.[Every 4 Weeks],0) as 'Every 4 Weeks'
       , a.[Monthy] - IsNull(b.[Monthy],0) as 'Monthy'

  FROM (
          SELECT* FROM
          (
          SELECT acc.ContractID,
               (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END) AS Interval,
               CAST(acc.CreateDate AS DATE) AS CreateDate
		FROM vwAccounts as acc
		INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
		INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
		AND addr.SourceTableID = 6  
          ) p
          PIVOT(
                    Count(ContractID)
                    FOR Interval IN(
                         [Weekly], [Fortnightly], [Every 4 Weeks], [Monthy]
                    )
          ) as pvt
  ) a
LEFT JOIN (

     SELECT * FROM
     (
     SELECT acc.ContractID,
               (CASE acc.RegularPaymentInterval WHEN 7 THEN 'Weekly' WHEN 14 THEN 'Fortnightly' WHEN 28 THEN 'Every 4 Weeks' WHEN 60 THEN 'Monthy' END) AS Interval,
               CAST(acc.CreateDate AS DATE) AS CreateDate
	FROM vwAccounts as acc
	INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
	INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
		AND addr.SourceTableID = 6 
     ) p
     PIVOT(
               Count(ContractID)
               FOR Interval IN(
                    [Weekly], [Fortnightly], [Every 4 Weeks], [Monthy]
               )
     ) as pvt

) b ON a.CreateDate = DATEADD(day,1, b.CreateDate)
ORDER BY a.CreateDate

-----------------------------------------------------------------------------------------------------------------------------------
--Annual Wage
-----------------------------------------------------------------------------------------------------------------------------------

--Sizes:
SELECT CASE WHEN res.[Annual Salary] <= 18200 THEN '0-18200'
                    WHEN res.[Annual Salary] <= 45000 THEN '18201-45000'
                    WHEN res.[Annual Salary] <= 120000 THEN '45001-120000'
                    WHEN res.[Annual Salary] <= 180000 THEN '120001-180000'
                    ELSE '>180000' END AS [Annual Wage]
     , COUNT(res.[Annual Salary]) AS 'Count'
FROM
(
     SELECT CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT) AS [Annual Salary]
FROM vwClientsEmployment 
WHERE empCurrentSalaryAmount IS NOT NULL

) res
GROUP BY CASE WHEN res.[Annual Salary] <= 18200 THEN '0-18200'
                    WHEN res.[Annual Salary] <= 45000 THEN '18201-45000'
                    WHEN res.[Annual Salary] <= 120000 THEN '45001-120000'
                    WHEN res.[Annual Salary] <= 180000 THEN '120001-180000'
                    ELSE '>180000' END
ORDER BY CASE WHEN res.[Annual Salary] <= 18200 THEN '0-18200'
                    WHEN res.[Annual Salary] <= 45000 THEN '18201-45000'
                    WHEN res.[Annual Salary] <= 120000 THEN '45001-120000'
                    WHEN res.[Annual Salary] <= 180000 THEN '120001-180000'
                    ELSE '>180000' END

--Emp Basis
SELECT pvt.[Employment Basis]
     , [18200] AS [0-18200]
     , [45000] AS [18201-45000]
     , [120000] AS [45001-120000]
     , [180000] AS [120001-180000]
     , [180001] AS [>180000]
FROM
(
     SELECT CASE ce.empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END AS [Employment Basis]
          , cl.ClientID AS ClientID
		  , CASE WHEN res.[Annual Salary] <= 18200 THEN 18200 
                    WHEN res.[Annual Salary] <= 45000 THEN 45000
                    WHEN res.[Annual Salary] <= 120000 THEN 120000
                    WHEN res.[Annual Salary] <= 180000 THEN 180000
                    ELSE 180001 END AS Intervals

     FROM vwClientsEmployment ce
     INNER JOIN vwClients cl
     ON ce.SourceID = cl.ClientID
	 INNER JOIN vwAccounts acc
	 ON acc.ClientID1 = cl.ClientID
	 INNER JOIN
	 (
               SELECT CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT) AS [Annual Salary],
                    acc.ContractID AS ContractID
                    , gp.Status
               FROM vwClientsEmployment ce
               INNER JOIN vwClients cl ON ce.SourceID = cl.ClientID
               INNER JOIN vwAccounts acc ON acc.ClientID1 = cl.CLientID
               LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
            	INNER JOIN vwGatewayPayments gp ON cl.ClientID = gp.ClientID AND (gp.Status = 'Dishonour' OR gp.Status = 'Success') AND gp.DrCr = 'Dr'
               WHERE  ap.PaymentType = 4
               AND empCurrentSalaryAmount IS NOT NULL
               GROUP BY acc.ContractID
             , acc.ContractDraw 
             , ap.ContractDraw
             , gp.Status
             , CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT)
             
          ) res
		  ON res.ContractID = acc.ContractID
     WHERE ce.ModifiedDT =
     (
          SELECT MAX(ce2.ModifiedDT)
          FROM vwClientsEmployment ce2
          WHERE ce2.SourceID = cl.ClientID
     )
) res2
PIVOT(
     COUNT(ClientID)
     FOR Intervals IN(
		[18200], [45000], [120000], [180000], [180001]
	)
) as pvt

--Dishonour

SELECT pvt.Status
     , [18200] AS [0-18200]
     , [45000] AS [18201-45000]
     , [120000] AS [45001-120000]
     , [180000] AS [120001-180000]
     , [180001] AS [>180000]
  FROM (
        SELECT ContractID
             , res.Status
             , CASE WHEN res.[Annual Salary] <= 18200 THEN 18200 
                    WHEN res.[Annual Salary] <= 45000 THEN 45000
                    WHEN res.[Annual Salary] <= 120000 THEN 120000
                    WHEN res.[Annual Salary] <= 180000 THEN 180000
                    ELSE 180001 END AS Intervals
          FROM 
          (
               SELECT CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT) AS [Annual Salary],
                    acc.ContractID AS ContractID
                    , gp.Status
               FROM vwClientsEmployment ce
               INNER JOIN vwClients cl ON ce.SourceID = cl.ClientID
               INNER JOIN vwAccounts acc ON acc.ClientID1 = cl.CLientID
               LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
            	INNER JOIN vwGatewayPayments gp ON cl.ClientID = gp.ClientID AND (gp.Status = 'Dishonour' OR gp.Status = 'Success') AND gp.DrCr = 'Dr'
               WHERE  ap.PaymentType = 4
               AND empCurrentSalaryAmount IS NOT NULL
               GROUP BY acc.ContractID
             , acc.ContractDraw 
             , ap.ContractDraw
             , gp.Status
             , CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT)
             
          ) res

       ) as datasrc
PIVOT(
     COUNT(datasrc.ContractID)
     FOR datasrc.Intervals IN(   
          [18200], [45000], [120000], [180000], [180001]
     )
) as pvt
ORDER BY pvt.Status DESC

--Draws per Month per Bracket:
SELECT PaymentDate
     , [18200] AS [0-18200]
     , [45000] AS [18201-45000]
     , [120000] AS [45001-120000]
     , [180000] AS [120001-180000]
     , [180001] AS [>180000]
  FROM (
        SELECT ContractID
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , CASE WHEN res.[Annual Salary] <= 18200 THEN 18200 
                    WHEN res.[Annual Salary] <= 45000 THEN 45000
                    WHEN res.[Annual Salary] <= 120000 THEN 120000
                    WHEN res.[Annual Salary] <= 180000 THEN 180000
                    ELSE 180001 END AS Intervals
          FROM 
          (
               SELECT CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT) AS [Annual Salary],
                    acc.ContractID AS ContractID
                    , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
               FROM vwClientsEmployment ce
               INNER JOIN vwClients cl ON ce.SourceID = cl.ClientID
               INNER JOIN vwAccounts acc ON acc.ClientID1 = cl.CLientID
               LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
               INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
               AND addr.SourceTableID = 6 
               WHERE  ap.PaymentType = 4
               AND empCurrentSalaryAmount IS NOT NULL
               GROUP BY acc.ContractID
             , acc.ContractDraw 
             , ap.ContractDraw
             , PaymentDate
             , CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT)
             
          ) res

       ) as datasrc

PIVOT(
     COUNT(datasrc.ContractID)
     FOR datasrc.Intervals IN(   
[18200], [45000], [120000], [180000], [180001]
)
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0);

 


--Avg Draw Amount by Month:

SELECT PaymentDate
     , [18200] AS [0-18200]
     , [45000] AS [18201-45000]
     , [120000] AS [45001-120000]
     , [180000] AS [120001-180000]
     , [180001] AS [>180000]
  FROM (
        SELECT Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , CASE WHEN res.[Annual Salary] <= 18200 THEN 18200 
                    WHEN res.[Annual Salary] <= 45000 THEN 45000
                    WHEN res.[Annual Salary] <= 120000 THEN 120000
                    WHEN res.[Annual Salary] <= 180000 THEN 180000
                    ELSE 180001 END AS Intervals
          FROM 
          (
               SELECT CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT) AS [Annual Salary],
                    ap.Amount AS Amount
                    , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
               FROM vwClientsEmployment ce
               INNER JOIN vwClients cl ON ce.SourceID = cl.ClientID
               INNER JOIN vwAccounts acc ON acc.ClientID1 = cl.CLientID
               LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
               INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
               AND addr.SourceTableID = 6 
               WHERE  ap.PaymentType = 4
               AND empCurrentSalaryAmount IS NOT NULL
               GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw
             , PaymentDate
             , CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT)
             
          ) res

       ) as datasrc

PIVOT(
     AVG(datasrc.Amount)
     FOR datasrc.Intervals IN(   
[18200], [45000], [120000], [180000], [180001]
)
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0);

--Total Withdrawn per Month

SELECT PaymentDate
     , [18200] AS [0-18200]
     , [45000] AS [18201-45000]
     , [120000] AS [45001-120000]
     , [180000] AS [120001-180000]
     , [180001] AS [>180000]
  FROM (
        SELECT Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , CASE WHEN res.[Annual Salary] <= 18200 THEN 18200 
                    WHEN res.[Annual Salary] <= 45000 THEN 45000
                    WHEN res.[Annual Salary] <= 120000 THEN 120000
                    WHEN res.[Annual Salary] <= 180000 THEN 180000
                    ELSE 180001 END AS Intervals
          FROM 
          (
               SELECT CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT) AS [Annual Salary],
                    ap.Amount AS Amount
                    , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
               FROM vwClientsEmployment ce
               INNER JOIN vwClients cl ON ce.SourceID = cl.ClientID
               INNER JOIN vwAccounts acc ON acc.ClientID1 = cl.CLientID
               LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
               INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
               AND addr.SourceTableID = 6 
               WHERE  ap.PaymentType = 4
               AND empCurrentSalaryAmount IS NOT NULL
               GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw
             , PaymentDate
             , CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT)
             
          ) res

       ) as datasrc

PIVOT(
     SUM(datasrc.Amount)
     FOR datasrc.Intervals IN(   
[18200], [45000], [120000], [180000], [180001]
)
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0);

--Total Drawn monthly per capita
SELECT PaymentDate
     , [18200] / (
		 	SELECT COUNT(cl.ClientID)
			FROM vwClientsEmployment ce
               INNER JOIN vwClients cl ON ce.SourceID = cl.ClientID
               INNER JOIN vwAccounts acc ON acc.ClientID1 = cl.CLientID
               LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
               WHERE  ap.PaymentType = 4
               AND empCurrentSalaryAmount IS NOT NULL
			   AND CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT) 
			   		BETWEEN 0 AND 18200
		 ) AS [0-18200]
     , [45000]/ (
		 	SELECT COUNT(cl.ClientID)
			FROM vwClientsEmployment ce
               INNER JOIN vwClients cl ON ce.SourceID = cl.ClientID
               INNER JOIN vwAccounts acc ON acc.ClientID1 = cl.CLientID
               LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
               WHERE  ap.PaymentType = 4
               AND empCurrentSalaryAmount IS NOT NULL
			   AND CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT) 
			   		BETWEEN 18201 AND 45000
		 ) AS [18201-45000]
     , [120000]/ (
		 	SELECT COUNT(cl.ClientID)
			FROM vwClientsEmployment ce
               INNER JOIN vwClients cl ON ce.SourceID = cl.ClientID
               INNER JOIN vwAccounts acc ON acc.ClientID1 = cl.CLientID
               LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
               WHERE  ap.PaymentType = 4
               AND empCurrentSalaryAmount IS NOT NULL
			   AND CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT) 
			   		BETWEEN 45001 AND 120000
		 ) AS [45001-120000]
     , [180000]/ (
		 	SELECT COUNT(cl.ClientID)
			FROM vwClientsEmployment ce
               INNER JOIN vwClients cl ON ce.SourceID = cl.ClientID
               INNER JOIN vwAccounts acc ON acc.ClientID1 = cl.CLientID
               LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
               WHERE  ap.PaymentType = 4
               AND empCurrentSalaryAmount IS NOT NULL
			   AND CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT) 
			   		BETWEEN 120001 AND 180000
		 ) AS [120001-180000]
     , [180001]/ (
		 	SELECT COUNT(cl.ClientID)
			FROM vwClientsEmployment ce
               INNER JOIN vwClients cl ON ce.SourceID = cl.ClientID
               INNER JOIN vwAccounts acc ON acc.ClientID1 = cl.CLientID
               LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
               WHERE  ap.PaymentType = 4
               AND empCurrentSalaryAmount IS NOT NULL
			   AND CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT) 
			   		> 180000
		 ) AS [>180000]
  FROM (
        SELECT Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , CASE WHEN res.[Annual Salary] <= 18200 THEN 18200 
                    WHEN res.[Annual Salary] <= 45000 THEN 45000
                    WHEN res.[Annual Salary] <= 120000 THEN 120000
                    WHEN res.[Annual Salary] <= 180000 THEN 180000
                    ELSE 180001 END AS Intervals
          FROM 
          (
               SELECT CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT) AS [Annual Salary],
                    ap.Amount AS Amount
                    , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
               FROM vwClientsEmployment ce
               INNER JOIN vwClients cl ON ce.SourceID = cl.ClientID
               INNER JOIN vwAccounts acc ON acc.ClientID1 = cl.CLientID
               LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
               WHERE  ap.PaymentType = 4
               AND empCurrentSalaryAmount IS NOT NULL
               GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw
             , PaymentDate
             , CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT)
             
          ) res

       ) as datasrc

PIVOT(
     SUM(datasrc.Amount)
     FOR datasrc.Intervals IN(   
[18200], [45000], [120000], [180000], [180001]
)
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0);

 --New Accounts per day by each bracket

SELECT CreateDate
     , [18200] AS [0-18200]
     , [45000] AS [18201-45000]
     , [120000] AS [45001-120000]
     , [180000] AS [120001-180000]
     , [180001] AS [>180000]
  FROM (
        SELECT CreateDate
             , CASE WHEN res.[Annual Salary] <= 18200 THEN 18200 
                    WHEN res.[Annual Salary] <= 45000 THEN 45000
                    WHEN res.[Annual Salary] <= 120000 THEN 120000
                    WHEN res.[Annual Salary] <= 180000 THEN 180000
                    ELSE 180001 END AS Intervals
             , ContractID
          FROM 
          (
               SELECT CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT) AS [Annual Salary],
                    CAST(acc.CreateDate AS DATE) AS CreateDate,
                    acc.ContractID as ContractID
               FROM vwClientsEmployment ce
               INNER JOIN vwClients cl ON ce.SourceID = cl.ClientID
               INNER JOIN vwAccounts acc ON acc.ClientID1 = cl.CLientID
               LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
               INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
               AND addr.SourceTableID = 6 
               WHERE  ap.PaymentType = 4
               AND empCurrentSalaryAmount IS NOT NULL
               GROUP BY CAST(acc.CreateDate AS DATE)
             , acc.ContractDraw 
             , ap.ContractDraw
             , acc.ContractID
             , CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT)
             
          ) res

       ) as datasrc

PIVOT(
     COUNT(datasrc.ContractID)
     FOR datasrc.Intervals IN(   
[18200], [45000], [120000], [180000], [180001]
)
) as pvt
ORDER BY CreateDate;

--Growth in account creation:

SELECT a.CreateDate
       , a.[18200] - IsNull(b.[18200],0) as [0-18200]
       , a.[45000] - IsNull(b.[45000],0) as [18201-45000]
       , a.[120000] - IsNull(b.[120000],0) as [45001-120000]
       , a.[180000] - IsNull(b.[180000],0) as [120001-180000]
       , a.[180001] - IsNull(b.[180001],0) as [>180000]
  FROM (
          SELECT *
  FROM (
        SELECT CreateDate
             , CASE WHEN res.[Annual Salary] <= 18200 THEN 18200 
                    WHEN res.[Annual Salary] <= 45000 THEN 45000
                    WHEN res.[Annual Salary] <= 120000 THEN 120000
                    WHEN res.[Annual Salary] <= 180000 THEN 180000
                    ELSE 180001 END AS Intervals
             , ContractID
          FROM 
          (
               SELECT CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT) AS [Annual Salary],
                    CAST(acc.CreateDate AS DATE) AS CreateDate,
                    acc.ContractID as ContractID
               FROM vwClientsEmployment ce
               INNER JOIN vwClients cl ON ce.SourceID = cl.ClientID
               INNER JOIN vwAccounts acc ON acc.ClientID1 = cl.CLientID
               LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
               INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
               AND addr.SourceTableID = 6 
               WHERE  ap.PaymentType = 4
               AND empCurrentSalaryAmount IS NOT NULL
               GROUP BY CAST(acc.CreateDate AS DATE)
             , acc.ContractDraw 
             , ap.ContractDraw
             , acc.ContractID
             , CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT)
             
          ) res

       ) as datasrc

PIVOT(
     COUNT(datasrc.ContractID)
     FOR datasrc.Intervals IN(   
          --Thanks to my python script for generating this for me. The commented-out one is just as long as i can make it without my table display freaking out
--[0-9999],[10000-19999],[20000-29999],[30000-39999],[40000-49999],[50000-59999],[60000-69999],[70000-79999],[80000-89999],[90000-99999],[100000-109999]
[18200], [45000], [120000], [180000], [180001]
)
) as pvt
  ) a
LEFT JOIN (

     SELECT *
  FROM (
        SELECT CreateDate
             , CASE WHEN res.[Annual Salary] <= 18200 THEN 18200 
                    WHEN res.[Annual Salary] <= 45000 THEN 45000
                    WHEN res.[Annual Salary] <= 120000 THEN 120000
                    WHEN res.[Annual Salary] <= 180000 THEN 180000
                    ELSE 180001 END AS Intervals
             , ContractID
          FROM 
          (
               SELECT CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT) AS [Annual Salary],
                    CAST(acc.CreateDate AS DATE) AS CreateDate,
                    acc.ContractID as ContractID
               FROM vwClientsEmployment ce
               INNER JOIN vwClients cl ON ce.SourceID = cl.ClientID
               INNER JOIN vwAccounts acc ON acc.ClientID1 = cl.CLientID
               LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
               INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
               AND addr.SourceTableID = 6 
               WHERE  ap.PaymentType = 4
               AND empCurrentSalaryAmount IS NOT NULL
               GROUP BY CAST(acc.CreateDate AS DATE)
             , acc.ContractDraw 
             , ap.ContractDraw
             , acc.ContractID
             , CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT)
             
          ) res

       ) as datasrc

PIVOT(
     COUNT(datasrc.ContractID)
     FOR datasrc.Intervals IN(   
[18200], [45000], [120000], [180000], [180001]
)
) as pvt

) b ON a.CreateDate = DATEADD(day,1, b.CreateDate)
ORDER BY a.CreateDate
-----------------------------------------------------------------------------------------------------------------------------------
--State
-----------------------------------------------------------------------------------------------------------------------------------


--Sizes:
SELECT addr.addrState, COUNT(*) AS 'Count'
FROM vwAccounts acc
INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
AND addr.SourceTableID = 6
GROUP BY addr.addrState

--Dishonour
SELECT *
  FROM (
        SELECT acc.ContractID
             , gp.Status
             , addr.addrState AS Interval
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
	INNER JOIN vwGatewayPayments gp ON cl.ClientID = gp.ClientID AND (gp.Status = 'Dishonour' OR gp.Status = 'Success') AND gp.DrCr = 'Dr'
     WHERE  ap.PaymentType = 4
      GROUP BY acc.ContractID
             , acc.ContractDraw 
             , ap.ContractDraw,
             gp.Status,
             addr.addrState
       ) as datasrc

PIVOT(
     COUNT(datasrc.ContractID)
     FOR Interval IN(
          [ACT] , [NSW] , [WA] , [SA] , [QLD] , [NT] , [VIC] , [TAS]
     )
) as pvt
ORDER BY pvt.Status DESC


--Draws per Month per Bracket:
SELECT *
  FROM (
        SELECT acc.ContractID
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , addr.addrState AS Interval
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
      GROUP BY acc.ContractID
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             addr.addrState
       ) as datasrc

PIVOT(
     COUNT(datasrc.ContractID)
     FOR Interval IN(
          [ACT] , [NSW] , [WA] , [SA] , [QLD] , [NT] , [VIC] , [TAS]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)

 


--Avg Draw Amount by Month:
SELECT *
  FROM (
        SELECT ap.Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , addr.addrState AS Interval
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
      GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             addr.addrState
       ) as datasrc

PIVOT(
     AVG(datasrc.Amount)
     FOR Interval IN(
          [ACT] , [NSW] , [WA] , [SA] , [QLD] , [NT] , [VIC] , [TAS]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)

--Total Withdrawn per Month
SELECT *
  FROM (
        SELECT ap.Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , addr.AddrState AS Interval
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
      GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             addr.AddrState
       ) as datasrc

PIVOT(
     SUM(datasrc.Amount)
     FOR Interval IN(
          [ACT] , [NSW] , [WA] , [SA] , [QLD] , [NT] , [VIC] , [TAS]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)

--Total drawn monthly per capita
SELECT PaymentDate
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
  FROM (
        SELECT ap.Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , addr.AddrState AS Interval
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
      GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             addr.AddrState
       ) as datasrc

PIVOT(
     SUM(datasrc.Amount)
     FOR Interval IN(
          [ACT] , [NSW] , [WA] , [SA] , [QLD] , [NT] , [VIC] , [TAS]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)


 --New Accounts per day by each bracket
SELECT* FROM
          (
          SELECT acc.ContractID,
               addr.AddrState AS Interval,
               CAST(acc.CreateDate AS DATE) AS CreateDate
		FROM vwAccounts as acc
		INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
		INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
		AND addr.SourceTableID = 6  
          ) p
          PIVOT(
                    Count(ContractID)
                         FOR Interval IN(
                              [ACT] , [NSW] , [WA] , [SA] , [QLD] , [NT] , [VIC] , [TAS]
                         )
          ) as pvt

ORDER BY pvt.CreateDate

--Growth in account creation:
SELECT a.CreateDate

       , a.ACT - IsNull(b.ACT,0) as ACT
		, a.NSW - IsNull(b.NSW,0) as NSW
       , a.WA - IsNull(b.WA,0) as WA
	   , a.SA - IsNull(b.SA,0) as SA
       , a.QLD - IsNull(b.QLD,0) as QLD
       , a.NT - IsNull(b.NT,0) as NT
       , a.VIC - IsNull(b.VIC,0) as VIC
       , a.TAS - IsNull(b.TAS,0) as TAS

  FROM (
          SELECT* FROM
          (
          SELECT acc.ContractID,
               addr.AddrState AS Interval,
               DATEADD(MONTH, DATEDIFF(MONTH, 0, acc.CreateDate), 0) AS CreateDate
		FROM vwAccounts as acc
		INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
		INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
		AND addr.SourceTableID = 6  
          ) p
          PIVOT(
                    Count(ContractID)
                    FOR Interval IN(
                         [ACT] , [NSW] , [WA] , [SA] , [QLD] , [NT] , [VIC] , [TAS]
                    )
          ) as pvt
  ) a
LEFT JOIN (

     SELECT * FROM
     (
     SELECT acc.ContractID,
               addr.AddrState AS Interval,
               DATEADD(MONTH, DATEDIFF(MONTH, 0, acc.CreateDate), 0) AS CreateDate
	FROM vwAccounts as acc
	INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
	INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
		AND addr.SourceTableID = 6 
     ) p
     PIVOT(
               Count(ContractID)
               FOR Interval IN(
                    [ACT] , [NSW] , [WA] , [SA] , [QLD] , [NT] , [VIC] , [TAS]
               )
     ) as pvt

) b ON a.CreateDate = DATEADD(MONTH,1, b.CreateDate)
ORDER BY a.CreateDate

-----------------------------------------------------------------------------------------------------------------------------------
--Emp Basis
-----------------------------------------------------------------------------------------------------------------------------------

--Sizes:
SELECT [Employment Basis]
     , COUNT(ClientID) AS [Count]
FROM
(
     SELECT CASE empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END AS [Employment Basis]
          , cl.ClientID AS ClientID

     FROM vwClientsEmployment ce
     INNER JOIN vwClients cl
     ON ce.SourceID = cl.ClientID
     WHERE ce.ModifiedDT =
     (
          SELECT MAX(ce2.ModifiedDT)
          FROM vwClientsEmployment ce2
          WHERE ce2.SourceID = cl.ClientID
     )
) res
GROUP BY  [Employment Basis]

--Dishonour
SELECT *
  FROM (
        SELECT acc.ContractID
             , gp.Status
             , CASE ce.empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END  AS Interval
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwGatewayPayments gp ON cl.ClientID = gp.ClientID AND (gp.Status = 'Dishonour' OR gp.Status = 'Success') AND gp.DrCr = 'Dr'
     INNER JOIN vwClientsEmployment ce ON ce.SourceID = cl.ClientID
     WHERE  ap.PaymentType = 4
          AND ce.ModifiedDT =
          (
               SELECT MAX(ce2.ModifiedDT)
               FROM vwClientsEmployment ce2
               WHERE ce2.SourceID = cl.ClientID
          )
      GROUP BY acc.ContractID
             , acc.ContractDraw 
             , ap.ContractDraw
             , gp.Status
             , CASE ce.empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END
       ) as datasrc

PIVOT(
     COUNT(datasrc.ContractID)
     FOR Interval IN(
          [Part Time] , [Social Security] , [Full Time] , [Casual]
     )
) as pvt
ORDER BY pvt.Status DESC


--Draws per Month per Bracket:
SELECT *
  FROM (
        SELECT acc.ContractID
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , CASE ce.empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END  AS Interval
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
     INNER JOIN vwClientsEmployment ce ON ce.SourceID = cl.ClientID
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
          AND ce.ModifiedDT =
          (
               SELECT MAX(ce2.ModifiedDT)
               FROM vwClientsEmployment ce2
               WHERE ce2.SourceID = cl.ClientID
          )
      GROUP BY acc.ContractID
             , acc.ContractDraw 
             , ap.ContractDraw
             , PaymentDate
             , CASE ce.empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END
       ) as datasrc

PIVOT(
     COUNT(datasrc.ContractID)
     FOR Interval IN(
          [Part Time] , [Social Security] , [Full Time] , [Casual]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)

 


--Avg Draw Amount by Month:
SELECT *
  FROM (
        SELECT ap.Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , CASE ce.empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END AS Interval
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
     INNER JOIN vwClientsEmployment ce ON ce.SourceID = cl.ClientID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
          AND ce.ModifiedDT =
          (
               SELECT MAX(ce2.ModifiedDT)
               FROM vwClientsEmployment ce2
               WHERE ce2.SourceID = cl.ClientID
          )
      GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             CASE ce.empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END
       ) as datasrc

PIVOT(
     AVG(datasrc.Amount)
     FOR Interval IN(
          [Part Time] , [Social Security] , [Full Time] , [Casual]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)

--Total Withdrawn per Month
SELECT *
  FROM (
        SELECT ap.Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , CASE ce.empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END AS Interval
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
          AND addr.SourceTableID = 6 
     INNER JOIN vwClientsEmployment ce ON ce.SourceID = cl.ClientID 
          AND ce.SourceTableID = 6 
        
     WHERE  ap.PaymentType = 4
          AND ce.ModifiedDT =
          (
               SELECT MAX(ce2.ModifiedDT)
               FROM vwClientsEmployment ce2
               WHERE ce2.SourceID = cl.ClientID
          )
      GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             CASE ce.empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END
       ) as datasrc

PIVOT(
     SUM(datasrc.Amount)
     FOR Interval IN(
          [Part Time] , [Social Security] , [Full Time] , [Casual]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)

--Total drawn monthly per capita
SELECT PaymentDate
	 , [Part Time] / (
		 SELECT COUNT(cl.ClientID)
		 FROM vwClients cl
		 INNER JOIN vwClientsEmployment ce ON ce.SourceID = cl.ClientID 
        	AND ce.SourceTableID = 6 
		WHERE ce.empBasis = 'P'
	 ) AS [Part Time]
	  , [Social Security] / (
		 SELECT COUNT(cl.ClientID)
		 FROM vwClients cl
		 INNER JOIN vwClientsEmployment ce ON ce.SourceID = cl.ClientID 
        	AND ce.SourceTableID = 6 
		WHERE ce.empBasis = 'S'
	 ) AS [Social Security]
	  , [Full Time] / (
		 SELECT COUNT(cl.ClientID)
		 FROM vwClients cl
		 INNER JOIN vwClientsEmployment ce ON ce.SourceID = cl.ClientID 
        	AND ce.SourceTableID = 6 
		WHERE ce.empBasis = 'F'
	 ) AS [Full Time]
	  , [Casual] / (
		 SELECT COUNT(cl.ClientID)
		 FROM vwClients cl
		 INNER JOIN vwClientsEmployment ce ON ce.SourceID = cl.ClientID 
        	AND ce.SourceTableID = 6 
		WHERE ce.empBasis = 'C'
	 ) AS [Casual]
	 
  FROM (
        SELECT ap.Amount
             , CONCAT(DATENAME(month,DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)),' ', YEAR(DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0))) AS PaymentDate
             , CASE ce.empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END AS Interval
          FROM vwAccounts acc
     LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
     INNER JOIN vwClientsEmployment ce ON ce.SourceID = cl.ClientID 
        AND addr.SourceTableID = 6 
     WHERE  ap.PaymentType = 4
          AND ce.ModifiedDT =
          (
               SELECT MAX(ce2.ModifiedDT)
               FROM vwClientsEmployment ce2
               WHERE ce2.SourceID = cl.ClientID
          )
      GROUP BY ap.Amount
             , acc.ContractDraw 
             , ap.ContractDraw,
             PaymentDate,
             CASE ce.empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END
       ) as datasrc

PIVOT(
     SUM(datasrc.Amount)
     FOR Interval IN(
          [Part Time] , [Social Security] , [Full Time] , [Casual]
     )
) as pvt
ORDER BY DATEADD(MONTH, DATEDIFF(MONTH, 0, PaymentDate), 0)


 --New Accounts per day by each bracket
SELECT *
  FROM (
        SELECT acc.ContractID
             , CAST(acc.CreateDate AS DATE) AS CreateDate
             , CASE ce.empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END AS Interval
          FROM vwAccounts acc
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsEmployment ce ON ce.SourceID = cl.ClientID
     WHERE  ce.ModifiedDT =
          (
               SELECT MAX(ce2.ModifiedDT)
               FROM vwClientsEmployment ce2
               WHERE ce2.SourceID = cl.ClientID
          )
       ) as datasrc
PIVOT(
     COUNT(datasrc.ContractID)
     FOR Interval IN(
          [Part Time] , [Social Security] , [Full Time] , [Casual]
     )
) as pvt
ORDER BY CreateDate

--Growth in account creation:
SELECT a.CreateDate
       , a.[Casual] - IsNull(b.[Casual],0) as [Casual]
       , a.[Social Security] - IsNull(b.[Social Security],0) as [Social Security]
       , a.[Full Time] - IsNull(b.[Full Time],0) as [Full Time]
       , a.[Part Time] - IsNull(b.[Part Time],0) as [Part Time]


  FROM (
          SELECT *
  FROM (
        SELECT acc.ContractID
             , CAST(acc.CreateDate AS DATE) AS CreateDate
             , CASE ce.empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END AS Interval
          FROM vwAccounts acc
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsEmployment ce ON ce.SourceID = cl.ClientID
     WHERE  ce.ModifiedDT =
          (
               SELECT MAX(ce2.ModifiedDT)
               FROM vwClientsEmployment ce2
               WHERE ce2.SourceID = cl.ClientID
          )
       ) as datasrc
PIVOT(
     COUNT(datasrc.ContractID)
     FOR Interval IN(
          [Part Time] , [Social Security] , [Full Time] , [Casual]
     )
) as pvt
  ) a
LEFT JOIN (

     SELECT *
  FROM (
        SELECT acc.ContractID
             , CAST(acc.CreateDate AS DATE) AS CreateDate
             , CASE ce.empBasis WHEN 'P' THEN 'Part Time' WHEN 'S' THEN 'Social Security' WHEN 'F' THEN 'Full Time' WHEN 'C' THEN 'Casual' END AS Interval
          FROM vwAccounts acc
     INNER JOIN vwClients as cl ON cl.ClientID = acc.ClientID1 
     INNER JOIN vwClientsEmployment ce ON ce.SourceID = cl.ClientID
     WHERE  ce.ModifiedDT =
          (
               SELECT MAX(ce2.ModifiedDT)
               FROM vwClientsEmployment ce2
               WHERE ce2.SourceID = cl.ClientID
          )
       ) as datasrc
PIVOT(
     COUNT(datasrc.ContractID)
     FOR Interval IN(
         [Part Time] , [Social Security] , [Full Time] , [Casual]
     )
) as pvt

) b ON a.CreateDate = DATEADD(day,1, b.CreateDate)
ORDER BY a.CreateDate

-----------------------------------------------------------------------------------------------------------------------------------
--Get % Change of EmpBasis over Time
-----------------------------------------------------------------------------------------------------------------------------------

SELECT empBasis
     , COUNT(ClientID) FROM
(
     SELECT empBasis
          , cl.ClientID AS ClientID

     FROM vwClientsEmployment ce
     INNER JOIN vwClients cl
     ON ce.SourceID = cl.ClientID
     WHERE ce.ModifiedDT =
     (
          SELECT MAX(ce2.ModifiedDT)
          FROM vwClientsEmployment ce2
          WHERE ce2.SourceID = cl.ClientID
     )
) res
PIVOT(
     COUNT(datasrc.ContractID)
     FOR Interval IN(
          [C] , [S] , [F] , [P]
     )
) as pvt

--Ratio of Active accounts by State over time 
SELECT [Date]
     , [ACT] * 100.0/([ACT] + [NSW] + [WA] + [SA] + [QLD] + [NT] + [VIC] + [TAS]) AS [ACT Ratio]
     , [NSW] * 100.0/([ACT] + [NSW] + [WA] + [SA] + [QLD] + [NT] + [VIC] + [TAS]) AS [NSW Ratio]
     , [WA] * 100.0/([ACT] + [NSW] + [WA] + [SA] + [QLD] + [NT] + [VIC] + [TAS]) AS [WA Ratio]
     , [SA] * 100.0/([ACT] + [NSW] + [WA] + [SA] + [QLD] + [NT] + [VIC] + [TAS]) AS [SA Ratio]
     , [QLD] * 100.0/([ACT] + [NSW] + [WA] + [SA] + [QLD] + [NT] + [VIC] + [TAS]) AS [QLD Ratio]
     , [NT] * 100.0/([ACT] + [NSW] + [WA] + [SA] + [QLD] + [NT] + [VIC] + [TAS]) AS [NT Ratio]
     , [VIC] * 100.0/([ACT] + [NSW] + [WA] + [SA] + [QLD] + [NT] + [VIC] + [TAS]) AS [VIC Ratio]
     , [TAS] * 100.0/([ACT] + [NSW] + [WA] + [SA] + [QLD] + [NT] + [VIC] + [TAS]) AS [TAS Ratio]
FROM
(
SELECT [Date]
     , CASE WHEN ACTPartiton = 0 THEN 0 ELSE first_value([ACT]) OVER (PARTITION BY ACTPartiton ORDER BY [Date]) END AS [ACT]
     , CASE WHEN NSWPartiton = 0 THEN 0 ELSE first_value([NSW]) OVER (PARTITION BY NSWPartiton ORDER BY [Date]) END AS [NSW]
     , CASE WHEN WAPartiton = 0 THEN 0 ELSE first_value([WA]) OVER (PARTITION BY WAPartiton ORDER BY [Date]) END AS [WA]
     , CASE WHEN SAPartiton = 0 THEN 0 ELSE first_value([SA]) OVER (PARTITION BY SAPartiton ORDER BY [Date]) END AS [SA]
     , CASE WHEN QLDPartiton = 0 THEN 0 ELSE first_value([QLD]) OVER (PARTITION BY QLDPartiton ORDER BY [Date]) END AS [QLD]
     , CASE WHEN NTPartiton = 0 THEN 0 ELSE first_value([NT]) OVER (PARTITION BY NTPartiton ORDER BY [Date]) END AS [NT]
     , CASE WHEN VICPartiton = 0 THEN 0 ELSE first_value([VIC]) OVER (PARTITION BY VICPartiton ORDER BY [Date]) END AS [VIC]
     , CASE WHEN TASPartiton = 0 THEN 0 ELSE first_value([TAS]) OVER (PARTITION BY TASPartiton ORDER BY [Date]) END AS [TAS]
FROM 
(
SELECT [Date]
     , [ACT]
     , SUM(CASE WHEN [ACT] IS NULL THEN 0 ELSE 1 END) OVER (ORDER BY [Date]) AS ACTPartiton
     , [NSW]
     , SUM(CASE WHEN [NSW] IS NULL THEN 0 ELSE 1 END) OVER (ORDER BY [Date]) AS NSWPartiton
     , [WA]
     , SUM(CASE WHEN [WA] IS NULL THEN 0 ELSE 1 END) OVER (ORDER BY [Date]) AS WAPartiton
     , [SA]
     , SUM(CASE WHEN [SA] IS NULL THEN 0 ELSE 1 END) OVER (ORDER BY [Date]) AS SAPartiton
     , [QLD]
     , SUM(CASE WHEN [QLD] IS NULL THEN 0 ELSE 1 END) OVER (ORDER BY [Date]) AS QLDPartiton
     , [NT]
     , SUM(CASE WHEN [NT] IS NULL THEN 0 ELSE 1 END) OVER (ORDER BY [Date]) AS NTPartiton
     , [VIC]
     , SUM(CASE WHEN [VIC] IS NULL THEN 0 ELSE 1 END) OVER (ORDER BY [Date]) AS VICPartiton
     , [TAS]
     , SUM(CASE WHEN [TAS] IS NULL THEN 0 ELSE 1 END) OVER (ORDER BY [Date]) AS TASPartiton
FROM
(
     SELECT *
     FROM
     (
          SELECT res.[Date] as [Date]
               , Max(res.runningTotal) AS runningTotal
               , res.AddrState as AddrState
          FROM
          (
          SELECT CAST(p1.ModifiedDT AS DATE) AS [Date]
                    , COUNT(p1.SourceID) OVER(PARTITION BY AddrState ORDER BY CAST(p1.ModifiedDT AS DATE)  ROWS UNBOUNDED PRECEDING) AS runningTotal
                    , addr.addrState AS AddrState
          FROM vwClients c
          JOIN vwClientsEmployment p1 ON (c.ClientID = p1.SourceID AND p1.SourceTableID = 6)
          LEFT OUTER JOIN vwClientsEmployment p2 ON ((c.ClientID = p2.SourceID AND p2.SourceTableID = 6) AND 
          (p1.ModifiedDT < p2.ModifiedDT OR (p1.ModifiedDT = p2.ModifiedDT AND p1.EmploymentID < p2.EmploymentID)))
          INNER JOIN vwAccounts acc ON c.ClientID = acc.ClientID1
          INNER JOIN vwClientsAddresses addr ON acc.ClientID1 = addr.SourceID 
          AND addr.SourceTableID = 6
          WHERE p2.EmploymentID IS NULL 
          AND p1.ModifiedDT IS NOT NULL
          AND acc.IsActive = 'True'
          
          ) res
          GROUP BY AddrState
               , [Date]
     ) datasrc
     PIVOT(
          MAX(datasrc.runningTotal)
          FOR AddrState IN(
               [ACT] , [NSW] , [WA] , [SA] , [QLD] , [NT] , [VIC] , [TAS]
          )
     ) as pvt
     
) a
) [Values]
) [Ratios]
ORDER BY [Date]

--Ratio of Active Accounts by EmpBasis by State Over time (Should account for the fact that Empbasis changes and gets the most recent record for each day. This means it is slow)
DECLARE @Date1 DATE = '30-Nov-2020'
DECLARE @Date2 DATE = '31-Jan-2021'

SELECT AddrState
     , [Date]
     
     , [S]*100.0/([S] + [C] + [P] + [F]) AS [S]
     , [P]*100.0/([S] + [C] + [P] + [F]) AS [P]
     , [C]*100.0/([S] + [C] + [P] + [F]) AS [C]
     , [F]*100.0/([S] + [C] + [P] + [F]) AS [F]
FROM
(
     SELECT [Date]
          , ce.EmpBasis
          , cl.ClientID
          , addr.AddrState
     FROM
     vwClients cl
     INNER JOIN
     (
          SELECT DATEADD(week, DATEDIFF(week, 0, ce.CreatedDT - 1), 0) AS [Date]
          FROM vwClientsEmployment ce
          WHERE ce.CreatedDT IS NOT NULL
               AND ce.SourceTableID = 6
               AND ce.CreatedDT BETWEEN @Date1 AND @Date2
          GROUP BY DATEADD(week, DATEDIFF(week, 0, ce.CreatedDT - 1), 0)
     ) dates ON 1=1
     INNER JOIN vwClientsEmployment ce ON ce.CreatedDT < dates.[Date]
          AND ce.SourceTableID = 6
     INNER JOIN vwClientsAddresses addr ON addr.SourceTableId = 6 AND addr.SourceID = cl.ClientID
     WHERE ce.CreatedDT = (SELECT MAX(ce2.CreatedDT) FROM vwClientsEmployment ce2 WHERE ce2.SourceID = cl.ClientID AND ce.CreatedDT < dates.[Date])
) datasrc
PIVOT(
     COUNT(ClientID)
     FOR EmpBasis IN(
          [S], [C], [P], [F]
     )
) pvt
ORDER BY AddrState, [Date]