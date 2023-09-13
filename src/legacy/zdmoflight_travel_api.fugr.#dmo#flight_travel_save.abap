"! API for Saving the Transactional Buffer of the Travel API
"!
FUNCTION ZDMOFLIGHT_TRAVEL_SAVE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"----------------------------------------------------------------------
  ZDMOcl_flight_legacy=>get_instance( )->save( ).
ENDFUNCTION.
