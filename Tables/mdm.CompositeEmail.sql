CREATE TABLE [mdm].[CompositeEmail]
(
[DimEmailID] [int] NOT NULL,
[Email] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailStatus] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DimCustomerId] [int] NOT NULL,
[SourceDB] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceSystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceSystemPriority] [int] NULL,
[SSID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerStatus] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountRep] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CompanyName] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CompanyNameIsCleanStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SalutationName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DonorMailName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DonorFormalName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthday] [date] NULL,
[Gender] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CD_Gender] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prefix] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MiddleName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suffix] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FullName] [nvarchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NameIsCleanStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryStreet] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimarySuite] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryCity] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryState] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryZip] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryPlus4] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryCounty] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryCountry] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryNCOAStatus] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryLatitude] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryLongitude] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryIsCleanStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactGUID] [uniqueidentifier] NULL,
[AddressOneStreet] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneSuite] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneCity] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneState] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneZip] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOnePlus4] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneCounty] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneCountry] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneStreetNCOAStatus] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneLatitude] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneLongitude] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressOneIsCleanStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoStreet] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoSuite] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoCity] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoState] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoZip] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoPlus4] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoCounty] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoCountry] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoStreetNCOAStatus] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoLatitude] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoLongitude] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressTwoIsCleanStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeStreet] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeSuite] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeCity] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeState] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeZip] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreePlus4] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeCounty] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeCountry] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeStreetNCOAStatus] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeLatitude] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeLongitude] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressThreeIsCleanStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourStreet] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourSuite] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourCity] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourState] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourZip] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourPlus4] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourCounty] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourCountry] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourStreetNCOAStatus] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourLatitude] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourLongitude] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressFourIsCleanStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhonePrimary] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhonePrimaryIsCleanStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhonePrimaryDNC] [bit] NULL,
[PhoneHome] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneHomeIsCleanStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneHomeDNC] [bit] NULL,
[PhoneCell] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneCellIsCleanStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneCellDNC] [bit] NULL,
[PhoneBusiness] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneBusinessIsCleanStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneBusinessDNC] [bit] NULL,
[PhoneFax] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneFaxIsCleanStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneFaxDNC] [bit] NULL,
[PhoneOther] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneOtherIsCleanStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneOtherDNC] [bit] NULL,
[ExtAttribute1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute2] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute3] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute4] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute5] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute6] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute7] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute8] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute9] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute10] [nvarchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute11] [decimal] (18, 6) NULL,
[ExtAttribute12] [decimal] (18, 6) NULL,
[ExtAttribute13] [decimal] (18, 6) NULL,
[ExtAttribute14] [decimal] (18, 6) NULL,
[ExtAttribute15] [decimal] (18, 6) NULL,
[ExtAttribute16] [decimal] (18, 6) NULL,
[ExtAttribute17] [decimal] (18, 6) NULL,
[ExtAttribute18] [decimal] (18, 6) NULL,
[ExtAttribute19] [decimal] (18, 6) NULL,
[ExtAttribute20] [decimal] (18, 6) NULL,
[ExtAttribute21] [datetime] NULL,
[ExtAttribute22] [datetime] NULL,
[ExtAttribute23] [datetime] NULL,
[ExtAttribute24] [datetime] NULL,
[ExtAttribute25] [datetime] NULL,
[ExtAttribute26] [datetime] NULL,
[ExtAttribute27] [datetime] NULL,
[ExtAttribute28] [datetime] NULL,
[ExtAttribute29] [datetime] NULL,
[ExtAttribute30] [datetime] NULL,
[ExtAttribute31] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute32] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute33] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute34] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtAttribute35] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSCreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSUpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSCreatedDate] [datetime] NULL,
[SSUpdatedDate] [datetime] NULL,
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NOT NULL,
[UpdatedDate] [datetime] NOT NULL,
[AccountId] [int] NULL,
[IsDeleted] [bit] NOT NULL,
[DeleteDate] [datetime] NULL,
[IsBusiness] [bit] NULL,
[SSB_CRMSYSTEM_ACCT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SSB_CRMSYSTEM_HOUSEHOLD_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [mdm].[CompositeEmail] ADD CONSTRAINT [PK_CompositeEmail] PRIMARY KEY CLUSTERED  ([DimEmailID])
GO
