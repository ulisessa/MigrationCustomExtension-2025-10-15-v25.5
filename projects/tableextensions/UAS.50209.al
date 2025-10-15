tableextension 50209 "Dynamic Req. Page Field Ext." extends "Dynamic Request Page Field"
{
    Caption = 'Dynamic Request Page Field';
    fields
    {
        modify("Table Caption")
        {
            Caption = 'Table Caption';
        }
        modify("Field Caption")
        {
            Caption = 'Field Caption';
        }
    }
}

