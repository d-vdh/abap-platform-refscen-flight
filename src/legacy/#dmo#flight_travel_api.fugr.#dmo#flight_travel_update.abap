"! <h1>API for Updating a Travel</h1>
"!
"! <p>
"! Function module to update a single Travel instance with the possibility to update related Bookings and
"! Booking Supplements in the same call.
"! </p>
"!
"! <p>
"! For an operation only on a Booking or Booking Supplement the Travel Data Change Flag structure still must be applied.
"! It then contains only the <em>travel_id</em> and all flags set to <em>false</em> respectively left <em>initial</em>.
"! </p>
"!
"!
"! @parameter is_travel              | Travel Data
"! @parameter is_travelx             | Travel Data Change Flags
"! @parameter it_booking             | Table of predefined Booking Key <em>booking_id</em> and Booking Data
"! @parameter it_bookingx            | Change Flag Table of Booking Data with predefined Booking Key <em>booking_id</em>
"! @parameter it_booking_supplement  | Table of predefined Booking Supplement Key <em>booking_id</em>, <em>booking_supplement_id</em> and Booking Supplement Data
"! @parameter it_booking_supplementx | Change Flag Table of Booking Supplement Data with predefined Booking Supplement Key <em>booking_id</em>, <em>booking_supplement_id</em>
"! @parameter es_travel              | Evaluated Travel Data like ZAI_DMOTRAVEL
"! @parameter et_booking             | Table of evaluated Bookings like ZAI_DMOBOOKING
"! @parameter et_booking_supplement  | Table of evaluated Booking Supplements like ZAI_DMOBOOK_SUPPL
"! @parameter et_messages            | Table of occurred messages
"!
FUNCTION ZAI_DMOflight_travel_update.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IS_TRAVEL) TYPE  ZAI_DMOS_TRAVEL_IN
*"     REFERENCE(IS_TRAVELX) TYPE  ZAI_DMOS_TRAVEL_INX
*"     REFERENCE(IT_BOOKING) TYPE  ZAI_DMOT_BOOKING_IN OPTIONAL
*"     REFERENCE(IT_BOOKINGX) TYPE  ZAI_DMOT_BOOKING_INX OPTIONAL
*"     REFERENCE(IT_BOOKING_SUPPLEMENT) TYPE
*"        ZAI_DMOT_BOOKING_SUPPLEMENT_IN OPTIONAL
*"     REFERENCE(IT_BOOKING_SUPPLEMENTX) TYPE
*"        ZAI_DMOT_BOOKING_SUPPLEMENT_INX OPTIONAL
*"  EXPORTING
*"     REFERENCE(ES_TRAVEL) TYPE  ZAI_DMOTRAVEL
*"     REFERENCE(ET_BOOKING) TYPE  ZAI_DMOT_BOOKING
*"     REFERENCE(ET_BOOKING_SUPPLEMENT) TYPE  ZAI_DMOT_BOOKING_SUPPLEMENT
*"     REFERENCE(ET_MESSAGES) TYPE  ZAI_DMOT_MESSAGE
*"----------------------------------------------------------------------



  CLEAR es_travel.
  CLEAR et_booking.
  CLEAR et_booking_supplement.
  CLEAR et_messages.

  ZAI_DMOcl_flight_legacy=>get_instance( )->update_travel( EXPORTING is_travel              = is_travel
                                                                   it_booking             = it_booking
                                                                   it_booking_supplement  = it_booking_supplement
                                                                   is_travelx             = is_travelx
                                                                   it_bookingx            = it_bookingx
                                                                   it_booking_supplementx = it_booking_supplementx
                                                         IMPORTING es_travel              = es_travel
                                                                   et_booking             = et_booking
                                                                   et_booking_supplement  = et_booking_supplement
                                                                   et_messages            = DATA(lt_messages) ).

  ZAI_DMOcl_flight_legacy=>get_instance( )->convert_messages( EXPORTING it_messages = lt_messages
                                                            IMPORTING et_messages = et_messages ).
ENDFUNCTION.
