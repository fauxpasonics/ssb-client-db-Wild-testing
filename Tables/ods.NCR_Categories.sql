CREATE TABLE [ods].[NCR_Categories]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__NCR_Categ__ETL_C__41BCB94E] DEFAULT (getdate()),
[ETL_UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF__NCR_Categ__ETL_U__42B0DD87] DEFAULT (getdate()),
[ETL_IsDeleted] [bit] NOT NULL CONSTRAINT [DF__NCR_Categ__ETL_I__43A501C0] DEFAULT ((0)),
[ETL_DeletedDate] [datetime] NULL,
[ETL_DeltaHashKey] [binary] (32) NULL,
[ETL_SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CATEG_COD] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCR] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LST_MAINT_DT] [date] NULL
)
GO
