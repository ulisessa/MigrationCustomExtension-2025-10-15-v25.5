tableextension 50741 tableextension50741 extends "Prod. Order Comment Line"
{
    Caption = 'Prod. Order Comment Line';
    fields
    {
        modify("Prod. Order No.")
        {
            Caption = 'Prod. Order No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Code")
        {
            Caption = 'Code';
        }
    }
}

