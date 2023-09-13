@EndUserText.label: 'Supplement Consumption View'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: ['SupplementID']

define root view entity ZDMOC_Supplement
  provider contract transactional_query
  as projection on ZDMOI_Supplement
{

  key SupplementID, 

      @Consumption.valueHelpDefinition: [{entity: {
                                            name: 'ZDMOI_SupplementCategory_VH',
                                            element: 'SupplementCategory'
                                          },
                                          useForValidation: true
                                          }]
      @ObjectModel.text.element: ['SupplementCategoryText']
      SupplementCategory as SupplementCategory,

      _SupplementCategory._Text.Description as SupplementCategoryText    : localized,

      _SupplementText.Description       as SupplementDescription : localized,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price                             as Price,

      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }, useForValidation: true }]
      CurrencyCode,
      
      LocalLastChangedAt,
      
      _SupplementCategory,
      _Currency
}
