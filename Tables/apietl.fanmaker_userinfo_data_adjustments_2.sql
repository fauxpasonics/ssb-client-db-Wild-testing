CREATE TABLE [apietl].[fanmaker_userinfo_data_adjustments_2]
(
[ETL__fanmaker_userinfo_data_adjustments_id] [uniqueidentifier] NOT NULL,
[ETL__fanmaker_userinfo_data_id] [uniqueidentifier] NULL,
[date] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[reason] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[points] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[fanmaker_userinfo_data_adjustments_2] ADD CONSTRAINT [PK__fanmaker__32118C06F14BCC63] PRIMARY KEY CLUSTERED  ([ETL__fanmaker_userinfo_data_adjustments_id])
GO
