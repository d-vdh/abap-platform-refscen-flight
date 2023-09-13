@EndUserText.label: 'Travel View Entity for Draft RefScen'
@AccessControl.authorizationCheck: #NOT_REQUIRED

define root view entity ZAI_DMOR_Travel_D
  as select from ZAI_DMOa_travel_d

  composition [0..*] of ZAI_DMOR_Booking_D         as _Booking

  association [0..1] to ZAI_DMOI_Agency            as _Agency        on $projection.AgencyID = _Agency.AgencyID
  association [0..1] to ZAI_DMOI_Customer          as _Customer      on $projection.CustomerID = _Customer.CustomerID
  association [1..1] to ZAI_DMOI_Overall_Status_VH as _OverallStatus on $projection.OverallStatus = _OverallStatus.OverallStatus
  association [0..1] to I_Currency               as _Currency      on $projection.CurrencyCode = _Currency.Currency

{ //ZAI_DMOa_travel_d
  key travel_uuid           as TravelUUID,

      travel_id             as TravelID,
      agency_id             as AgencyID,
      customer_id           as CustomerID,
      begin_date            as BeginDate,
      end_date              as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,
      currency_code         as CurrencyCode,
      description           as Description,
      overall_status        as OverallStatus,

      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.lastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      //total ETag field
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

      //Associations
      _Booking,

      _Agency,
      _Customer,
      _OverallStatus,
      _Currency
}