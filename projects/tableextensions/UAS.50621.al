tableextension 50621 tableextension50621 extends "Segment History"
{
    fields
    {
        modify("Segment No.")
        {
            Caption = 'Segment No.';
        }
        modify("Segment Action No.")
        {
            Caption = 'Segment Action No.';
        }
        modify("Segment Line No.")
        {
            Caption = 'Segment Line No.';
        }
        modify("Contact No.")
        {
            Caption = 'Contact No.';
        }
        modify("Action Taken")
        {
            Caption = 'Action Taken';
            OptionCaption = 'Insertion,Deletion';
        }
    }
}

