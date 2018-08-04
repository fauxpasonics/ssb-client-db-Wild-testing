SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_FanMaker_UserDetails_Spend] (@AsOfDate)
*/
 
CREATE FUNCTION [ods].[AsOf_FanMaker_UserDetails_Spend] (@AsOfDate DATETIME)
 
RETURNS @Results TABLE
(
[UserID] [nvarchar](100) NULL,
[Ticketing_Spend] [decimal](18, 6) NULL,
[POS_Points] [int] NULL,
[POS_Spend] [decimal](18, 6) NULL,
[ETL_CreatedOn] [datetime] NOT NULL,
[ETL_CreatedBy] NVARCHAR(400) NOT NULL,
[ETL_UpdatedOn] [datetime] NOT NULL,
[ETL_UpdatedBy] NVARCHAR(400) NOT NULL
)
 
AS
BEGIN
 
DECLARE @EndDate DATETIME = (SELECT [etl].[ConvertToLocalTime](CAST(GETDATE() AS datetime2(0))))
SET @AsOfDate = (SELECT CAST(@AsOfDate AS datetime2(0)))
 
INSERT INTO @Results
SELECT [UserID],[Ticketing_Spend],[POS_Points],[POS_Spend],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
    (
    SELECT [UserID],[Ticketing_Spend],[POS_Points],[POS_Spend],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
    FROM [ods].[FanMaker_UserDetails_Spend] t
    UNION ALL
    SELECT [UserID],[Ticketing_Spend],[POS_Points],[POS_Spend],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
    FROM [ods].[Snapshot_FanMaker_UserDetails_Spend]
    ) a
WHERE
    @AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
    AND [ETL_CreatedOn] <= @AsOfDate
 
RETURN
 
END
GO
