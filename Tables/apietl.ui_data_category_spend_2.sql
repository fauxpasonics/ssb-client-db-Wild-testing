CREATE TABLE [apietl].[ui_data_category_spend_2]
(
[ui_data_category_spend_id] [uniqueidentifier] NOT NULL,
[ui_data_id] [uniqueidentifier] NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[spend] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[ui_data_category_spend_2] ADD CONSTRAINT [PK__ui_data___F8F6430CABBC35D4] PRIMARY KEY CLUSTERED  ([ui_data_category_spend_id])
GO
