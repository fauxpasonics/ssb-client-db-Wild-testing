CREATE TABLE [apietl].[fanmaker_userinfo_0]
(
[ETL__fanmaker_userinfo_id] [uniqueidentifier] NOT NULL,
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__fanmaker___inser__7326CA54] DEFAULT (getutcdate()),
[status] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[success] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__multi_query_value_for_audit] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[fanmaker_userinfo_0] ADD CONSTRAINT [PK__fanmaker__C3CC43D9483230FE] PRIMARY KEY CLUSTERED  ([ETL__fanmaker_userinfo_id])
GO
