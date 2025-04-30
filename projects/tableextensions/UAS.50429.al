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
        }
        field(50700; CAI; Code[20])
        {
        }
        field(50701; "Fecha Vencimiento"; Date)
        {
        }
    }
}

