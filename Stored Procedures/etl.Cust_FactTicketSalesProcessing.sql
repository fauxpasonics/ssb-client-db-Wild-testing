SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO











--EXEC etl.TM_LoadFactTicketSales

CREATE PROCEDURE [etl].[Cust_FactTicketSalesProcessing]
(
	@BatchId INT = 0,
	@LoadDate DATETIME = NULL,
	@Options NVARCHAR(MAX) = NULL
)
AS


BEGIN


/*****************************************************************************************************************
															PLAN TYPE
******************************************************************************************************************/

----NEW----

UPDATE fts
SET fts.DimPlanTypeId = 1
FROM   #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND fts.SalesSource NOT IN ('Renewal Sale', 'Renewal Add-On', 'Renewal Upgrade'
									,'Brokers','Corporate Sponsorship', 'Hockey Operations'
									, 'Wild Trade', 'John Maher','Matt Majka','Jack Larson'
									,'Maria Troje','Jim Ibister','Jeff Pellegrom','Rachel Schuldt'
									,'Mitch Helgerson')

----RENEWAL----

UPDATE fts
SET fts.DimPlanTypeId = 2
FROM    #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND fts.SalesSource = 'Renewal Sale'

----ADD ON----

UPDATE fts
SET fts.DimPlanTypeId = 3
FROM    #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND fts.SalesSource = 'Renewal Add On'

----UPGRADE----

UPDATE fts
SET fts.DimPlanTypeId = 4
FROM    #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild
	   AND fts.SalesSource = 'Renewal Upgrade'

----BROKER----

UPDATE fts
SET fts.DimPlanTypeId = 5
FROM    #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild
	   AND fts.SalesSource ='Brokers'

----NO PLAN----

UPDATE fts
SET fts.DimPlanTypeId = 6
FROM   #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild
	   AND fts.SalesSource IS NULL

---- Bjorn Additions
---7=Hockey Operations
UPDATE fts
SET fts.DimPlanTypeId = 8
FROM    #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild
          AND fts.SalesSource = 'Hockey Operations'

--- 8=Wild Trade
UPDATE fts
SET fts.DimPlanTypeId = 9
FROM   #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild
          AND fts.SalesSource = 'Wild Trade'

--9= Executive Seats    
UPDATE fts
SET fts.DimPlanTypeId = 10
FROM   #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild
          AND fts.SalesSource in ('John Maher','Matt Majka','Jack Larson','Maria Troje','Jim Ibister','Jeff Pellegrom','Rachel Schuldt','Mitch Helgerson')


--11 Deposits


UPDATE fts
SET fts.DimTicketTypeId = 4
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimPlan
		ON fts.DimPlanId = dimPlan.DimPlanId
	JOIN dbo.DimItem di 
		ON fts.DimItemId = di.DimItemId
WHERE  (fts.DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND (DimPlan.PlanCode LIKE '16BUSDEP'
	   OR DimPlan.PlanCode LIKE '16ESTDEP'
	   OR DimPlan.PlanCode LIKE '16WKDEP'
	   OR DimPlan.PlanCode LIKE '16RVLDEP'))
	   OR (fts.DimSeasonId = 2 --General Admission - Wild TM compatible (SSID = 342)
	   AND (di.ItemCode LIKE '17%DEP'))



/*****************************************************************************************************************
															TICKET TYPE
******************************************************************************************************************/

----FULL SEASON----

UPDATE fts
SET fts.DimTicketTypeId = 1
FROM    #stgFactTicketSales fts
	JOIN dbo.DimPlan dimPlan
		ON fts.DimPlanId = dimPlan.DimPlanId
WHERE  ((fts.DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimPlan.PlanCode LIKE '16FS%')
	   OR (fts.DimSeasonId = 162 --'2017-2018 Minnesota Wild'
	   AND DimPlan.PlanCode LIKE '17FS%')
	   AND fts.[CompCode] <= '0')

----HALF SEASON----

UPDATE fts
SET fts.DimTicketTypeId = 2
FROM    #stgFactTicketSales fts
	JOIN dbo.DimPlan dimPlan
		ON fts.DimPlanId = dimPlan.DimPlanId
WHERE  (fts.DimSeasonId = 19 --'2015-2016 Minnesota Wild'
	   AND (DimPlan.PlanCode LIKE '15NORT%' 
	   OR DimPlan.PlanCode LIKE '15IRON%'))
	   OR (fts.DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND (DimPlan.PlanCode LIKE '16NORT%' 
	   OR DimPlan.PlanCode LIKE '16IRON%'))
	   OR (fts.DimSeasonId = 162 --'2017-2018 Minnesota Wild'
	   AND (DimPlan.PlanCode LIKE '17NORT%' OR
	   DimPlan.PlanCode LIKE '17IRON%'))



