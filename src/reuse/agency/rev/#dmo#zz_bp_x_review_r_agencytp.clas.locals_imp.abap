CLASS ltcl_review DEFINITION DEFERRED FOR TESTING.
CLASS lhc_ZAI_DMOzz_review DEFINITION INHERITING FROM cl_abap_behavior_handler
  FRIENDS ltcl_review.
  PRIVATE SECTION.
    CONSTANTS: rating_in_range TYPE string VALUE 'RATING_IN_RANGE' ##NO_TEXT.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR ZAI_DMOzz_review RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZAI_DMOzz_review RESULT result.

    METHODS reviewwashelpful FOR MODIFY
      IMPORTING keys FOR ACTION ZAI_DMOzz_review~ZAI_DMOreviewwashelpful RESULT result.

    METHODS reviewwasnothelpful FOR MODIFY
      IMPORTING keys FOR ACTION ZAI_DMOzz_review~ZAI_DMOreviewwasnothelpful RESULT result.

    METHODS ratinginrange FOR VALIDATE ON SAVE
      IMPORTING keys FOR ZAI_DMOzz_review~ZAI_DMOratinginrange.

ENDCLASS.

CLASS lhc_ZAI_DMOzz_review IMPLEMENTATION.

  METHOD get_instance_features.
    READ ENTITIES OF ZAI_DMOi_agencytp IN LOCAL MODE
      ENTITY ZAI_DMOzz_review
        FIELDS ( reviewer )
        WITH CORRESPONDING #( keys )
        RESULT DATA(reviews)
      FAILED failed.

    result = VALUE #(
        FOR review IN reviews
        LET enabled = COND #( WHEN review-reviewer = cl_abap_context_info=>get_user_technical_name( )
                                THEN if_abap_behv=>fc-o-enabled
                                ELSE if_abap_behv=>fc-o-disabled ) IN
        (
          %tky = review-%tky
          %update = enabled
          %delete = enabled
        )
      ).
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD reviewwashelpful.
    READ ENTITIES OF ZAI_DMOi_agencytp IN LOCAL MODE
      ENTITY ZAI_DMOzz_review
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(reviews)
        FAILED failed.

    LOOP AT reviews ASSIGNING FIELD-SYMBOL(<review>).
      <review>-helpfulcount += 1.
      <review>-helpfultotal += 1.

      APPEND VALUE #(
          %tky   = <review>-%tky
          %param = CORRESPONDING #( <review> )
        ) TO result.
    ENDLOOP.

    MODIFY ENTITIES OF ZAI_DMOi_agencytp IN LOCAL MODE
      ENTITY ZAI_DMOzz_review
        UPDATE FIELDS ( helpfulcount helpfultotal )
          WITH CORRESPONDING #( reviews ).
  ENDMETHOD.

  METHOD reviewwasnothelpful.
    READ ENTITIES OF ZAI_DMOi_agencytp IN LOCAL MODE
      ENTITY ZAI_DMOzz_review
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(reviews)
        FAILED failed.

    LOOP AT reviews ASSIGNING FIELD-SYMBOL(<review>).
      <review>-helpfultotal += 1.

      APPEND VALUE #(
          %tky   = <review>-%tky
          %param = CORRESPONDING #( <review> )
        ) TO result.
    ENDLOOP.

    MODIFY ENTITIES OF ZAI_DMOi_agencytp IN LOCAL MODE
      ENTITY ZAI_DMOzz_review
        UPDATE FIELDS ( helpfultotal )
          WITH CORRESPONDING #( reviews ).
  ENDMETHOD.

  METHOD ratinginrange.
    READ ENTITIES OF ZAI_DMOi_agencytp IN LOCAL MODE
      ENTITY ZAI_DMOzz_review
        FIELDS ( rating )
        WITH CORRESPONDING #( keys )
        RESULT DATA(reviews)
      ENTITY ZAI_DMOzz_review BY \_agency
        FROM CORRESPONDING #( keys )
        LINK DATA(agency_links).

    LOOP AT reviews INTO DATA(review).
      APPEND VALUE #(
          %tky        = review-%tky
          %state_area = rating_in_range
        ) TO reported-ZAI_DMOzz_review.

      IF review-rating > 5 OR review-rating < 1.
        APPEND VALUE #(
            %tky              = review-%tky
            %state_area       = rating_in_range
            %msg              = NEW ZAI_DMOzz_cx_agency_review( ZAI_DMOzz_cx_agency_review=>rating_invalid )
            %element-rating   = if_abap_behv=>mk-on
            %path-ZAI_DMOagency-%tky = VALUE #( agency_links[ KEY draft  source-%tky = review-%tky ]-target-%tky OPTIONAL )
          ) TO reported-ZAI_DMOzz_review.
        APPEND VALUE #( %tky = review-%tky ) TO failed-ZAI_DMOzz_review.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.


