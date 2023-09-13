"! <h1>API for Creating a Travel</h1>
"!
"! <p>
"! Function module to create a single Travel instance with the possibility to create related Bookings and
"! Booking Supplements in the same call (so called deep-create).
"! </p>
"!
"! <p>
"! The <em>travel_id</em> will be provided be the API but the IDs of Booking <em>booking_id</em> as well
"! of Booking Supplements <em>booking_id</em> and <em>booking_supplement_id</em>.
"! </p>
"!
"!
"! @parameter is_travel             | Travel Data
"! @parameter it_booking            | Table of predefined Booking Key <em>booking_id</em> and Booking Data
"! @parameter it_booking_supplement | Table of predefined Booking Supplement Key <em>booking_id</em>, <em>booking_supplement_id</em> and Booking Supplement Data
"! @parameter iv_numbering_mode      | Numbering Mode for creating new Travels. If not specified, the default is Early.
"! Late numbering is also supported (for gap-free numbering), and requires Adjust Numbers to be called before the save is executed
"! @parameter es_travel             | Evaluated Travel Data like ZAI_DMOTRAVEL
"! @parameter et_booking            | Table of evaluated Bookings like ZAI_DMOBOOKING
"! @parameter et_booking_supplement | Table of evaluated Booking Supplements like ZAI_DMOBOOK_SUPPL
"! @parameter et_messages           | Table of occurred messages
"!
FUNCTION ZAI_DMOflight_travel_create.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IS_TRAVEL) TYPE  ZAI_DMOS_TRAVEL_IN
*"     REFERENCE(IT_BOOKING) TYPE  ZAI_DMOT_BOOKING_IN OPTIONAL
*"     REFERENCE(IT_BOOKING_SUPPLEMENT) TYPE
*"        ZAI_DMOT_BOOKING_SUPPLEMENT_IN OPTIONAL
*"     REFERENCE(IV_NUMBERING_MODE) TYPE
*"        ZAI_DMOIF_FLIGHT_LEGACY=>T_NUMBERING_MODE OPTIONAL
*"  EXPORTING
*"     REFERENCE(ES_TRAVEL) TYPE  ZAI_DMOTRAVEL
*"     REFERENCE(ET_BOOKING) TYPE  ZAI_DMOT_BOOKING
*"     REFERENCE(ET_BOOKING_SUPPLEMENT) TYPE  ZAI_DMOT_BOOKING_SUPPLEMENT
*"     REFERENCE(ET_MESSAGES) TYPE  ZAI_DMOT_MESSAGE
*"----------------------------------------------------------------------
  DATA: lv_numbering_mode TYPE ZAI_DMOif_flight_legacy=>t_numbering_mode.
  IF iv_numbering_mode IS INITIAL.
    lv_numbering_mode = ZAI_DMOif_flight_legacy=>numbering_mode-early.
  ELSE.
    lv_numbering_mode = iv_numbering_mode.
  ENDIF.

  CLEAR es_travel.
  CLEAR et_booking.
  CLEAR et_booking_supplement.
  CLEAR et_messages.

  ZAI_DMOcl_flight_legacy=>get_instance( )->create_travel( EXPORTING is_travel             = is_travel
                                                                   it_booking            = it_booking
                                                                   it_booking_supplement = it_booking_supplement
                                                                   iv_numbering_mode     = lv_numbering_mode
                                                         IMPORTING es_travel             = es_travel
                                                                   et_booking            = et_booking
                                                                   et_booking_supplement = et_booking_supplement
                                                                   et_messages           = DATA(lt_messages) ).

  ZAI_DMOcl_flight_legacy=>get_instance( )->convert_messages( EXPORTING it_messages = lt_messages
                                                            IMPORTING et_messages = et_messages ).
ENDFUNCTION.
