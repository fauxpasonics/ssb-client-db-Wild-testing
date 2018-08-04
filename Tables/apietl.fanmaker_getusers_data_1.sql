CREATE TABLE [apietl].[fanmaker_getusers_data_1]
(
[ETL__fanmaker_getusers_data_id] [uniqueidentifier] NOT NULL,
[ETL__fanmaker_getusers_id] [uniqueidentifier] NULL,
[username] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[fanmaker_getusers_data_1] ADD CONSTRAINT [PK__fanmaker__04D36795F91FDE38] PRIMARY KEY CLUSTERED  ([ETL__fanmaker_getusers_data_id])
GO
