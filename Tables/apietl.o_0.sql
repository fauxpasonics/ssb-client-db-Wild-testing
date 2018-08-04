CREATE TABLE [apietl].[o_0]
(
[o_id] [uniqueidentifier] NOT NULL,
[session_id] [uniqueidentifier] NOT NULL,
[insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__o_0__insert_date__16BA1F54] DEFAULT (getutcdate()),
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
ALTER TABLE [apietl].[o_0] ADD CONSTRAINT [PK__o_0__904BC20E56DA5960] PRIMARY KEY CLUSTERED  ([o_id])
GO
