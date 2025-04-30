tableextension 50092 tableextension50092 extends "Direct Debit Collection Entry"
{
    fields
    {
        modify("Direct Debit Collection No.")
        {
            Caption = 'Direct Debit Collection No.';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Customer No.")
        {
            Caption = 'Customer No.';
        }
        modify("Applies-to Entry No.")
        {
            Caption = 'Applies-to Entry No.';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Transaction ID")
        {
            Caption = 'Transaction ID';
        }
        modify("Sequence Type")
        {
            OptionCaption = 'One Off,First,Recurring,Last';
        }
        modify("Mandate ID")
        {
            Caption = 'Mandate ID';
        }
        modify("Mandate Type of Payment")
        {
            Caption = 'Mandate Type of Payment';
            OptionCaption = 'One Off,Recurrent';
        }
        modify("Applies-to Entry Document No.")
        {
            Caption = 'Applies-to Entry Document No.';
        }
        modify("Applies-to Entry Description")
        {
            Caption = 'Applies-to Entry Description';
        }
        modify("Applies-to Entry Posting Date")
        {
            Caption = 'Applies-to Entry Posting Date';
        }
        modify("Applies-to Entry Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Applies-to Entry Currency Code';
        }
        modify("Applies-to Entry Amount")
        {
            Caption = 'Applies-to Entry Amount';
        }
        modify("Applies-to Entry Rem. Amount")
        {
            Caption = 'Applies-to Entry Rem. Amount';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "DocTypeErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //DocTypeErr : ENU=The customer ledger entry must be of type Invoice, Finance Charge Memo, Reminder or Bill.;ESP=El movimiento del cliente debe ser del tipo Factura, Documento interés, Recordatorio o Efecto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DocTypeErr : ENU=The customer ledger entry must be of type Invoice, Finance Charge Memo, Reminder or Bill.;ESP=El movimiento del cliente debe ser del tipo Factura, Documento interés, Recordatorio o Efecto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "RejectQst(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //RejectQst : ENU=Do you want to reject this collection entry?;ESP=¿Confirma que desea rechazar este movimiento de cobro?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RejectQst : ENU=Do you want to reject this collection entry?;ESP=?Confirma que desea rechazar este movimiento de cobro?;
    //Variable type has not been exported.
}

