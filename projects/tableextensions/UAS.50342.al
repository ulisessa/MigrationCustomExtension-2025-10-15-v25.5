tableextension 50342 tableextension50342 extends "Post Code"
{
    Caption = 'Post Code';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(City)
        {
            Caption = 'City';
        }
        modify("Search City")
        {
            Caption = 'Search City';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("County Code")
        {
            Caption = 'County Code';
        }
    }
}

