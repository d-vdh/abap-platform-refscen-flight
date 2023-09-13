@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier ValueHelp'
@Search.searchable: true

define view entity ZAI_DMOI_Carrier_StdVH
  as select from ZAI_DMOI_Carrier
{

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['Name']
      @UI.textArrangement: #TEXT_SEPARATE
      @UI.lineItem: [{ position: 10, importance: #HIGH }]
  key AirlineID,

      @Search.defaultSearchElement: true
      @UI.textArrangement: #TEXT_SEPARATE
      @UI.lineItem: [{ position: 20, importance: #HIGH }]
      Name,

      @UI.textArrangement: #TEXT_ONLY
      @UI.lineItem: [{ position: 30, importance: #MEDIUM }]
      @ObjectModel.text.element: ['CurrencyName']
      CurrencyCode,

      @UI.hidden: true
      _Currency._Text[1:Language = $session.system_language].CurrencyName as CurrencyName
}
