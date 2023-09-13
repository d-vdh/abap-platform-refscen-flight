@AbapCatalog.sqlViewName: 'ZAI_DMOCURRHLP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Help View for Currency Conversion'
define view ZAI_DMOCURRENCY_HELPER
  with parameters
    amount             : ZAI_DMOtotal_price,
    source_currency    : ZAI_DMOcurrency_code,
    target_currency    : ZAI_DMOcurrency_code,
    exchange_rate_date : ZAI_DMObooking_date

  as select from ZAI_DMOagency

{
  key currency_conversion( amount             => $parameters.amount,
                           source_currency    => $parameters.source_currency,
                           target_currency    => $parameters.target_currency,
                           exchange_rate_date => $parameters.exchange_rate_date,
                           error_handling     => 'SET_TO_NULL' ) as ConvertedAmount
}
