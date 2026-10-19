tableextension 50429 tableextension50429 extends "No. Series Line"
{
    Caption = 'No. Series Line';
    fields
    {
        modify("Series Code")
        {
            Caption = 'Series Code';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Starting No.")
        {
            Caption = 'Starting No.';
        }
        modify("Ending No.")
        {
            Caption = 'Ending No.';
        }
        modify("Warning No.")
        {
            Caption = 'Warning No.';
        }
        modify("Increment-by No.")
        {
            Caption = 'Increment-by No.';
        }
        modify("Last No. Used")
        {
            Caption = 'Last No. Used';
        }
        modify("Last Date Used")
        {
            Caption = 'Last Date Used';
        }
        field(50000; "Fecha final"; Date)
        {
            Caption = 'Fecha final';
            ToolTip = 'Specifies the value of the Fecha final field.';
        }
        field(50700; CAI; Code[20])
        {
            Caption = 'CAI';
            ToolTip = 'Specifies the value of the CAI field.';
        }
        field(50701; "Fecha Vencimiento"; Date)
        {
            Caption = 'Fecha Vencimiento';
            ToolTip = 'Specifies the value of the Fecha Vencimiento field.';
        }
    }
}

