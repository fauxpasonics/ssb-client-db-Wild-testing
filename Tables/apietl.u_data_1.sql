CREATE TABLE [apietl].[u_data_1]
(
[u_data_id] [uniqueidentifier] NOT NULL,
[u_id] [uniqueidentifier] NULL,
[username] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created_at] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[u_data_1] ADD CONSTRAINT [PK__u_data_1__D12729C2B576705D] PRIMARY KEY CLUSTERED  ([u_data_id])
GO
