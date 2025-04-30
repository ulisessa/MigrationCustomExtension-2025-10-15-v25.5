tableextension 50449 tableextension50449 extends "Tax Jurisdiction Translation"
{
    Caption = 'Tax Jurisdiction Translation';
    fields
    {
        modify("Tax Jurisdiction Code")
        {
            Caption = 'Tax Jurisdiction Code';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }
}

