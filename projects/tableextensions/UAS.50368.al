tableextension 50368 tableextension50368 extends "VAT Statement Template"
{
    Caption = 'VAT Statement Template';
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
        modify("VAT Statement Report ID")
        {
            Caption = 'VAT Statement Report ID';
        }
        modify("Page Caption")
        {
            Caption = 'Page Caption';
        }
        modify("VAT Statement Report Caption")
        {
            Caption = 'VAT Statement Report Caption';
        }
    }
}

