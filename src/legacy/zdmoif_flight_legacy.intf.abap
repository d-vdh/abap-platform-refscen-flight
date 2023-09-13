"! <strong>Interface for Flight Legacy Coding</strong><br/>
"! Every used structure or table type needed in the API Function Modules
"! will be defined here.
INTERFACE ZDMOif_flight_legacy
  PUBLIC.

******************************
* Database table table types *
******************************

  "! Table type of the table ZDMOTRAVEL
  TYPES tt_travel             TYPE ZDMOt_travel.
  "! Table type of the table ZDMOBOOKING
  TYPES tt_booking            TYPE ZDMOt_booking.
  "! Table type of the table ZDMOBOOK_SUPPL
  TYPES tt_booking_supplement TYPE ZDMOt_booking_supplement.
  "! Table type of the table ZDMOFLIGHT
  TYPES tt_flight             TYPE ZDMOt_flight.



******************
* Key structures *
******************

  "! Key structure of Travel
  TYPES ts_travel_key TYPE ZDMOs_travel_key.
  "! Table type that contains only the keys of Travel
  TYPES tt_travel_key TYPE ZDMOt_travel_key.

  "! Key structure of Booking
  TYPES ts_booking_key TYPE ZDMOs_booking_key.
  "! Table type that contains only the keys of Booking
  TYPES tt_booking_key TYPE ZDMOt_booking_key.

  "! Key structure of Booking Supplements
  TYPES ts_booking_supplement_key TYPE ZDMOs_booking_supplement_key.
  "! Table type that contains only the keys of Booking Supplements
  TYPES tt_booking_supplement_key TYPE ZDMOt_booking_supplement_key.



***********************************************************************************************************************************
* Flag structures for data components                                                                                             *
* IMPORTANT: When you add or remove fields from ZDMOTRAVEL, ZDMOBOOKING, ZDMOBOOK_SUPPL you need to change the following types *
***********************************************************************************************************************************

  "! <strong>Flag structure for Travel data. </strong><br/>
  "! Each component identifies if the corresponding data has been changed.
  "! Where <em>abap_true</em> represents a change.
  TYPES ts_travel_intx TYPE ZDMOs_travel_intx.
  "! <strong>Flag structure for Booking data. </strong><br/>
  "! Each component identifies if the corresponding data has been changed.
  "! Where <em>abap_true</em> represents a change.
  TYPES ts_booking_intx TYPE ZDMOs_booking_intx.
  "! <strong>Flag structure for Booking Supplement data. </strong><br/>
  "! Each component identifies if the corresponding data has been changed.
  "! Where <em>abap_true</em> represents a change.
  TYPES ts_booking_supplement_intx TYPE ZDMOs_booking_supplement_intx.



**********************************************************************
* Internal
**********************************************************************

  " Internally we use the full X-structures: With complete key and action code
  TYPES ts_travelx TYPE ZDMOs_travelx.
  TYPES tt_travelx TYPE ZDMOt_travelx.

  TYPES ts_bookingx TYPE ZDMOs_bookingx.
  TYPES tt_bookingx TYPE ZDMOt_bookingx.

  TYPES ts_booking_supplementx TYPE ZDMOs_booking_supplementx.
  TYPES tt_booking_supplementx TYPE ZDMOt_booking_supplementx.



*********
* ENUMs *
*********

  TYPES:
    "! Action codes for CUD Operations
    "! <ul>
    "! <li><em>create</em> = create a node</li>
    "! <li><em>update</em> = update a node</li>
    "! <li><em>delete</em> = delete a node</li>
    "! </ul>
    BEGIN OF ENUM action_code_enum STRUCTURE action_code BASE TYPE ZDMOaction_code,
      initial VALUE IS INITIAL,
      create  VALUE 'C',
      update  VALUE 'U',
      delete  VALUE 'D',
    END OF ENUM action_code_enum STRUCTURE action_code.

  TYPES:
    "! Travel Stati
    "! <ul>
    "! <li><em>New</em> = New Travel</li>
    "! <li><em>Planned</em> = Planned Travel</li>
    "! <li><em>Booked</em> = Booked Travel</li>
    "! <li><em>Cancelled</em> = Cancelled Travel</li>
    "! </ul>
    BEGIN OF ENUM travel_status_enum STRUCTURE travel_status BASE TYPE ZDMOtravel_status,
      initial   VALUE IS INITIAL,
      new       VALUE 'N',
      planned   VALUE 'P',
      booked    VALUE 'B',
      cancelled VALUE 'X',
    END OF ENUM travel_status_enum STRUCTURE travel_status.



