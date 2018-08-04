CREATE TABLE [apietl].[bypass_orders_concession_1]
(
[ETL__bypass_orders_concession_id] [uniqueidentifier] NOT NULL,
[ETL__bypass_orders_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[uuid] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[signature_on_tablet] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[status] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[alcohol_closed] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[print_receipt_twice] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sqs_queue_url] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[allow_tips] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[open] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[alcohol_on] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[auto_print_credit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[auto_print_other] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[auto_print_remote_orders] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[auto_print_cash] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_surcharge] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[surcharge_is_percentage] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[surcharge_tax_rate] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[inseat_order_surcharge] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[inseat_surcharge_is_percentage] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[inseat_surcharge_tax_rate] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[allow_print_order_taker_tips_report] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[server_station_auto_logout_enabled] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[server_station_auto_logout_timeout] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[has_pickup?] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[has_inseat?] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[is_merchandise?] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[bypass_orders_concession_1] ADD CONSTRAINT [PK__bypass_o__D0CEC2EBFD62BC08] PRIMARY KEY CLUSTERED  ([ETL__bypass_orders_concession_id])
GO
