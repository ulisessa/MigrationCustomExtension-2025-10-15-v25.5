tableextension 50174 "ECSL VAT Report Line Rel. Ext." extends "ECSL VAT Report Line Relation"
{
    Caption = 'ECSL VAT Report Line Relation';
    fields
    {
        modify("VAT Entry No.")
        {
            Caption = 'VAT Entry No.';
        }
        modify("ECSL Line No.")
        {
            Caption = 'ECSL Line No.';
        }
        modify("ECSL Report No.")
        {
            Caption = 'ECSL Report No.';
        }
    }
}

