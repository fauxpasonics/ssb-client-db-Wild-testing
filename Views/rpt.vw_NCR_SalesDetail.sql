SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
 CREATE VIEW  [rpt].[vw_NCR_SalesDetail] AS 
(
SELECT 
BUS_DAT, 
CASE WHEN  BUS_DAT BETWEEN'2015-07-01'AND'2016-06-30'THEN'2015-2016'
WHEN BUS_DAT BETWEEN'2016-07-01'AND'2017-06-30' THEN '2016-2017'
WHEN BUS_DAT BETWEEN'2017-07-01'AND'2018-06-30'THEN'2017-2018'
 ELSE 'Other'END  AS SEASON_NAME,
DOC_ID, LIN_SEQ_NO, EVENT_NO, STR_ID, STORE_NAME, STA_ID, TKT_NO, LIN_GUID, LIN_TYP, PAR_ITEM_NO, KIT_COMP_QTY, STK_LOC_ID,ITEM_VEND_NO, QTY_SOLD, SELL_UNIT, QTY_SOLD_STK_UNIT,  PRC, COST, EXT_COST, EXT_PRC, DIM_1_UPR, DIM_2_UPR, DIM_3_UPR
,c.CATEG_COD, c.DESCR AS CATEG_DESCR, sli.SUBCAT_COD, sli.CATEG_SUBCAT
,i.ITEM_NO, i.DESCR AS ITEM_DESCR, STAT, i.ITEM_TYP, i.TRK_METH, i.IS_TXBL, STK_UNIT, WEIGHT, CUBE, CREATE_DAT, GRID_DIM_1_TAG, GRID_DIM_2_TAG, GRID_DIM_3_TAG, i.BARCOD, IS_ECOMM_ITEM, LST_COST, IS_KIT_PAR, IS_DISCNTBL, i.PRC_1,  HTML_DESCR
FROM [rpt].[vw_NCR_SalesLineItems] sli (NOLOCK)
LEFT JOIN [ods].[NCR_Categories] c (NOLOCK) ON sli.CATEG_COD = c.CATEG_COD
LEFT JOIN [ods].[NCR_Items] i (NOLOCK) ON sli.ITEM_NO = i.ITEM_NO
)
GO
