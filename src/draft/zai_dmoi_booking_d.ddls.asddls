@EndUserText.label: 'Booking Interface Projection View '
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZAI_DMOI_Booking_D
  as projection on ZAI_DMOR_Booking_D
{
  key BookingUUID,
      TravelUUID,
      BookingID,
      BookingDate,
      CustomerID,
      AirlineID,
      ConnectionID,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LocalLastChangedAt,
      /* Associations */
      _BookingStatus,
      _BookingSupplement : redirected to composition child ZAI_DMOI_BookingSupplement_D,
      _Carrier,
      _Connection,
      _Customer,
      _Travel            : redirected to parent ZAI_DMOI_Travel_D
}
