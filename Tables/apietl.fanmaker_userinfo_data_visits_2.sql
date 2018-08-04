CREATE TABLE [apietl].[fanmaker_userinfo_data_visits_2]
(
[ETL__fanmaker_userinfo_data_visits_id] [uniqueidentifier] NOT NULL,
[ETL__fanmaker_userinfo_data_id] [uniqueidentifier] NULL,
[last_login] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[desktop] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mobile] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[fanmaker_userinfo_data_visits_2] ADD CONSTRAINT [PK__fanmaker__4C61BFCB84B789E5] PRIMARY KEY CLUSTERED  ([ETL__fanmaker_userinfo_data_visits_id])
GO
