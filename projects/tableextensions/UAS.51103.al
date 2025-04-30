tableextension 51103 tableextension51103 extends "Internal Movement Line"
{
    Caption = 'Internal Movement Line';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Shelf No.")
        {
            Caption = 'Shelf No.';
        }
        modify("From Bin Code")
        {
            Caption = 'From Bin Code';
        }
        modify("To Bin Code")
        {
            Caption = 'To Bin Code';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 32)".

            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Sorting Sequence No.")
        {
            Caption = 'Sorting Sequence No.';
        }
    }

    //Unsupported feature: Code Modification on "CheckQtyItemTrackingLines(PROCEDURE 2)".

    //procedure CheckQtyItemTrackingLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ItemTrackingMgt.CheckWhseItemTrkgSetup("Item No.",WhseSNRequired,WhseLNRequired,false);
    if WhseSNRequired or WhseLNRequired then begin
      WhseWorksheetLine.InitLineWithItem(
        WhseWorksheetLine."Whse. Document Type"::"Internal Movement","No.","Line No.",
        "Location Code","Item No.","Variant Code",
        "Qty. (Base)","Qty. (Base)","Qty. per Unit of Measure");
      exit(
        ItemTrackingMgt.UpdateQuantities(
          WhseWorksheetLine,TotalWhseItemTrackingLine,SourceQuantityArray,UndefinedQtyArray,DATABASE::"Internal Movement Line"));
    end;
    exit(true);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    //++Arbu
    {
      EXIT(
        ItemTrackingMgt.UpdateQuantities(
          WhseWorksheetLine,TotalWhseItemTrackingLine,SourceQuantityArray,UndefinedQtyArray,DATABASE::"Internal Movement Line"));
    }
    //--Arbu
    end;
    exit(true);
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "ItemTrackingErr(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //ItemTrackingErr : @@@=Item tracking numbers should not be higher than the item quantity.;ENU=Item tracking numbers defined for item %1 in the %2 are higher than the item quantity.\\Adjust the item tracking numbers and then increase the item quantity, if relevant.;ESP=Los números de seguimiento de producto definidos para el producto %1 en %2 son mayores que la cantidad de producto.\\Ajústelos y, a continuación, aumente la cantidad de producto, si es necesario.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ItemTrackingErr : @@@=Item tracking numbers should not be higher than the item quantity.;ENU=Item tracking numbers defined for item %1 in the %2 are higher than the item quantity.\\Adjust the item tracking numbers and then increase the item quantity, if relevant.;ESP=Los números de seguimiento de producto definidos para el producto %1 en %2 son mayores que la cantidad de producto.\\Ajústelos y, a continuación, aumente la cantidad de producto, si es necesario.;
    //Variable type has not been exported.
}

