SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [etl].[sp_CRMInteg_RecentCustData]
AS
    TRUNCATE TABLE etl.CRMProcess_RecentCustData;

    DECLARE @Client VARCHAR(50);
    SET @Client = 'Wild-TM';

    SELECT  x.DimCustomerId
          , MAX(x.MaxTransDate) maxtransdate
          , x.Team
    INTO    #tmpTicketSales
    FROM    (
              SELECT    f.DimCustomerId
                      , MAX(dd.CalDate) MaxTransDate
                      , @Client Team
              FROM      dbo.FactTicketSales f WITH ( NOLOCK )
              INNER JOIN dbo.DimDate dd WITH ( NOLOCK ) ON dd.DimDateId = f.DimDateId
              WHERE     dd.CalDate >= DATEADD(YEAR, -2, GETDATE() + 2)
              GROUP BY  f.DimCustomerId
            ) x
    GROUP BY x.DimCustomerId
          , x.Team;

    INSERT  INTO etl.CRMProcess_RecentCustData
            (
              SSID
            , MaxTransDate
            , Team
            )
    SELECT  b.SSID
          , a.maxtransdate
          , a.Team
    FROM    [#tmpTicketSales] a
    INNER JOIN dbo.vwDimCustomer_ModAcctId b ON b.DimCustomerId = a.DimCustomerId;





GO
