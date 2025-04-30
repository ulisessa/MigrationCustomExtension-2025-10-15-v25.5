tableextension 50120 tableextension50120 extends "Positive Pay Footer"
{
    Caption = 'Positive Pay Footer';
    fields
    {
        modify("Data Exch. Entry No.")
        {
            Caption = 'Data Exch. Entry No.';
        }
        modify("Data Exch. Detail Entry No.")
        {
            Caption = 'Data Exch. Detail Entry No.';
        }
        modify("Account Number")
        {
            Caption = 'Account Number';
        }
    }
}

