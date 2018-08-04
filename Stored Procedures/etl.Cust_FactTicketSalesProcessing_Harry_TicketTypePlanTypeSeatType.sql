SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [etl].[Cust_FactTicketSalesProcessing_Harry_TicketTypePlanTypeSeatType]
(
	@BatchId BIGINT = 0,
	@Options NVARCHAR(MAX) = NULL,
    @FactLoadRunTime DATETIME
)
AS



BEGIN


/*****************************************************************************************************************
															PLAN TYPE
******************************************************************************************************************/

----NEW----

UPDATE fts
SET fts.DimPlanTypeId = 1
FROM    #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND fts.SalesSource NOT IN ('Renewal Sale', 'Renewal Add-On', 'Renewal Upgrade'
									,'Brokers','Corporate Sponsorship')

----RENEWAL----

UPDATE fts
SET fts.DimPlanTypeId = 2
FROM    #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND fts.SalesSource = 'Renewal Sale'

----ADD ON----

UPDATE fts
SET fts.DimPlanTypeId = 3
FROM    #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND fts.SalesSource = 'Renewal Add On'

----UPGRADE----

UPDATE fts
SET fts.DimPlanTypeId = 4
FROM    #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND fts.SalesSource = 'Renewal Upgrade'

----BROKER----

UPDATE fts
SET fts.DimPlanTypeId = 5
FROM    #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND fts.SalesSource ='Brokers'

----NO PLAN----

UPDATE fts
SET fts.DimPlanTypeId = 6
FROM    #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND fts.SalesSource IS NULL

/*****************************************************************************************************************
															TICKET TYPE
******************************************************************************************************************/

----FULL SEASON----

UPDATE fts
SET fts.DimTicketTypeId = 1
FROM    #stgFactTicketSales fts
	JOIN dbo.DimPlan dimPlan
		ON fts.DimPlanId = dimPlan.DimPlanId
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimPlan.PlanCode LIKE '16FS%'

----HALF SEASON----

UPDATE fts
SET fts.DimTicketTypeId = 2
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimPlan
		ON fts.DimPlanId = dimPlan.DimPlanId
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimPlan.PlanCode LIKE '16NORT%' OR
	   DimPlan.PlanCode LIKE '16IRON%'

----11 GAME PLAN (11GMPL)----

UPDATE fts
SET fts.DimTicketTypeId = 3
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimPlan
		ON fts.DimPlanId = dimPlan.DimPlanId
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND (DimPlan.PlanCode LIKE '16BUS%'
	   OR DimPlan.PlanCode LIKE '16EAST%' 
	   OR DimPlan.PlanCode LIKE '16WKND%'
	   OR DimPlan.PlanCode LIKE '16RVL%')

----11 GAME PLAN (11GMDEP)----

UPDATE fts
SET fts.DimTicketTypeId = 4
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimPlan
		ON fts.DimPlanId = dimPlan.DimPlanId
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimPlan.PlanCode IN ('16BUSDEP','16ESTDEP','16WKDEP','16RVLDEP')

/***************************************************
			REVIEW WITH HARRY
****************************************************/

------GROUP----

UPDATE fts
SET fts.DimTicketTypeId = 5
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimPlan
		ON fts.DimPlanId = dimPlan.DimPlanId
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
       AND fts.GroupFlag = 'Y'

------SINGLE----

UPDATE fts
SET fts.DimTicketTypeId = 6
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimPlan
		ON fts.DimPlanId = dimPlan.DimPlanId
	LEFT JOIN (SELECT DISTINCT fts.SSID_acct_id 
			   FROM dbo.FactTicketSales fts 
				   JOIN dbo.DimPlan dimplan
				   ON dimplan.DimPlanId = fts.DimPlanId
			   WHERE fts.DimSeasonId = 88 
					AND dimplan.PlanCode IS NOT NULL
			   )planHolder
		ON fts.SSID_acct_id = planHolder.SSID_acct_id
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
       AND fts.groupFlag = 'N'
	   AND planHolder.SSID_acct_id IS NULL	

------SINGLE (ISG) ----

