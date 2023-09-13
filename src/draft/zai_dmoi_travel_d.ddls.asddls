@EndUserText.label: 'Travel Interface Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZAI_DMOI_Travel_D
  provider contract transactional_interface
  as projection on ZAI_DMOR_Travel_D
{
  key TravelUUID,
      TravelID,
      AgencyID,
      CustomerID,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,
      LocalLastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZAI_DMOI_Booking_D,
      _Currency,
      _Customer,
      _OverallStatus
}
