extend view entity ZDMOR_AgencyTP with
association [0..1] to ZDMOZZ_P_Agency_Review_Avg as ZDMOZZ_ReviewAvgZAG on ZDMOZZ_ReviewAvgZAG.AgencyId = Agency.AgencyID
{
  ZDMOZZ_ReviewAvgZAG
}
