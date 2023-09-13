@EndUserText.label: 'Booking Supplement Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true

@Search.searchable: true
define view entity ZAI_DMOC_BookingSupplement_U
  as projection on ZAI_DMOI_BookingSupplement_U

{     //ZAI_DMOI_BookingSupplement_U
      @Search.defaultSearchElement: true
  key TravelID,

      @Search.defaultSearchElement: true
  key BookingID,

  key BookingSupplementID,


      @Consumption.valueHelpDefinition: [ 
          {  entity: {name: 'ZAI_DMOI_Supplement_StdVH', element: 'SupplementID' },
             additionalBinding: [ { localElement: 'Price',        element: 'Price',        usage: #RESULT },
                                  { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT }], 
             useForValidation: true }
        ]
      @ObjectModel.text.element: ['SupplementText']
      SupplementID,
      _SupplementText.Description as SupplementText : localized,

      Price,

      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }, useForValidation: true }]
      CurrencyCode,

//      LastChangedAt,

      /* Associations */
      //ZAI_DMOI_BookingSupplement_U
      _Booking : redirected to parent ZAI_DMOC_Booking_U,
      _Travel  : redirected to ZAI_DMOC_Travel_U ,         
      _Product,
      _SupplementText

}
