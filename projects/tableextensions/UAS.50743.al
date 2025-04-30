tableextension 50743 tableextension50743 extends "Prod. Order Comp. Cmt Line"
{
    Caption = 'Prod. Order Comp. Cmt Line';
    fields
    {
        modify("Prod. Order BOM Line No.")
        {
            Caption = 'Prod. Order BOM Line No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Prod. Order No.")
        {
            Caption = 'Prod. Order No.';
        }
        modify("Prod. Order Line No.")
        {
            Caption = 'Prod. Order Line No.';
        }
    }
}

