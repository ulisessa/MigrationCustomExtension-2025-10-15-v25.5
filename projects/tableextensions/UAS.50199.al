tableextension 50199 "Workflow - Table Relation Ext." extends "Workflow - Table Relation"
{
    Caption = 'Workflow - Table Relation';
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
        modify("Related Table Caption")
        {
            Caption = 'Related Table Caption';
        }
        modify("Related Field Caption")
        {
            Caption = 'Related Field Caption';
        }
    }
}