----11 GAME PLAN (11GMPL)----

UPDATE fts
SET fts.DimTicketTypeId = 3
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimPlan
		ON fts.DimPlanId = dimPlan.DimPlanId
WHERE  (fts.DimSeasonId = 19 --'2015-2016 Minnesota Wild'
	   AND (DimPlan.PlanCode LIKE '15BUS%'
	   OR DimPlan.PlanCode LIKE '15EAST%' 
	   OR DimPlan.PlanCode LIKE '15WKND%'
	   OR DimPlan.PlanCode LIKE '15RVL%'))
	   OR (fts.DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND (DimPlan.PlanCode LIKE '16BUS%'
	   OR DimPlan.PlanCode LIKE '16EAST%' 
	   OR DimPlan.PlanCode LIKE '16WKND%'
	   OR DimPlan.PlanCode LIKE '16RVL%'))
	   OR (fts.DimSeasonId = 162 --'2017-2018 Minnesota Wild'
	   AND (DimPlan.PlanCode LIKE '17BUS%'
	   OR DimPlan.PlanCode LIKE '17EAST%' 
	   OR DimPlan.PlanCode LIKE '17WKND%'
	   OR DimPlan.PlanCode LIKE '17RVL%'))

----11 GAME PLAN (11GMDEP)----

UPDATE fts
SET fts.DimTicketTypeId = 4
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimPlan
		ON fts.DimPlanId = dimPlan.DimPlanId
	JOIN dbo.DimItem di 
		ON fts.DimItemId = di.DimItemId
WHERE  (fts.DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND (DimPlan.PlanCode LIKE '16BUSDEP'
	   OR DimPlan.PlanCode LIKE '16ESTDEP'
	   OR DimPlan.PlanCode LIKE '16WKDEP'
	   OR DimPlan.PlanCode LIKE '16RVLDEP'))
	   OR (fts.DimSeasonId = 2 --General Admission - Wild TM compatible (SSID = 342)
	   AND (di.ItemCode LIKE '17%DEP'))

----BUD LIGHT LOUNGE----
UPDATE fts
SET fts.DimTicketTypeId = 15
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimPlan
		ON fts.DimPlanId = dimPlan.DimPlanId
WHERE PlanCode IN ('17LOGE', '16LOGE')

----GROUP----
UPDATE fts
SET fts.DimTicketTypeId = 5
FROM #stgFactTicketSales fts
	JOIN dbo.DimPriceCode dpc ON fts.DimPriceCodeId = dpc.DimpriceCodeId
WHERE dpc.PC2 = 'G'

----SINGLE----

UPDATE fts
SET fts.DimTicketTypeId = 6
FROM #stgFactTicketSales fts
	JOIN dbo.DimPriceCode dpc ON fts.DimPriceCodeId = dpc.DimpriceCodeId
	JOIN dbo.DimPlan dp ON fts.DimPlanId = dp.DimplanId
WHERE (PlanCode = 'None' AND dpc.PC2 = 'S')
OR fts.[RetailTicketType] <> ''
OR (dpc.PriceCode like '%11' AND dp.PlanCode = 'None' AND dpc.PC1 <> 'S')
OR (dpc.PriceCode like '%22' AND dp.PlanCode = 'None' AND dpc.PC1 <> 'S')

UPDATE fts
SET fts.DimTicketTypeId = 6
FROM #stgFactTicketSales fts
	JOIN dbo.DimPriceCode dpc ON fts.DimPriceCodeId = dpc.DimpriceCodeId
	JOIN dbo.DimPlan dp ON fts.DimPlanId = dp.DimplanId
WHERE dp.PlanCode like 'MSEPLN%'
OR dp.PlanCode IN ('EMPSALE', 'PRESALE')

UPDATE fts
SET fts.DimTicketTypeId = 6
FROM #stgFactTicketSales fts
	INNER JOIN dbo.DimPriceCode dpc ON fts.DimPriceCodeId = dpc.DimpriceCodeId
	INNER JOIN dbo.DimEvent (NOLOCK) de ON fts.DimEventId = de.DimEventId
	INNER JOIN dbo.DimEventHeader deh ON de.DimEventHeaderId = deh.DimEventHeaderId
	INNER JOIN dbo.DimSeasonHeader dsh ON deh.DimSeasonHeaderId = dsh.DimSeasonHeaderId
WHERE (dsh.SeasonName = '2017-2018 Minnesota Wild' AND PC2 = '1' AND PC3 IS NULL)

