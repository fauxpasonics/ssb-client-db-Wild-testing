SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [segmentation].[vw__CRM_TouchPointGoal]
AS

SELECT dc.SSB_CRMSYSTEM_CONTACT_ID 
, client_attendance, client_delivery, client_directornote, client_directorphonecall, client_fanrelationssatisfaction
, client_handnote, client_inseatvisitinarena, client_lastgroupdeclinereason, client_lastseasongrouprevenue
, client_lastseasongroupseats, client_lasttouchpointcompleted, client_lasttouchpointdate, client_likelihoodtorenew
, client_outofofficevisit, client_overallsatisfaction, client_phonecall, client_plantype, client_specialevent
, client_stadiumseries, client_stadiumseriesname, client_teamperfomancesatisfaction, client_tenure, client_wrlogins
, createdbyname, createdon, createdonbehalfbyname
, koreps_currentcost, koreps_currentcost_base, koreps_currentperceivedvalue
, koreps_currentperceivedvalue_base, koreps_currentpoints, koreps_enddate, koreps_name
, koreps_pointsremaining, koreps_seasonidname, koreps_startdate, koreps_targetvalue
, modifiedbyname, modifiedon , modifiedonbehalfbyname
, owneridname, statecode, statecodename, statuscode, statuscodename
FROM Wild_Reporting.[Prodcopy].[TouchPointGoal] pc (NOLOCK)
JOIN [dbo].[vwDimCustomer_ModAcctId] dc ON dc.SourceSystem = 'Dynamics CRM - Contacts' AND  CAST(pc.koreps_contactid AS NVARCHAR(100)) = dc.SSID









GO
