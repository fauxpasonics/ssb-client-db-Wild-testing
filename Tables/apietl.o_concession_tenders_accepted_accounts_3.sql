CREATE TABLE [apietl].[o_concession_tenders_accepted_accounts_3]
(
[o_concession_tenders_accepted_accounts_id] [uniqueidentifier] NOT NULL,
[o_concession_tenders_accepted_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_concession_tenders_accepted_accounts_3] ADD CONSTRAINT [PK__o_conces__69AFFB777C00861B] PRIMARY KEY CLUSTERED  ([o_concession_tenders_accepted_accounts_id])
GO
