tableextension 50195 "Workflow Buffer Ext." extends "Workflow Buffer"
{
    Caption = 'Workflow Buffer';
    fields
    {
        modify("Category Code")
        {
            Caption = 'Category Code';
        }
        modify("Workflow Code")
        {
            Caption = 'Workflow Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }
}