----PARKING----

UPDATE fts
SET fts.DimTicketTypeId = 13
FROM #stgFactTicketSales fts
	JOIN dbo.DimSeason ds ON fts.DimSeasonId = ds.DimSeasonId
	JOIN dbo.DimPriceCode dpc ON fts.DimPriceCodeID = dpc.DimPriceCodeID
WHERE ds.SeasonName like '%Parking%' 

----SUITE MISC----

UPDATE fts
SET fts.DimTicketTypeId = 14
FROM #stgFactTicketSales fts
	JOIN dbo.DimSeason ds ON fts.DimSeasonId = ds.DimSeasonId
	JOIN dbo.DimPriceCode dpc ON fts.DimPriceCodeID = dpc.DimPriceCodeID
	JOIN dbo.Dimplan dp on fts.DimplanId = dp.DimplanId
WHERE ds.SeasonName like '%Suite%' 
and dpc.PriceCode <> 'SAA'
and (dp.PlanCode NOT LIKE '%SUITE%' OR dp.PlanCode NOT LIKE '%SUIT')

----SUITE Annual ----

UPDATE fts
SET fts.DimTicketTypeId = 19
--select distinct PlanCode 
FROM #stgFactTicketSales fts
	INNER JOIN dbo.DimPlan dp on fts.DimPlanId = dp.DimPlanId
WHERE dp.PlanCode like '%SUITE%'
OR dp.PlanCode LIKE '%SUIT'

----SUITE RENTAL----

UPDATE fts
SET fts.DimTicketTypeId = 17
FROM #stgFactTicketSales fts
	INNER JOIN dbo.DimEvent de on fts.DimEventId = de.DimEventId
WHERE de.EventCode like 'SR%'

----SUITE Annual Additional ----

UPDATE fts
SET fts.DimTicketTypeId = 18
FROM #stgFactTicketSales fts
	INNER JOIN dbo.DimPriceCode dpc on fts.DimPriceCodeId = dpc.DimPriceCodeId
WHERE dpc.PriceCode = 'SAA'


----SUITESG----

UPDATE fts
SET fts.DimTicketTypeId = 10
FROM #stgFactTicketSales fts
	JOIN dbo.DimPriceCode dimPrice
		ON fts.DimPriceCodeID = dimPrice.DimPriceCodeID
WHERE  dimPrice.PriceCode = 'SAE'


-------Pick up any missing tickets ----------
UPDATE fts
SET fts.DimTicketTypeId = 6
FROM #stgFactTicketSales fts
WHERE fts.DimPlanId <= '0' 
AND fts.DimTicketTypeId = '-1'
AND fts.DimPriceCodeId <> '-1'
AND fts.DimSeasonid = '162'


----COMP----

UPDATE fts
SET fts.DimTicketTypeId = 16
FROM #stgFactTicketSales fts
	INNER JOIN dbo.DimEvent de on fts.DimEventId = de.DimEventId
WHERE de.EventCode NOT LIKE 'SR%'
AND fts.[CompCode] > '0'


/******************************************
			LOGIC CURRENTLY UNKNOWN 
*******************************************/


----SINGLE (ISG) ----

--UPDATE fts
--SET fts.DimTicketTypeId = 7
--FROM #stgFactTicketSales fts
--	JOIN dbo.DimPlan dimPlan
--		ON fts.DimPlanId = dimPlan.DimPlanId
--WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
--	   AND DimPlan.PlanCode IS NULL
--       AND fts.IsGroup = 0



----STHSG----

--UPDATE fts
--SET fts.DimTicketTypeId = 9
--FROM #stgFactTicketSales fts
--	JOIN dbo.DimPlan dimPlan
--		ON fts.DimPlanId = dimPlan.DimPlanId
--WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
--	   AND DimPlan.PlanCode IS NULL
--       AND fts.IsGroup = 0



----WAITFULL----

UPDATE fts
SET fts.DimTicketTypeId = 11
FROM #stgFactTicketSales fts
	JOIN dbo.DimEvent dimEvent
		ON fts.DimEventId = dimEvent.DimEventId
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND dimEvent.EventName = 'FULLWL'

----WAITHALF----

UPDATE fts
SET fts.DimTicketTypeId = 12
FROM #stgFactTicketSales fts
	JOIN dbo.DimEvent dimEvent
		ON fts.DimEventId = dimEvent.DimEventId
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND dimEvent.EventName = 'HALFWL'



/*****************************************************************************************************************
															SEAT TYPE
******************************************************************************************************************/


