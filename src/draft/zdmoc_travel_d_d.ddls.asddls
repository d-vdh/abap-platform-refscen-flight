@EndUserText.label: 'Travel Projection View with Draft'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: ['TravelID']

define root view entity ZDMOC_Travel_D_D
  provider contract transactional_query
  as projection on ZDMOR_Travel_D

{
  key TravelUUID,


      @Search.defaultSearchElement: true
      TravelID,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['AgencyName']
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZDMOI_Agency_StdVH', element: 'AgencyID'  }, useForValidation: true }]
      AgencyID,
      _Agency.Name       as AgencyName,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['CustomerName']
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZDMOI_Customer_StdVH', element: 'CustomerID' }, useForValidation: true}]
      CustomerID,
      _Customer.LastName as CustomerName,

      BeginDate,

      EndDate,

      BookingFee,

      TotalPrice,

      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }, useForValidation: true }]
      CurrencyCode,

      Description,

      @ObjectModel.text.element: ['OverallStatusText']
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZDMOI_Overall_Status_VH', element: 'OverallStatus'  } }]
      OverallStatus,
      _OverallStatus._Text.Text as OverallStatusText: localized,
      

      LocalLastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZDMOC_Booking_D_D,
      _Currency,
      _Customer, 
      _OverallStatus
}