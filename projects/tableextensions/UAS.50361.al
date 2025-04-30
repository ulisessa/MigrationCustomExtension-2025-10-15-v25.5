tableextension 50361 tableextension50361 extends "VAT Registration Log"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("VAT Registration No.")
        {
            Caption = 'VAT Registration No.';
        }
        modify("Account No.")
        {
            Caption = 'Account No.';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify(Status)
        {
            OptionCaption = 'Not Verified,Valid,Invalid';
        }
        modify("Verified Address")
        {
            Caption = 'Verified Address';
        }
        modify("Verified Postcode")
        {
            Caption = 'Verified Postcode';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "CompInfoUpdatedMsg(Variable 1018)".

    //var
    //>>>> ORIGINAL VALUE:
    //CompInfoUpdatedMsg : ENU=The company information has been updated.;ESP=Se ha actualizado la información de la empresa.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CompInfoUpdatedMsg : ENU=The company information has been updated.;ESP=Se ha actualizado la información de la empresa.;
    //Variable type has not been exported.
}

