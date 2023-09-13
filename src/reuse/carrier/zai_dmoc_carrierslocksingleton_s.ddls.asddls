@EndUserText.label: 'Carrier Singleton Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['CarrierSingletonID']

define root view entity ZAI_DMOC_CarriersLockSingleton_S
  provider contract transactional_query
  as projection on ZAI_DMOI_CarriersLockSingleton_S
{
  key CarrierSingletonID,

      @Consumption.hidden: true
      LastChangedAtMax,
      /* Associations */
      _Airline : redirected to composition child ZAI_DMOC_Carrier_S
}