CREATE TABLE [ods].[Eloqua_ActivityWebVisit]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Eloqua_Ac__ETL_C__236943A5] DEFAULT (getdate()),
[ETL_UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__Eloqua_Ac__ETL_U__245D67DE] DEFAULT (getdate()),
[ETL_IsDeleted] [bit] NOT NULL CONSTRAINT [DF__Eloqua_Ac__ETL_I__25518C17] DEFAULT ((0)),
[ETL_DeletedDate] [datetime] NULL,
[ETL_DeltaHashKey] [binary] (32) NULL,
[ID] [bigint] NOT NULL,
[Name] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedAt] [datetime] NULL,
[Type] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssetId] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssetType] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactId] [bigint] NOT NULL,
[Duration] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QueryString] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QueryStringDisplay] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Thread] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[URL] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ReferrerUrl] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VisitorExternalId] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NumberOfPages] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IpAddress] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstPageViewUrl] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [ods].[Eloqua_ActivityWebVisit] ADD CONSTRAINT [PK__Eloqua_A__3214EC2753C602E8] PRIMARY KEY CLUSTERED  ([ID])
GO
CREATE NONCLUSTERED INDEX [IDX_ActivityWebVisit_ContactId] ON [ods].[Eloqua_ActivityWebVisit] ([ContactId])
GO
