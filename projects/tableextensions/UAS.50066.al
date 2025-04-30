tableextension 50066 tableextension50066 extends "Cost Accounting Setup"
{
    Caption = 'Cost Accounting Setup';
    fields
    {
        modify("Align G/L Account")
        {
            OptionCaption = 'No Alignment,Automatic,Prompt';
        }
        modify("Align Cost Center Dimension")
        {
            Caption = 'Align Cost Center Dimension';
            OptionCaption = 'No Alignment,Automatic,Prompt';
        }
        modify("Align Cost Object Dimension")
        {
            Caption = 'Align Cost Object Dimension';
            OptionCaption = 'No Alignment,Automatic,Prompt';
        }
        modify("Last Allocation ID")
        {
            Caption = 'Last Allocation ID';
        }
        modify("Last Allocation Doc. No.")
        {
            Caption = 'Last Allocation Doc. No.';
        }
        modify("Cost Center Dimension")
        {
            Caption = 'Cost Center Dimension';
        }
        modify("Cost Object Dimension")
        {
            Caption = 'Cost Object Dimension';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=The starting date can no longer be defined. According to Register No. %1, general ledger entries have already been transferred to Cost Accounting.;ESP=La fecha inicial ya no se puede definir. Según el reg. No. %1, los movimientos de contabilidad ya se han transferido a contabilidad de costes.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=The starting date can no longer be defined. According to Register No. %1, general ledger entries have already been transferred to Cost Accounting.;ESP=La fecha inicial ya no se puede definir. Según el reg. No.%1, los movimientos de contabilidad ya se han transferido a contabilidad de costes.;
    //Variable type has not been exported.
}

