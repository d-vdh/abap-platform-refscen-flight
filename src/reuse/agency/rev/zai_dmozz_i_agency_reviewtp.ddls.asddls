@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Agency Review'
define view entity ZAI_DMOZZ_I_Agency_ReviewTP
  as projection on ZAI_DMOZZ_R_Agency_ReviewTP
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
      /* Associations */
      _Agency : redirected to parent ZAI_DMOI_AgencyTP
}