----GA ----
--UPDATE fts
--SET fts.DimSeatTypeId = 1
--FROM #stgFactTicketSales fts
--JOIN dbo.DimSeat seat ON fts.DimArenaID = seat.DimArenaID
--WHERE DimSeasonId = 88 --'2016-2017 Minnesota Wild'
--	AND seat.SectionName LIKE '%'

----Club Seats----
UPDATE fts
SET fts.DimSeatTypeId = 2
FROM #stgFactTicketSales fts
JOIN dbo.DimSeat seat ON fts.DimSeatIdStart = seat.DimSeatId
WHERE fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	AND seat.SectionName LIKE 'C%'

----100 Level----
UPDATE fts
SET fts.DimSeatTypeId = 3
FROM #stgFactTicketSales fts
JOIN dbo.DimSeat seat ON fts.DimSeatIdStart = seat.DimSeatId
WHERE fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	AND seat.SectionName LIKE '1%'


----200 Level----
UPDATE fts
SET fts.DimSeatTypeId = 4
FROM #stgFactTicketSales fts
JOIN dbo.DimSeat seat ON fts.DimSeatIdStart = seat.DimSeatId
WHERE fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	AND seat.SectionName LIKE '2%'

----Loge Seats----
UPDATE fts
SET fts.DimSeatTypeId = 5
FROM #stgFactTicketSales fts
JOIN dbo.DimSeat seat ON fts.DimSeatIdStart = seat.DimSeatId
WHERE fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	AND seat.SectionName = 'LGE'

----Suites----
UPDATE fts
SET fts.DimSeatTypeId = 6
FROM #stgFactTicketSales fts
JOIN dbo.DimSeat seat ON fts.DimSeatIdStart = seat.DimSeatId
WHERE fts.DimSeasonId IN (111, 164) --'2016-2017 Minnesota Wild - Suites', 2017-2018 Minnesota Wild - Suites 
	AND seat.SectionName = 'SUITE'

/*****************************************************************************************************************
															TICKET CLASS
******************************************************************************************************************/

--FULL SEASON NEW--

UPDATE fts
SET fts.DimTicketClassId = 1
FROM #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND DimTicketTypeId = 1 --'Full Season'
	   AND DimPlanTypeId = 1 --'New'

--FULL SEASON RENEW--

UPDATE fts
SET fts.DimTicketClassId = 2
FROM #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND DimTicketTypeId = 1 --'Full Season'
	   AND DimPlanTypeId = 2 --'Renewal'

--FULL SEASON ADD-ON--

UPDATE fts
SET fts.DimTicketClassId = 3
FROM #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND DimTicketTypeId = 1 --'Full Season'
	   AND DimPlanTypeId = 3 --'Add-On'

--FULL SEASON UPGRADE--

UPDATE fts
SET fts.DimTicketClassId = 4
FROM #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild = 88 --'2016-2017 Minnesota Wild'
	   AND DimTicketTypeId = 1 --'Full Season'
	   AND DimPlanTypeId = 4 --'Add-On'

--FULL SEASON BROKER--

UPDATE fts
SET fts.DimTicketClassId = 5
FROM #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND DimTicketTypeId = 1 --'Full Season'
	   AND DimPlanTypeId = 5 --'Broker'


--HALF SEASON NEW--

UPDATE fts
SET fts.DimTicketClassId = 6
FROM #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND DimTicketTypeId = 2 --'Half Season'
	   AND DimPlanTypeId = 1 --'New'

--HALF SEASON RENEW--

UPDATE fts
SET fts.DimTicketClassId = 7
FROM #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND DimTicketTypeId = 2 --'Half Season'
	   AND DimPlanTypeId = 2 --'Renewal'

--HALF SEASON ADD-ON--

UPDATE fts
SET fts.DimTicketClassId = 8
FROM #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND DimTicketTypeId = 2 --'Half Season'
	   AND DimPlanTypeId = 3 --'Add-On'

--HALF SEASON UPGRADE--

UPDATE fts
SET fts.DimTicketClassId = 9
FROM #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND DimTicketTypeId = 2 --'Half Season'
	   AND DimPlanTypeId = 4 --'Add-On'

--HALF SEASON BROKER--

UPDATE fts
SET fts.DimTicketClassId = 10
FROM #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND DimTicketTypeId = 2 --'Half Season'
	   AND DimPlanTypeId = 5 --'Broker'



--PAID GROUP--

UPDATE fts
SET fts.DimTicketClassId = 11
FROM #stgFactTicketSales fts
JOIN ods.Tm_Tkt tmtickets ON fts.SSID_acct_id = tmtickets.acct_id
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND DimTicketTypeId = 5 --'Group'
	   AND DimPlanTypeId = 6 --'No Plan'
	   AND Paid = 'Y'


