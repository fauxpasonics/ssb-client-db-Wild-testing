CREATE TABLE [ods].[Eloqua_ActivityEmailSend]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Eloqua_Ac__ETL_C__06CD04F7] DEFAULT (getdate()),
[ETL_UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__Eloqua_Ac__ETL_U__07C12930] DEFAULT (getdate()),
[ETL_IsDeleted] [bit] NOT NULL CONSTRAINT [DF__Eloqua_Ac__ETL_I__08B54D69] DEFAULT ((0)),
[ETL_DeletedDate] [datetime] NULL,
[ETL_DeltaHashKey] [binary] (32) NULL,
[ID] [bigint] NOT NULL,
[Name] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedAt] [datetime] NULL,
[Type] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssetName] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssetId] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssetType] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactId] [bigint] NOT NULL,
[EmailName] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailWebLink] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailRecipientId] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubjectLine] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CampaignId] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [ods].[Eloqua_ActivityEmailSend] ADD CONSTRAINT [PK__Eloqua_A__3214EC27174B6DCD] PRIMARY KEY CLUSTERED  ([ID])
GO
CREATE NONCLUSTERED INDEX [IDX_ActivityEmailSend_ContactId] ON [ods].[Eloqua_ActivityEmailSend] ([ContactId])
GO
