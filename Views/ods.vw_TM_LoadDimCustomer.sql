SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [ods].[vw_TM_LoadDimCustomer] 
AS 

WITH CTE  AS (
SELECT 
                 ct.acct_id, 
                 cust_name_id, 
                 MAX(name_prefix) as name_prefix, 
                 MAX(name_suffix) as name_suffix, 
                 MAX(full_name) as full_name, 
                 MAX(UpdateDate) as UpdateDate,

       MAX(CASE WHEN ct.rn=1 THEN ct.street_addr END) AS Primary_street,
                 MAX(CASE WHEN ct.rn=1 THEN ct.city END) AS Primary_city,
                 MAX(CASE WHEN ct.rn=1 THEN ct.state END) AS Primary_state,
                 MAX(CASE WHEN ct.rn=1 THEN ct.zip END) AS Primary_zip,
                 MAX(CASE WHEN ct.rn=1 THEN ct.country END) AS Primary_country,

       MAX(CASE WHEN ct.rn=2 THEN ct.street_addr END) AS One_street,
                 MAX(CASE WHEN ct.rn=2 THEN ct.city END) AS One_city,
                 MAX(CASE WHEN ct.rn=2 THEN ct.state END) AS One_state,
                 MAX(CASE WHEN ct.rn=2 THEN ct.zip END) AS One_zip,
                 MAX(CASE WHEN ct.rn=2 THEN ct.country END) AS One_country
	/*  Customization:  ADD ADDITIONAL ADDRESSES HERE AS NECESSARY  */

FROM (SELECT acct_id, cust_name_id, name_prefix, name_suffix, full_name, UpdateDate
      , CASE WHEN CONCAT(street_addr_1, street_addr_2) = '' THEN NULL WHEN ISNULL(street_addr_1,'') = ISNULL(street_addr_2,'') THEN street_addr_1  
		WHEN ISNULL(street_addr_1,'') = '' THEN street_addr_2 WHEN ISNULL(street_addr_2,'') = '' THEN street_addr_1
        ELSE street_addr_1 + ' ' + street_addr_2 END AS street_addr  , city, state, zip, country,
       ROW_NUMBER() OVER(PARTITION BY acct_id, cust_name_id ORDER BY CASE WHEN CONCAT(street_addr_1, street_addr_2) = '' THEN NULL WHEN city = '' THEN NULL ELSE 1 END desc, primary_ind DESC, UpdateDate DESC) AS rn 
	   /*  Customization:  ADJUST RANKING TO PRIORITIZE DIFFERENT ADDRESSES - DON'T GET RID OF COMPLETENESS CHECK  */
FROM ods.TM_CustAddress ) ct
GROUP BY ct.acct_id,cust_name_id )