************************
* Importing structures *
************************

  "! INcoming structure of the node Travel.  It contains key and data fields.<br/>
  "! The caller of the BAPI like function modules shall not provide the administrative fields.
  TYPES ts_travel_in TYPE ZDMOs_travel_in.

  "! INcoming structure of the node Booking.  It contains the booking key and data fields.<br/>
  "! The BAPI like function modules always refer to a single travel.
  "! Therefore the Travel ID is not required in the subnode tables.
  TYPES ts_booking_in TYPE ZDMOs_booking_in.
  "! INcoming table type of the node Booking.  It contains the booking key and data fields.
  TYPES tt_booking_in TYPE ZDMOt_booking_in.

  "! INcoming structure of the node Booking Supplement.  It contains the booking key, booking supplement key and data fields.<br/>
  "! The BAPI like function modules always refer to a single travel.
  "! Therefore the Travel ID is not required in the subnode tables but the booking key is required as it refers to it corresponding super node.
  TYPES ts_booking_supplement_in TYPE ZDMOs_booking_supplement_in.
  "! INcoming table type of the node Booking Supplement.  It contains the booking key, booking supplement key and data fields.
  TYPES tt_booking_supplement_in TYPE ZDMOt_booking_supplement_in.

  "! INcoming flag structure of the node Travel.  It contains key and the bit flag to the corresponding fields.<br/>
  "! The caller of the BAPI like function modules shall not provide the administrative fields.
  "! Furthermore the action Code is not required for the root (because it is already determined by the function module name).
  TYPES ts_travel_inx TYPE ZDMOs_travel_inx.

  "! INcoming flag structure of the node Booking.  It contains key and the bit flag to the corresponding fields.<br/>
  "! The BAPI like function modules always refer to a single travel.
  "! Therefore the Travel ID is not required in the subnode tables.
  TYPES ts_booking_inx TYPE ZDMOs_booking_inx.
  "! INcoming flag table type of the node Booking.  It contains key and the bit flag to the corresponding fields.
  TYPES tt_booking_inx TYPE ZDMOt_booking_inx.

  "! INcoming flag structure of the node Booking Supplement.  It contains key and the bit flag to the corresponding fields.<br/>
  "! The BAPI like function modules always refer to a single travel.
  "! Therefore the Travel ID is not required in the subnode tables.
  TYPES ts_booking_supplement_inx TYPE ZDMOs_booking_supplement_inx.
  "! INcoming flag table type of the node Booking Supplement.  It contains key and the bit flag to the corresponding fields.
  TYPES tt_booking_supplement_inx TYPE ZDMOt_booking_supplement_inx.



**********************************************************************
* Late Numbering
**********************************************************************
  TYPES:
    BEGIN OF ts_ln_travel,
      travel_id TYPE ZDMOtravel_id,
    END OF ts_ln_travel,
    BEGIN OF ts_ln_travel_mapping,
      preliminary TYPE ts_ln_travel,
      final       TYPE ts_ln_travel,
    END OF ts_ln_travel_mapping,
    tt_ln_travel_mapping TYPE STANDARD TABLE OF ts_ln_travel_mapping WITH DEFAULT KEY,

    BEGIN OF ts_ln_booking,
      travel_id  TYPE ZDMOtravel_id,
      booking_id TYPE ZDMObooking_id,
    END OF ts_ln_booking,
    BEGIN OF ts_ln_booking_mapping,
      preliminary TYPE ts_ln_booking,
      final       TYPE ts_ln_booking,
    END OF ts_ln_booking_mapping,
    tt_ln_booking_mapping TYPE STANDARD TABLE OF ts_ln_booking_mapping WITH DEFAULT KEY,

    BEGIN OF ts_ln_bookingsuppl,
      travel_id             TYPE ZDMOtravel_id,
      booking_id            TYPE ZDMObooking_id,
      booking_supplement_id TYPE ZDMObooking_supplement_id,
    END OF ts_ln_bookingsuppl,
    BEGIN OF ts_ln_bookingsuppl_mapping,
      preliminary TYPE ts_ln_bookingsuppl,
      final       TYPE ts_ln_bookingsuppl,
    END OF ts_ln_bookingsuppl_mapping,
    tt_ln_bookingsuppl_mapping TYPE STANDARD TABLE OF ts_ln_bookingsuppl_mapping WITH DEFAULT KEY.


  TYPES:
    t_numbering_mode TYPE c LENGTH 1 .

  CONSTANTS:
    "! Travel-ID boundary for early/late numbering differentiation
    "! The value itself will never be used. Values below indicate early numbering. Values above, late numbering.
    late_numbering_boundary TYPE ZDMOtravel_id VALUE '90000000',
    "! Constants for Numbering Mode
    BEGIN OF numbering_mode,
      "! Early Internal Numbering
      early TYPE t_numbering_mode VALUE 'E',
      "! Late Numbering
      late  TYPE t_numbering_mode VALUE 'L',
    END OF numbering_mode.


*****************
* Message table *
*****************

  "! Table of messages
  TYPES tt_message TYPE ZDMOt_message.

  "! Table of messages like T100. <br/>
  "! We have only error messages.
  "! Currently we do not communicate Warnings or Success Messages.
  "! Internally we use a table of exceptions.
  TYPES tt_if_t100_message TYPE STANDARD TABLE OF REF TO if_t100_message WITH EMPTY KEY.
ENDINTERFACE.
