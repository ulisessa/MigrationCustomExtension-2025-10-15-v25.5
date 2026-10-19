tableextension 51057 tableextension51057 extends "Sales Shipment Buffer"
{
    Caption = 'Sales Shipment Buffer';
    fields
    {
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        field(50000; "Net kilos"; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
            DataClassification = ToBeClassified;
        }
        field(50001; "Gross kilos"; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
            DataClassification = ToBeClassified;
        }
    }
}

