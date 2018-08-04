SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_FanMaker_UserDetails] (@AsOfDate)
*/
 
CREATE FUNCTION [ods].[AsOf_FanMaker_UserDetails] (@AsOfDate DATETIME)
 
RETURNS @Results TABLE
(
[UserID] [nvarchar](100) NULL,
[Status] [nvarchar](50) NULL,
[Success] [nvarchar](50) NULL,
[EmailDeliverable] [nvarchar](50) NULL,
[Fanfluence] [nvarchar](255) NULL,
[FirstName] [nvarchar](255) NULL,
[LastName] [nvarchar](255) NULL,
[ProfileURL] [nvarchar](500) NULL,
[CreatedAt] [datetime2](7) NULL,
[TCAcceptedAt] [datetime2](7) NULL,
[MembershipAssignment] [nvarchar](50) NULL,
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
SELECT [UserID],[Status],[Success],[EmailDeliverable],[Fanfluence],[FirstName],[LastName],[ProfileURL],[CreatedAt],[TCAcceptedAt],[MembershipAssignment],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
    (
    SELECT [UserID],[Status],[Success],[EmailDeliverable],[Fanfluence],[FirstName],[LastName],[ProfileURL],[CreatedAt],[TCAcceptedAt],[MembershipAssignment],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
    FROM [ods].[FanMaker_UserDetails] t
    UNION ALL
    SELECT [UserID],[Status],[Success],[EmailDeliverable],[Fanfluence],[FirstName],[LastName],[ProfileURL],[CreatedAt],[TCAcceptedAt],[MembershipAssignment],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
    FROM [ods].[Snapshot_FanMaker_UserDetails]
    ) a
WHERE
    @AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
    AND [ETL_CreatedOn] <= @AsOfDate
 
RETURN
 
END
GO
