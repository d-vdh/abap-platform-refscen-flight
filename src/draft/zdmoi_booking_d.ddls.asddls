@EndUserText.label: 'Booking Interface Projection View '
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZDMOI_Booking_D
  as projection on ZDMOR_Booking_D
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
      _BookingSupplement : redirected to composition child ZDMOI_BookingSupplement_D,
      _Carrier,
      _Connection,
      _Customer,
      _Travel            : redirected to parent ZDMOI_Travel_D
}
