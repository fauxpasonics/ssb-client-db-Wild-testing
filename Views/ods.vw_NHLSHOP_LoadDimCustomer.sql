SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





/*****Hash Rules for Reference******
WHEN 'int' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),' + COLUMN_NAME + ')),''DBNULL_INT'')'
WHEN 'bigint' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),' + COLUMN_NAME + ')),''DBNULL_BIGINT'')'
WHEN 'datetime' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),' + COLUMN_NAME + ')),''DBNULL_DATETIME'')'  
WHEN 'datetime2' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),' + COLUMN_NAME + ')),''DBNULL_DATETIME'')'
WHEN 'date' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),' + COLUMN_NAME + ',112)),''DBNULL_DATE'')' 
WHEN 'bit' THEN 'ISNULL(RTRIM(CONVERT(varchar(10),' + COLUMN_NAME + ')),''DBNULL_BIT'')'  
WHEN 'decimal' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),'+ COLUMN_NAME + ')),''DBNULL_NUMBER'')' 
WHEN 'numeric' THEN 'ISNULL(RTRIM(CONVERT(varchar(25),'+ COLUMN_NAME + ')),''DBNULL_NUMBER'')' 
ELSE 'ISNULL(RTRIM(' + COLUMN_NAME + '),''DBNULL_TEXT'')'
*****/
--DROP VIEW ods.[vw_Eloqua_LoadDimCustomer];
CREATE VIEW [ods].[vw_NHLSHOP_LoadDimCustomer]
AS
    (
      SELECT    *
	/*Name*/
              , HASHBYTES('sha2_256',
                          ISNULL(RTRIM(Prefix), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(FirstName), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(MiddleName), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(LastName), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(Suffix), 'DBNULL_TEXT')) AS [NameDirtyHash]
              , NULL AS [NameIsCleanStatus]
              , NULL AS [NameMasterId]

	/*Address*/
              , HASHBYTES('sha2_256',
                          ISNULL(RTRIM(AddressPrimaryStreet), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressPrimaryCity), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressPrimaryState), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressPrimaryZip), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressPrimaryCounty), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressPrimaryCountry), 'DBNULL_TEXT')) AS [AddressPrimaryDirtyHash]
              , NULL AS [AddressPrimaryIsCleanStatus]
              , NULL AS [AddressPrimaryMasterId]
              , HASHBYTES('sha2_256',
                          ISNULL(RTRIM(AddressOneStreet), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressOneCity), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressOneState), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressOneZip), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressOneCounty), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressOneCountry), 'DBNULL_TEXT')) AS [AddressOneDirtyHash]
              , NULL AS [AddressOneIsCleanStatus]
              , NULL AS [AddressOneMasterId]
              , HASHBYTES('sha2_256',
                          ISNULL(RTRIM(AddressTwoStreet), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressTwoCity), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressTwoState), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressTwoZip), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressTwoCounty), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressTwoCountry), 'DBNULL_TEXT')) AS [AddressTwoDirtyHash]
              , NULL AS [AddressTwoIsCleanStatus]
              , NULL AS [AddressTwoMasterId]
              , HASHBYTES('sha2_256',
                          ISNULL(RTRIM(AddressThreeStreet), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressThreeCity), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressThreeState), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressThreeZip), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressThreeCounty), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressThreeCountry), 'DBNULL_TEXT')) AS [AddressThreeDirtyHash]
              , NULL AS [AddressThreeIsCleanStatus]
              , NULL AS [AddressThreeMasterId]
              , HASHBYTES('sha2_256',
                          ISNULL(RTRIM(AddressFourStreet), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressFourCity), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressFourState), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressFourZip), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressFourCounty), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressFourCountry), 'DBNULL_TEXT')) AS [AddressFourDirtyHash]
              , NULL AS [AddressFourIsCleanStatus]
              , NULL AS [AddressFourMasterId]

	/*Contact*/
              , HASHBYTES('sha2_256',
                          ISNULL(RTRIM(Prefix), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(FirstName), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(MiddleName), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(LastName), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(Suffix), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressPrimaryStreet), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressPrimaryCity), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressPrimaryState), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressPrimaryZip), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressPrimaryCounty), 'DBNULL_TEXT')
                          + ISNULL(RTRIM(AddressPrimaryCountry), 'DBNULL_TEXT')) AS [ContactDirtyHash]
              , CAST(NULL AS UNIQUEIDENTIFIER) AS [ContactGuid]

	/*Phone*/
              , HASHBYTES('sha2_256',
                          ISNULL(RTRIM(PhonePrimary), 'DBNULL_TEXT')) AS [PhonePrimaryDirtyHash]
              , NULL AS [PhonePrimaryIsCleanStatus]
              , NULL AS [PhonePrimaryMasterId]
              , HASHBYTES('sha2_256', ISNULL(RTRIM(PhoneHome), 'DBNULL_TEXT')) AS [PhoneHomeDirtyHash]
              , NULL AS [PhoneHomeIsCleanStatus]
              , NULL AS [PhoneHomeMasterId]
              , HASHBYTES('sha2_256', ISNULL(RTRIM(PhoneCell), 'DBNULL_TEXT')) AS [PhoneCellDirtyHash]
              , NULL AS [PhoneCellIsCleanStatus]
              , NULL AS [PhoneCellMasterId]
              , HASHBYTES('sha2_256',
                          ISNULL(RTRIM(PhoneBusiness), 'DBNULL_TEXT')) AS [PhoneBusinessDirtyHash]
              , NULL AS [PhoneBusinessIsCleanStatus]
              , NULL AS [PhoneBusinessMasterId]
              , HASHBYTES('sha2_256', ISNULL(RTRIM(PhoneFax), 'DBNULL_TEXT')) AS [PhoneFaxDirtyHash]
              , NULL AS [PhoneFaxIsCleanStatus]
              , NULL AS [PhoneFaxMasterId]
              , HASHBYTES('sha2_256', ISNULL(RTRIM(PhoneFax), 'DBNULL_TEXT')) AS [PhoneOtherDirtyHash]
              , NULL AS [PhoneOtherIsCleanStatus]
              , NULL AS [PhoneOtherMasterId]

	/*Email*/
              , HASHBYTES('sha2_256',
                          ISNULL(RTRIM(EmailPrimary), 'DBNULL_TEXT')) AS [EmailPrimaryDirtyHash]
              , NULL AS [EmailPrimaryIsCleanStatus]
              , NULL AS [EmailPrimaryMasterId]
              , HASHBYTES('sha2_256', ISNULL(RTRIM(EmailOne), 'DBNULL_TEXT')) AS [EmailOneDirtyHash]
              , NULL AS [EmailOneIsCleanStatus]
              , NULL AS [EmailOneMasterId]
              , HASHBYTES('sha2_256', ISNULL(RTRIM(EmailTwo), 'DBNULL_TEXT')) AS [EmailTwoDirtyHash]
              , NULL AS [EmailTwoIsCleanStatus]
              , NULL AS [EmailTwoMasterId]
      FROM      (
                  --base set
                  SELECT    DB_NAME() AS [SourceDB]
                          , 'NHL Shop' AS [SourceSystem]
                          , NULL AS [SourceSystemPriority]

			/*Standard Attributes*/
                          , CAST(vnldc.FAN_ID AS NVARCHAR(100)) [SSID]
                          , NULL AS [CustomerType]
                          , NULL AS [CustomerStatus]
                          , NULL AS [AccountType]
                          , CAST(NULL AS NVARCHAR(50)) AS [AccountRep]
                          , CAST(NULL AS NVARCHAR(50)) AS [CompanyName]
                          , NULL AS [SalutationName]
                          , NULL AS [DonorMailName]
                          , NULL AS [DonorFormalName]
                          , CAST (NULL AS DATE) AS [Birthday]
                          , NULL AS [Gender]
                          , 0 [MergedRecordFlag]
                          , NULL [MergedIntoSSID]

			/**ENTITIES**/
			/*Name*/
                          , NULL AS [Prefix]
                          , vnldc.NAME_FIRST AS [FirstName]
                          , NULL AS [MiddleName]
                          , vnldc.NAME_LAST AS [LastName]
                          , NULL AS [Suffix]
			--, c.name_title as [Title]

			/*AddressPrimary*/
                          , vnldc.ADDRESS1 AS [AddressPrimaryStreet]
                          , vnldc.CITY1 AS [AddressPrimaryCity]
                          , vnldc.REGION_FT AS [AddressPrimaryState]
                          , vnldc.POSTCODE1 AS [AddressPrimaryZip]
                          , NULL AS [AddressPrimaryCounty]
                          , NULL AS [AddressPrimaryCountry]
                          , NULL AS [AddressOneStreet]
                          , NULL AS [AddressOneCity]
                          , NULL AS [AddressOneState]
                          , NULL AS [AddressOneZip]
                          , NULL AS [AddressOneCounty]
                          , NULL AS [AddressOneCountry]
                          , NULL AS [AddressTwoStreet]
                          , NULL AS [AddressTwoCity]
                          , NULL AS [AddressTwoState]
                          , NULL AS [AddressTwoZip]
                          , NULL AS [AddressTwoCounty]
                          , NULL AS [AddressTwoCountry]
                          , NULL AS [AddressThreeStreet]
                          , NULL AS [AddressThreeCity]
                          , NULL AS [AddressThreeState]
                          , NULL AS [AddressThreeZip]
                          , NULL AS [AddressThreeCounty]
                          , NULL AS [AddressThreeCountry]
                          , NULL AS [AddressFourStreet]
                          , NULL AS [AddressFourCity]
                          , NULL AS [AddressFourState]
                          , NULL AS [AddressFourZip]
                          , NULL AS [AddressFourCounty]
                          , NULL AS [AddressFourCountry] 

			/*Phone*/
                          , vnldc.TELNR_LONG AS [PhonePrimary]
                          , LEFT(NULL, 25) AS [PhoneHome]
                          , LEFT(NULL, 25) AS [PhoneCell]
                          , LEFT(NULL, 25) AS [PhoneBusiness]
                          , LEFT(NULL, 25) AS [PhoneFax]
                          , NULL AS [PhoneOther]

			/*Email*/
                          , vnldc.EMAIL AS [EmailPrimary]
                          , NULL AS [EmailOne]
                          , NULL AS [EmailTwo]

			/*Extended Attributes*/
                          , NULL AS [ExtAttribute1] --nvarchar(100) CRMGUID
                          , NULL AS [ExtAttribute2]
                          , NULL AS [ExtAttribute3]
                          , NULL AS [ExtAttribute4]
                          , NULL AS [ExtAttribute5]
                          , NULL AS [ExtAttribute6]
                          , NULL AS [ExtAttribute7]
                          , NULL AS [ExtAttribute8]
                          , NULL AS [ExtAttribute9]
                          , NULL AS [ExtAttribute10]
                          , NULL AS [ExtAttribute11]
                          , NULL AS [ExtAttribute12]
                          , NULL AS [ExtAttribute13]
                          , NULL AS [ExtAttribute14]
                          , NULL AS [ExtAttribute15]
                          , NULL AS [ExtAttribute16]
                          , NULL AS [ExtAttribute17]
                          , NULL AS [ExtAttribute18]
                          , NULL AS [ExtAttribute19]
                          , NULL AS [ExtAttribute20]
                          , NULL AS [ExtAttribute21] --datetime
                          , NULL AS [ExtAttribute22]
                          , NULL AS [ExtAttribute23]
                          , NULL AS [ExtAttribute24]
                          , NULL AS [ExtAttribute25]
                          , NULL AS [ExtAttribute26]
                          , NULL AS [ExtAttribute27]
                          , NULL AS [ExtAttribute28]
                          , NULL AS [ExtAttribute29]
                          , NULL AS [ExtAttribute30]  

			/*Source Created and Updated*/
                          , NULL [SSCreatedBy]
                          , NULL [SSUpdatedBy]
						   , CAST(GETDATE() AS DATE) [CreatedDate]
                          , CAST(GETDATE() AS DATE) [SSCreatedDate]
                          , CAST(NULL AS DATE) [SSUpdatedDate]
                          , NULL [AccountId]
                          , NULL IsBusiness
                  FROM      ods.vw_NHLSHOP_LoadDimCustomerHelper AS vnldc
                  WHERE     1 = 1
                            AND vnldc.order_date_rank = 1
                ) a
    );
























GO
