@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection View - CDS Data Model'

@Search.searchable: true

define view entity ZDMOI_Connection
  as select from ZDMOconnection as Connection

  association [1..1] to ZDMOI_Carrier as _Airline            on $projection.AirlineID = _Airline.AirlineID
  association [1..1] to ZDMOI_Airport as _DepartureAirport   on $projection.DepartureAirport = _DepartureAirport.AirportID
  association [1..1] to ZDMOI_Airport as _DestinationAirport on $projection.DestinationAirport = _DestinationAirport.AirportID

{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @ObjectModel.text.association: '_Airline'
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZDMOI_Carrier', element: 'AirlineID' }, useForValidation: true}]
      //@Consumption.valueHelpDefinition: [{entity: {name: 'ZDMOI_Carrier_StdVH', element: 'AirlineID' }, useForValidation: true}]
  key Connection.carrier_id      as AirlineID,

      @Search.defaultSearchElement: true
  key Connection.connection_id   as ConnectionID,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZDMOI_Airport', element: 'AirportID' }, useForValidation: true }]
      //@Consumption.valueHelpDefinition: [{entity: {name: 'ZDMOI_Airport_StdVH', element: 'AirportID' }, useForValidation: true }]
      Connection.airport_from_id as DepartureAirport,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZDMOI_Airport', element: 'AirportID' }, useForValidation: true }]
      //@Consumption.valueHelpDefinition: [{entity: {name: 'ZDMOI_Airport_StdVH', element: 'AirportID' }, useForValidation: true }]
      Connection.airport_to_id   as DestinationAirport,

      Connection.departure_time  as DepartureTime,

      Connection.arrival_time    as ArrivalTime,

      //@Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      Connection.distance        as Distance,

      Connection.distance_unit   as DistanceUnit,

      /* Associations */
      _Airline,
      _DepartureAirport,
      _DestinationAirport
}
