@EndUserText.label: 'BookSupplement Interface Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZAI_DMOI_BookingSupplement_D
  as projection on ZAI_DMOR_BookingSupplement_D
{
  key BookSupplUUID,
      TravelUUID,
      BookingUUID,
      BookingSupplementID,
      SupplementID,
      BookSupplPrice,
      CurrencyCode,
      LocalLastChangedAt,
      /* Associations */
      _Booking : redirected to parent ZAI_DMOI_Booking_D,
      _Product,
      _SupplementText,
      _Travel  : redirected to ZAI_DMOI_Travel_D
}