--UNPAID GROUP--


UPDATE fts
SET fts.DimTicketClassId = 12
FROM #stgFactTicketSales fts
JOIN ods.Tm_Tkt tmtickets ON fts.SSID_acct_id = tmtickets.acct_id
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND DimTicketTypeId = 5 --'Group'
	   AND DimPlanTypeId = 6 --'No Plan'
	   AND Paid = 'N'


--SINGLE GAME--

UPDATE fts
SET fts.DimTicketClassId = 13
FROM #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND DimTicketTypeId = 6 --'Single'

--LOGE--
	
UPDATE fts
SET fts.DimTicketClassId = 15
FROM #stgFactTicketSales fts
WHERE  fts.DimSeasonId = 94 --'2016-2017 Minnesota Wild - Loge'
		OR fts.DimSeasonId = 163 --'2017-2018 Minnesota Wild - Loge'

--MISC--

UPDATE fts
SET fts.DimTicketClassId = 14
FROM #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND DimTicketClassId IS NULL
/*****************************************************************************************************************
													FACT TAGS
******************************************************************************************************************/


--IsPremium--

UPDATE fts
SET fts.IsPremium = 1
FROM #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND (
			(  DimSeatTypeID = 3 AND ssid_row_id = '1'  )
			OR DimSeatTypeID = 5 --Loge
			OR DimSeatTypeID = 6 --Suite
			OR DimSeatTypeID = 2 --Club
	   ) 

--IsComp--	   
UPDATE fts
SET fts.IsComp = 1
FROM #stgFactTicketSales fts
WHERE fts.[CompCode] > '0'

	   

--IsGroup--

UPDATE fts
SET fts.IsGroup = 1
FROM #stgFactTicketSales fts
INNER JOIN dbo.DimPriceCode dpc on fts.DimPriceCodeId = dpc.DimpriceCodeId 
WHERE PC2 = 'G'
	   
--IsDiscount--



/******************************************
			LOGIC CURRENTLY UNKNOWN 
*******************************************/

--IsPlan--

UPDATE fts
SET fts.IsPlan = 1
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimplan
		ON fts.DimPlanId = dimplan.DimPlanId
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND dimplan.PlanCode IS NOT NULL
	   AND dimplan.PlanCode <> 'None'
	   

--IsPartial--

UPDATE fts
SET fts.IsPartial = 1
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimplan
		ON fts.DimPlanId = dimplan.DimPlanId
WHERE  (fts.DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND (DimPlan.PlanCode LIKE '16NORT%'
	   OR DimPlan.PlanCode LIKE '16BUS%'
	   OR DimPlan.PlanCode LIKE '16EAST%' 
	   OR DimPlan.PlanCode LIKE '16WKND%' 
	   OR DimPlan.PlanCode LIKE '16RVL%' 
	   OR DimPlan.PlanCode LIKE '16BUSDEP'
	   OR DimPlan.PlanCode LIKE '16ESTDEP'
	   OR DimPlan.PlanCode LIKE '16WKDEP'
	   OR DimPlan.PlanCode LIKE '16RVLDEP'))
	   OR (fts.DimSeasonId = 162 
	   AND (DimPlan.PlanCode LIKE '17NORT%' 
	   OR DimPlan.PlanCode LIKE '17IRON%'
	   OR DimPlan.PlanCode LIKE '17BUS%'
	   OR DimPlan.PlanCode LIKE '17EAST%' 
	   OR DimPlan.PlanCode LIKE '17WKND%'
	   OR DimPlan.PlanCode LIKE '17RVL%'))


--IsSingleEvent--

UPDATE fts
SET fts.IsSingleEvent = 1
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimplan
		ON fts.DimPlanId = dimplan.DimPlanId
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND DimPlan.PlanCode IS NULL





--IsBroker--

UPDATE fts
SET fts.IsBroker = 1
FROM #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND fts.SalesSource = 'Brokers'
	   

--IsRenewal--

UPDATE fts
SET fts.IsRenewal = 1
FROM #stgFactTicketSales fts
WHERE  fts.DimSeasonId IN (88, 162) --'2016-2017 Minnesota Wild', 2017-2018 Minnesota Wild 
	   AND fts.SalesSource IN ('Renewal Sale', 'Renewal Add-On', 'Renewal Upgrade')

	   

UPDATE  fts
SET     fts.QtySeatFSE = fts.QtySeat / 44.0
FROM    #stgFactTicketSales AS fts
        INNER JOIN dbo.DimTicketType dtt ON fts.DimTicketTypeId = dtt.DimTicketTypeId
WHERE   fts.IsPlan = 1;



END 

















GO
