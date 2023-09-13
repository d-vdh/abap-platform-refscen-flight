extend view entity ZDMOC_AgencyTP with
{
  @UI.facet: [
      {
        id:            'Review',
        purpose:       #STANDARD,
        type:          #LINEITEM_REFERENCE,
        label:         'Review',
        position:      20,
        targetElement: 'ZDMOZZ_ReviewZAG'
      }
    ]
  Agency.ZDMOZZ_ReviewZAG : redirected to composition child ZDMOZZ_C_Agency_ReviewTP
}