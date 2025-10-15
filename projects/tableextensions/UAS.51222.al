tableextension 51222 tableextension51222 extends "Country/Region"
{
    Caption = 'Country/Region';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("ISO Code")
        {
            Caption = 'ISO Code';
        }
        modify("ISO Numeric Code")
        {
            Caption = 'ISO Numeric Code';
        }
        modify("EU Country/Region Code")
        {
            Caption = 'EU Country/Region Code';
        }
        modify("Intrastat Code")
        {
            Caption = 'Intrastat Code';
        }
        modify("Address Format")
        {
            Caption = 'Address Format';
        }
        modify("Contact Address Format")
        {
            Caption = 'Contact Address Format';
            OptionCaption = 'First,After Company Name,Last';
        }
        modify("Last Modified Date Time")
        {
            Caption = 'Last Modified Date Time';
        }
        modify("VAT Registration No. digits")
        {
            Caption = 'VAT Registration No. digits';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "CountryRegionNotFilledErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //CountryRegionNotFilledErr : ENU=You must specify a country or region.;ESP=Debe especificar un país o región.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CountryRegionNotFilledErr : ENU=You must specify a country or region.;ESP=Debe especificar un país o región.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NumericErr(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //NumericErr : ENU=must contain numbers only;ESP=solo debe contener números;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NumericErr : ENU=must contain numbers only;ESP=solo debe contener números;
    //Variable type has not been exported.
}

