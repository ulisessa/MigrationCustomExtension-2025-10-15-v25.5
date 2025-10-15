tableextension 50208 "Dynamic Req. Page Entity Ext." extends "Dynamic Request Page Entity"
{
    Caption = 'Dynamic Request Page Entity';
    fields
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Table Caption")
        {
            Caption = 'Table Caption';
        }
        modify("Related Table Caption")
        {
            Caption = 'Related Table Caption';
        }
        modify("Sequence No.")
        {
            Caption = 'Sequence No.';
        }
    }
}

