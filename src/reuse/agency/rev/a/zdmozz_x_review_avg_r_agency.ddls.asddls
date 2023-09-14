extend view entity ZDMOR_AgencyTP with
association [0..1] to ZDMOZZ_P_Agency_Review_Avg as ZZ_ReviewAvgZAG on ZZ_ReviewAvgZAG.AgencyId = Agency.AgencyID
{
  ZZ_ReviewAvgZAG
}
