tableextension 51109 tableextension51109 extends "VAT Return Period"
{
    Caption = 'VAT Return Period';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("No. Series")
        {
            Caption = 'No. Series';
        }
        modify("Period Key")
        {
            Caption = 'Period Key';
        }
        modify("End Date")
        {
            Caption = 'End Date';
        }
        modify("Received Date")
        {
            Caption = 'Received Date';
        }
        modify("VAT Return No.")
        {
            Caption = 'VAT Return No.';
        }
        modify("VAT Return Status")
        {
            Caption = 'VAT Return Status';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "DeleteExistingVATRetErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //DeleteExistingVATRetErr : ENU=You cannot delete a VAT return period that has a linked VAT return.;ESP=No puede eliminar un período de devolución de IVA que tenga una devolución de IVA vinculada.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DeleteExistingVATRetErr : ENU=You cannot delete a VAT return period that has a linked VAT return.;ESP=No puede eliminar un período de devolución de IVA que tenga una devolución de IVA vinculada.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "OverdueTxt(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //OverdueTxt : @@@="%1 - date; %2 - days count";ENU=Your VAT return is overdue since %1 (%2 days);ESP=La devolución de IVA vence desde %1 (%2 días);
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OverdueTxt : @@@="%1 - date; %2 - days count";ENU=Your VAT return is overdue since %1 (%2 days);ESP=La devolución de IVA vence desde %1 (%2 días);
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "OpenTxt(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //OpenTxt : @@@="%1 - date; %2 - days count";ENU=Your VAT return is due %1 (in %2 days);ESP=La devolución de IVA vence %1 (en %2 días);
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OpenTxt : @@@="%1 - date; %2 - days count";ENU=Your VAT return is due %1 (in %2 days);ESP=La devolución de IVA vence %1 (en %2 días);
    //Variable type has not been exported.
}

