SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
	CREATE VIEW [etl].[vw_TicketTaggingLogic]
		AS

		SELECT ttl.TagType, ttl.TagTypeTableID, ttl.TagTypeRank, CONCAT(
		'/*** ', ttl.TagType, ' ', ttl.TagTypeTableID, ': ', COALESCE(tt.TicketTypeName, pt.PlanTypeName, tc.TicketClassName, st.SeatTypeName), ' ***/
		Update TicketSales
		SET TicketSales.Dim', ttl.TagType, 'ID = ', ttl.TagTypeTableID, '
		FROM dbo.FactTicketSales TicketSales (NOLOCK)
		JOIN dbo.DimSeason Season (NOLOCK)
			on TicketSales.DimSeasonID = Season.DimSeasonID'
		-- DimEvent --
		, CASE WHEN ttl.logic LIKE 'Event.%' OR ttl.logic LIKE '% Event.%' OR ttl.logic LIKE '%(Event.%' THEN '
		JOIN dbo.DimEvent Event (NOLOCK)
			on TicketSales.DimEventID = Event.DimEventID' ELSE '' END

		-- DimItem --
		, CASE WHEN ttl.logic LIKE 'Item.%' OR ttl.logic LIKE '% Item.%' OR ttl.logic LIKE '%(Item.%' THEN '
		JOIN dbo.DimItem Item (NOLOCK)
			on TicketSales.DimItemID = Item.DimItemID' ELSE '' END

		-- DimPlan --
		, CASE WHEN ttl.logic LIKE 'PlanCode.%' OR ttl.logic LIKE '% PlanCode.%' OR ttl.logic LIKE '%(PlanCode.%' THEN '
		JOIN dbo.DimPlan PlanCode (NOLOCK)
			on TicketSales.DimPlanID = PlanCode.DimPlanID' ELSE '' END

		-- DimPriceCode --
		, CASE WHEN ttl.logic LIKE 'PriceCode.%' OR ttl.logic LIKE '% PriceCode.%' OR ttl.logic LIKE '%(PriceCode.%' THEN '
		JOIN dbo.DimPriceCode PriceCode (NOLOCK)
			on TicketSales.DimPriceCodeID = PriceCode.DimPriceCodeID' ELSE '' END

		-- DimSeat --
		, CASE WHEN ttl.logic LIKE 'Seat.%' OR ttl.logic LIKE '% Seat.%' OR ttl.logic LIKE '%(Seat.%' THEN '
		JOIN dbo.DimSeat Seat (NOLOCK)
			on TicketSales.DimSeatIDStart = Seat.DimSeatID' ELSE '' END

		-- DimLedger --
		, CASE WHEN ttl.logic LIKE 'Ledger.%' OR ttl.logic LIKE '% Ledger.%' OR ttl.logic LIKE '%(Ledger.%' THEN '
		JOIN dbo.DimLedger Ledger (NOLOCK)
			on TicketSales.DimLedgerID = Ledger.DimLedgerID' ELSE '' END

		-- DimTicketType --
		, CASE WHEN ttl.logic LIKE 'TicketType.%' OR ttl.logic LIKE '% TicketType.%' OR ttl.logic LIKE '%(TicketType.%' THEN '
		JOIN dbo.DimTicketType TicketType (NOLOCK)
			on TicketSales.DimTicketTypeID = TicketType.DimTicketTypeID' ELSE '' END

		-- DimPlanType --
		, CASE WHEN ttl.logic LIKE 'PlanType.%' OR ttl.logic LIKE '% PlanType.%' OR ttl.logic LIKE '%(PlanType.%' THEN '
		JOIN dbo.DimPlanType PlanType (NOLOCK)
			ON TicketSales.DimPlanTypeID = PlanType.DimPlanTypeID' ELSE '' END

		-- DimTicketClass --
		, CASE WHEN ttl.logic LIKE 'TicketClass.%' OR ttl.logic LIKE '% TicketClass.%' OR ttl.logic LIKE '%(TicketClass.%' THEN '
		JOIN dbo.DimTicketClass TicketClass (NOLOCK)
			on TicketSales.DimTicketClassID = TicketClass.DimTicketClassID' ELSE '' END

		-- DimSeatType --
		, CASE WHEN ttl.logic LIKE 'SeatType.%' OR ttl.logic LIKE '% SeatType.%' OR ttl.logic LIKE '%(SeatType.%' THEN '
		JOIN dbo.DimSeatType SeatType (NOLOCK)
			on TicketSales.DimSeatTypeID = SeatType.DimSeatTypeID' ELSE '' END

		-- DimEventHeader --
		,CASE WHEN ttl.logic LIKE 'EventHeader.%' OR ttl.logic LIKE '% EventHeader.%' OR ttl.logic LIKE '%(EventHeader.%' THEN '
		JOIN dbo.DimEvent Event (NOLOCK)
			on TicketSales.DimEventID = Event.DimEventID
		JOIN dbo.DimEventHeader EventHeader (NOLOCK)
			on Event.DimEventHeaderID = EventHeader.DimEventHeaderID' ELSE '' END

		-- DimEventZone --
		, CASE WHEN ttl.logic LIKE 'EventZone.%' OR ttl.logic LIKE '% EventZone.%' OR ttl.logic LIKE '%(EventZone.%' THEN '
		JOIN dbo.DimEventZone EventZone (NOLOCK)
			on TicketSales.DimEventZoneID = EventZone.DimEventZoneID' ELSE '' END

		-- DimPriceLevel --
		, CASE WHEN ttl.logic LIKE 'PriceLevel.%' OR ttl.logic LIKE '% PriceLevel.%' OR ttl.logic LIKE '%(PriceLevel.%' THEN '
		JOIN dbo.DimPriceLevel PriceLevel (NOLOCK)
			on TicketSales.DimPriceLevelID = PriceLevel.DimPriceLevelID' ELSE '' END

		-- DimSeatStatus --
		, CASE WHEN ttl.logic LIKE 'SeatStatus.%' OR ttl.logic LIKE '% SeatStatus.%' OR ttl.logic LIKE '%(SeatStatus.%' THEN '
		JOIN dbo.DimSeatStatus SeatStatus (NOLOCK)
			on TicketSales.DimSeatStatusID = SeatStatus.DimPSeatStatusID' ELSE '' END

		-- DimPriceType --
		, CASE WHEN ttl.logic LIKE 'PriceType.%' OR ttl.logic LIKE '% PriceType.%' OR ttl.logic LIKE '%(PriceType.%' THEN '
		JOIN dbo.DimPriceType PriceType (NOLOCK)
			on TicketSales.DimPriceTypeID = PriceType.DimPriceTypeID' ELSE '' END

		-- DimRep --
		, CASE WHEN ttl.logic LIKE 'Rep.%' OR ttl.logic LIKE '% Rep.%' OR ttl.logic LIKE '%(Rep.%' THEN '
		JOIN dbo.DimRep Rep (NOLOCK)
			on TicketSales.DimRepID = Rep.DimRepID' ELSE '' END

		-- DimOffer --
		, CASE WHEN ttl.logic LIKE 'Offer.%' OR ttl.logic LIKE '% Offer.%' OR ttl.logic LIKE '%(Offer.%' THEN '
		JOIN dbo.DimOffer Offer (NOLOCK)
			on TicketSales.DimOfferID = Offer.DimOfferID' ELSE '' END

		-- DimSalesCode --
		, CASE WHEN ttl.logic LIKE 'SalesCode.%' OR ttl.logic LIKE '% SalesCode.%' OR ttl.logic LIKE '%(SalesCode.%' THEN '
		JOIN dbo.DimSalesCode SalesCode (NOLOCK)
			on TicketSales.DimSalesCodeID = SalesCode.DimSalesCodeID' ELSE '' END

		-- DimPromo --
		, CASE WHEN ttl.logic LIKE 'Promo.%' OR ttl.logic LIKE '% Promo.%' OR ttl.logic LIKE '%(Promo.%' THEN '
		JOIN dbo.DimPromo Promo (NOLOCK)
			on TicketSales.DimPromoID = Promo.DimPromoID' ELSE '' END

		-- TM_Ticket --
		, CASE WHEN ttl.logic LIKE 'odstkt.%' OR ttl.logic LIKE '% odstkt.%' OR ttl.logic LIKE '%(odstkt.%' THEN '
		JOIN ods.TM_Ticket odstkt (NOLOCK)
			ON TicketSales.TM_order_num = odstkt.order_num
			AND TicketSales.TM_order_line_item = odstkt.order_line_item' ELSE '' END
		, '
		WHERE (', ttl.Logic, ')
			AND Season.DimSeasonID IN (', ttl.DimSeasonID, ')




		') TagUpdateScript
		FROM etl.TicketTaggingLogic ttl (NOLOCK)
		LEFT JOIN dbo.DimTicketType tt (NOLOCK)
			ON ttl.TagType = 'TicketType'
			AND ttl.TagTypeTableID = tt.DimTicketTypeId
		LEFT JOIN dbo.DimPlanType pt (NOLOCK)
			ON ttl.TagType = 'PlanType'
			AND ttl.TagTypeTableID = pt.DimPlanTypeId
		LEFT JOIN dbo.DimTicketClass tc (NOLOCK)
			ON ttl.TagType = 'TicketClass'
			AND ttl.TagTypeTableID = tc.DimTicketClassId
		LEFT JOIN dbo.DimSeatType st (NOLOCK)
			ON ttl.TagType = 'SeatType'
			AND ttl.TagTypeTableID = st.DimSeatTypeId
		WHERE ISNULL(ttl.Logic, '') <> ''
			AND ttl.TagType IN ('TicketType', 'PlanType', 'TicketClass', 'SeatType')

		UNION ALL

		SELECT ttl.TagType, ttl.TagTypeTableID, ttl.TagTypeRank, CONCAT(
		'/* Seat Config_Location:', ttl.Config_Location, ' */
		UPDATE Seat
		SET Seat.Config_Location = ''', ttl.Config_Location, '''
		FROM dbo.DimSeat Seat
		WHERE (', ttl.Logic, ')


		') TagUpdateScript
		FROM etl.TicketTaggingLogic ttl (NOLOCK)
		WHERE ISNULL(ttl.Logic, '') <> ''
			AND ttl.TagType IN ('Config_Location')

GO
