@EndUserText.label: 'Agency Extension: Derived Event'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZDMOZZ_P_AgencyReview_Contact
  as select from ZDMOI_Agency
{
  key AgencyID,
      Name,
      PhoneNumber
}
