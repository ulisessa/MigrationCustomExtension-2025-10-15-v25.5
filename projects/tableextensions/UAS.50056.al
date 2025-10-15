tableextension 50056 "Country/Region Trans. Ext." extends "Country/Region Translation"
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

