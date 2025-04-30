tableextension 51114 tableextension51114 extends "VAT Statement Report Line"
{
    Caption = 'VAT Statement Report Line';
    fields
    {
        modify("VAT Report No.")
        {
            Caption = 'VAT Report No.';
        }
        modify("VAT Report Config. Code")
        {
            Caption = 'VAT Report Config. Code';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Row No.")
        {
            Caption = 'Row No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Box No.")
        {
            Caption = 'Box No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "MissingSetupErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //MissingSetupErr : @@@="%1 = Setup table";ENU=This is not allowed because of the setup in the %1 window.;ESP=Esto no se permite debido a la configuración establecida en la ventana %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MissingSetupErr : @@@="%1 = Setup table";ENU=This is not allowed because of the setup in the %1 window.;ESP=Esto no se permite debido a la configuración establecida en la ventana %1.;
    //Variable type has not been exported.
}

