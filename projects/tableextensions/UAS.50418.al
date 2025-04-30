tableextension 50418 tableextension50418 extends "Payment Terms"
{
    Caption = 'Payment Terms';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Due Date Calculation")
        {
            Caption = 'Due Date Calculation';
        }
        modify("Discount Date Calculation")
        {
            Caption = 'Discount Date Calculation';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Last Modified Date Time")
        {
            Caption = 'Last Modified Date Time';
        }
        modify("Max. No. of Days till Due Date")
        {
            Caption = 'Max. No. of Days till Due Date';
        }
        modify("No. of Installments")
        {
            Caption = 'No. of Installments';
        }
        modify("VAT distribution")
        {
            Caption = 'VAT distribution';
        }
        field(50002; "xDistancia 1er. Plazo"; Text[10])
        {
            DateFormula = true;
        }
        field(50100; "xNo. Plazos"; Integer)
        {
            BlankZero = true;
        }
        field(50101; "xDistancia Plazos"; Text[10])
        {
            DateFormula = true;
        }
        field(50102; "xDías Retroceso"; Integer)
        {
            BlankZero = true;
        }
    }


    //Unsupported feature: Property Modification (TextConstString) on "CannotRemoveDefaultPaymentTermsErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotRemoveDefaultPaymentTermsErr : ENU=You cannot remove the default payment terms.;ESP=No puede quitar los términos de pago predeterminados.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotRemoveDefaultPaymentTermsErr : ENU=You cannot remove the default payment terms.;ESP=No puede quitar los términos de pago predeterminados.;
    //Variable type has not been exported.
}

