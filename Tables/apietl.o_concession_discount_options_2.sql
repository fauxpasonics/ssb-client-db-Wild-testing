CREATE TABLE [apietl].[o_concession_discount_options_2]
(
[o_concession_discount_options_id] [uniqueidentifier] NOT NULL,
[o_concession_id] [uniqueidentifier] NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[percentage] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[amount] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_concession_discount_options_2] ADD CONSTRAINT [PK__o_conces__CEE7A49639B9D86E] PRIMARY KEY CLUSTERED  ([o_concession_discount_options_id])
GO
