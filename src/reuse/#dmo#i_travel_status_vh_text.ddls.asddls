@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Status Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
 serviceQuality: #A,
 sizeCategory: #S,
 dataClass: #MASTER
 }
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZAI_DMOI_Travel_Status_VH_Text
  as select from ZAI_DMOtrvl_stat_t

  association [1..1] to ZAI_DMOI_Travel_Status_VH as _TravelStatus on $projection.TravelStatus = _TravelStatus.TravelStatus

{
      @ObjectModel.text.element: ['Text']
  key travel_status as TravelStatus,

      @Semantics.language: true
  key language      as Language,

      @Semantics.text: true
      text          as Text,

      _TravelStatus
}
