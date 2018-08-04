SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [etl].[Load_ods_Eloqua_Contact]
(
	@BatchId NVARCHAR(50) = NULL,
	@Options NVARCHAR(MAX) = NULL
)
AS 

BEGIN
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Name:     SSBCLOUD\dhorstman
Date:     03/02/2016
Comments: Initial creation
*************************************************************************************/

SET @BatchId = ISNULL(@BatchId, CONVERT(NVARCHAR(50), NEWID()))

DECLARE @RunTime DATETIME = GETDATE()

DECLARE @ExecutionId uniqueidentifier = newid();
DECLARE @ProcedureName nvarchar(255) = OBJECT_SCHEMA_NAME(@@PROCID) + '.' + OBJECT_NAME(@@PROCID);
DECLARE @SrcRowCount int = ISNULL((SELECT CONVERT(varchar, COUNT(*)) FROM src.Eloqua_Contact),'0');	
DECLARE @SrcDataSize NVARCHAR(255) = '0'

/*Load Options into a temp table*/
SELECT Col1 AS OptionKey, Col2 as OptionValue INTO #Options FROM [dbo].[SplitMultiColumn](@Options, '=', ';')

DECLARE @DisableDelete nvarchar(5) = ISNULL((SELECT OptionValue FROM #Options WHERE OptionKey = 'DisableDelete'),'true')

BEGIN TRY 

PRINT 'Execution Id: ' + CONVERT(NVARCHAR(100),@ExecutionId)

EXEC etl.LogEventRecordDB @Batchid, 'Info', @ProcedureName, 'Merge Load', 'Procedure Processing', 'Start', @ExecutionId
EXEC etl.LogEventRecordDB @Batchid, 'Info', @ProcedureName, 'Merge Load', 'Src Row Count', @SrcRowCount, @ExecutionId
EXEC etl.LogEventRecordDB @Batchid, 'Info', @ProcedureName, 'Merge Load', 'Src DataSize', @SrcDataSize, @ExecutionId

SELECT CAST(NULL AS BINARY(32)) ETL_Sync_DeltaHashKey
,  ID, Name, AccountName, BouncebackDate, IsBounceback, IsSubscribed, PostalCode, Province, SubscriptionDate, UnsubscriptionDate, CreatedAt, CreatedBy, AccessedAt, CurrentStatus, Depth, UpdatedAt, UpdatedBy, EmailAddress, FirstName, LastName, Company, Address1, Address2, Address3, City, Country, MobilePhone, BusinessPhone, Fax, Title, SalesPerson, C_EmailDisplayName, C_State_Prov, C_Zip_Postal, C_Salutation, C_SFDCContactID, C_SFDCLeadID, C_DateCreated, C_DateModified, ContactIDExt, C_SFDCAccountID, C_LastModifiedByExtIntegrateSystem, C_SFDCLastCampaignID, C_SFDCLastCampaignStatus, C_Company_Revenue1, C_SFDC_EmailOptOut1, C_Lead_Source___Most_Recent1, C_Lead_Source___Original1, C_Industry1, C_Annual_Revenue1, C_Lead_Status1, C_Job_Role1, C_LS___High_Value_Website_Content1, C_Lead_Score_Date___Most_Recent1, C_Integrated_Marketing_and_Sales_Funnel_Stage, C_Product_Solution_of_Interest1, C_elqPURLName1, C_Lead_Rating___Combined1, C_EmailAddressDomain, C_FirstAndLastName, C_Company_Size1, C_Lead_Score___Last_High_Touch_Event_Date1, C_Lead_Rating___Explicit1, C_Lead_Rating___Implicit1, C_Lead_Score___Explicit1, C_Lead_Score___Implicit1, C_Lead_Score_Date___Profile___Most_Recent1, C_Territory, C_MD5HashedEmailAddress, C_SHA256HashedEmailAddress, C_MD5HashedBusPhone, C_SHA256HashedBusPhone, C_MD5HashedMobilePhone, C_SHA256HashedMobilePhone, C_Lead_Score, C_ElqPURLName, C_MSCRMContactID, C_MSCRMLeadID, C_MSCRMAccountID, C_MSCRMLastCampaignID, C_MSCRMLastCampaignName, C_MSCRMLastCampaignStatus, C_LastMSCRMCampaignResponseID, C_MSCRM_EmailOptOut, C_MSCRM_LeadRating, C_Account_Numbers1, C_Miles_From_Facility1, C_Birthdate1, C_Do_not_allow_Bulk_Emails1, C_Email_Address_21, C_Email_Address_31, C_My_Wild_Account_PIN1, C_Propensity_Alt_Rock1, C_Propensity_Broadway1, C_Propensity_Country1, C_Propensity_Family_Shows1, C_Propensity_Hard_Rock1, C_Propensity_Hockey1, C_Propensity_Rap_or_Hip_Hop1, C_Propensity_Rock_or_Pop1, C_Serviceperson1, C_Personicx_Group1, C_Personicx_Cluster1, C_Business_Main_Phone1, C_SMS1, C_Direct_Phone1, C_Home_Phone1, C_accountid_name1
INTO #SrcData
FROM (
	SELECT ID, Name, AccountName, BouncebackDate, IsBounceback, IsSubscribed, PostalCode, Province, SubscriptionDate, UnsubscriptionDate, CreatedAt, CreatedBy, AccessedAt, CurrentStatus, Depth, UpdatedAt, UpdatedBy, EmailAddress, FirstName, LastName, Company, Address1, Address2, Address3, City, Country, MobilePhone, BusinessPhone, Fax, Title, SalesPerson, C_EmailDisplayName, C_State_Prov, C_Zip_Postal, C_Salutation, C_SFDCContactID, C_SFDCLeadID, C_DateCreated, C_DateModified, ContactIDExt, C_SFDCAccountID, C_LastModifiedByExtIntegrateSystem, C_SFDCLastCampaignID, C_SFDCLastCampaignStatus, C_Company_Revenue1, C_SFDC_EmailOptOut1, C_Lead_Source___Most_Recent1, C_Lead_Source___Original1, C_Industry1, C_Annual_Revenue1, C_Lead_Status1, C_Job_Role1, C_LS___High_Value_Website_Content1, C_Lead_Score_Date___Most_Recent1, C_Integrated_Marketing_and_Sales_Funnel_Stage, C_Product_Solution_of_Interest1, C_elqPURLName1, C_Lead_Rating___Combined1, C_EmailAddressDomain, C_FirstAndLastName, C_Company_Size1, C_Lead_Score___Last_High_Touch_Event_Date1, C_Lead_Rating___Explicit1, C_Lead_Rating___Implicit1, C_Lead_Score___Explicit1, C_Lead_Score___Implicit1, C_Lead_Score_Date___Profile___Most_Recent1, C_Territory, C_MD5HashedEmailAddress, C_SHA256HashedEmailAddress, C_MD5HashedBusPhone, C_SHA256HashedBusPhone, C_MD5HashedMobilePhone, C_SHA256HashedMobilePhone, C_Lead_Score, C_ElqPURLName, C_MSCRMContactID, C_MSCRMLeadID, C_MSCRMAccountID, C_MSCRMLastCampaignID, C_MSCRMLastCampaignName, C_MSCRMLastCampaignStatus, C_LastMSCRMCampaignResponseID, C_MSCRM_EmailOptOut, C_MSCRM_LeadRating, C_Account_Numbers1, C_Miles_From_Facility1, C_Birthdate1, C_Do_not_allow_Bulk_Emails1, C_Email_Address_21, C_Email_Address_31, C_My_Wild_Account_PIN1, C_Propensity_Alt_Rock1, C_Propensity_Broadway1, C_Propensity_Country1, C_Propensity_Family_Shows1, C_Propensity_Hard_Rock1, C_Propensity_Hockey1, C_Propensity_Rap_or_Hip_Hop1, C_Propensity_Rock_or_Pop1, C_Serviceperson1, C_Personicx_Group1, C_Personicx_Cluster1, C_Business_Main_Phone1, C_SMS1, C_Direct_Phone1, C_Home_Phone1, C_accountid_name1
	, ROW_NUMBER() OVER(PARTITION BY ID ORDER BY ETL_ID) RowRank
	FROM src.Eloqua_Contact
) a
WHERE RowRank = 1

EXEC etl.LogEventRecordDB @Batchid, 'Info', @ProcedureName, 'Merge Load', 'Src Table Setup', 'Temp Table Loaded', @ExecutionId

UPDATE #SrcData
SET ETL_Sync_DeltaHashKey = HASHBYTES('sha2_256', ISNULL(RTRIM(CONVERT(varchar(25),AccessedAt)),'DBNULL_DATETIME') + ISNULL(RTRIM(AccountName),'DBNULL_TEXT') + ISNULL(RTRIM(Address1),'DBNULL_TEXT') + ISNULL(RTRIM(Address2),'DBNULL_TEXT') + ISNULL(RTRIM(Address3),'DBNULL_TEXT') + ISNULL(RTRIM(BouncebackDate),'DBNULL_TEXT') + ISNULL(RTRIM(BusinessPhone),'DBNULL_TEXT') + ISNULL(RTRIM(C_Account_Numbers1),'DBNULL_TEXT') + ISNULL(RTRIM(C_accountid_name1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Annual_Revenue1),'DBNULL_TEXT') + ISNULL(RTRIM(CONVERT(varchar(10),C_Birthdate1,112)),'DBNULL_DATE') + ISNULL(RTRIM(C_Business_Main_Phone1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Company_Revenue1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Company_Size1),'DBNULL_TEXT') + ISNULL(RTRIM(CONVERT(varchar(10),C_DateCreated,112)),'DBNULL_DATE') + ISNULL(RTRIM(CONVERT(varchar(10),C_DateModified,112)),'DBNULL_DATE') + ISNULL(RTRIM(C_Direct_Phone1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Do_not_allow_Bulk_Emails1),'DBNULL_TEXT') + ISNULL(RTRIM(C_ElqPURLName),'DBNULL_TEXT') + ISNULL(RTRIM(C_elqPURLName1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Email_Address_21),'DBNULL_TEXT') + ISNULL(RTRIM(C_Email_Address_31),'DBNULL_TEXT') + ISNULL(RTRIM(C_EmailAddressDomain),'DBNULL_TEXT') + ISNULL(RTRIM(C_EmailDisplayName),'DBNULL_TEXT') + ISNULL(RTRIM(C_FirstAndLastName),'DBNULL_TEXT') + ISNULL(RTRIM(C_Home_Phone1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Industry1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Integrated_Marketing_and_Sales_Funnel_Stage),'DBNULL_TEXT') + ISNULL(RTRIM(C_Job_Role1),'DBNULL_TEXT') + ISNULL(RTRIM(CONVERT(varchar(10),C_LastModifiedByExtIntegrateSystem,112)),'DBNULL_DATE') + ISNULL(RTRIM(C_LastMSCRMCampaignResponseID),'DBNULL_TEXT') + ISNULL(RTRIM(C_Lead_Rating___Combined1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Lead_Rating___Explicit1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Lead_Rating___Implicit1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Lead_Score),'DBNULL_TEXT') + ISNULL(RTRIM(CONVERT(varchar(25),C_Lead_Score___Explicit1)),'DBNULL_NUMBER') + ISNULL(RTRIM(CONVERT(varchar(25),C_Lead_Score___Implicit1)),'DBNULL_NUMBER') + ISNULL(RTRIM(CONVERT(varchar(10),C_Lead_Score___Last_High_Touch_Event_Date1,112)),'DBNULL_DATE') + ISNULL(RTRIM(CONVERT(varchar(10),C_Lead_Score_Date___Most_Recent1,112)),'DBNULL_DATE') + ISNULL(RTRIM(CONVERT(varchar(10),C_Lead_Score_Date___Profile___Most_Recent1,112)),'DBNULL_DATE') + ISNULL(RTRIM(C_Lead_Source___Most_Recent1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Lead_Source___Original1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Lead_Status1),'DBNULL_TEXT') + ISNULL(RTRIM(CONVERT(varchar(25),C_LS___High_Value_Website_Content1)),'DBNULL_NUMBER') + ISNULL(RTRIM(C_MD5HashedBusPhone),'DBNULL_TEXT') + ISNULL(RTRIM(C_MD5HashedEmailAddress),'DBNULL_TEXT') + ISNULL(RTRIM(C_MD5HashedMobilePhone),'DBNULL_TEXT') + ISNULL(RTRIM(CONVERT(varchar(25),C_Miles_From_Facility1)),'DBNULL_NUMBER') + ISNULL(RTRIM(C_MSCRM_EmailOptOut),'DBNULL_TEXT') + ISNULL(RTRIM(C_MSCRM_LeadRating),'DBNULL_TEXT') + ISNULL(RTRIM(C_MSCRMAccountID),'DBNULL_TEXT') + ISNULL(RTRIM(C_MSCRMContactID),'DBNULL_TEXT') + ISNULL(RTRIM(C_MSCRMLastCampaignID),'DBNULL_TEXT') + ISNULL(RTRIM(C_MSCRMLastCampaignName),'DBNULL_TEXT') + ISNULL(RTRIM(C_MSCRMLastCampaignStatus),'DBNULL_TEXT') + ISNULL(RTRIM(C_MSCRMLeadID),'DBNULL_TEXT') + ISNULL(RTRIM(C_My_Wild_Account_PIN1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Personicx_Cluster1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Personicx_Group1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Product_Solution_of_Interest1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Propensity_Alt_Rock1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Propensity_Broadway1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Propensity_Country1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Propensity_Family_Shows1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Propensity_Hard_Rock1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Propensity_Hockey1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Propensity_Rap_or_Hip_Hop1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Propensity_Rock_or_Pop1),'DBNULL_TEXT') + ISNULL(RTRIM(C_Salutation),'DBNULL_TEXT') + ISNULL(RTRIM(C_Serviceperson1),'DBNULL_TEXT') + ISNULL(RTRIM(C_SFDC_EmailOptOut1),'DBNULL_TEXT') + ISNULL(RTRIM(C_SFDCAccountID),'DBNULL_TEXT') + ISNULL(RTRIM(C_SFDCContactID),'DBNULL_TEXT') + ISNULL(RTRIM(C_SFDCLastCampaignID),'DBNULL_TEXT') + ISNULL(RTRIM(C_SFDCLastCampaignStatus),'DBNULL_TEXT') + ISNULL(RTRIM(C_SFDCLeadID),'DBNULL_TEXT') + ISNULL(RTRIM(C_SHA256HashedBusPhone),'DBNULL_TEXT') + ISNULL(RTRIM(C_SHA256HashedEmailAddress),'DBNULL_TEXT') + ISNULL(RTRIM(C_SHA256HashedMobilePhone),'DBNULL_TEXT') + ISNULL(RTRIM(C_SMS1),'DBNULL_TEXT') + ISNULL(RTRIM(C_State_Prov),'DBNULL_TEXT') + ISNULL(RTRIM(C_Territory),'DBNULL_TEXT') + ISNULL(RTRIM(C_Zip_Postal),'DBNULL_TEXT') + ISNULL(RTRIM(City),'DBNULL_TEXT') + ISNULL(RTRIM(Company),'DBNULL_TEXT') + ISNULL(RTRIM(ContactIDExt),'DBNULL_TEXT') + ISNULL(RTRIM(Country),'DBNULL_TEXT') + ISNULL(RTRIM(CONVERT(varchar(25),CreatedAt)),'DBNULL_DATETIME') + ISNULL(RTRIM(CreatedBy),'DBNULL_TEXT') + ISNULL(RTRIM(CurrentStatus),'DBNULL_TEXT') + ISNULL(RTRIM(Depth),'DBNULL_TEXT') + ISNULL(RTRIM(EmailAddress),'DBNULL_TEXT') + ISNULL(RTRIM(Fax),'DBNULL_TEXT') + ISNULL(RTRIM(FirstName),'DBNULL_TEXT') + ISNULL(RTRIM(ID),'DBNULL_TEXT') + ISNULL(RTRIM(CONVERT(varchar(10),IsBounceback)),'DBNULL_BIT') + ISNULL(RTRIM(CONVERT(varchar(10),IsSubscribed)),'DBNULL_BIT') + ISNULL(RTRIM(LastName),'DBNULL_TEXT') + ISNULL(RTRIM(MobilePhone),'DBNULL_TEXT') + ISNULL(RTRIM(Name),'DBNULL_TEXT') + ISNULL(RTRIM(PostalCode),'DBNULL_TEXT') + ISNULL(RTRIM(Province),'DBNULL_TEXT') + ISNULL(RTRIM(SalesPerson),'DBNULL_TEXT') + ISNULL(RTRIM(CONVERT(varchar(25),SubscriptionDate)),'DBNULL_DATETIME') + ISNULL(RTRIM(Title),'DBNULL_TEXT') + ISNULL(RTRIM(CONVERT(varchar(25),UnsubscriptionDate)),'DBNULL_DATETIME') + ISNULL(RTRIM(CONVERT(varchar(25),UpdatedAt)),'DBNULL_DATETIME') + ISNULL(RTRIM(UpdatedBy),'DBNULL_TEXT'))

EXEC etl.LogEventRecordDB @Batchid, 'Info', @ProcedureName, 'Merge Load', 'Src Table Setup', 'ETL_Sync_DeltaHashKey Set', @ExecutionId

CREATE NONCLUSTERED INDEX IDX_Load_Key ON #SrcData (ID)
CREATE NONCLUSTERED INDEX IDX_ETL_Sync_DeltaHashKey ON #SrcData (ETL_Sync_DeltaHashKey)

EXEC etl.LogEventRecordDB @Batchid, 'Info', @ProcedureName, 'Merge Load', 'Src Table Setup', 'Temp Table Indexes Created', @ExecutionId

EXEC etl.LogEventRecordDB @Batchid, 'Info', @ProcedureName, 'Merge Load', 'Merge Statement Execution', 'Start', @ExecutionId
	MERGE ods.Eloqua_Contact AS myTarget

USING (
	SELECT * FROM #SrcData
) AS mySource
    
	ON myTarget.ID = mySource.ID

WHEN MATCHED AND (
     ISNULL(mySource.ETL_Sync_DeltaHashKey,-1) <> ISNULL(myTarget.ETL_DeltaHashKey, -1)
	 
)
THEN UPDATE SET
      myTarget.[ETL_UpdatedDate] = @RunTime
     ,myTarget.[ETL_IsDeleted] = 0
     ,myTarget.[ETL_DeletedDate] = NULL
     ,myTarget.[ETL_DeltaHashKey] = mySource.[ETL_Sync_DeltaHashKey]
     ,myTarget.[Name] = mySource.[Name]
     ,myTarget.[AccountName] = mySource.[AccountName]
     ,myTarget.[BouncebackDate] = mySource.[BouncebackDate]
     ,myTarget.[IsBounceback] = mySource.[IsBounceback]
     ,myTarget.[IsSubscribed] = mySource.[IsSubscribed]
     ,myTarget.[PostalCode] = mySource.[PostalCode]
     ,myTarget.[Province] = mySource.[Province]
     ,myTarget.[SubscriptionDate] = mySource.[SubscriptionDate]
     ,myTarget.[UnsubscriptionDate] = mySource.[UnsubscriptionDate]
     ,myTarget.[CreatedAt] = mySource.[CreatedAt]
     ,myTarget.[CreatedBy] = mySource.[CreatedBy]
     ,myTarget.[AccessedAt] = mySource.[AccessedAt]
     ,myTarget.[CurrentStatus] = mySource.[CurrentStatus]
     ,myTarget.[Depth] = mySource.[Depth]
     ,myTarget.[UpdatedAt] = mySource.[UpdatedAt]
     ,myTarget.[UpdatedBy] = mySource.[UpdatedBy]
     ,myTarget.[EmailAddress] = mySource.[EmailAddress]
     ,myTarget.[FirstName] = mySource.[FirstName]
     ,myTarget.[LastName] = mySource.[LastName]
     ,myTarget.[Company] = mySource.[Company]
     ,myTarget.[Address1] = mySource.[Address1]
     ,myTarget.[Address2] = mySource.[Address2]
     ,myTarget.[Address3] = mySource.[Address3]
     ,myTarget.[City] = mySource.[City]
     ,myTarget.[Country] = mySource.[Country]
     ,myTarget.[MobilePhone] = mySource.[MobilePhone]
     ,myTarget.[BusinessPhone] = mySource.[BusinessPhone]
     ,myTarget.[Fax] = mySource.[Fax]
     ,myTarget.[Title] = mySource.[Title]
     ,myTarget.[SalesPerson] = mySource.[SalesPerson]
     ,myTarget.[C_EmailDisplayName] = mySource.[C_EmailDisplayName]
     ,myTarget.[C_State_Prov] = mySource.[C_State_Prov]
     ,myTarget.[C_Zip_Postal] = mySource.[C_Zip_Postal]
     ,myTarget.[C_Salutation] = mySource.[C_Salutation]
     ,myTarget.[C_SFDCContactID] = mySource.[C_SFDCContactID]
     ,myTarget.[C_SFDCLeadID] = mySource.[C_SFDCLeadID]
     ,myTarget.[C_DateCreated] = mySource.[C_DateCreated]
     ,myTarget.[C_DateModified] = mySource.[C_DateModified]
     ,myTarget.[ContactIDExt] = mySource.[ContactIDExt]
     ,myTarget.[C_SFDCAccountID] = mySource.[C_SFDCAccountID]
     ,myTarget.[C_LastModifiedByExtIntegrateSystem] = mySource.[C_LastModifiedByExtIntegrateSystem]
     ,myTarget.[C_SFDCLastCampaignID] = mySource.[C_SFDCLastCampaignID]
     ,myTarget.[C_SFDCLastCampaignStatus] = mySource.[C_SFDCLastCampaignStatus]
     ,myTarget.[C_Company_Revenue1] = mySource.[C_Company_Revenue1]
     ,myTarget.[C_SFDC_EmailOptOut1] = mySource.[C_SFDC_EmailOptOut1]
     ,myTarget.[C_Lead_Source___Most_Recent1] = mySource.[C_Lead_Source___Most_Recent1]
     ,myTarget.[C_Lead_Source___Original1] = mySource.[C_Lead_Source___Original1]
     ,myTarget.[C_Industry1] = mySource.[C_Industry1]
     ,myTarget.[C_Annual_Revenue1] = mySource.[C_Annual_Revenue1]
     ,myTarget.[C_Lead_Status1] = mySource.[C_Lead_Status1]
     ,myTarget.[C_Job_Role1] = mySource.[C_Job_Role1]
     ,myTarget.[C_LS___High_Value_Website_Content1] = mySource.[C_LS___High_Value_Website_Content1]
     ,myTarget.[C_Lead_Score_Date___Most_Recent1] = mySource.[C_Lead_Score_Date___Most_Recent1]
     ,myTarget.[C_Integrated_Marketing_and_Sales_Funnel_Stage] = mySource.[C_Integrated_Marketing_and_Sales_Funnel_Stage]
     ,myTarget.[C_Product_Solution_of_Interest1] = mySource.[C_Product_Solution_of_Interest1]
     ,myTarget.[C_elqPURLName1] = mySource.[C_elqPURLName1]
     ,myTarget.[C_Lead_Rating___Combined1] = mySource.[C_Lead_Rating___Combined1]
     ,myTarget.[C_EmailAddressDomain] = mySource.[C_EmailAddressDomain]
     ,myTarget.[C_FirstAndLastName] = mySource.[C_FirstAndLastName]
     ,myTarget.[C_Company_Size1] = mySource.[C_Company_Size1]
     ,myTarget.[C_Lead_Score___Last_High_Touch_Event_Date1] = mySource.[C_Lead_Score___Last_High_Touch_Event_Date1]
     ,myTarget.[C_Lead_Rating___Explicit1] = mySource.[C_Lead_Rating___Explicit1]
     ,myTarget.[C_Lead_Rating___Implicit1] = mySource.[C_Lead_Rating___Implicit1]
     ,myTarget.[C_Lead_Score___Explicit1] = mySource.[C_Lead_Score___Explicit1]
     ,myTarget.[C_Lead_Score___Implicit1] = mySource.[C_Lead_Score___Implicit1]
     ,myTarget.[C_Lead_Score_Date___Profile___Most_Recent1] = mySource.[C_Lead_Score_Date___Profile___Most_Recent1]
     ,myTarget.[C_Territory] = mySource.[C_Territory]
     ,myTarget.[C_MD5HashedEmailAddress] = mySource.[C_MD5HashedEmailAddress]
     ,myTarget.[C_SHA256HashedEmailAddress] = mySource.[C_SHA256HashedEmailAddress]
     ,myTarget.[C_MD5HashedBusPhone] = mySource.[C_MD5HashedBusPhone]
     ,myTarget.[C_SHA256HashedBusPhone] = mySource.[C_SHA256HashedBusPhone]
     ,myTarget.[C_MD5HashedMobilePhone] = mySource.[C_MD5HashedMobilePhone]
     ,myTarget.[C_SHA256HashedMobilePhone] = mySource.[C_SHA256HashedMobilePhone]
     ,myTarget.[C_Lead_Score] = mySource.[C_Lead_Score]
     ,myTarget.[C_ElqPURLName] = mySource.[C_ElqPURLName]
     ,myTarget.[C_MSCRMContactID] = mySource.[C_MSCRMContactID]
     ,myTarget.[C_MSCRMLeadID] = mySource.[C_MSCRMLeadID]
     ,myTarget.[C_MSCRMAccountID] = mySource.[C_MSCRMAccountID]
     ,myTarget.[C_MSCRMLastCampaignID] = mySource.[C_MSCRMLastCampaignID]
     ,myTarget.[C_MSCRMLastCampaignName] = mySource.[C_MSCRMLastCampaignName]
     ,myTarget.[C_MSCRMLastCampaignStatus] = mySource.[C_MSCRMLastCampaignStatus]
     ,myTarget.[C_LastMSCRMCampaignResponseID] = mySource.[C_LastMSCRMCampaignResponseID]
     ,myTarget.[C_MSCRM_EmailOptOut] = mySource.[C_MSCRM_EmailOptOut]
     ,myTarget.[C_MSCRM_LeadRating] = mySource.[C_MSCRM_LeadRating]
     ,myTarget.[C_Account_Numbers1] = mySource.[C_Account_Numbers1]
     ,myTarget.[C_Miles_From_Facility1] = mySource.[C_Miles_From_Facility1]
     ,myTarget.[C_Birthdate1] = mySource.[C_Birthdate1]
     ,myTarget.[C_Do_not_allow_Bulk_Emails1] = mySource.[C_Do_not_allow_Bulk_Emails1]
     ,myTarget.[C_Email_Address_21] = mySource.[C_Email_Address_21]
     ,myTarget.[C_Email_Address_31] = mySource.[C_Email_Address_31]
     ,myTarget.[C_My_Wild_Account_PIN1] = mySource.[C_My_Wild_Account_PIN1]
     ,myTarget.[C_Propensity_Alt_Rock1] = mySource.[C_Propensity_Alt_Rock1]
     ,myTarget.[C_Propensity_Broadway1] = mySource.[C_Propensity_Broadway1]
     ,myTarget.[C_Propensity_Country1] = mySource.[C_Propensity_Country1]
     ,myTarget.[C_Propensity_Family_Shows1] = mySource.[C_Propensity_Family_Shows1]
     ,myTarget.[C_Propensity_Hard_Rock1] = mySource.[C_Propensity_Hard_Rock1]
     ,myTarget.[C_Propensity_Hockey1] = mySource.[C_Propensity_Hockey1]
     ,myTarget.[C_Propensity_Rap_or_Hip_Hop1] = mySource.[C_Propensity_Rap_or_Hip_Hop1]
     ,myTarget.[C_Propensity_Rock_or_Pop1] = mySource.[C_Propensity_Rock_or_Pop1]
     ,myTarget.[C_Serviceperson1] = mySource.[C_Serviceperson1]
     ,myTarget.[C_Personicx_Group1] = mySource.[C_Personicx_Group1]
     ,myTarget.[C_Personicx_Cluster1] = mySource.[C_Personicx_Cluster1]
     ,myTarget.[C_Business_Main_Phone1] = mySource.[C_Business_Main_Phone1]
     ,myTarget.[C_SMS1] = mySource.[C_SMS1]
     ,myTarget.[C_Direct_Phone1] = mySource.[C_Direct_Phone1]
     ,myTarget.[C_Home_Phone1] = mySource.[C_Home_Phone1]
     ,myTarget.[C_accountid_name1] = mySource.[C_accountid_name1]
     

--WHEN NOT MATCHED BY SOURCE AND @DisableDelete = 'false' THEN DELETE
WHEN NOT MATCHED BY TARGET
THEN INSERT
     ([ETL_CreatedDate]
     ,[ETL_UpdatedDate]
     ,[ETL_IsDeleted]
     ,[ETL_DeletedDate]
     ,[ETL_DeltaHashKey]
     ,[ID]
     ,[Name]
     ,[AccountName]
     ,[BouncebackDate]
     ,[IsBounceback]
     ,[IsSubscribed]
     ,[PostalCode]
     ,[Province]
     ,[SubscriptionDate]
     ,[UnsubscriptionDate]
     ,[CreatedAt]
     ,[CreatedBy]
     ,[AccessedAt]
     ,[CurrentStatus]
     ,[Depth]
     ,[UpdatedAt]
     ,[UpdatedBy]
     ,[EmailAddress]
     ,[FirstName]
     ,[LastName]
     ,[Company]
     ,[Address1]
     ,[Address2]
     ,[Address3]
     ,[City]
     ,[Country]
     ,[MobilePhone]
     ,[BusinessPhone]
     ,[Fax]
     ,[Title]
     ,[SalesPerson]
     ,[C_EmailDisplayName]
     ,[C_State_Prov]
     ,[C_Zip_Postal]
     ,[C_Salutation]
     ,[C_SFDCContactID]
     ,[C_SFDCLeadID]
     ,[C_DateCreated]
     ,[C_DateModified]
     ,[ContactIDExt]
     ,[C_SFDCAccountID]
     ,[C_LastModifiedByExtIntegrateSystem]
     ,[C_SFDCLastCampaignID]
     ,[C_SFDCLastCampaignStatus]
     ,[C_Company_Revenue1]
     ,[C_SFDC_EmailOptOut1]
     ,[C_Lead_Source___Most_Recent1]
     ,[C_Lead_Source___Original1]
     ,[C_Industry1]
     ,[C_Annual_Revenue1]
     ,[C_Lead_Status1]
     ,[C_Job_Role1]
     ,[C_LS___High_Value_Website_Content1]
     ,[C_Lead_Score_Date___Most_Recent1]
     ,[C_Integrated_Marketing_and_Sales_Funnel_Stage]
     ,[C_Product_Solution_of_Interest1]
     ,[C_elqPURLName1]
     ,[C_Lead_Rating___Combined1]
     ,[C_EmailAddressDomain]
     ,[C_FirstAndLastName]
     ,[C_Company_Size1]
     ,[C_Lead_Score___Last_High_Touch_Event_Date1]
     ,[C_Lead_Rating___Explicit1]
     ,[C_Lead_Rating___Implicit1]
     ,[C_Lead_Score___Explicit1]
     ,[C_Lead_Score___Implicit1]
     ,[C_Lead_Score_Date___Profile___Most_Recent1]
     ,[C_Territory]
     ,[C_MD5HashedEmailAddress]
     ,[C_SHA256HashedEmailAddress]
     ,[C_MD5HashedBusPhone]
     ,[C_SHA256HashedBusPhone]
     ,[C_MD5HashedMobilePhone]
     ,[C_SHA256HashedMobilePhone]
     ,[C_Lead_Score]
     ,[C_ElqPURLName]
     ,[C_MSCRMContactID]
     ,[C_MSCRMLeadID]
     ,[C_MSCRMAccountID]
     ,[C_MSCRMLastCampaignID]
     ,[C_MSCRMLastCampaignName]
     ,[C_MSCRMLastCampaignStatus]
     ,[C_LastMSCRMCampaignResponseID]
     ,[C_MSCRM_EmailOptOut]
     ,[C_MSCRM_LeadRating]
     ,[C_Account_Numbers1]
     ,[C_Miles_From_Facility1]
     ,[C_Birthdate1]
     ,[C_Do_not_allow_Bulk_Emails1]
     ,[C_Email_Address_21]
     ,[C_Email_Address_31]
     ,[C_My_Wild_Account_PIN1]
     ,[C_Propensity_Alt_Rock1]
     ,[C_Propensity_Broadway1]
     ,[C_Propensity_Country1]
     ,[C_Propensity_Family_Shows1]
     ,[C_Propensity_Hard_Rock1]
     ,[C_Propensity_Hockey1]
     ,[C_Propensity_Rap_or_Hip_Hop1]
     ,[C_Propensity_Rock_or_Pop1]
     ,[C_Serviceperson1]
     ,[C_Personicx_Group1]
     ,[C_Personicx_Cluster1]
     ,[C_Business_Main_Phone1]
     ,[C_SMS1]
     ,[C_Direct_Phone1]
     ,[C_Home_Phone1]
     ,[C_accountid_name1]
     )
VALUES
     (@RunTime	--[ETL_CreatedDate]
     ,@RunTime	--[ETL_UpdatedDate]
     ,0			--[ETL_IsDeleted]
     ,NULL		--[ETL_DeletedDate]
     ,mySource.[ETL_Sync_DeltaHashKey]
     ,mySource.[ID]
     ,mySource.[Name]
     ,mySource.[AccountName]
     ,mySource.[BouncebackDate]
     ,mySource.[IsBounceback]
     ,mySource.[IsSubscribed]
     ,mySource.[PostalCode]
     ,mySource.[Province]
     ,mySource.[SubscriptionDate]
     ,mySource.[UnsubscriptionDate]
     ,mySource.[CreatedAt]
     ,mySource.[CreatedBy]
     ,mySource.[AccessedAt]
     ,mySource.[CurrentStatus]
     ,mySource.[Depth]
     ,mySource.[UpdatedAt]
     ,mySource.[UpdatedBy]
     ,mySource.[EmailAddress]
     ,mySource.[FirstName]
     ,mySource.[LastName]
     ,mySource.[Company]
     ,mySource.[Address1]
     ,mySource.[Address2]
     ,mySource.[Address3]
     ,mySource.[City]
     ,mySource.[Country]
     ,mySource.[MobilePhone]
     ,mySource.[BusinessPhone]
     ,mySource.[Fax]
     ,mySource.[Title]
     ,mySource.[SalesPerson]
     ,mySource.[C_EmailDisplayName]
     ,mySource.[C_State_Prov]
     ,mySource.[C_Zip_Postal]
     ,mySource.[C_Salutation]
     ,mySource.[C_SFDCContactID]
     ,mySource.[C_SFDCLeadID]
     ,mySource.[C_DateCreated]
     ,mySource.[C_DateModified]
     ,mySource.[ContactIDExt]
     ,mySource.[C_SFDCAccountID]
     ,mySource.[C_LastModifiedByExtIntegrateSystem]
     ,mySource.[C_SFDCLastCampaignID]
     ,mySource.[C_SFDCLastCampaignStatus]
     ,mySource.[C_Company_Revenue1]
     ,mySource.[C_SFDC_EmailOptOut1]
     ,mySource.[C_Lead_Source___Most_Recent1]
     ,mySource.[C_Lead_Source___Original1]
     ,mySource.[C_Industry1]
     ,mySource.[C_Annual_Revenue1]
     ,mySource.[C_Lead_Status1]
     ,mySource.[C_Job_Role1]
     ,mySource.[C_LS___High_Value_Website_Content1]
     ,mySource.[C_Lead_Score_Date___Most_Recent1]
     ,mySource.[C_Integrated_Marketing_and_Sales_Funnel_Stage]
     ,mySource.[C_Product_Solution_of_Interest1]
     ,mySource.[C_elqPURLName1]
     ,mySource.[C_Lead_Rating___Combined1]
     ,mySource.[C_EmailAddressDomain]
     ,mySource.[C_FirstAndLastName]
     ,mySource.[C_Company_Size1]
     ,mySource.[C_Lead_Score___Last_High_Touch_Event_Date1]
     ,mySource.[C_Lead_Rating___Explicit1]
     ,mySource.[C_Lead_Rating___Implicit1]
     ,mySource.[C_Lead_Score___Explicit1]
     ,mySource.[C_Lead_Score___Implicit1]
     ,mySource.[C_Lead_Score_Date___Profile___Most_Recent1]
     ,mySource.[C_Territory]
     ,mySource.[C_MD5HashedEmailAddress]
     ,mySource.[C_SHA256HashedEmailAddress]
     ,mySource.[C_MD5HashedBusPhone]
     ,mySource.[C_SHA256HashedBusPhone]
     ,mySource.[C_MD5HashedMobilePhone]
     ,mySource.[C_SHA256HashedMobilePhone]
     ,mySource.[C_Lead_Score]
     ,mySource.[C_ElqPURLName]
     ,mySource.[C_MSCRMContactID]
     ,mySource.[C_MSCRMLeadID]
     ,mySource.[C_MSCRMAccountID]
     ,mySource.[C_MSCRMLastCampaignID]
     ,mySource.[C_MSCRMLastCampaignName]
     ,mySource.[C_MSCRMLastCampaignStatus]
     ,mySource.[C_LastMSCRMCampaignResponseID]
     ,mySource.[C_MSCRM_EmailOptOut]
     ,mySource.[C_MSCRM_LeadRating]
     ,mySource.[C_Account_Numbers1]
     ,mySource.[C_Miles_From_Facility1]
     ,mySource.[C_Birthdate1]
     ,mySource.[C_Do_not_allow_Bulk_Emails1]
     ,mySource.[C_Email_Address_21]
     ,mySource.[C_Email_Address_31]
     ,mySource.[C_My_Wild_Account_PIN1]
     ,mySource.[C_Propensity_Alt_Rock1]
     ,mySource.[C_Propensity_Broadway1]
     ,mySource.[C_Propensity_Country1]
     ,mySource.[C_Propensity_Family_Shows1]
     ,mySource.[C_Propensity_Hard_Rock1]
     ,mySource.[C_Propensity_Hockey1]
     ,mySource.[C_Propensity_Rap_or_Hip_Hop1]
     ,mySource.[C_Propensity_Rock_or_Pop1]
     ,mySource.[C_Serviceperson1]
     ,mySource.[C_Personicx_Group1]
     ,mySource.[C_Personicx_Cluster1]
     ,mySource.[C_Business_Main_Phone1]
     ,mySource.[C_SMS1]
     ,mySource.[C_Direct_Phone1]
     ,mySource.[C_Home_Phone1]
     ,mySource.[C_accountid_name1]
     )
;

EXEC etl.LogEventRecordDB @Batchid, 'Info', @ProcedureName, 'Merge Load', 'Merge Statement Execution', 'Complete', @ExecutionId

END TRY 
BEGIN CATCH 

	DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
	DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
	DECLARE @ErrorState INT = ERROR_STATE();
			
	PRINT @ErrorMessage
	EXEC etl.LogEventRecordDB @Batchid, 'Error', @ProcedureName, 'Merge Load', 'Merge Error', @ErrorMessage, @ExecutionId
	EXEC etl.LogEventRecordDB @Batchid, 'Info', @ProcedureName, 'Merge Load', 'Procedure Processing', 'Complete', @ExecutionId

	RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)

END CATCH

EXEC etl.LogEventRecordDB @Batchid, 'Info', @ProcedureName, 'Merge Load', 'Procedure Processing', 'Complete', @ExecutionId


END


GO