UPDATE fts
SET fts.DimTicketTypeId = 7
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimPlan
		ON fts.DimPlanId = dimPlan.DimPlanId
	JOIN (SELECT DISTINCT fts.SSID_acct_id 
			   FROM dbo.FactTicketSales fts 
				   JOIN dbo.DimPlan dimplan
				   ON dimplan.DimPlanId = fts.DimPlanId
			   WHERE fts.DimSeasonId = 88 
					AND dimplan.PlanCode IS NOT NULL
			   )planHolder
		ON fts.SSID_acct_id = planHolder.SSID_acct_id
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimPlan.PlanCode IS NULL
       AND fts.groupFlag = 'N'


----STHSG----

---------
------Harry:  This is way too inclusive.  Think this is actually the exact same as ISGSTH which has better logic
---------

--UPDATE fts
--SET fts.DimTicketTypeId = 9
--FROM #stgFactTicketSales fts
--	JOIN dbo.DimPlan dimPlan
--		ON fts.DimPlanId = dimPlan.DimPlanId
--WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
--	   AND DimPlan.PlanCode IS NULL
--       AND fts.groupFlag = 'N'

----SUITESG----

UPDATE fts
SET fts.DimTicketTypeId = 10
FROM #stgFactTicketSales fts
	JOIN dbo.DimPriceCode dimPrice
		ON fts.DimPriceCodeID = dimPrice.DimPriceCodeID
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND dimPrice.PriceCode = 'SAE'

----WAITFULL----

UPDATE fts
SET fts.DimTicketTypeId = 11
FROM #stgFactTicketSales fts
	JOIN dbo.DimEvent dimEvent
		ON fts.DimEventId = dimEvent.DimEventId
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND dimEvent.EventName = 'FULLWL'

----WAITHALF----

UPDATE fts
SET fts.DimTicketTypeId = 12
FROM #stgFactTicketSales fts
	JOIN dbo.DimEvent dimEvent
		ON fts.DimEventId = dimEvent.DimEventId
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND dimEvent.EventName = 'HALFWL'

----MISC----

UPDATE fts
SET fts.DimTicketTypeId = 8
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimPlan
		ON fts.DimPlanId = dimPlan.DimPlanId
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimTicketTypeId IS NULL

/*****************************************************************************************************************
															SEAT TYPE
******************************************************************************************************************/

----Club Seats----
UPDATE fts
SET fts.DimSeatTypeId = 2
FROM #stgFactTicketSales fts
JOIN dbo.DimSeat seat ON fts.DimArenaID = seat.DimArenaID
WHERE DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	AND seat.SectionName LIKE 'C%'

----100 Level----
UPDATE fts
SET fts.DimSeatTypeId = 3
FROM #stgFactTicketSales fts
JOIN dbo.DimSeat seat ON fts.DimArenaID = seat.DimArenaID
WHERE DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	AND seat.SectionName LIKE '1%'


----200 Level----
UPDATE fts
SET fts.DimSeatTypeId = 4
FROM #stgFactTicketSales fts
JOIN dbo.DimSeat seat ON fts.DimArenaID = seat.DimArenaID
WHERE DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	AND seat.SectionName LIKE '2%'

----Loge Seats----
UPDATE fts
SET fts.DimSeatTypeId = 5
FROM #stgFactTicketSales fts
JOIN dbo.DimSeat seat ON fts.DimArenaID = seat.DimArenaID
WHERE DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	AND seat.SectionName LIKE 'LGE'

----Suites----
UPDATE fts
SET fts.DimSeatTypeId = 6
FROM #stgFactTicketSales fts
JOIN dbo.DimSeat seat ON fts.DimArenaID = seat.DimArenaID
WHERE DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	AND seat.SectionName LIKE 'SUITE'

--GA ----
UPDATE fts
SET fts.DimSeatTypeId = 1
FROM #stgFactTicketSales fts
WHERE DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	AND ISNULL(DimTicketTypeId,-1) <> -1

/*****************************************************************************************************************
															TICKET CLASS
******************************************************************************************************************/

--FULL SEASON NEW--

