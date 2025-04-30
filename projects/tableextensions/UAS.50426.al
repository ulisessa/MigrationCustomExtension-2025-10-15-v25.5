tableextension 50426 tableextension50426 extends "Fin. Charge Comment Line"
{
    Caption = 'Fin. Charge Comment Line';
    fields
    {
        modify(Type)
        {
            OptionCaption = 'Finance Charge Memo,Issued Finance Charge Memo';
        }
        modify("No.")
        {
            Caption = 'No.';
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

