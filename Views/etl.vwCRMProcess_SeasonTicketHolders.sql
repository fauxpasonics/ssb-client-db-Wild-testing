SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vwCRMProcess_SeasonTicketHolders]
AS
    SELECT DISTINCT
            a.DimCustomerId
          , dc.AccountId
          , dc.SSID
          , CAST(ds.SeasonYear AS VARCHAR(50)) SeasonYear
          , CAST(ds.SeasonYear + '-'
            + CONVERT(VARCHAR, ( CAST(ds.SeasonYear AS INT) + 1 )) AS VARCHAR(50)) SeasonYr
    FROM    dbo.FactTicketSales a
    INNER JOIN dbo.DimCustomer dc ON dc.DimCustomerId = a.DimCustomerId
    INNER JOIN dbo.DimPlan AS dp ON dp.DimPlanId = a.DimPlanId
    INNER JOIN dbo.DimSeason ds ON ds.DimSeasonId = a.DimSeasonId
    WHERE   dp.PlanCode LIKE '%FS%';

GO
