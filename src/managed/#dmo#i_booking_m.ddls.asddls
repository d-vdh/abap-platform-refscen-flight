@AccessControl.authorizationCheck: #NOT_REQUIRED
//@Metadata.ignorePropagatedAnnotations:true
@EndUserText.label: 'Booking view'

define view entity ZAI_DMOI_Booking_M
  as select from ZAI_DMObooking_m as Booking

  association        to parent ZAI_DMOI_Travel_M   as _Travel        on  $projection.travel_id = _Travel.travel_id
  composition [0..*] of ZAI_DMOI_BookSuppl_M       as _BookSupplement

  association [1..1] to ZAI_DMOI_Customer          as _Customer      on  $projection.customer_id = _Customer.CustomerID
  association [1..1] to ZAI_DMOI_Carrier           as _Carrier       on  $projection.carrier_id = _Carrier.AirlineID
  association [1..1] to ZAI_DMOI_Connection        as _Connection    on  $projection.carrier_id    = _Connection.AirlineID
                                                                   and $projection.connection_id = _Connection.ConnectionID
  association [1..1] to ZAI_DMOI_Booking_Status_VH as _BookingStatus on  $projection.booking_status = _BookingStatus.BookingStatus

{
  key travel_id,
  key booking_id,

      booking_date,
      customer_id,
      carrier_id,
      connection_id,
      flight_date,
      @Semantics.amount.currencyCode: 'currency_code'
      flight_price,
      currency_code,
      booking_status,

      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at,

      /* Associations */
      _Travel,
      _BookSupplement,
      _Customer,
      _Carrier,
      _Connection,
      _BookingStatus

}