CLASS ltcl_sc_r_agency DEFINITION DEFERRED FOR TESTING.
CLASS lsc_r_agency DEFINITION INHERITING FROM cl_abap_behavior_saver FRIENDS ltcl_sc_r_agency.
  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_r_agency IMPLEMENTATION.

  METHOD adjust_numbers.
    TYPES: t_mapped_review TYPE STRUCTURE FOR MAPPED LATE ZAI_DMOzz_i_agency_reviewtp.
    DATA: agencies TYPE STANDARD TABLE OF ZAI_DMOagency_id WITH KEY table_line.
    FIELD-SYMBOLS: <mapped_review> TYPE t_mapped_review.

    CHECK mapped-ZAI_DMOzz_review IS NOT INITIAL.

    LOOP AT mapped-ZAI_DMOzz_review ASSIGNING <mapped_review> GROUP BY <mapped_review>-%tmp-agencyid.
      APPEND <mapped_review>-%tmp-agencyid TO agencies.
    ENDLOOP.

    ASSERT agencies IS NOT INITIAL.

    SELECT
      FROM ZAI_DMOzz_agn_reva  AS db
      JOIN @agencies         AS itab
        ON db~agency_id = itab~table_line
      FIELDS DISTINCT
        db~agency_id,
        MAX( db~review_id ) AS max_review_id
      GROUP BY db~agency_id
      INTO TABLE @DATA(max_reviews).

    LOOP AT mapped-ZAI_DMOzz_review INTO DATA(mapped_review_group) GROUP BY mapped_review_group-%tmp-agencyid.
      DATA(max_review_id) = VALUE #( max_reviews[ agency_id = mapped_review_group-%tmp-agencyid ]-max_review_id OPTIONAL ).
      LOOP AT mapped-ZAI_DMOzz_review ASSIGNING <mapped_review> WHERE %tmp-agencyid = mapped_review_group-%tmp-agencyid.
        <mapped_review>-agencyid = <mapped_review>-%tmp-agencyid.
        max_review_id += 1.
        <mapped_review>-reviewid = max_review_id.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

  METHOD save_modified.
    IF create-ZAI_DMOzz_review IS NOT INITIAL.
      READ ENTITIES OF ZAI_DMOi_agencytp IN LOCAL MODE
        ENTITY ZAI_DMOagency
          FIELDS ( emailaddress ) WITH CORRESPONDING #( create-ZAI_DMOzz_review )
        RESULT DATA(agencies).

      RAISE ENTITY EVENT ZAI_DMOi_agencytp~ZAI_DMOagencyreviewcreated
        FROM VALUE #(
          FOR review IN create-ZAI_DMOzz_review (
              agencyid        = review-agencyid
              reviewid        = review-reviewid
              rating          = review-rating
              freetextcomment = review-freetextcomment
              emailaddress    = agencies[ KEY entity  agencyid = review-agencyid ]-emailaddress
            )
          ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
