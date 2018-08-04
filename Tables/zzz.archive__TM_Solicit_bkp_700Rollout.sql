CREATE TABLE [zzz].[archive__TM_Solicit_bkp_700Rollout]
(
[solicitation_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicitation_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicitation_desc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[reason] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_user] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upd_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acct_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name_last] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name_last_first_mi] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[email_addr] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[campaign_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[campaign_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[drive_year] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[item_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[item_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[list_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[list_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[list_count] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicitation_goal] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicitation_cost] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contact_type_code] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contact_type] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicitation_category] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicitation_category_name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[start_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[end_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[drop_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sent_datetime] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sent_count] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mm_email_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mm_cell_id] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mm_user_email] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[solicitation_status] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[benefits] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[attachment_filename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NULL CONSTRAINT [DF__TM_Solici__Creat__3EA749C6] DEFAULT (getdate())
)
WITH
(
DATA_COMPRESSION = PAGE
)
GO
CREATE NONCLUSTERED INDEX [IDX_CreatedDate] ON [zzz].[archive__TM_Solicit_bkp_700Rollout] ([CreatedDate])
GO
CREATE NONCLUSTERED INDEX [IDX_SourceFileName] ON [zzz].[archive__TM_Solicit_bkp_700Rollout] ([SourceFileName])
GO
