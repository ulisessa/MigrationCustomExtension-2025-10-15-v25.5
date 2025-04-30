tableextension 50640 tableextension50640 extends "Segment Criteria Line"
{
    Caption = 'Segment Criteria Line';
    fields
    {
        modify("Segment No.")
        {
            Caption = 'Segment No.';
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

