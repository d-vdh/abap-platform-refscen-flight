extend view entity ZAI_DMOC_AgencyTP with
{
  @UI: {
    lineItem:   [ { position: 25, importance: #HIGH },
                  { position: 10, type: #FOR_ACTION, dataAction: 'ZAI_DMOcreateFromTemplate', label: 'Create from Template' } ],
    fieldGroup: [ { position: 25, qualifier: 'General_FG' } ],
    identification: [ { position: 10, type: #FOR_ACTION, dataAction: 'ZAI_DMOcreateFromTemplate', label: 'Create from Template' } ] 
  }
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.8
  Agency.ZAI_DMOZZSloganZAG
}
