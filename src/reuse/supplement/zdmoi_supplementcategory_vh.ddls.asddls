@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplement Category Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
 serviceQuality: #X,
 sizeCategory: #S,
 dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS

define view entity ZDMOI_SupplementCategory_VH
  as select from ZDMOsupplcat

  association [0..*] to ZDMOI_SupplementCategory_VH_T as _Text on $projection.SupplementCategory = _Text.SupplementCategory

{
      @UI.textArrangement: #TEXT_ONLY
      @UI.lineItem: [{importance: #HIGH}]
      @ObjectModel.text.association: '_Text'
  key supplement_category as SupplementCategory,

      _Text
}
