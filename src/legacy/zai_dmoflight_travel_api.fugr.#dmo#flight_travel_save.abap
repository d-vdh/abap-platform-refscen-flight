"! API for Saving the Transactional Buffer of the Travel API
"!
FUNCTION ZAI_DMOFLIGHT_TRAVEL_SAVE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"----------------------------------------------------------------------
  ZAI_DMOcl_flight_legacy=>get_instance( )->save( ).
ENDFUNCTION.
