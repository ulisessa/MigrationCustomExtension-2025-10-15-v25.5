tableextension 50202 "Workflow Category Ext." extends "Workflow Category"
{
    Caption = 'Workflow Category';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }
}

