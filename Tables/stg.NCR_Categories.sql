CREATE TABLE [stg].[NCR_Categories]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__NCR_Categ__ETL_C__458D4A32] DEFAULT (getdate()),
[ETL_SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CATEG_COD] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCR] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LST_MAINT_DT] [date] NULL
)
GO
