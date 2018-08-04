CREATE TABLE [zzz].[archive__TM_RetailEvent_bkp_700Rollout]
(
[retail_event_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[host_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[host_event_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[host_event_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_date] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[event_time] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attraction_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attraction_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[major_category_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[major_category_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[minor_category_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[minor_category_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[venue_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[venue_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[primary_act_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[primary_act] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[secondary_act_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[secondary_act] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NULL
)
GO
CREATE NONCLUSTERED INDEX [IDX_CreatedDate] ON [zzz].[archive__TM_RetailEvent_bkp_700Rollout] ([CreatedDate])
GO
CREATE NONCLUSTERED INDEX [IDX_SourceFileName] ON [zzz].[archive__TM_RetailEvent_bkp_700Rollout] ([SourceFileName])
GO
