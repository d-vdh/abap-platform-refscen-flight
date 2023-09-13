FUNCTION ZDMOflight_booksuppl_u.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(VALUES) TYPE  ZDMOTT_BOOKSUPPL_M
*"----------------------------------------------------------------------
  UPDATE ZDMObooksuppl_m FROM TABLE @values.

ENDFUNCTION.  "#EC CI_VALPAR
