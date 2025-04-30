tableextension 51060 tableextension51060 extends "Standard Address"
{
    Caption = 'Standard Address';
    fields
    {
        modify("Address Type")
        {
            Caption = 'Address Type';
        }
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
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Post Code")
        {
            Caption = 'Post Code';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "DevMsgNotTemporaryErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //DevMsgNotTemporaryErr : ENU=This function can only be used when the record is temporary.;ESP=Esta función solo se puede usar cuando el registro es temporal.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DevMsgNotTemporaryErr : ENU=This function can only be used when the record is temporary.;ESP=Esta función solo se puede usar cuando el registro es temporal.;
    //Variable type has not been exported.
}

