tableextension 51250 tableextension51250 extends "Autocomplete Address"
{
    Caption = 'Autocomplete Address';
    fields
    {
        modify(Address)
        {
            Caption = 'Address';
        }
        modify("Address 2")
        {
            Caption = 'Address 2';
        }
        modify(City)
        {
            Caption = 'City';
        }
        modify(Postcode)
        {
            Caption = 'Postcode';
        }
        modify("Country / Region")
        {
            Caption = 'Country / Region';
        }
    }
}

