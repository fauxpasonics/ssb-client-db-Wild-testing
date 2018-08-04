CREATE TABLE [zzz].[ods__TM_Tex_bkp_700Rollout]
(
[id] [bigint] NOT NULL IDENTITY(1, 1),
[event_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[section_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[row_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_date] [datetime] NULL,
[event_time] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[seat_num] [int] NULL,
[num_seats] [int] NULL,
[last_seat] [int] NULL,
[seat_increment] [int] NULL,
[event_id] [int] NULL,
[section_id] [int] NULL,
[row_id] [int] NULL,
[owner_acct_id] [bigint] NULL,
[Company_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Owner_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Orig_purchase_price] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[order_num] [bigint] NULL,
[order_line_item] [bigint] NULL,
[order_line_item_seq] [int] NULL,
[plan_event_id] [int] NULL,
[plan_event_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[add_datetime] [datetime] NULL,
[add_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[assoc_acct_id] [bigint] NULL,
[forward_to_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[forward_to_email_addr] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[delivery_method] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[activity] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[activity_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[season_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[season_id] [int] NULL,
[season_year] [int] NULL,
[org_id] [int] NULL,
[org_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InsertDate] [datetime] NULL CONSTRAINT [DF__TM_Tex__InsertDa__075714DC] DEFAULT (getdate()),
[UpdateDate] [datetime] NULL CONSTRAINT [DF__TM_Tex__UpdateDa__084B3915] DEFAULT (getdate()),
[SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HashKey] [binary] (32) NULL,
[te_seller_credit_amount] [decimal] (18, 6) NULL,
[te_seller_fees] [decimal] (18, 6) NULL,
[te_posting_price] [decimal] (18, 6) NULL,
[te_buyer_fees_hidden] [decimal] (18, 6) NULL,
[te_purchase_price] [decimal] (18, 6) NULL,
[te_buyer_fees_not_hidden] [decimal] (18, 6) NULL,
[inet_delivery_fee] [decimal] (18, 6) NULL,
[inet_transaction_amount] [decimal] (18, 6) NULL
)
WITH
(
DATA_COMPRESSION = PAGE
)
GO
ALTER TABLE [zzz].[ods__TM_Tex_bkp_700Rollout] ADD CONSTRAINT [PK__TM_Tex__3213E83FF7694C64] PRIMARY KEY CLUSTERED  ([id]) WITH (DATA_COMPRESSION = PAGE)
GO
