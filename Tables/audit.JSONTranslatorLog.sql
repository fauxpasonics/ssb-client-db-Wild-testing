CREATE TABLE [audit].[JSONTranslatorLog]
(
[AsOf] [datetime] NOT NULL CONSTRAINT [DF__JSONTransl__AsOf__1B8F50CA] DEFAULT (dateadd(hour,(-7),getdate())),
[SourceTable] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [audit].[JSONTranslatorLog] ADD CONSTRAINT [PK__JSONTran__02FDDA6D0ACA72AD] PRIMARY KEY CLUSTERED  ([AsOf])
GO
