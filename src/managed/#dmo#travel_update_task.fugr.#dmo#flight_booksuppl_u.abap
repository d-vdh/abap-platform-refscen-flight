FUNCTION ZAI_DMOflight_booksuppl_u.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(VALUES) TYPE  ZAI_DMOTT_BOOKSUPPL_M
*"----------------------------------------------------------------------
  UPDATE ZAI_DMObooksuppl_m FROM TABLE @values.

ENDFUNCTION.  "#EC CI_VALPAR
