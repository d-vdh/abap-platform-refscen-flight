@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement View - CDS data model'

define view entity ZAI_DMOI_BookSuppl_M 
  as select from ZAI_DMObooksuppl_m as BookingSupplement

  association        to parent ZAI_DMOI_Booking_M  as _Booking     on  $projection.travel_id    = _Booking.travel_id
                                                                 and $projection.booking_id   = _Booking.booking_id

  association [1..1] to ZAI_DMOI_Travel_M       as _Travel         on  $projection.travel_id    = _Travel.travel_id
  association [1..1] to ZAI_DMOI_Supplement     as _Product        on $projection.supplement_id = _Product.SupplementID
  association [1..*] to ZAI_DMOI_SupplementText as _SupplementText on $projection.supplement_id = _SupplementText.SupplementID
{
  key travel_id,
  key booking_id,
  key booking_supplement_id,
      supplement_id,
      @Semantics.amount.currencyCode: 'currency_code'
      price,
      currency_code,
      
      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at,

      /* Associations */
      _Travel, 
      _Booking,
      _Product, 
      _SupplementText    
} 
