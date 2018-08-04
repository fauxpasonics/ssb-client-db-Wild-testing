CREATE TABLE [src].[Eloqua_Contact]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Eloqua_Co__ETL_C__6EF57B66] DEFAULT (getdate()),
[ETL_UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__Eloqua_Co__ETL_U__6FE99F9F] DEFAULT (getdate()),
[ETL_IsDeleted] [bit] NOT NULL CONSTRAINT [DF__Eloqua_Co__ETL_I__70DDC3D8] DEFAULT ((0)),
[ETL_DeletedDate] [datetime] NULL,
[ETL_DeltaHashKey] [binary] (32) NULL,
[ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountName] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BouncebackDate] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsBounceback] [bit] NULL,
[IsSubscribed] [bit] NULL,
[PostalCode] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Province] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubscriptionDate] [datetime] NULL,
[UnsubscriptionDate] [datetime] NULL,
[CreatedAt] [datetime] NULL,
[CreatedBy] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccessedAt] [datetime] NULL,
[CurrentStatus] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Depth] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdatedAt] [datetime] NULL,
[UpdatedBy] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Company] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address2] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address3] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Country] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MobilePhone] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BusinessPhone] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fax] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SalesPerson] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_EmailDisplayName] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_State_Prov] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Zip_Postal] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Salutation] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SFDCContactID] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SFDCLeadID] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_DateCreated] [date] NULL,
[C_DateModified] [date] NULL,
[ContactIDExt] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SFDCAccountID] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_LastModifiedByExtIntegrateSystem] [date] NULL,
[C_SFDCLastCampaignID] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SFDCLastCampaignStatus] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Company_Revenue1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SFDC_EmailOptOut1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Lead_Source___Most_Recent1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Lead_Source___Original1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Industry1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Annual_Revenue1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Lead_Status1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Job_Role1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_LS___High_Value_Website_Content1] [numeric] (38, 6) NULL,
[C_Lead_Score_Date___Most_Recent1] [date] NULL,
[C_Integrated_Marketing_and_Sales_Funnel_Stage] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Product_Solution_of_Interest1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_elqPURLName1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Lead_Rating___Combined1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_EmailAddressDomain] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_FirstAndLastName] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Company_Size1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Lead_Score___Last_High_Touch_Event_Date1] [date] NULL,
[C_Lead_Rating___Explicit1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Lead_Rating___Implicit1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Lead_Score___Explicit1] [numeric] (38, 6) NULL,
[C_Lead_Score___Implicit1] [numeric] (38, 6) NULL,
[C_Lead_Score_Date___Profile___Most_Recent1] [date] NULL,
[C_Territory] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_MD5HashedEmailAddress] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SHA256HashedEmailAddress] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_MD5HashedBusPhone] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SHA256HashedBusPhone] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_MD5HashedMobilePhone] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SHA256HashedMobilePhone] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Lead_Score] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_ElqPURLName] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_MSCRMContactID] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_MSCRMLeadID] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_MSCRMAccountID] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_MSCRMLastCampaignID] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_MSCRMLastCampaignName] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_MSCRMLastCampaignStatus] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_LastMSCRMCampaignResponseID] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_MSCRM_EmailOptOut] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_MSCRM_LeadRating] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Account_Numbers1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Miles_From_Facility1] [numeric] (38, 6) NULL,
[C_Birthdate1] [date] NULL,
[C_Do_not_allow_Bulk_Emails1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Email_Address_21] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Email_Address_31] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_My_Wild_Account_PIN1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Propensity_Alt_Rock1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Propensity_Broadway1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Propensity_Country1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Propensity_Family_Shows1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Propensity_Hard_Rock1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Propensity_Hockey1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Propensity_Rap_or_Hip_Hop1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Propensity_Rock_or_Pop1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Serviceperson1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Personicx_Group1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Personicx_Cluster1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Business_Main_Phone1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SMS1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Direct_Phone1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Home_Phone1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_accountid_name1] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO