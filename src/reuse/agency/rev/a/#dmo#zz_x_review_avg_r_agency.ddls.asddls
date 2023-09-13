extend view entity ZAI_DMOR_AgencyTP with
association [0..1] to ZAI_DMOZZ_P_Agency_Review_Avg as ZAI_DMOZZ_ReviewAvgZAG on ZAI_DMOZZ_ReviewAvgZAG.AgencyId = Agency.AgencyID
{
  ZAI_DMOZZ_ReviewAvgZAG
}
