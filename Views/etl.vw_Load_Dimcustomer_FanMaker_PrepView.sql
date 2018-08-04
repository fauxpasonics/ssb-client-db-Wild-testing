SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


--select SSID, COUNT(*)
--FROM [etl].[vw_Load_Dimcustomer_FanMaker_PrepView]
--GROUP BY SSID
--HAVING COUNT(*)>1


CREATE VIEW [etl].[vw_Load_Dimcustomer_FanMaker_PrepView] AS
(

	SELECT  DISTINCT
	usr.UserId SSID
	, usr.FirstName 
	, usr.LastName

	
	  --pa primary address is now where adtype=m
	, CAST(ISNULL(pa.Address1,'') + ' ' + ISNULL(pa.Address2,'') AS VARCHAR(500)) PrimaryAddressStreet
	, CAST(pa.City AS VARCHAR(200)) PrimaryAddressCity
	, CAST(pa.[State] AS VARCHAR(200)) PrimaryAddressState
	, CAST(pa.ZipCode AS VARCHAR(200)) PrimaryAddressZipCode
	, CAST(pa.Country AS VARCHAR(200)) PrimaryAddressCountry

	, ph.PhoneHome
	, ph.PhoneMobile AS PhoneCell
	, ph.PhoneOffice AS PhoneBusiness


	, Email.ContactInfo_Email AS EmailPrimary
	, usr.CreatedAt AS SSCreatedDate
	, usr.ETL_CreatedOn AS CreatedDate
	, usr.ETL_UpdatedOn AS UpdatedDate


	FROM [ods].[FanMaker_UserDetails](NOLOCK) usr
	LEFT OUTER JOIN ( 
	--This is looking at the customers preferred address type to pull that for Primary; handling duplicates
			SELECT a.*
			FROM [ods].[FanMaker_UserDetails_Address] (NOLOCK) a
			INNER JOIN (select UserId, AddressId, ROW_NUMBER() OVER(PARTITION BY UserId ORDER BY ETL_UpdatedOn DESC, ETL_CreatedOn) xRank 
						FROM [ods].[FanMaker_UserDetails_Address] (NOLOCK)
						WHERE IsPrimary = 'true') x  ON a.UserId = x.UserId 
													AND a.AddressId = x.AddressId
													AND x.xRank = 1
			WHERE IsPrimary = 'true'
			 
	)	pa ON usr.UserId = pa.UserId	

	LEFT OUTER JOIN (
		SELECT UserId, PhoneHome, PhoneMobile, PhoneOffice
		FROM [ods].[FanMaker_UserDetails_Phone] (NOLOCK)
		
	) ph ON usr.UserId = ph.UserId	

	LEFT OUTER JOIN (
		SELECT UserId, ContactInfo_Email, ETL_UpdatedOn
		FROM [ods].[FanMaker_UserDetails_Email] (NOLOCK)

	) Email ON usr.UserId = Email.UserId	




)




































GO
