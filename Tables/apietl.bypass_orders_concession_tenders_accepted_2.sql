CREATE TABLE [apietl].[bypass_orders_concession_tenders_accepted_2]
(
[ETL__bypass_orders_concession_tenders_accepted_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_concession_id] [uniqueidentifier] NULL,
[friendly_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[amount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_concession_tenders_accepted_2] ADD CONSTRAINT [PK__bypass_o__C95181E41E62531C] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_concession_tenders_accepted_id])
GO
