tableextension 50058 tableextension50058 extends "Cost Journal Template"
{
    fields
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Posting Report ID")
        {
            Caption = 'Posting Report ID';
        }
        modify("Posting Report Caption")
        {
            Caption = 'Posting Report Caption';
        }
    }
}

