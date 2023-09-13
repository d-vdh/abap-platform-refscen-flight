@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplement Category Value Help Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
 serviceQuality: #X,
 sizeCategory: #S,
 dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZDMOI_SupplementCategory_VH_T
  as select from ZDMOsupplcat_t

  association [1..1] to ZDMOI_SupplementCategory_VH as _SupplmentCategory on $projection.SupplementCategory = _SupplmentCategory.SupplementCategory

{
      @ObjectModel.foreignKey.association: '_SupplmentCategory'
      @ObjectModel.text.element: ['Description']
  key supplement_category as SupplementCategory,

      @Semantics.language: true
  key language_code       as LanguageCode,

      @Semantics.text: true
      description         as Description,

      _SupplmentCategory
}
