CREATE TABLE [stg].[Bypass_StandsheetRows]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Bypass_St__ETL_C__082F3637] DEFAULT (getdate()),
[ETL_SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[standsheet_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[stock_item_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[price] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pre_event_transfer_in_count] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pre_event_transfer_out_count] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[actual_start_count] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mid_event_transfers_in_count] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mid_event_transfers_out_count] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gratis_count] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[waste_count] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[end_count] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[gos_count] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sold_count] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[variance] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
