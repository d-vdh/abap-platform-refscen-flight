FUNCTION ZAI_DMOflight_booksuppl_d.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(VALUES) TYPE  ZAI_DMOTT_BOOKSUPPL_M
*"----------------------------------------------------------------------
  DELETE ZAI_DMObooksuppl_m FROM TABLE @values.

ENDFUNCTION.  "#EC CI_VALPAR
