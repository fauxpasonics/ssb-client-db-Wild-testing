CREATE TABLE [apietl].[o_payments_merchant_receipt_info_2]
(
[o_payments_merchant_receipt_info_id] [uniqueidentifier] NOT NULL,
[o_payments_id] [uniqueidentifier] NULL,
[Reference Number] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [apietl].[o_payments_merchant_receipt_info_2] ADD CONSTRAINT [PK__o_paymen__5988DD534686295A] PRIMARY KEY CLUSTERED  ([o_payments_merchant_receipt_info_id])
GO
