@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Agency Review'
define view entity ZAI_DMOZZ_R_Agency_ReviewTP
  as select from ZAI_DMOZZ_I_Agency_Review
  association to parent ZAI_DMOR_AgencyTP as _Agency on $projection.AgencyId = _Agency.AgencyID
{
  key AgencyId,
  key ReviewId,
      Rating,
      FreeTextComment,
      HelpfulCount,
      HelpfulTotal,
      Reviewer,
      LocalCreatedAt,
      LocalLastChangedAt,
      _Agency
}
