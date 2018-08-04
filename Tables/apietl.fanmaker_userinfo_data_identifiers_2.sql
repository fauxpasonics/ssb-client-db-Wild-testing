CREATE TABLE [apietl].[fanmaker_userinfo_data_identifiers_2]
(
[ETL__fanmaker_userinfo_data_identifiers_id] [uniqueidentifier] NOT NULL,
[ETL__fanmaker_userinfo_data_id] [uniqueidentifier] NULL,
[identifier] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[active] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[fanmaker_userinfo_data_identifiers_2] ADD CONSTRAINT [PK__fanmaker__94730ABAA97F74EE] PRIMARY KEY CLUSTERED  ([ETL__fanmaker_userinfo_data_identifiers_id])
GO
