"! API for drawing the final numbers in case of Late Numbering
"!
"! <p>
"! In case of Late Numbering this function module has to be called right
"! before the save is executed to ensure gap-free numbering.
"! </p>
"!
"! <p>
"! In case of Early Numbering this function module has no effect.
"! </p>
"!
"!
"! @parameter et_travel_mapping       | Table of final Travel-IDs
"! @parameter et_booking_mapping      | Table of final Travel-IDs/Booking-IDs
"! @parameter et_bookingsuppl_mapping | Table of final Travel-IDs/Booking-IDs/BookingSupplement-IDs
"!
FUNCTION ZDMOflight_travel_adj_numbers.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  EXPORTING
*"     REFERENCE(ET_TRAVEL_MAPPING) TYPE
*"        ZDMOIF_FLIGHT_LEGACY=>TT_LN_TRAVEL_MAPPING
*"     REFERENCE(ET_BOOKING_MAPPING) TYPE
*"        ZDMOIF_FLIGHT_LEGACY=>TT_LN_BOOKING_MAPPING
*"     REFERENCE(ET_BOOKINGSUPPL_MAPPING) TYPE
*"        ZDMOIF_FLIGHT_LEGACY=>TT_LN_BOOKINGSUPPL_MAPPING
*"----------------------------------------------------------------------
  ZDMOcl_flight_legacy=>get_instance( )->adjust_numbers(
    IMPORTING
      et_travel_mapping       = et_travel_mapping
      et_booking_mapping      = et_booking_mapping
      et_bookingsuppl_mapping = et_bookingsuppl_mapping ).


ENDFUNCTION.
