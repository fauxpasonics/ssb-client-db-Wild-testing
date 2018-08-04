SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [segmentation].[vw__CRM_PhoneCall]
AS

SELECT dc.SSB_CRMSYSTEM_CONTACT_ID 
, activityid, activitytypecode, activitytypecodename, actualdurationminutes, actualend, actualstart, category, client_touchpointcampaign, createdbyname, createdon, createdonbehalfbyname, directioncode, directioncodename, importsequencenumber, isbilled, isbilledname, isregularactivity, isregularactivityname, isworkflowcreated, isworkflowcreatedname, kore_activitycategoryid, kore_activitycategoryidname, kore_activitysubcategoryid, kore_activitysubcategoryidname, kore_additionalparameters, kore_campaignprospectid, kore_campaignprospectidname, kore_category, kore_categoryname, kore_colorcode, kore_colorcodename, kore_importid, kore_priorconversations, kore_quickcampaignid, kore_secondarynameid, kore_subcategory, kore_subcategoryname, kore_touchpoint, kore_touchpointcomments, kore_touchpointid, kore_touchpointidname, koreps_campaignid, koreps_colorcode, koreps_dealsheetid, koreps_donotstream, koreps_donotstreamname, koreps_premiumdealid, koreps_savescreeninitiated, koreps_savescreeninitiatedname, koreps_syncpriority, koreps_touchpointid, leftvoicemail, leftvoicemailname, modifiedby, modifiedbyname, modifiedbyyominame, modifiedon, modifiedonbehalfby, modifiedonbehalfbyname, modifiedonbehalfbyyominame, new_cdr_id, overriddencreatedon, ownerid, owneridname, owneridtype, owneridyominame, owningbusinessunit, owningteam, owninguser, phonenumber, prioritycode, prioritycodename,  scheduleddurationminutes, scheduledend, scheduledstart, serviceid, stageid, statecode, statecodename, statuscode, statuscodename, str_marketingphonecallsalestypeid, str_marketingphonecallsalestypeidname, str_marketingphonecallservicetypeid, str_marketingphonecallservicetypeidname, str_temp, str_touchpoint, str_touchpointname, subcategory

FROM Wild_Reporting.[Prodcopy].[PhoneCall] pc (NOLOCK) 
JOIN [dbo].[vwDimCustomer_ModAcctId] dc ON dc.SourceSystem = 'Dynamics CRM - Contacts' AND CAST(pc.regardingobjectid AS NVARCHAR(100)) = dc.SSID 
WHERE pc.regardingobjecttypecode = 'contact'










GO
