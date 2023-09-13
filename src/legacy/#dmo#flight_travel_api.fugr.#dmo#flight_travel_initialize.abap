"! API for Initializing the Transactional Buffer of the Travel API
"!
FUNCTION ZAI_DMOFLIGHT_TRAVEL_INITIALIZE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"----------------------------------------------------------------------
  ZAI_DMOcl_flight_legacy=>get_instance( )->initialize( ).
ENDFUNCTION.
