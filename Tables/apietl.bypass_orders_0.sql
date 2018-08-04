CREATE TABLE [apietl].[bypass_orders_0]
(
[ETL__bypass_orders_id] [uniqueidentifier] NOT NULL,
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__bypass_or__inser__31C4B1F9] DEFAULT (getutcdate()),
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[friendly_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[total] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tippable] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tip] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[updated_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[errors] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[uuid] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[subtotal] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seat] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seat_number] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_taker_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[discounts_total] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sales_tax_total] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[surcharge] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[balance_due] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[device_serial_number] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[location_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[service_location_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[loyalty_account] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[number_of_guests] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vendor_id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[concession] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[section] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[row] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gratuity_configuration_snapshot] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_0] ADD CONSTRAINT [PK__bypass_o__10B6259C77674757] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_id])
GO
