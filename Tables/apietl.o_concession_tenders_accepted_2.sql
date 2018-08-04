CREATE TABLE [apietl].[o_concession_tenders_accepted_2]
(
[o_concession_tenders_accepted_id] [uniqueidentifier] NOT NULL,
[o_concession_id] [uniqueidentifier] NULL,
[friendly_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_concession_tenders_accepted_2] ADD CONSTRAINT [PK__o_conces__91D0D403C0DC4BCF] PRIMARY KEY CLUSTERED  ([o_concession_tenders_accepted_id])
GO
