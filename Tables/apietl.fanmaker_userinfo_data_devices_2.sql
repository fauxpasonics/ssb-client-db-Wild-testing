CREATE TABLE [apietl].[fanmaker_userinfo_data_devices_2]
(
[ETL__fanmaker_userinfo_data_devices_id] [uniqueidentifier] NOT NULL,
[ETL__fanmaker_userinfo_data_id] [uniqueidentifier] NULL,
[device_type] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[os] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[app_name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[fanmaker_userinfo_data_devices_2] ADD CONSTRAINT [PK__fanmaker__FDC4A53F07219632] PRIMARY KEY CLUSTERED  ([ETL__fanmaker_userinfo_data_devices_id])
GO