UPDATE fts
SET fts.DimTicketClassId = 1
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimTicketTypeId = 1 --'Full Season'
	   AND DimPlanTypeId = 1 --'New'

--FULL SEASON RENEW--

UPDATE fts
SET fts.DimTicketClassId = 2
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimTicketTypeId = 1 --'Full Season'
	   AND DimPlanTypeId = 2 --'Renewal'

--FULL SEASON ADD-ON--

UPDATE fts
SET fts.DimTicketClassId = 3
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimTicketTypeId = 1 --'Full Season'
	   AND DimPlanTypeId = 3 --'Add-On'

--FULL SEASON UPGRADE--

UPDATE fts
SET fts.DimTicketClassId = 4
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimTicketTypeId = 1 --'Full Season'
	   AND DimPlanTypeId = 4 --'Upgrade'

--FULL SEASON BROKER--

UPDATE fts
SET fts.DimTicketClassId = 5
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimTicketTypeId = 1 --'Full Season'
	   AND DimPlanTypeId = 5 --'Broker'


--HALF SEASON NEW--

UPDATE fts
SET fts.DimTicketClassId = 6
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimTicketTypeId = 2 --'Half Season'
	   AND DimPlanTypeId = 1 --'New'

--HALF SEASON RENEW--

UPDATE fts
SET fts.DimTicketClassId = 7
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimTicketTypeId = 2 --'Half Season'
	   AND DimPlanTypeId = 2 --'Renewal'

--HALF SEASON ADD-ON--

UPDATE fts
SET fts.DimTicketClassId = 8
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimTicketTypeId = 2 --'Half Season'
	   AND DimPlanTypeId = 3 --'Add-On'

--HALF SEASON UPGRADE--

UPDATE fts
SET fts.DimTicketClassId = 9
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimTicketTypeId = 2 --'Half Season'
	   AND DimPlanTypeId = 4 --'Upgrade'

--HALF SEASON BROKER--

UPDATE fts
SET fts.DimTicketClassId = 10
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimTicketTypeId = 2 --'Half Season'
	   AND DimPlanTypeId = 5 --'Broker'



/***************************************************
			REVIEW WITH HARRY
****************************************************/

----PAID GROUP--

---------
------Harry: Partials?  Marked with a 'P'
---------


UPDATE fts
SET fts.DimTicketClassId = 11
FROM #stgFactTicketSales fts
JOIN ods.Tm_Tkt tmtickets ON fts.SSID_acct_id = tmtickets.acct_id
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimTicketTypeId = 5 --'Group'
	   AND DimPlanTypeId = 6 --'No Plan'
	   AND PaidStatus = 'Y'


----UNPAID GROUP--


UPDATE fts
SET fts.DimTicketClassId = 12
FROM #stgFactTicketSales fts
JOIN ods.Tm_Tkt tmtickets ON fts.SSID_acct_id = tmtickets.acct_id
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimTicketTypeId = 5 --'Group'
	   AND DimPlanTypeId = 6 --'No Plan'
	   AND PaidStatus = 'N'


--SINGLE GAME--

UPDATE fts
SET fts.DimTicketClassId = 13
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimTicketTypeId = 5 --'Single'

--LOGE--
	
UPDATE fts
SET fts.DimTicketClassId = 15
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 94 --'2016-2017 Minnesota Wild - Loge'

--MISC--

UPDATE fts
SET fts.DimTicketClassId = 14
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimTicketClassId IS NULL
/*****************************************************************************************************************
													FACT TAGS
******************************************************************************************************************/


/***************************************************
			REVIEW WITH HARRY
****************************************************/

--IsPremium--

UPDATE fts
SET fts.IsPremium = 1
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND (
			(  DimSeatTypeID = 3 AND ssid_row_id = '1'  )
			OR DimSeatTypeID = 5 --Loge
			OR DimSeatTypeID = 6 --Suite
			OR DimSeatTypeID = 2 --Club
	   ) 

UPDATE fts
SET fts.IsPremium = 1
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimSeatTypeID <> 1 

UPDATE fts
SET fts.IsPremium = 0
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND fts.IsPremium <> 1
   

--IsComp--

