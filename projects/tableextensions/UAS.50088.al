tableextension 50088 "Bank Export/Import Setup Ext." extends "Bank Export/Import Setup"
{
    Caption = 'Bank Export/Import Setup';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Direction)
        {
            Caption = 'Direction';
        }
        modify("Data Exch. Def. Code")
        {
            Caption = 'Data Exch. Def. Code';
        }
        modify("Check Export Codeunit")
        {
            Caption = 'Check Export Codeunit';
        }
        modify("Check Export Codeunit Name")
        {
            Caption = 'Check Export Codeunit Name';
        }
    }
}

