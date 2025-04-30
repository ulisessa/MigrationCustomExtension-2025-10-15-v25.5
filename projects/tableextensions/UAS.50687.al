tableextension 50687 tableextension50687 extends "HR Confidential Comment Line"
{
    Caption = 'HR Confidential Comment Line';
    fields
    {
        modify("Table Name")
        {
            OptionCaption = 'Confidential Information';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Table Line No.")
        {
            Caption = 'Table Line No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
    }
}

