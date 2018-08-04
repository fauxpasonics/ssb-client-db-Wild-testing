CREATE TABLE [apietl].[o_checks_1]
(
[o_checks_id] [uniqueidentifier] NOT NULL,
[o_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[uuid] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payor_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_card_type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[payment_account] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_uuid] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paid_amount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tip_amount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[subtotal] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[discounts] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[surchage] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tax] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[balance_due] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[total] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[change_due] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tablet_created_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[updated_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_checks_1] ADD CONSTRAINT [PK__o_checks__521AF1A932243487] PRIMARY KEY CLUSTERED  ([o_checks_id])
GO
