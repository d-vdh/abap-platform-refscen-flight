@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Overall Status Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
 serviceQuality: #A,
 sizeCategory: #S,
 dataClass: #MASTER
 }
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZAI_DMOI_Overall_Status_VH
  as select from ZAI_DMOoall_stat

  association [0..*] to ZAI_DMOI_Overall_Status_VH_Text as _Text on $projection.OverallStatus = _Text.OverallStatus

{
      @UI.textArrangement: #TEXT_ONLY
      @UI.lineItem: [{importance: #HIGH}]
      @ObjectModel.text.association: '_Text'
  key overall_status as OverallStatus,

      _Text
}
