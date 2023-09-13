extend view entity ZAI_DMOC_AgencyTP with
{
  @UI.facet: [
      {
        id:            'Review',
        purpose:       #STANDARD,
        type:          #LINEITEM_REFERENCE,
        label:         'Review',
        position:      20,
        targetElement: 'ZAI_DMOZZ_ReviewZAG'
      }
    ]
  Agency.ZAI_DMOZZ_ReviewZAG : redirected to composition child ZAI_DMOZZ_C_Agency_ReviewTP
}
