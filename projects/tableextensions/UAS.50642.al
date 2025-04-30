tableextension 50642 tableextension50642 extends "Saved Segment Criteria Line"
{
    Caption = 'Saved Segment Criteria Line';
    fields
    {
        modify("Segment Criteria Code")
        {
            Caption = 'Segment Criteria Code';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify(Type)
        {
            OptionCaption = 'Action,Filter';
        }
        modify("Table No.")
        {
            Caption = 'Table No.';
        }
        modify("Expand Contact")
        {
            Caption = 'Expand Contact';
        }
        modify("Ignore Exclusion")
        {
            Caption = 'Ignore Exclusion';
        }
        modify("Table Caption")
        {
            Caption = 'Table Caption';
        }
        modify("No. of Filters")
        {
            Caption = 'No. of Filters';
        }
    }
}

