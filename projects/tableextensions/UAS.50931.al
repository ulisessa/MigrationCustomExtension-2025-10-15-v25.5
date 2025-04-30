tableextension 50931 tableextension50931 extends "Troubleshooting Header"
{
    Caption = 'Troubleshooting Header';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=No %1 was found.;ESP=No se encontró %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=No %1 was found.;ESP=No se encontró %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=No %1 was found for %2 %3.;ESP=No se encontró %1 para %2 %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=No %1 was found for %2 %3.;ESP=No se encontró %1 para %2 %3.;
    //Variable type has not been exported.
}

