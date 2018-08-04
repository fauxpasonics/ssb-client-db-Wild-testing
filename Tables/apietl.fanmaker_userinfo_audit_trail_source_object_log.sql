CREATE TABLE [apietl].[fanmaker_userinfo_audit_trail_source_object_log]
(
[ETL__audit_id] [uniqueidentifier] NOT NULL,
[ETL__fanmaker_userinfo_id] [uniqueidentifier] NULL,
[ETL__session_id] [uniqueidentifier] NOT NULL,
[ETL__insert_datetime] [datetime] NOT NULL CONSTRAINT [DF__fanmaker___inser__493B7D80] DEFAULT (getutcdate()),
[json_payload] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[raw_response] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[fanmaker_userinfo_audit_trail_source_object_log] ADD CONSTRAINT [PK__fanmaker__5AF33E335262B79B] PRIMARY KEY CLUSTERED  ([ETL__audit_id])
GO
