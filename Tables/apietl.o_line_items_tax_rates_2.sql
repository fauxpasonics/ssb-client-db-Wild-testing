CREATE TABLE [apietl].[o_line_items_tax_rates_2]
(
[o_line_items_tax_rates_id] [uniqueidentifier] NOT NULL,
[o_line_items_id] [uniqueidentifier] NULL,
[receipt_label] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rate] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_line_items_tax_rates_2] ADD CONSTRAINT [PK__o_line_i__5381BC360BE273B2] PRIMARY KEY CLUSTERED  ([o_line_items_tax_rates_id])
GO
