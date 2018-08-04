SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
-- Get the status of your table 20 minutes ago...
DECLARE @AsOfDate DATETIME = (SELECT [etl].[ConvertToLocalTime](DATEADD(MINUTE,-20,GETDATE())))
SELECT * FROM [ods].[AsOf_FanMaker_UserDetails_Address] (@AsOfDate)
*/
 
CREATE FUNCTION [ods].[AsOf_FanMaker_UserDetails_Address] (@AsOfDate DATETIME)
 
RETURNS @Results TABLE
(
[UserID] [nvarchar](100) NULL,
[AddressID] [nvarchar](100) NULL,
[CustomerName] [nvarchar](500) NULL,
[Address1] [nvarchar](255) NULL,
[Address2] [nvarchar](255) NULL,
[City] [nvarchar](255) NULL,
[State] [nvarchar](255) NULL,
[ZipCode] [nvarchar](255) NULL,
[Phone] [nvarchar](255) NULL,
[Country] [nvarchar](255) NULL,
[IsPrimary] [nvarchar](40) NULL,
[FullAddress] [nvarchar](1000) NULL,
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
SELECT [UserID],[AddressID],[CustomerName],[Address1],[Address2],[City],[State],[ZipCode],[Phone],[Country],[IsPrimary],[FullAddress],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy]
FROM
    (
    SELECT [UserID],[AddressID],[CustomerName],[Address1],[Address2],[City],[State],[ZipCode],[Phone],[Country],[IsPrimary],[FullAddress],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],@EndDate [RecordEndDate]
    FROM [ods].[FanMaker_UserDetails_Address] t
    UNION ALL
    SELECT [UserID],[AddressID],[CustomerName],[Address1],[Address2],[City],[State],[ZipCode],[Phone],[Country],[IsPrimary],[FullAddress],[ETL_CreatedOn],[ETL_CreatedBy],[ETL_UpdatedOn],[ETL_UpdatedBy],[RecordEndDate]
    FROM [ods].[Snapshot_FanMaker_UserDetails_Address]
    ) a
WHERE
    @AsOfDate BETWEEN [ETL_UpdatedOn] AND [RecordEndDate]
    AND [ETL_CreatedOn] <= @AsOfDate
 
RETURN
 
END
GO
