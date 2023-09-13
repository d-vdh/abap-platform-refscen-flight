FUNCTION ZAI_DMOflight_booksuppl_c.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(VALUES) TYPE  ZAI_DMOTT_BOOKSUPPL_M
*"----------------------------------------------------------------------
  INSERT ZAI_DMObooksuppl_m FROM TABLE @values.

ENDFUNCTION. "#EC CI_VALPAR
