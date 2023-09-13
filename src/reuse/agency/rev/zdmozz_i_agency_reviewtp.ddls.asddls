@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Agency Review'
define view entity ZDMOZZ_I_Agency_ReviewTP
  as projection on ZDMOZZ_R_Agency_ReviewTP
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
      _Agency : redirected to parent ZDMOI_AgencyTP
}
