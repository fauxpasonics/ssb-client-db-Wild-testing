SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Ismail Fuseini
-- Create date: 7/11/2016
-- =============================================
CREATE PROCEDURE [etl].[sp_MDM_SeasonTicketHolders]
AS
    BEGIN

        SET NOCOUNT ON;

        SELECT  *
        INTO    #tmpTrans
        FROM    etl.vwCRMProcess_SeasonTicketHolders;

        TRUNCATE TABLE etl.CRMProcess_SeasonTicketHolders;

        INSERT  INTO etl.CRMProcess_SeasonTicketHolders
        SELECT DISTINCT
                AccountId
              , CAST(SSID AS VARCHAR(50)) SSID
              , CAST(SeasonYear AS VARCHAR(50)) SeasonYear
              , CAST(SeasonYear + '-'
                + CONVERT(VARCHAR, ( CAST(SeasonYear AS INT) + 1 )) AS VARCHAR(50)) SeasonYr
              , 'Wild' Team
        FROM    #tmpTrans;


        DROP TABLE #tmpTrans;
    END;
GO
