tableextension 50777 tableextension50777 extends "Inventory Page Data"
{
    Caption = 'Inventory Page Data';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Period Type")
        {
            OptionCaption = 'Day,Week,Month,Quarter,Year';
        }
        modify("Period No.")
        {
            Caption = 'Period No.';
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
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Scheduled Receipt")
        {
            Caption = 'Scheduled Receipt';
        }
        modify(Forecast)
        {
            Caption = 'Forecast';
        }
        modify("Remaining Forecast")
        {
            Caption = 'Remaining Forecast';
        }
        modify("Action Message Qty.")
        {
            Caption = 'Action Message Qty.';
        }
        modify("Action Message")
        {
            Caption = 'Action Message';
        }
        modify("Attached to Line No.")
        {
            Caption = 'Attached to Line No.';
        }
        modify("Ref. Order No.")
        {
            Caption = 'Ref. Order No.';
        }
        modify("Reserved Receipt")
        {
            Caption = 'Reserved Receipt';
        }
    }
}

