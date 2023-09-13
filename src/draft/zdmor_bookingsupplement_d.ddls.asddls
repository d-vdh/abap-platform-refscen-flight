@EndUserText.label: 'BookSuppl View Entity fro Draft RefScen'
@AccessControl.authorizationCheck: #NOT_REQUIRED

define view entity ZDMOR_BookingSupplement_D
  as select from ZDMOa_bksuppl_d

  association        to parent ZDMOR_Booking_D as _Booking        on $projection.BookingUUID  = _Booking.BookingUUID
  association [1..1] to ZDMOR_Travel_D         as _Travel         on $projection.TravelUUID   = _Travel.TravelUUID

  association [1..1] to ZDMOI_Supplement       as _Product        on $projection.SupplementID = _Product.SupplementID
  association [1..*] to ZDMOI_SupplementText   as _SupplementText on $projection.SupplementID = _SupplementText.SupplementID

{ //ZDMOa_bksuppl_d
  key booksuppl_uuid        as BookSupplUUID,
      root_uuid             as TravelUUID,
      parent_uuid           as BookingUUID,

      booking_supplement_id as BookingSupplementID,
      supplement_id         as SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as BookSupplPrice,
      currency_code         as CurrencyCode,

      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      //Associations
      _Travel,
      _Booking,

      _Product,
      _SupplementText
}
