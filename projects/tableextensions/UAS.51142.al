tableextension 51142 tableextension51142 extends "Miniform Header"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("No. of Records in List")
        {
            Caption = 'No. of Records in List';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=There can only be one login form.;ESP=Solo puede haber un formulario de inicio de sesión.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=There can only be one login form.;ESP=Solo puede haber un formulario de inicio de sesión.;
    //Variable type has not been exported.
}

