CREATE TABLE [zzz].[ods__TM_Arena_bkp_700Rollout]
(
[id] [bigint] NOT NULL IDENTITY(1, 1),
[arena_id] [int] NULL,
[arena_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[arena_abv] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[venue_city] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[venue_state] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[venue_zip] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[inet_arena_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[street_addr_1] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[street_addr_2] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[city] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[state] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[country] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[phone] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InsertDate] [datetime] NULL CONSTRAINT [DF__TM_Arena__Insert__42E1EEFE] DEFAULT (getdate()),
[UpdateDate] [datetime] NULL CONSTRAINT [DF__TM_Arena__Update__43D61337] DEFAULT (getdate()),
[SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HashKey] [binary] (32) NULL
)
WITH
(
DATA_COMPRESSION = PAGE
)
GO
ALTER TABLE [zzz].[ods__TM_Arena_bkp_700Rollout] ADD CONSTRAINT [PK__TM_Arena__3213E83F51C7B4C0] PRIMARY KEY CLUSTERED  ([id]) WITH (DATA_COMPRESSION = PAGE)
GO
