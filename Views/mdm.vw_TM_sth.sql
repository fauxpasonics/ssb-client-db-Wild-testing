SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [mdm].[vw_TM_sth]
AS
    SELECT  DISTINCT
            dc.DimCustomerId
          , CY_STH.CY_STH
          , STH.STH
          , PP.PastPurchaser 
          , dc.AccountId
    FROM    dbo.DimCustomer AS dc (NOLOCK)
    LEFT JOIN (
                -- Rule #1 - ARchtics Current STH
SELECT  DISTINCT
        fts.DimCustomerId
      , 1 AS CY_STH
FROM  [rpt].[vw_FactTicketSalesBase]  AS fts  (NOLOCK)
WHERE   fts.SeasonHeaderIsActive = '1'
        AND fts.DimTicketTypeId = '1'
              ) CY_STH ON dc.DimCustomerId = CY_STH.DimCustomerId
    LEFT JOIN (
                -- Rule #2 - Archtics Historical STH 
SELECT  DISTINCT
        fts.DimCustomerId
      , 1 AS STH
FROM  [rpt].[vw_FactTicketSalesBase]  AS fts  (NOLOCK)
WHERE   fts.DimTicketTypeId = '1'
               ) STH ON STH.DimCustomerId = dc.DimCustomerId
    LEFT JOIN (
                -- Rule #3 - Seat Purchase in the Last 3 Years
SELECT  DISTINCT
        fts.DimCustomerId
      , 1 AS PastPurchaser
FROM    [rpt].[vw_FactTicketSales] AS fts
JOIN    [rpt].[vw_DimDate] AS dd ON dd.DimDateId = fts.DimDateId
WHERE   dd.CalDate > DATEADD(YEAR, -3, GETDATE())
              ) PP ON PP.DimCustomerId = dc.DimCustomerId;


GO
