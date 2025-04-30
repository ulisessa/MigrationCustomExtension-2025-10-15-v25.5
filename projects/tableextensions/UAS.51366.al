tableextension 51366 tableextension51366 extends "Untracked Planning Element"
{
    Caption = 'Untracked Planning Element';
    fields
    {
        modify("Worksheet Batch Name")
        {
            Caption = 'Worksheet Batch Name';
        }
        modify("Worksheet Line No.")
        {
            Caption = 'Worksheet Line No.';
        }
        modify("Track Line No.")
        {
            Caption = 'Track Line No.';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Parameter Value")
        {
            Caption = 'Parameter Value';
        }
        modify("Warning Level")
        {
            OptionCaption = ',Emergency,Exception,Attention';
        }
    }
}

