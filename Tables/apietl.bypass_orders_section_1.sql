CREATE TABLE [apietl].[bypass_orders_section_1]
(
[ETL__bypass_orders_section_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_section_1] ADD CONSTRAINT [PK__bypass_o__C4590B3A0FAE0C06] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_section_id])
GO
