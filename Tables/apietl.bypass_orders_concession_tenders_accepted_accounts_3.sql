CREATE TABLE [apietl].[bypass_orders_concession_tenders_accepted_accounts_3]
(
[ETL__bypass_orders_concession_tenders_accepted_accounts_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_concession_tenders_accepted_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_concession_tenders_accepted_accounts_3] ADD CONSTRAINT [PK__bypass_o__831E1A3BBEE3E8F5] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_concession_tenders_accepted_accounts_id])
GO
