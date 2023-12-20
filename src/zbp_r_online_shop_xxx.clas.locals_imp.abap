CLASS lsc_zbp_r_online_shop_xxx DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.
    METHODS save_modified REDEFINITION.
ENDCLASS.

CLASS lsc_zbp_r_online_shop_xxx IMPLEMENTATION.

  METHOD save_modified.
    DATA : lt_online_shop_as TYPE STANDARD TABLE OF zshop_as_xxx,
           ls_online_shop_as TYPE                   zshop_as_xxx.
    IF zbp_r_online_shop_xxx=>cv_pr_mapped-purchaserequisition IS NOT INITIAL.
      LOOP AT zbp_r_online_shop_xxx=>cv_pr_mapped-purchaserequisition ASSIGNING FIELD-SYMBOL(<fs_pr_mapped>).
        CONVERT KEY OF i_purchaserequisitiontp FROM <fs_pr_mapped>-%pid TO
DATA(ls_pr_key).
        <fs_pr_mapped>-purchaserequisition = ls_pr_key-purchaserequisition.
      ENDLOOP.
    ENDIF.

    IF create-online_shop IS NOT INITIAL.
      " Creates internal table with instance data
      lt_online_shop_as = CORRESPONDING #( create-online_shop ).
      lt_online_shop_as[ 1 ]-purchasereqn =  ls_pr_key-purchaserequisition
.

      INSERT zshop_as_xxx FROM TABLE @lt_online_shop_as.
    ENDIF.
  ENDMETHOD.
ENDCLASS.

CLASS lhc_zbp_r_online_shop_xxx  DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR  online_shop RESULT result.


    METHODS create_pr FOR MODIFY
      IMPORTING keys FOR ACTION online_shop~create_pr.


    METHODS update_inforecord FOR MODIFY
      IMPORTING keys FOR ACTION online_shop~update_inforecord.


    METHODS calculate_order_id FOR DETERMINE ON MODIFY
      IMPORTING keys FOR online_shop~calculate_order_id.

    METHODS set_inforecord FOR MODIFY
      IMPORTING keys FOR ACTION online_shop~set_inforecord.



ENDCLASS.

CLASS lhc_zbp_r_online_shop_xxx  IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.


  METHOD create_pr.
  ENDMETHOD.
  METHOD update_inforecord.

   ENDMETHOD.
   METHOD calculate_order_id.
   ENDMETHOD.
   METHOD set_inforecord.
   ENDMETHOD.
   ENDCLASS.
