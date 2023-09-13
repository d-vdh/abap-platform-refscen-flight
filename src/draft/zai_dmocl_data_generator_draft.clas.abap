CLASS ZAI_DMOcl_data_generator_draft DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES ZAI_DMOif_data_generation_badi .
    INTERFACES if_badi_interface .
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS ZAI_DMOcl_data_generator_draft IMPLEMENTATION.


  METHOD ZAI_DMOif_data_generation_badi~data_generation.
    " Travels
    out->write( ' --> ZAI_DMOA_TRAVEL_D' ).

    DELETE FROM ZAI_DMOd_travel_d.                        "#EC CI_NOWHERE
    DELETE FROM ZAI_DMOa_travel_d.                        "#EC CI_NOWHERE

    INSERT ZAI_DMOa_travel_d FROM (
      SELECT FROM ZAI_DMOtravel FIELDS
        " client
        uuid( ) AS travel_uuid,
        travel_id,
        agency_id,
        customer_id,
        begin_date,
        end_date,
        booking_fee,
        total_price,
        currency_code,
        description,
        CASE status WHEN 'B' THEN 'A'
                    WHEN 'P' THEN 'O'
                    WHEN 'N' THEN 'O'
                    ELSE 'X' END AS overall_status,
        createdby AS local_created_by,
        createdat AS local_created_at,
        lastchangedby AS local_last_changed_by,
        lastchangedat AS local_last_changed_at,
        lastchangedat AS last_changed_at
    ).


    " bookings
    out->write( ' --> ZAI_DMOA_BOOKING_D' ).

    DELETE FROM ZAI_DMOd_booking_d.                       "#EC CI_NOWHERE
    DELETE FROM ZAI_DMOa_booking_d.                       "#EC CI_NOWHERE

    INSERT ZAI_DMOa_booking_d FROM (
        SELECT
          FROM ZAI_DMObooking
            JOIN ZAI_DMOa_travel_d ON ZAI_DMObooking~travel_id = ZAI_DMOa_travel_d~travel_id
            JOIN ZAI_DMOtravel ON ZAI_DMOtravel~travel_id = ZAI_DMObooking~travel_id
          FIELDS  "client,
                  uuid( ) AS booking_uuid,
                  ZAI_DMOa_travel_d~travel_uuid AS parent_uuid,
                  ZAI_DMObooking~booking_id,
                  ZAI_DMObooking~booking_date,
                  ZAI_DMObooking~customer_id,
                  ZAI_DMObooking~carrier_id,
                  ZAI_DMObooking~connection_id,
                  ZAI_DMObooking~flight_date,
                  ZAI_DMObooking~flight_price,
                  ZAI_DMObooking~currency_code,
                  CASE ZAI_DMOtravel~status WHEN 'P' THEN 'N'
                                                   ELSE ZAI_DMOtravel~status END AS booking_status,
                  ZAI_DMOa_travel_d~last_changed_at AS local_last_changed_at
    ).



    " Booking supplements
    out->write( ' --> ZAI_DMOA_BKSUPPL_D' ).

    DELETE FROM ZAI_DMOd_bksuppl_d.                       "#EC CI_NOWHERE
    DELETE FROM ZAI_DMOa_bksuppl_d.                       "#EC CI_NOWHERE

    INSERT ZAI_DMOa_bksuppl_d FROM (
      SELECT FROM ZAI_DMObook_suppl    AS supp
               JOIN ZAI_DMOa_travel_d  AS trvl ON trvl~travel_id = supp~travel_id
               JOIN ZAI_DMOa_booking_d AS book ON book~parent_uuid = trvl~travel_uuid
                                            AND book~booking_id = supp~booking_id

        FIELDS
          " client
          uuid( )                 AS booksuppl_uuid,
          trvl~travel_uuid        AS root_uuid,
          book~booking_uuid       AS parent_uuid,
          supp~booking_supplement_id,
          supp~supplement_id,
          supp~price,
          supp~currency_code,
          trvl~last_changed_at    AS local_last_changed_at
    ).

  ENDMETHOD.


ENDCLASS.
