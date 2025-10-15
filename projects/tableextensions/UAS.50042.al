tableextension 50042 "Customer/Vendor Warn. 349 Ext." extends "Customer/Vendor Warning 349"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Include Correction")
        {
            Caption = 'Include Correction';
        }
        modify("Customer/Vendor No.")
        {
            Caption = 'Customer/Vendor No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Original Declaration FY")
        {
            Caption = 'Original Declaration FY';
        }
        modify("VAT Entry No.")
        {
            Caption = 'VAT Entry No.';
        }
        modify("Delivery Operation Code")
        {
            Caption = 'Delivery Operation Code';
        }
        modify("No Taxable Entry No.")
        {
            Caption = 'No Taxable Entry No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text1100000(Variable 1100000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100000 : ENU=%1 should be TRUE in order to modify the %2 for this line.;ESP=Para poder modificar %2 en esta línea, %1 debe ser TRUE.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100000 : ENU=%1 should be TRUE in order to modify the %2 for this line.;ESP=Para poder modificar %2 en esta línea, %1 debe ser TRUE.;
    //Variable type has not been exported.
}

