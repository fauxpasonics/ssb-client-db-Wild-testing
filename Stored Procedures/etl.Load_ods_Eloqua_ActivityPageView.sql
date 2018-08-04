SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [etl].[Load_ods_Eloqua_ActivityPageView]
(
	@BatchId INT = 0,
	@Options NVARCHAR(MAX) = NULL
)
AS 

BEGIN
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Name:     svcETL
Date:     01/23/2016
Comments: Initial creation
*************************************************************************************/

DECLARE @RunTime DATETIME = GETDATE()

DECLARE @ExecutionId uniqueidentifier = newid();
DECLARE @ProcedureName NVARCHAR(255) = OBJECT_SCHEMA_NAME(@@PROCID) + '.' + OBJECT_NAME(@@PROCID);
DECLARE @SrcRowCount INT = ISNULL((SELECT CONVERT(VARCHAR, COUNT(*)) FROM src.Eloqua_ActivityPageView),'0');	
DECLARE @SrcDataSize NVARCHAR(255) = '0'

BEGIN TRY 

PRINT 'Execution Id: ' + CONVERT(NVARCHAR(100),@ExecutionId)

SELECT *
INTO #SrcData
FROM (
	SELECT CAST(NULL AS BINARY(32)) ETL_DeltaHashKey, ID, CreatedAt, Type, ContactId, IPAddress, Url, CampaignId, ReferrerUrl, VisitorId, VisitorExternalId, WebVisitId, IsWebTrackingOptedIn,
	ROW_NUMBER() OVER (PARTITION BY ID ORDER BY ETL_ID) RowNum
	FROM src.Eloqua_ActivityPageView) A
WHERE RowNum = 1;

UPDATE #SrcData
SET ETL_DeltaHashKey = HASHBYTES('sha2_256', ISNULL(RTRIM(CampaignId),'DBNULL_TEXT') + ISNULL(RTRIM(ContactId),'DBNULL_TEXT') + ISNULL(RTRIM(CONVERT(varchar(25),CreatedAt)),'DBNULL_DATETIME') + ISNULL(RTRIM(ID),'DBNULL_TEXT') + ISNULL(RTRIM(IPAddress),'DBNULL_TEXT') + ISNULL(RTRIM(CONVERT(varchar(10),IsWebTrackingOptedIn)),'DBNULL_BIT') + ISNULL(RTRIM(ReferrerUrl),'DBNULL_TEXT') + ISNULL(RTRIM(Type),'DBNULL_TEXT') + ISNULL(RTRIM(Url),'DBNULL_TEXT') + ISNULL(RTRIM(VisitorExternalId),'DBNULL_TEXT') + ISNULL(RTRIM(VisitorId),'DBNULL_TEXT') + ISNULL(RTRIM(WebVisitId),'DBNULL_TEXT'))


CREATE NONCLUSTERED INDEX IDX_Load_Key ON #SrcData (ID)
CREATE NONCLUSTERED INDEX IDX_ETL_DeltaHashKey ON #SrcData (ETL_DeltaHashKey)



MERGE ods.Eloqua_ActivityPageView AS myTarget

USING (
	SELECT * FROM #SrcData
) AS mySource
    
	ON myTarget.ID = mySource.ID

WHEN MATCHED AND (
     ISNULL(mySource.ETL_DeltaHashKey,-1) <> ISNULL(myTarget.ETL_DeltaHashKey, -1)
	 
)
THEN UPDATE SET
      myTarget.[ETL_UpdatedDate] = @RunTime
     ,myTarget.[ETL_DeltaHashKey] = mySource.[ETL_DeltaHashKey]
     ,myTarget.[ID] = mySource.[ID]
     ,myTarget.[CreatedAt] = mySource.[CreatedAt]
     ,myTarget.[Type] = mySource.[Type]
     ,myTarget.[ContactId] = mySource.[ContactId]
     ,myTarget.[IPAddress] = mySource.[IPAddress]
     ,myTarget.[Url] = mySource.[Url]
     ,myTarget.[CampaignId] = mySource.[CampaignId]
     ,myTarget.[ReferrerUrl] = mySource.[ReferrerUrl]
     ,myTarget.[VisitorId] = mySource.[VisitorId]
     ,myTarget.[VisitorExternalId] = mySource.[VisitorExternalId]
     ,myTarget.[WebVisitId] = mySource.[WebVisitId]
     ,myTarget.[IsWebTrackingOptedIn] = mySource.[IsWebTrackingOptedIn]
     
WHEN NOT MATCHED BY TARGET
THEN INSERT
     ([ETL_CreatedDate]
     ,[ETL_UpdatedDate]
     ,[ETL_IsDeleted]
     ,[ETL_DeletedDate]
     ,[ETL_DeltaHashKey]
     ,[ID]
     ,[CreatedAt]
     ,[Type]
     ,[ContactId]
     ,[IPAddress]
     ,[Url]
     ,[CampaignId]
     ,[ReferrerUrl]
     ,[VisitorId]
     ,[VisitorExternalId]
     ,[WebVisitId]
     ,[IsWebTrackingOptedIn]
     )
VALUES
     (@RunTime --ETL_CreatedDate
     ,@RunTime --ETL_UpdateddDate
     ,0 --ETL_DeletedDate
     ,NULL --ETL_DeletedDate
     ,mySource.[ETL_DeltaHashKey]
     ,mySource.[ID]
     ,mySource.[CreatedAt]
     ,mySource.[Type]
     ,mySource.[ContactId]
     ,mySource.[IPAddress]
     ,mySource.[Url]
     ,mySource.[CampaignId]
     ,mySource.[ReferrerUrl]
     ,mySource.[VisitorId]
     ,mySource.[VisitorExternalId]
     ,mySource.[WebVisitId]
     ,mySource.[IsWebTrackingOptedIn]
     )
;



DECLARE @MergeInsertRowCount INT = ISNULL((SELECT CONVERT(VARCHAR, COUNT(*)) FROM ods.Eloqua_ActivityPageView WHERE ETL_CreatedDate >= @RunTime AND ETL_UpdatedDate = ETL_CreatedDate),'0');	
DECLARE @MergeUpdateRowCount INT = ISNULL((SELECT CONVERT(VARCHAR, COUNT(*)) FROM ods.Eloqua_ActivityPageView WHERE ETL_UpdatedDate >= @RunTime AND ETL_UpdatedDate > ETL_CreatedDate),'0');	


END TRY 
BEGIN CATCH 

	DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
	DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
	DECLARE @ErrorState INT = ERROR_STATE();
			
	PRINT @ErrorMessage

	RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)

END CATCH


END





GO
