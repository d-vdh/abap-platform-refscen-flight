@AbapCatalog.sqlViewName: 'ZDMOCURRHLP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Help View for Currency Conversion'
define view ZDMOCURRENCY_HELPER
  with parameters
    amount             : ZDMOtotal_price,
    source_currency    : ZDMOcurrency_code,
    target_currency    : ZDMOcurrency_code,
    exchange_rate_date : ZDMObooking_date

  as select from ZDMOagency

{
  key currency_conversion( amount             => $parameters.amount,
                           source_currency    => $parameters.source_currency,
                           target_currency    => $parameters.target_currency,
                           exchange_rate_date => $parameters.exchange_rate_date,
                           error_handling     => 'SET_TO_NULL' ) as ConvertedAmount
}
