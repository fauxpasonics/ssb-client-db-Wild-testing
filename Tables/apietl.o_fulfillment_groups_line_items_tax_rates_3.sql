CREATE TABLE [apietl].[o_fulfillment_groups_line_items_tax_rates_3]
(
[o_fulfillment_groups_line_items_tax_rates_id] [uniqueidentifier] NOT NULL,
[o_fulfillment_groups_line_items_id] [uniqueidentifier] NULL,
[receipt_label] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[rate] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_fulfillment_groups_line_items_tax_rates_3] ADD CONSTRAINT [PK__o_fulfil__F03D797575A84714] PRIMARY KEY CLUSTERED  ([o_fulfillment_groups_line_items_tax_rates_id])
GO
