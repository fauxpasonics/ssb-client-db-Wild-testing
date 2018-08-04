CREATE TABLE [apietl].[fanmaker_userinfo_data_activities_2]
(
[ETL__fanmaker_userinfo_data_activities_id] [uniqueidentifier] NOT NULL,
[ETL__fanmaker_userinfo_data_id] [uniqueidentifier] NULL,
[identity] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[subtype] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[subject] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[source_url] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[worth] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[awarded] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[fanmaker_userinfo_data_activities_2] ADD CONSTRAINT [PK__fanmaker__6F71C66EEDCEF5BC] PRIMARY KEY CLUSTERED  ([ETL__fanmaker_userinfo_data_activities_id])
GO
