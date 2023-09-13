@EndUserText.label: 'Agency Extension: Derived Event'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZAI_DMOZZ_P_AgencyReview_Contact
  as select from ZAI_DMOI_Agency
{
  key AgencyID,
      Name,
      PhoneNumber
}
