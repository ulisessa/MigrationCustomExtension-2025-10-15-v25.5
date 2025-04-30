tableextension 50407 tableextension50407 extends "Payment Method"
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
        modify("Direct Debit Pmt. Terms Code")
        {
            Caption = 'Direct Debit Pmt. Terms Code';
        }
        modify("Pmt. Export Line Definition")
        {
            Caption = 'Pmt. Export Line Definition';
        }

        modify("Last Modified Date Time")
        {
            Caption = 'Last Modified Date Time';
        }
        modify("SII Payment Method Code")
        {
            Caption = 'SII Payment Method Code';
        }
        modify("Submit for Acceptance")
        {
            Caption = 'Submit for Acceptance';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "UseForInvoicingErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //UseForInvoicingErr : ENU=The Use for Invoicing property must be set to true in the Invoicing App.;ESP=El uso para la propiedad de facturación debe establecerse en true en Microsoft Invoicing.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UseForInvoicingErr : ENU=The Use for Invoicing property must be set to true in the Invoicing App.;ESP=El uso para la propiedad de facturación debe establecerse en true en Microsoft Invoicing.;
    //Variable type has not been exported.
}

