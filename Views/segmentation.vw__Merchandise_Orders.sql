SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [segmentation].[vw__Merchandise_Orders] 

AS



SELECT
       ssbid.SSB_CRMSYSTEM_CONTACT_ID AS SSB_CRMSYSTEM_CONTACT_ID
      , u.BUS_DAT AS [OrderDate]
      , CATEG_COD AS [ProductCategory]
      , SUBCAT_COD AS [ProductSubCategory]
      , ITEM_NO AS [ProductID]
      , DESCR AS [ProductName]
      ,QTY_SOLD AS QuantitySold
      ,PRC AS [UnitPrice]
      ,(CAST(QTY_SOLD AS numeric) * CAST(PRC AS numeric)) AS [OrderTotal]

FROM [ods].[NCR_SalesLineItems] u WITH (NOLOCK) 
INNER JOIN ods.NCR_SalesHeaders h WITH (NOLOCK) ON u.DOC_ID = h.DOC_ID
INNER JOIN dbo.dimcustomerssbid SSBID WITH (NOLOCK) 
	ON SSBID.SourceSystem = 'NCR_Retail' and SSBID.SSID = h.CUST_NO
				
WHERE   u.BUS_DAT >= (GETDATE() - 	365)





GO
