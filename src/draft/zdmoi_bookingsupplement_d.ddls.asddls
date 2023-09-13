@EndUserText.label: 'BookSupplement Interface Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZDMOI_BookingSupplement_D
  as projection on ZDMOR_BookingSupplement_D
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
      _Booking : redirected to parent ZDMOI_Booking_D,
      _Product,
      _SupplementText,
      _Travel  : redirected to ZDMOI_Travel_D
}
