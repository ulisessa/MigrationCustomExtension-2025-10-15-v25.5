tableextension 51059 tableextension51059 extends "Custom Address Format Line"
{
    Caption = 'Custom Address Format Line';
    fields
    {
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Field Position")
        {
            Caption = 'Field Position';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "LimitExceededErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //LimitExceededErr : ENU=You cannot create more than three Custom Address Format Lines.;ESP=No puede crear más de tres líneas de formato de dirección personalizado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LimitExceededErr : ENU=You cannot create more than three Custom Address Format Lines.;ESP=No puede crear más de tres líneas de formato de dirección personalizado.;
    //Variable type has not been exported.
}

