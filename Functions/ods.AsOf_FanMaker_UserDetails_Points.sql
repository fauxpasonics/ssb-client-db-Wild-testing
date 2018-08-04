SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_FanMaker_UserDetails_Points] (@AsOfDate)
*/
 
CREATE FUNCTION [ods].[AsOf_FanMaker_UserDetails_Points] (@AsOfDate DATETIME)
 
RETURNS @Results TABLE
(
[UserID] [nvarchar](100) NULL,
[PointsAvailable] [int] NULL,
[PointsSpent] [int] NULL,
[TotalPointsEarned] [int] NULL,
[SocialPoints] [int] NULL,
[TicketingPoints] [int] NULL,
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
SELECT [UserID],[PointsAvailable],[PointsSpent],[TotalPointsEarned],[SocialPoints],[TicketingPoints],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
    (
    SELECT [UserID],[PointsAvailable],[PointsSpent],[TotalPointsEarned],[SocialPoints],[TicketingPoints],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
    FROM [ods].[FanMaker_UserDetails_Points] t
    UNION ALL
    SELECT [UserID],[PointsAvailable],[PointsSpent],[TotalPointsEarned],[SocialPoints],[TicketingPoints],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
    FROM [ods].[Snapshot_FanMaker_UserDetails_Points]
    ) a
WHERE
    @AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
    AND [ETL_CreatedOn] <= @AsOfDate
 
RETURN
 
END
GO