UPDATE fts
SET fts.IsComp = 1
FROM #stgFactTicketSales fts
WHERE Compcode <> 'Not Comp' or comp_code <> 0

UPDATE fts
SET fts.IsComp = 0
FROM #stgFactTicketSales fts
WHERE Compcode = 'Not Comp' or comp_code = 0

/******************************************
			LOGIC UNDEFINED 
*******************************************/
	   
--IsHost--

/***************************************************
			REVIEW WITH HARRY
****************************************************/

UPDATE fts
SET fts.IsHost = 1
FROM #stgFactTicketSales fts
JOIN ods.Tm_Tkt tmtickets ON fts.SSID_acct_id = tmtickets.acct_id
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND price_code LIKE '%*%'

UPDATE fts
SET fts.IsHost = 0
FROM #stgFactTicketSales fts
JOIN ods.Tm_Tkt tmtickets ON fts.SSID_acct_id = tmtickets.acct_id
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND price_code not like '%*%'

--IsPlan--

UPDATE fts
SET fts.IsPlan = 1
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimplan
		ON fts.DimPlanId = dimplan.DimPlanId
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND dimplan.PlanCode IS NOT NULL
	   
UPDATE fts
SET fts.IsPlan = 0
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND fts.IsPlan <> 1

--IsPartial--

UPDATE fts
SET fts.IsPartial = 1
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimplan
		ON fts.DimPlanId = dimplan.DimPlanId
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND (DimPlan.PlanCode LIKE '16NORT%'
			OR DimPlan.PlanCode LIKE '16BUS%'
			OR DimPlan.PlanCode LIKE '16EAST%' 
			OR DimPlan.PlanCode LIKE '16WKND%' 
			OR DimPlan.PlanCode LIKE '16RVL%' 
			OR DimPlan.PlanCode LIKE '16BUSDEP'
			OR DimPlan.PlanCode LIKE '16ESTDEP'
			OR DimPlan.PlanCode LIKE '16WKDEP'
			OR DimPlan.PlanCode LIKE '16RVLDEP')

UPDATE fts
SET fts.IsPartial = 0
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimplan
		ON fts.DimPlanId = dimplan.DimPlanId
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	  AND fts.IsPartial <> 1

--IsSingleEvent--

UPDATE fts
SET fts.IsSingleEvent = 1
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimplan
		ON fts.DimPlanId = dimplan.DimPlanId
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND DimPlan.PlanCode IS NULL

UPDATE fts
SET fts.IsSingleEvent = 0
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'   
	   AND fts.IsSingleEvent <> 1
--IsGroup--

/***************************************************
			REVIEW WITH HARRY
****************************************************/
--UPDATE fts
--SET fts.IsGroup = 1
--FROM #stgFactTicketSales fts
--JOIN ods.Tm_Tkt tmtickets ON fts.SSID_acct_id = tmtickets.acct_id
--WHERE  tmtickets.group_flag = 'Y'
--	AND tmtickets.plan_event_name is NULL
	
UPDATE fts
SET fts.IsGroup = 1	   
FROM #stgFactTicketSales fts
	JOIN dbo.DimPlan dimPlan
		ON fts.DimPlanId = dimPlan.DimPlanId
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
       AND fts.GroupFlag = 'Y'
	   AND dimplan.plancode is null

UPDATE fts
SET fts.IsGroup = 0	   
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
		AND fts.IsGroup <> 1
		AND ( fts.groupflag = 'N'
			OR ( fts.groupflag = 'Y' and dimplan.plancode is not null ) )

--IsBroker--

UPDATE fts
SET fts.IsBroker = 1
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND fts.SalesSource = 'Brokers'

UPDATE fts
SET fts.IsBroker = 0
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND fts.IsBroker <> 1

--IsRenewal--

UPDATE fts
SET fts.IsRenewal = 1
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND fts.SalesSource IN ('Renewal Sale', 'Renewal Add-On', 'Renewal Upgrade')

UPDATE fts
SET fts.IsRenewal = 0
FROM #stgFactTicketSales fts
WHERE  DimSeasonId = 88 --'2016-2017 Minnesota Wild'
	   AND fts.IsRenewal <> 1


END 




GO
