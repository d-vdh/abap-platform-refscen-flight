@EndUserText.label: 'Carrier Singleton Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['CarrierSingletonID']

define root view entity ZDMOC_CarriersLockSingleton_S
  provider contract transactional_query
  as projection on ZDMOI_CarriersLockSingleton_S
{
  key CarrierSingletonID,

      @Consumption.hidden: true
      LastChangedAtMax,
      /* Associations */
      _Airline : redirected to composition child ZDMOC_Carrier_S
}
