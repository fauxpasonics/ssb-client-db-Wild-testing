SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [rpt].[vw_NCR_SalesLineItems] AS (

SELECT 
 BUS_DAT, DOC_ID, LIN_SEQ_NO, EVENT_NO, STR_ID
, CASE WHEN STR_ID = '01' THEN 'Xcel Center – Lodge'
	   WHEN STR_ID = '02' THEN 'Xcel Center – Section 101'
	   WHEN STR_ID = '03' THEN 'Xcel Center – Section 119'
	   WHEN STR_ID = '04' THEN 'Xcel Center – Section 200'
	   WHEN STR_ID = '05' THEN 'Xcel Center – Section 205'
	   WHEN STR_ID = '06' THEN 'Xcel Center – Gate 2'
	   WHEN STR_ID = '07' THEN 'Xcel Center – Club level'
	   WHEN STR_ID = '31' THEN 'Maplewood Mall'
	   WHEN STR_ID = '41' THEN 'Southdale Mall'
	   WHEN STR_ID = '61' THEN 'Minnesota Lynx Events (Xcel Center)'
	   WHEN STR_ID = '81' THEN 'Remote event sales (State Fair)'
	   WHEN STR_ID = '91' THEN 'Internet Sales'
	   WHEN STR_ID = '95' THEN  'Offsite SOH'
	   WHEN STR_ID = '98' THEN 'Consignment Sales' ELSE 'Unknown' END AS STORE_NAME
, STA_ID, TKT_NO, LIN_GUID, LIN_TYP, PAR_ITEM_NO, KIT_COMP_QTY, STK_LOC_ID, BARCOD, ITEM_NO, DESCR, CATEG_COD, SUBCAT_COD, CATEG_SUBCAT, ITEM_VEND_NO, ITEM_TYP, TRK_METH, IS_TXBL, QTY_SOLD, SELL_UNIT, QTY_SOLD_STK_UNIT, PRC_1, PRC, COST, EXT_COST, EXT_PRC, DIM_1_UPR, DIM_2_UPR, DIM_3_UPR, LST_MAINT_DT
FROM [ods].[NCR_SalesLineItems] (NOLOCK)

) 
GO