(  
  
     SELECT *  
    /*Name*/  
    , HASHBYTES('sha2_256',  
                            ISNULL(RTRIM(Prefix),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(FirstName),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(MiddleName),'DBNULL_TEXT')    
                            + ISNULL(RTRIM(LastName),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(Suffix),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(Fullname),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(CompanyName),'DBNULL_TEXT')) AS [NameDirtyHash]  
    , 'Dirty' AS [NameIsCleanStatus]  
    , NULL AS [NameMasterId]  
   
    /*Address*/  
    , HASHBYTES('sha2_256', ISNULL(RTRIM(AddressPrimaryStreet),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(AddressPrimaryCity),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(AddressPrimaryState),'DBNULL_TEXT')    
                            + ISNULL(RTRIM(AddressPrimaryZip),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(AddressPrimaryCounty),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(AddressPrimaryCountry),'DBNULL_TEXT')
                            + ISNULL(RTRIM(AddressPrimarySuite),'DBNULL_TEXT')) AS [AddressPrimaryDirtyHash]  
    , 'Dirty' AS [AddressPrimaryIsCleanStatus]  
    , NULL AS [AddressPrimaryMasterId]  
    , HASHBYTES('sha2_256', ISNULL(RTRIM(AddressOneStreet),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(AddressOneCity),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(AddressOneState),'DBNULL_TEXT')    
                            + ISNULL(RTRIM(AddressOneZip),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(AddressOneCounty),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(AddressOneCountry),'DBNULL_TEXT')
                            + ISNULL(RTRIM(AddressOneSuite),'DBNULL_TEXT')) AS [AddressOneDirtyHash]  
    , 'Dirty' AS [AddressOneIsCleanStatus]  
    , NULL AS [AddressOneMasterId]  
    , HASHBYTES('sha2_256', ISNULL(RTRIM(AddressTwoStreet),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(AddressTwoCity),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(AddressTwoState),'DBNULL_TEXT')    
                            + ISNULL(RTRIM(AddressTwoZip),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(AddressTwoCounty),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(AddressTwoCountry),'DBNULL_TEXT')
                            + ISNULL(RTRIM(AddressTwoSuite),'DBNULL_TEXT')) AS [AddressTwoDirtyHash]  
    , 'Dirty' AS [AddressTwoIsCleanStatus]  
    , NULL AS [AddressTwoMasterId]  
    , HASHBYTES('sha2_256', ISNULL(RTRIM(AddressThreeStreet),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(AddressThreeCity),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(AddressThreeState),'DBNULL_TEXT')    
                            + ISNULL(RTRIM(AddressThreeZip),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(AddressThreeCounty),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(AddressThreeCountry),'DBNULL_TEXT') 
                            + ISNULL(RTRIM(AddressThreeSuite),'DBNULL_TEXT')) AS [AddressThreeDirtyHash]  
    , 'Dirty' AS [AddressThreeIsCleanStatus]  
    , NULL AS [AddressThreeMasterId]  
    , HASHBYTES('sha2_256', ISNULL(RTRIM(AddressFourStreet),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(AddressFourCity),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(AddressFourState),'DBNULL_TEXT')    
                            + ISNULL(RTRIM(AddressFourZip),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(AddressFourCounty),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(AddressFourCountry),'DBNULL_TEXT')
                            + ISNULL(RTRIM(AddressFourSuite),'DBNULL_TEXT')) AS [AddressFourDirtyHash]  
    , 'Dirty' AS [AddressFourIsCleanStatus]  
    , NULL AS [AddressFourMasterId]  
   
    /*Contact*/  
    , HASHBYTES('sha2_256', ISNULL(RTRIM(Prefix),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(FirstName),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(MiddleName),'DBNULL_TEXT')    
                            + ISNULL(RTRIM(LastName),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(Suffix),'DBNULL_TEXT')
							+ ISNULL(RTRIM(AddressPrimaryStreet),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(AddressPrimaryCity),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(AddressPrimaryState),'DBNULL_TEXT')    
                            + ISNULL(RTRIM(AddressPrimaryZip),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(AddressPrimaryCounty),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(AddressPrimaryCountry),'DBNULL_TEXT')
                            + ISNULL(RTRIM(AddressPrimarySuite),'DBNULL_TEXT')) AS [ContactDirtyHash]  
   
    /*Phone*/  
    , HASHBYTES('sha2_256', ISNULL(RTRIM(PhonePrimary),'DBNULL_TEXT')) AS [PhonePrimaryDirtyHash]  
    , 'Dirty' AS [PhonePrimaryIsCleanStatus]  
    , NULL AS [PhonePrimaryMasterId]  
    , HASHBYTES('sha2_256', ISNULL(RTRIM(PhoneHome),'DBNULL_TEXT')) AS [PhoneHomeDirtyHash]  
    , 'Dirty' AS [PhoneHomeIsCleanStatus]  
    , NULL AS [PhoneHomeMasterId]  
    , HASHBYTES('sha2_256', ISNULL(RTRIM(PhoneCell),'DBNULL_TEXT')) AS [PhoneCellDirtyHash]  
    , 'Dirty' AS [PhoneCellIsCleanStatus]  
    , NULL AS [PhoneCellMasterId]  
    , HASHBYTES('sha2_256', ISNULL(RTRIM(PhoneBusiness),'DBNULL_TEXT')) AS [PhoneBusinessDirtyHash]  
    , 'Dirty' AS [PhoneBusinessIsCleanStatus]  
    , NULL AS [PhoneBusinessMasterId]  
    , HASHBYTES('sha2_256', ISNULL(RTRIM(PhoneFax),'DBNULL_TEXT')) AS [PhoneFaxDirtyHash]  
    , 'Dirty' AS [PhoneFaxIsCleanStatus]  
    , NULL AS [PhoneFaxMasterId]  
    , HASHBYTES('sha2_256', ISNULL(RTRIM(PhoneOther),'DBNULL_TEXT')) AS [PhoneOtherDirtyHash]  
    , 'Dirty' AS [PhoneOtherIsCleanStatus]  
    , NULL AS [PhoneOtherMasterId]  
   
    /*Email*/  
    , HASHBYTES('sha2_256', ISNULL(RTRIM(EmailPrimary),'DBNULL_TEXT')) AS [EmailPrimaryDirtyHash]  
    , 'Dirty' AS [EmailPrimaryIsCleanStatus]  
    , NULL AS [EmailPrimaryMasterId]  
    , HASHBYTES('sha2_256', ISNULL(RTRIM(EmailOne),'DBNULL_TEXT')) AS [EmailOneDirtyHash]  
    , 'Dirty' AS [EmailOneIsCleanStatus]  
    , NULL AS [EmailOneMasterId]  
    , HASHBYTES('sha2_256', ISNULL(RTRIM(EmailTwo),'DBNULL_TEXT')) AS [EmailTwoDirtyHash]  
    , 'Dirty' AS [EmailTwoIsCleanStatus]  
    , NULL AS [EmailTwoMasterId]  
       
    /*External Attributes*/  
    , HASHBYTES('sha2_256', ISNULL(RTRIM(customerType),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(CustomerStatus),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(AccountType),'DBNULL_TEXT')    
                            + ISNULL(RTRIM(AccountRep),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(CompanyName),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(SalutationName),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(DonorMailName),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(DonorFormalName),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(Birthday),'DBNULL_TEXT')    
                            + ISNULL(RTRIM(Gender),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(AccountId),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(MergedRecordFlag),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(MergedIntoSSID),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(IsBusiness),'DBNULL_TEXT')) AS [contactattrDirtyHash]  
   
    , HASHBYTES('sha2_256', ISNULL(RTRIM(ExtAttribute1),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(ExtAttribute2),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(ExtAttribute3),'DBNULL_TEXT')    
                            + ISNULL(RTRIM(ExtAttribute4),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(ExtAttribute5),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(ExtAttribute6),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(ExtAttribute7),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(ExtAttribute8),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(ExtAttribute9),'DBNULL_TEXT')    
                            + ISNULL(RTRIM(ExtAttribute10),'DBNULL_TEXT')) AS [extattr1_10DirtyHash]  
   
    , HASHBYTES('sha2_256', ISNULL(RTRIM(ExtAttribute11),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(ExtAttribute12),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(ExtAttribute13),'DBNULL_TEXT')    
                            + ISNULL(RTRIM(ExtAttribute14),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(ExtAttribute15),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(ExtAttribute16),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(ExtAttribute17),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(ExtAttribute18),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(ExtAttribute19),'DBNULL_TEXT')    
                            + ISNULL(RTRIM(ExtAttribute20),'DBNULL_TEXT')) AS [extattr11_20DirtyHash]  
   
                               
    , HASHBYTES('sha2_256', ISNULL(RTRIM(ExtAttribute21),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(ExtAttribute22),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(ExtAttribute23),'DBNULL_TEXT')    
                            + ISNULL(RTRIM(ExtAttribute24),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(ExtAttribute25),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(ExtAttribute26),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(ExtAttribute27),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(ExtAttribute28),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(ExtAttribute29),'DBNULL_TEXT')    
                            + ISNULL(RTRIM(ExtAttribute30),'DBNULL_TEXT')) AS [extattr21_30DirtyHash]  
   
                               
    , HASHBYTES('sha2_256', ISNULL(RTRIM(ExtAttribute31),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(ExtAttribute32),'DBNULL_TEXT')  
                            + ISNULL(RTRIM(ExtAttribute33),'DBNULL_TEXT')    
                            + ISNULL(RTRIM(ExtAttribute34),'DBNULL_TEXT')   
                            + ISNULL(RTRIM(ExtAttribute35),'DBNULL_TEXT')) AS [extattr31_35DirtyHash]  

 FROM (  
  SELECT   
   'Wild' AS [SourceDB]  /*  Customization:  Adjust sourcedb */
   , 'TM' AS [SourceSystem]  /*  Customization:  Adjust sourcesystem if necessary (also needs to be adjusted at bottom)  */
   , NULL AS [SourceSystemPriority]  
  
   /*Standard Attributes*/  
   , CAST(c.acct_id AS NVARCHAR(25)) + ':' + CAST(c.cust_name_id AS NVARCHAR(25)) [SSID]  
   , CAST(c.primary_code AS NVARCHAR (50)) AS [CustomerType]  
   , CAST(c.rec_status AS NVARCHAR (50)) AS [CustomerStatus]  
   , CAST(c.acct_type_desc AS NVARCHAR (50)) AS [AccountType]   
   , CAST(COALESCE(NULLIF(cr.rep_name,''),c.acct_rep_name) AS NVARCHAR (50)) AS [AccountRep]    /*  Customization:  Swap places if team tells you TM_Cust is better source (it probably isn't) */
   , CAST(NULLIF(c.company_name,'') AS NVARCHAR (50)) AS [CompanyName]   
   , LEFT(c.salutation,50) AS [SalutationName]  
   , NULL AS [DonorMailName]  
   , NULL AS [DonorFormalName]  
   , CASE WHEN c.birth_date IS NOT NULL AND c.birth_date <> '' AND c.birth_date > '1/1/1900' THEN CAST(c.birth_date AS DATE) ELSE NULL END AS [Birthday]  
   , c.gender AS [Gender]   
   , 0 [MergedRecordFlag]  
   , NULL [MergedIntoSSID]  
  
   /**ENTITIES**/  
   /*Name*/  
   , a.name_prefix AS [Prefix]  
   , c.name_first AS [FirstName]  
   , c.name_mi AS [MiddleName]  
   , c.name_last AS [LastName]  
   , NULL AS [FullName]  
   , a.name_suffix AS [Suffix]  
   , c.name_title as [Title]  
  
   /*Addresses*/  
   , CASE WHEN a.primary_street IS NOT NULL THEN a.primary_street ELSE CASE WHEN CONCAT(c.street_addr_1, c.street_addr_2) = '' THEN NULL WHEN ISNULL(c.street_addr_1,'') = ISNULL(c.street_addr_2,'') THEN c.street_addr_1  
		WHEN ISNULL(c.street_addr_1,'') = '' THEN c.street_addr_2 WHEN ISNULL(c.street_addr_2,'') = '' THEN c.street_addr_1
        ELSE c.street_addr_1 + ' ' + c.street_addr_2 END END AS [AddressPrimaryStreet]  
   , NULL AS [addressprimarysuite]
   , CASE WHEN isnull(a.Primary_city, '') = '' AND isnull(c.city,'') = '' THEN NULL WHEN isnull(a.Primary_city, '') = '' THEN c.city ELSE a.Primary_city END AS [AddressPrimaryCity]   
   , CASE WHEN isnull(a.Primary_state, '') = '' AND ISNULL(c.state,'') = '' THEN NULL WHEN ISNULL(a.primary_state,'') = '' THEN c.state ELSE a.Primary_state END AS [AddressPrimaryState]   
   , CASE WHEN isnull(a.Primary_zip, '') = '' AND ISNULL(c.zip,'') = '' THEN NULL WHEN ISNULL(a.primary_zip,'') = '' THEN c.state ELSE a.Primary_zip END AS [AddressPrimaryZip]   
   , NULL AS [AddressPrimaryCounty]                                                                                                                                                       
   , CASE WHEN isnull(a.Primary_country, '') = '' AND ISNULL(c.country,'') = '' THEN NULL WHEN ISNULL(a.primary_country,'') = '' THEN c.country ELSE a.Primary_country END AS [AddressPrimaryCountry]   
   , a.one_street AS [AddressOneStreet] 
   , NULL AS [addressOnesuite]
   , CASE WHEN isnull(a.One_city, '') = '' THEN NULL ELSE a.One_city END AS [AddressOneCity]   
   , CASE WHEN isnull(a.One_state, '') = '' THEN NULL ELSE a.One_state END AS [AddressOneState]   
   , CASE WHEN isnull(a.One_zip, '') = '' THEN NULL ELSE a.One_zip END AS [AddressOneZip]   
   , NULL AS [AddressOneCounty]                                                                                                                                                       
   , CASE WHEN isnull(a.One_country,'') = '' THEN NULL ELSE a.One_country END AS [AddressOneCountry]   
/*  ADD ADDITIONAL ADDRESSES HERE AND IN CTE.  NULL OUT THE SUITE!!!!  */
   , NULL AS [AddressTwoStreet]  
   , NULL AS [addresstwosuite]
   , NULL AS [AddressTwoCity]   
   , NULL AS [AddressTwoState]   
   , NULL AS [AddressTwoZip]   
   , NULL AS [AddressTwoCounty]   
   , NULL AS [AddressTwoCountry]  
   , NULL AS [AddressThreeStreet]  
   , NULL AS [addressthreesuite] 
   , NULL AS [AddressThreeCity]   
   , NULL AS [AddressThreeState]   
   , NULL AS [AddressThreeZip]   
   , NULL AS [AddressThreeCounty]   
   , NULL AS [AddressThreeCountry]     
   , NULL AS [AddressFourStreet]  
   , NULL AS [addressfoursuite]
   , NULL AS [AddressFourCity]   
   , NULL AS [AddressFourState]   
   , NULL AS [AddressFourZip]   
   , NULL AS [AddressFourCounty]  
   , NULL AS [AddressFourCountry]      
  
   /*Phone*/  
   , LEFT(COALESCE(NULLIF(c.phone_day,''),NULLIF(c.phone_eve,''),NULLIF(c.phone_cell,'')),25) AS [PhonePrimary]  
   , LEFT(NULLIF(c.phone_eve,''),25) AS [PhoneHome]  
   , LEFT(NULLIF(c.phone_cell,''),25) AS [PhoneCell]  
   , LEFT(NULLIF(c.phone_day,''),25) AS [PhoneBusiness]  
   , LEFT(NULLIF(c.phone_fax,''),25) AS [PhoneFax]  
   , NULL AS [PhoneOther]  
  
   /*Email*/ 
   , COALESCE(NULLIF(c.email_addr,''), NULLIF(c.email_addr2,'')) AS [EmailPrimary]  
   , NULLIF(c.email_addr,'') AS [EmailOne]  
   , NULLIF(c.email_addr2,'') AS [EmailTwo]  
  
   /*Extended Attributes*/  
   , NULL AS [ExtAttribute1] --nvarchar(100)  
   , NULL AS [ExtAttribute2]   
   , NULL AS [ExtAttribute3]   
   , NULL AS [ExtAttribute4]   
   , NULL AS [ExtAttribute5]   
   , NULL AS [ExtAttribute6]   
   , NULL AS [ExtAttribute7]   
   , NULL AS [ExtAttribute8]    
   , NULL AS [ExtAttribute9]   
   , NULL AS [ExtAttribute10]   
  
   , NULL AS [ExtAttribute11]   --number 
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
   , NULL AS [extattribute22]  
   , NULL AS [ExtAttribute23]   
   , NULL AS [ExtAttribute24]   
   , NULL AS [ExtAttribute25]   
   , NULL AS [ExtAttribute26]   
   , NULL AS [ExtAttribute27]   
   , NULL AS [ExtAttribute28]   
   , NULL AS [ExtAttribute29]   
   , NULL AS [ExtAttribute30]    

   , NULL AS [ExtAttribute31] --nvarchar(max)  
   , NULL AS [ExtAttribute32]   
   , NULL AS [ExtAttribute33]   
   , NULL AS [ExtAttribute34]   
   , NULL AS [ExtAttribute35]   
  
   /*Source Created and Updated*/  
   , c.add_user [SSCreatedBy]  
   , c.upd_user [SSUpdatedBy]  
   , c.add_date [SSCreatedDate]  
   , c.upd_date [SSUpdatedDate] 
   , GETDATE() createddate
   , GETDATE() updateddate 
  
   , c.acct_id [AccountId]  
   , CAST(CASE WHEN c.name_type = 'C' THEN 1 ELSE 0 END AS BIT) IsBusiness  
   , 0 AS IsDeleted  
   , NULL AS Customer_Matchkey  
/*  Customization:  Lots of other options here - acct_id + cust_name, acct_id only when the primary_code is primary.  Be careful!!!  Always check for blanks and 0s.  */
  
  FROM ods.TM_Cust c WITH (NOLOCK)  
      LEFT JOIN(
      SELECT * FROM CTE AS ct) AS a ON a.acct_id= c.acct_id AND a.cust_name_id = c.cust_name_id
      LEFT JOIN (	
      SELECT custrep.acct_id, MIN(CASE WHEN ISNULL(cust.name_first,'') = '' THEN cust.name_last ELSE CONCAT(cust.name_first, ' ', cust.name_last) END) AS rep_name
         FROM ods.TM_CustRep custrep (NOLOCK)         
         INNER JOIN ods.TM_Cust cust (NOLOCK) ON custrep.acct_rep_id = cust.acct_id AND cust.Primary_code = 'Primary'
         WHERE custrep.acct_rep_type = 'S'
         GROUP BY custrep.acct_id 
	  ) cr  ON c.acct_id = cr.acct_id
  WHERE 1=1    
  AND CASE WHEN a.UpdateDate > c.upd_date THEN a.updatedate ELSE c.upd_date END > (SELECT DATEADD(d, -3,MAX([SSUpdatedDate])) FROM dbo.[DimCustomer] WITH (NOLOCK) WHERE SourceSystem = 'TM')  
/*  Customization:  Update sourcesystem name if changed above  */
   ) z 
   ) 
   


GO
