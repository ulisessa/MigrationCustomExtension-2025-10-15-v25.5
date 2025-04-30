tableextension 50961 tableextension50961 extends "Customer Price Group"
{
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
        modify("Allow Line Disc.")
        {
            Caption = 'Allow Line Disc.';
        }
    }
}

