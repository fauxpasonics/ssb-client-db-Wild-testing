SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [segmentation].[vw__CRM_TicketSalesOpportunity]
AS

SELECT dc.SSB_CRMSYSTEM_CONTACT_ID 
, client_contestteamname, client_currentpaymentplan, client_fencesittertype, client_fse, client_originalplanvalue
, client_plantypes, client_renewalstatus, client_rrpointshavebeendeposited, client_rrpointshavebeendepositedname
, client_wildrewardsrenewalincentive, client_wildrewardsrenewalincentivename, createdbyname
, createdon, createdonbehalfbyname 
, kore_account, kore_accountname, kore_boxofficeusername
, kore_campaign, kore_campaignname, kore_completedtasks
, kore_datewon, kore_declineorderreason
, kore_declineorderreasonname, kore_declineorderreasonother, kore_estimatedclosedate, kore_name
, kore_nextscheduledactivity, kore_numberoftickets, kore_opportunitysize, kore_paymentdetails, kore_paymentdetailsname, kore_paymentplan
, kore_paymentplanname, kore_primaryobjection, kore_primaryobjectionname
, kore_product, kore_productname, kore_rating, kore_ratingname, kore_reasonforbuying, kore_reasonforbuyingname
, kore_salesstep, kore_salesstepname, kore_salestype, kore_salestypename, kore_season
, kore_submitforanotherrep, kore_submitforanotherrepname, kore_submittousername
, kore_ticketorderdate, kore_ticketorderprocessedon, kore_ticketordertype
, kore_ticketordertypename, koreps_addons, koreps_addonsother, koreps_conversation
, koreps_conversationname, koreps_leadsource, koreps_leadsourcename, koreps_numberoftickets2, koreps_oppsize
, koreps_oppsize_base, koreps_oppsize2, koreps_oppsize2_base, modifiedbyname, modifiedon, modifiedonbehalfby
, modifiedonbehalfbyname,  overriddencreatedon, owneridname, owneridtype
, statecode, statecodename, statuscode, statuscodename

FROM Wild_Reporting.[Prodcopy].[TicketSalesOpportunity] pc (NOLOCK)
JOIN [dbo].[vwDimCustomer_ModAcctId] dc ON dc.SourceSystem = 'Dynamics CRM - Contacts' AND CAST(pc.kore_contact AS NVARCHAR(100)) = dc.SSID









GO
