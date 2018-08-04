CREATE TABLE [zzz].[ods__TM_Solicit_bkp_700Rollout]
(
[id] [bigint] NOT NULL IDENTITY(1, 1),
[solicitation_id] [bigint] NULL,
[solicitation_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicitation_desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[reason] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_datetime] [datetime] NULL,
[acct_id] [bigint] NULL,
[name_last] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name_last_first_mi] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_addr] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[campaign_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[campaign_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[drive_year] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[item_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[item_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[list_id] [bigint] NULL,
[list_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[list_count] [bigint] NULL,
[solicitation_goal] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicitation_cost] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contact_type_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contact_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicitation_category] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicitation_category_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[start_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[end_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[drop_datetime] [datetime] NULL,
[sent_datetime] [datetime] NULL,
[sent_count] [bigint] NULL,
[mm_email_id] [bigint] NULL,
[mm_cell_id] [bigint] NULL,
[mm_user_email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicitation_status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[benefits] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attachment_filename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[InsertDate] [datetime] NULL CONSTRAINT [DF__TM_Solici__Inser__038683F8] DEFAULT (getdate()),
[UpdateDate] [datetime] NULL CONSTRAINT [DF__TM_Solici__Updat__047AA831] DEFAULT (getdate()),
[SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HashKey] [binary] (32) NULL
)
WITH
(
DATA_COMPRESSION = PAGE
)
GO
ALTER TABLE [zzz].[ods__TM_Solicit_bkp_700Rollout] ADD CONSTRAINT [PK__TM_Solic__3213E83F62395BC4] PRIMARY KEY CLUSTERED  ([id]) WITH (DATA_COMPRESSION = PAGE)
GO
