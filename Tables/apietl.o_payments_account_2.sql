CREATE TABLE [apietl].[o_payments_account_2]
(
[o_payments_account_id] [uniqueidentifier] NOT NULL,
[o_payments_id] [uniqueidentifier] NULL,
[id] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_payments_account_2] ADD CONSTRAINT [PK__o_paymen__3F4BF6DA4C9A0901] PRIMARY KEY CLUSTERED  ([o_payments_account_id])
GO
