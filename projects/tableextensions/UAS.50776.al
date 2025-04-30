tableextension 50776 tableextension50776 extends "Inventory Event Buffer"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Source Line ID")
        {
            Caption = 'Source Line ID';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Transfer Direction")
        {
            Caption = 'Transfer Direction';
        }
        modify("Action Message")
        {
            Caption = 'Action Message';
        }
        modify("Attached to Line No.")
        {
            Caption = 'Attached to Line No.';
        }
        modify("Forecast Type")
        {
            Caption = 'Forecast Type';
        }
        modify("Ref. Order No.")
        {
            Caption = 'Ref. Order No.';
        }
        modify("Ref. Order Type")
        {
            OptionCaption = ' ,Purchase,Prod. Order,Assembly,Transfer';
        }
        modify("Ref. Order Line No.")
        {
            Caption = 'Ref. Order Line No.';
        }
    }

    //Unsupported feature: Code Modification on "TransferFromSales(PROCEDURE 1)".

    //procedure TransferFromSales();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if SalesLine.Type <> SalesLine.Type::Item then
      exit;

    #4..8
    "Location Code" := SalesLine."Location Code";
    "Availability Date" := SalesLine."Shipment Date";
    Type := Type::Sale;
    SalesLineReserve.ReservQuantity(SalesLine,RemQty,"Remaining Quantity (Base)");
    SalesLine.CalcFields("Reserved Qty. (Base)");
    "Remaining Quantity (Base)" := -"Remaining Quantity (Base)";
    "Reserved Quantity (Base)" := -SalesLine."Reserved Qty. (Base)";
    #16..20
    end;

    OnAfterTransferFromSales(Rec,SalesLine);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
    //++ARbu SalesLineReserve.ReservQuantity(SalesLine,RemQty,"Remaining Quantity (Base)");
    #13..23
    */
    //end;

    //Unsupported feature: Property Insertion (Dimensions) on "TransferFromSalesReturn(PROCEDURE 15).RemQty(Variable 1001)".

}

