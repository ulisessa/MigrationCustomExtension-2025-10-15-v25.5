tableextension 51113 tableextension51113 extends "VAT Report Line"
{
    Caption = 'VAT Report Line';
    fields
    {
        modify("VAT Report No.")
        {
            Caption = 'VAT Report No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("VAT Calculation Type")
        {
            Caption = 'VAT Calculation Type';
        }
        modify("Bill-to/Pay-to No.")
        {
            Caption = 'Bill-to/Pay-to No.';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Internal Ref. No.")
        {
            Caption = 'Internal Ref. No.';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=This is not allowed because of the setup in the %1 window.;ESP=Esto no se permite debido a la configuración establecida en la ventana %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=This is not allowed because of the setup in the %1 window.;ESP=Esto no se permite debido a la configuración establecida en la ventana %1.;
    //Variable type has not been exported.
}

