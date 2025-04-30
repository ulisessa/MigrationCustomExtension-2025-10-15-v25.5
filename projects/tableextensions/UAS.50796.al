tableextension 50796 tableextension50796 extends "FA Journal Template"
{
    fields
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Test Report ID")
        {
            Caption = 'Test Report ID';
        }
        modify("Page ID")
        {
            Caption = 'Page ID';
        }
        modify("Posting Report ID")
        {
            Caption = 'Posting Report ID';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify(Recurring)
        {
            Caption = 'Recurring';
        }
        modify("Test Report Caption")
        {
            Caption = 'Test Report Caption';
        }
        modify("Page Caption")
        {
            Caption = 'Page Caption';
        }
        modify("Posting Report Caption")
        {
            Caption = 'Posting Report Caption';
        }
        modify("Maint. Posting Report ID")
        {
            Caption = 'Maint. Posting Report ID';
        }
        modify("Maint. Posting Report Caption")
        {
            Caption = 'Maint. Posting Report Caption';
        }
        modify("Posting No. Series")
        {
            Caption = 'Posting No. Series';
        }
        modify("Increment Batch Name")
        {
            Caption = 'Increment Batch Name';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=Only the %1 field can be filled in on recurring journals.;ESP=Solo se debe completar el campo %1 en los diarios periódicos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=Only the %1 field can be filled in on recurring journals.;ESP=Solo se debe completar el campo %1 en los diarios periódicos.;
    //Variable type has not been exported.
}

