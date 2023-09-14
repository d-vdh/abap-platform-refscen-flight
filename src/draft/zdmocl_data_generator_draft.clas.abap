CLASS ZDMOcl_data_generator_draft DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES ZDMOif_data_generation_badi .
    INTERFACES if_badi_interface .
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS ZDMOCL_DATA_GENERATOR_DRAFT IMPLEMENTATION.


  METHOD ZDMOif_data_generation_badi~data_generation.
    " Travels
    out->write( ' --> ZDMOA_TRAVEL_D' ).

    DELETE FROM ZDMOd_travel_d.                        "#EC CI_NOWHERE
    DELETE FROM ZDMOa_travel_d.                        "#EC CI_NOWHERE

    INSERT ZDMOa_travel_d FROM (
      SELECT FROM ZDMOtravel FIELDS
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
    out->write( ' --> ZDMOA_BOOKING_D' ).

    DELETE FROM ZDMOd_booking_d.                       "#EC CI_NOWHERE
    DELETE FROM ZDMOa_booking_d.                       "#EC CI_NOWHERE

    INSERT ZDMOa_booking_d FROM (
        SELECT
          FROM ZDMObooking
            JOIN ZDMOa_travel_d ON ZDMObooking~travel_id = ZDMOa_travel_d~travel_id
            JOIN ZDMOtravel ON ZDMOtravel~travel_id = ZDMObooking~travel_id
          FIELDS  "client,
                  uuid( ) AS booking_uuid,
                  ZDMOa_travel_d~travel_uuid AS parent_uuid,
                  ZDMObooking~booking_id,
                  ZDMObooking~booking_date,
                  ZDMObooking~customer_id,
                  ZDMObooking~carrier_id,
                  ZDMObooking~connection_id,
                  ZDMObooking~flight_date,
                  ZDMObooking~flight_price,
                  ZDMObooking~currency_code,
                  CASE ZDMOtravel~status WHEN 'P' THEN 'N'
                                                   ELSE ZDMOtravel~status END AS booking_status,
                  ZDMOa_travel_d~last_changed_at AS local_last_changed_at
    ).



    " Booking supplements
    out->write( ' --> ZDMOA_BKSUPPL_D' ).

    DELETE FROM ZDMOd_bksuppl_d.                       "#EC CI_NOWHERE
    DELETE FROM ZDMOa_bksuppl_d.                       "#EC CI_NOWHERE

    INSERT ZDMOa_bksuppl_d FROM (
      SELECT FROM ZDMObook_suppl    AS supp
               JOIN ZDMOa_travel_d  AS trvl ON trvl~travel_id = supp~travel_id
               JOIN ZDMOa_booking_d AS book ON book~parent_uuid = trvl~travel_uuid
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
