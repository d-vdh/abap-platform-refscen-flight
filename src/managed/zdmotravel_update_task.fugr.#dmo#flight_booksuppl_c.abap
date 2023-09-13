FUNCTION ZDMOflight_booksuppl_c.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(VALUES) TYPE  ZDMOTT_BOOKSUPPL_M
*"----------------------------------------------------------------------
  INSERT ZDMObooksuppl_m FROM TABLE @values.

ENDFUNCTION. "#EC CI_VALPAR
