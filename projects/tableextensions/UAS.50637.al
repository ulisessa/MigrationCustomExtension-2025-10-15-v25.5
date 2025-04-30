tableextension 50637 tableextension50637 extends "Close Opportunity Code"
{
    Caption = 'Close Opportunity Code';
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
        modify("No. of Opportunities")
        {
            Caption = 'No. of Opportunities';
        }
    }
}

