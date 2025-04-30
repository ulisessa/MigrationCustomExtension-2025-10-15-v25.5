tableextension 50056 tableextension50056 extends "Country/Region Translation"
{
    Caption = 'Country/Region Translation';
    fields
    {
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
    }
}

