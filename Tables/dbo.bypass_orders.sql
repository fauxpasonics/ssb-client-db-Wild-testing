CREATE TABLE [dbo].[bypass_orders]
(
[authorization_payment] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tippable] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[concession] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[id] [int] NULL,
[friendly_id] [int] NULL,
[discounts_total] [decimal] (18, 0) NULL,
[sales_tax_total] [decimal] (18, 0) NULL,
[location_id] [int] NULL,
[number_of_guests] [int] NULL,
[fulfillment_groups] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[line_items] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[adjustments] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[checks] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payments] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[errors] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seat_number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[service_location_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[loyalty_account] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vendor_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[section] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[row] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gratuity_configuration_snapshot] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created_at] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[total] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tip] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[updated_at] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[uuid] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[subtotal] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seat] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_taker_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[surcharge] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[balance_due] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[device_serial_number] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO