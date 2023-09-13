FUNCTION ZDMOflight_booksuppl_d.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(VALUES) TYPE  ZDMOTT_BOOKSUPPL_M
*"----------------------------------------------------------------------
  DELETE ZDMObooksuppl_m FROM TABLE @values.

ENDFUNCTION.  "#EC CI_VALPAR
