CREATE TABLE [apietl].[bypass_orders_payments_1]
(
[ETL__bypass_orders_payments_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[amount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[last_four_digits] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[card_type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[uuid] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[status_message] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tip_amount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tippable] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[stored_value_code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[refunded_amount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[voided_amount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[device_serial_number] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[is_tip] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[child_tip_amount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[failed_amount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[cvm_indicator] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[entry_type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[language_code] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[card_pan] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[client_created_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_payments_1] ADD CONSTRAINT [PK__bypass_o__6EEE860ED22C0C7C] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_payments_id])
GO
