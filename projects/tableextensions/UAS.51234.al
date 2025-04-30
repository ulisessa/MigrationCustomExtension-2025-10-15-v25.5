tableextension 51234 tableextension51234 extends "Assemble-to-Order Link"
{
    Caption = 'Assemble-to-Order Link';
    fields
    {
        modify("Assembly Document No.")
        {
            Caption = 'Assembly Document No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Document Line No.")
        {
            Caption = 'Document Line No.';
        }
    }

    //Unsupported feature: Code Modification on "ReserveAsmToSale(PROCEDURE 10)".

    //procedure ReserveAsmToSale();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if SalesLine."Document Type" <> SalesLine."Document Type"::Order then
      exit;

    #4..9
        DATABASE::"Sales Line",SalesLine."Document Type",SalesLine."Document No.",'',0,SalesLine."Line No.",
        AsmHeader."Variant Code",AsmHeader."Location Code",AsmHeader."Qty. per Unit of Measure");
      AsmHeaderReserve.CreateReservationSetFrom(TrackingSpecification);
      AsmHeaderReserve.CreateReservation2(AsmHeader,AsmHeader.Description,AsmHeader."Due Date",QtyToReserve,QtyToReserveBase);

      if SalesLine.Reserve = SalesLine.Reserve::Never then
        SalesLine.Reserve := SalesLine.Reserve::Optional;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..12
    //++Arbu  AsmHeaderReserve.CreateReservation2(AsmHeader,AsmHeader.Description,AsmHeader."Due Date",QtyToReserve,QtyToReserveBase);
    #14..17
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: QtyToAddBlank) (VariableCollection) on "RemoveTrackingFromReservation(PROCEDURE 39)".



    //Unsupported feature: Code Modification on "RemoveTrackingFromReservation(PROCEDURE 39)".

    //procedure RemoveTrackingFromReservation();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OnBeforeRemoveTrackingFromReservation(ReservEntry,ItemTrackingCode);

    ReservEntry.SetPointerFilter;
    #4..8
    ItemTrackingCodeRec.Get(ItemTrackingCode);
    ReservEngineMgt.AddItemTrackingToTempRecSet(
      ReservEntry,TrackingSpecification,
      TrackingSpecification."Quantity (Base)",QtyToAdd,
      ItemTrackingCodeRec."SN Specific Tracking",
      ItemTrackingCodeRec."Lot Specific Tracking");

    OnAfterRemoveTrackingFromReservation(ReservEntry,TrackingSpecification,ItemTrackingCodeRec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
      //++Arbu
      QtyToAdd,QtyToAddBlank,
      //TrackingSpecification."Quantity (Base)",QtyToAdd,
      //--Arbu
    #13..16
    */
    //end;


    //Unsupported feature: Code Modification on "RestoreItemTracking(PROCEDURE 37)".

    //procedure RestoreItemTracking();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetAsmHeader;

    if TrackingSpecification.Find('-') then
    #4..6
        CreateReservEntry.SetDisallowCancellation(true);
        CreateReservEntry.SetBinding(ReservEntry.Binding::"Order-to-Order");
        CreateReservEntry.SetQtyToHandleAndInvoice(
          TrackingSpecification."Qty. to Handle (Base)",TrackingSpecification."Qty. to Invoice (Base)");

        CreateReservEntry.CreateReservEntryFor(
          DATABASE::"Assembly Header",AsmHeader."Document Type",AsmHeader."No.",'',0,0,
          AsmHeader."Qty. per Unit of Measure",0,TrackingSpecification."Quantity (Base)",
          TrackingSpecification."Serial No.",TrackingSpecification."Lot No.");
        CreateReservEntry.CreateReservEntryFrom(
          DATABASE::"Sales Line",SalesLine."Document Type",SalesLine."Document No.",'',0,SalesLine."Line No.",
          AsmHeader."Qty. per Unit of Measure",
    #19..24
          AsmHeader."Due Date",AsmHeader."Due Date",0,0);
      until TrackingSpecification.Next = 0;
    TrackingSpecification.DeleteAll;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9
          TrackingSpecification."Qty. to Handle (Base)",TrackingSpecification."Qty. to Invoice (Base)",
          //++Arbu
          TrackingSpecification."Net kilos to handle (Base)",TrackingSpecification."Net kilos to invoice (Base)",
          TrackingSpecification."Gross kilos to handle (Base)",TrackingSpecification."Gross kilos to invoice (Base)"
          //--Arbu
          );
    #11..14
          TrackingSpecification."Serial No.",TrackingSpecification."Lot No.",
          //++Arbu
          TrackingSpecification."Net kilos (Base)",TrackingSpecification."Gross kilos (Base)"
          //--Arbu
          );
    #16..27
    */
    //end;


    //Unsupported feature: Code Modification on "CopyAsmToNewAsmOrder(PROCEDURE 21)".

    //procedure CopyAsmToNewAsmOrder();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ToAsmOrderHeader := FromAsmHeader;
    ToAsmOrderHeader."Document Type" := ToAsmOrderHeader."Document Type"::Order;
    ToAsmOrderHeader."No." := '';
    ToAsmOrderHeader.Status := ToAsmOrderHeader.Status::Open;
    ToAsmOrderHeader."Assembled Quantity" := 0;
    ToAsmOrderHeader."Assembled Quantity (Base)" := 0;
    ToAsmOrderHeader.Validate(Quantity,FromAsmHeader."Quantity to Assemble");
    ToAsmOrderHeader.Insert(true);
    RecordLinkManagement.CopyLinks(FromAsmHeader,ToAsmOrderHeader);

    FromAsmLine.SetRange("Document Type",FromAsmHeader."Document Type");
    FromAsmLine.SetRange("Document No.",FromAsmHeader."No.");
    #13..34
          ToAsmCommentLine.Insert(true);
        until FromAsmCommentLine.Next = 0;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
    //++Arbu RecordLinkManagement.CopyLinks(FromAsmHeader,ToAsmOrderHeader);
    #10..37
    */
    //end;

    //Unsupported feature: Property Insertion (Dimensions) on "RemoveTrackingFromReservation(PROCEDURE 39).QtyToAdd(Variable 1006)".



    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=Do you want to roll up the price from the assembly components?;ESP=¿Desea distribuir el precio de los componentes del ensamblado?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=Do you want to roll up the price from the assembly components?;ESP=?Desea distribuir el precio de los componentes del ensamblado?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=Do you want to roll up the cost from the assembly components?;ESP=¿Desea distribuir el coste de los componentes del ensamblado?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=Do you want to roll up the cost from the assembly components?;ESP=?Desea distribuir el coste de los componentes del ensamblado?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : @@@="%1 = Document Type, %2 = No.";ENU=The item tracking defined on Assembly Header with Document Type %1, No. %2 exceeds %3 on Sales Line with Document Type %4, Document No. %5, Line No. %6.\\ You must adjust the existing item tracking before you can reenter the new quantity.;ESP=El seguimiento de productos definido en la cabecera de ensamblado con el tipo de documento %1, No. %2 excede %3 en la línea de ventas con el tipo de documento %4, No. documento %5, No. línea %6.\\ Debe ajustar el seguim. prod. actual antes de volver a introducir la nueva cantidad.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : @@@="%1 = Document Type, %2 = No.";ENU=The item tracking defined on Assembly Header with Document Type %1, No. %2 exceeds %3 on Sales Line with Document Type %4, Document No. %5, Line No. %6.\\ You must adjust the existing item tracking before you can reenter the new quantity.;ESP=El seguimiento de productos definido en la cabecera de ensamblado con el tipo de documento %1, No.%2 excede %3 en la línea de ventas con el tipo de documento %4, No.documento %5, No.línea %6.\\ Debe ajustar el seguim. prod. actual antes de volver a introducir la nueva cantidad.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=%1 cannot be lower than %2 or higher than %3.\These limits may be defined by constraints calculated from the %4 field on the related %5. Refer to the field help for more information.;ESP=%1 no puede ser inferior a %2 ni superior a %3.\Estos límites pueden definirse por restricciones calculadas a partir del campo %4 del %5 relacionado. Consulte la ayuda del campo para obtener más información.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=%1 cannot be lower than %2 or higher than %3.\These limits may be defined by constraints calculated from the %4 field on the related %5. Refer to the field help for more information.;ESP=%1 no puede ser inferior a %2 ni superior a %3.\Estos límites pueden definirse por restricciones calculadas a partir del campo %4 del %5 relacionado. Consulte la ayuda del campo para obtener más información.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=One or more %1 lines exist for the %2.;ESP=Existen una o más líneas %1 para %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=One or more %1 lines exist for the %2.;ESP=Existen una o más líneas %1 para %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=The status of the linked assembly order will be changed to %1. Do you want to continue?;ESP=El estado del pedido de ensamblado vinculado se cambiará a %1. ¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=The status of the linked assembly order will be changed to %1. Do you want to continue?;ESP=El estado del pedido de ensamblado vinculado se cambiar? a %1. ?Desea continuar?;
    //Variable type has not been exported.
}

