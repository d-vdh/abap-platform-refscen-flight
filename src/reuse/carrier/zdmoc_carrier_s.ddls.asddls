@EndUserText.label: 'Projection View Carrier'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['AirlineID']


define view entity ZDMOC_Carrier_S
  as projection on ZDMOI_Carrier_S
{
  key AirlineID,
  
      @Consumption.hidden: true
      CarrierSingletonID,
      
      Name,
      
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }, useForValidation: true }]
      CurrencyCode,
      
      LocalLastChangedAt,
      
      /* Associations */
      _CarrierSingleton : redirected to parent ZDMOC_CarriersLockSingleton_S
}
