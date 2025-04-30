tableextension 50800 tableextension50800 extends "FA Reclass. Journal Template"
{
    fields
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Page ID")
        {
            Caption = 'Page ID';
        }
        modify("Page Caption")
        {
            Caption = 'Page Caption';
        }
        modify("Increment Batch Name")
        {
            Caption = 'Increment Batch Name';
        }
    }
}

