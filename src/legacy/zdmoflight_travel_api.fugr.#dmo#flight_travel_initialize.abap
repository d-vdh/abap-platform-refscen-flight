"! API for Initializing the Transactional Buffer of the Travel API
"!
FUNCTION ZDMOFLIGHT_TRAVEL_INITIALIZE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"----------------------------------------------------------------------
  ZDMOcl_flight_legacy=>get_instance( )->initialize( ).
ENDFUNCTION.
