@EndUserText.label: 'Booking View Entity for Draft RefScen'
@AccessControl.authorizationCheck: #NOT_REQUIRED

define view entity ZAI_DMOR_Booking_D
  as select from ZAI_DMOa_booking_d

  association        to parent ZAI_DMOR_Travel_D     as _Travel        on  $projection.TravelUUID = _Travel.TravelUUID
  composition [0..*] of ZAI_DMOR_BookingSupplement_D as _BookingSupplement

  association [1..1] to ZAI_DMOI_Customer            as _Customer      on  $projection.CustomerID = _Customer.CustomerID
  association [1..1] to ZAI_DMOI_Carrier             as _Carrier       on  $projection.AirlineID = _Carrier.AirlineID
  association [1..1] to ZAI_DMOI_Connection          as _Connection    on  $projection.AirlineID    = _Connection.AirlineID
                                                                     and $projection.ConnectionID = _Connection.ConnectionID
  association [1..1] to ZAI_DMOI_Booking_Status_VH   as _BookingStatus on  $projection.BookingStatus = _BookingStatus.BookingStatus

{ //ZAI_DMOa_booking_d
  key booking_uuid          as BookingUUID,
      parent_uuid           as TravelUUID,

      booking_id            as BookingID,
      booking_date          as BookingDate,
      customer_id           as CustomerID,
      carrier_id            as AirlineID,
      connection_id         as ConnectionID,
      flight_date           as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price          as FlightPrice,
      currency_code         as CurrencyCode,
      booking_status        as BookingStatus,

      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      //Associations
      _Travel,
      _BookingSupplement,

      _Customer,
      _Carrier,
      _Connection, 
      _BookingStatus
}
