tableextension 51081 tableextension51081 extends "Posted Whse. Shipment Line"
{
    Caption = 'Posted Whse. Shipment Line';
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
        modify("Source No.")
        {
            Caption = 'Source No.';
        }
        modify("Source Line No.")
        {
            Caption = 'Source Line No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Shelf No.")
        {
            Caption = 'Shelf No.';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Zone Code")
        {
            Caption = 'Zone Code';
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
            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Destination No.")
        {
            Caption = 'Destination No.';
        }
        modify("Shipping Advice")
        {
            Caption = 'Shipping Advice';
        }
        modify("Shipment Date")
        {
            Caption = 'Shipment Date';
        }
        modify("Posted Source No.")
        {
            Caption = 'Posted Source No.';
        }
        modify("Whse. Shipment No.")
        {
            Caption = 'Whse. Shipment No.';
        }
        modify("Whse Shipment Line No.")
        {
            Caption = 'Whse Shipment Line No.';
        }
        field(50000; "Net kilos"; Decimal)
        {
            Caption = 'Net kilos';
            ToolTip = 'Specifies the value of the Net kilos field.';
        }
        field(50001; "Gross kilos"; Decimal)
        {
            Caption = 'Gross kilos';
            ToolTip = 'Specifies the value of the Gross kilos field.';
        }
    }


    //Unsupported feature: Code Modification on "SetSourceFilter(PROCEDURE 42)".

    //procedure SetSourceFilter();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WhseManagement.SetSourceFilterForPostedWhseShptLine(Rec,SourceType,SourceSubType,SourceNo,SourceLineNo,SetKey);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //WhseManagement.SetSourceFilterForPostedWhseShptLine(Rec,SourceType,SourceSubType,SourceNo,SourceLineNo,SetKey);
    */
    //end;
}

