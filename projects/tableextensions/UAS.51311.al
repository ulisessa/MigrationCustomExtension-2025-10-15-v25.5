tableextension 51311 tableextension51311 extends "Payment Registration Buffer"
{
    Caption = 'Payment Registration Buffer';
    fields
    {
        modify("Ledger Entry No.")
        {
            Caption = 'Ledger Entry No.';
        }
        modify("Source No.")
        {
            Caption = 'Source No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Date Received")
        {
            Caption = 'Date Received';
        }
        modify("Limit Amount Received")
        {
            Caption = 'Limit Amount Received';
        }
        modify("Payment Method Code")
        {
            Caption = 'Payment Method Code';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "DueDateMsg(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //DueDateMsg : ENU=The payment is overdue. You can calculate interest for late payments from customers by choosing the Finance Charge Memo button.;ESP=El pago ha vencido. Para calcular el interés de los pagos vencidos del cliente, haga clic en el botón Documento interés.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DueDateMsg : ENU=The payment is overdue. You can calculate interest for late payments from customers by choosing the Finance Charge Memo button.;ESP=El pago ha vencido. Para calcular el interés de los pagos vencidos del cliente, haga clic en el botón Documento interés.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "PmtDiscMsg(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //PmtDiscMsg : ENU=Payment Discount Date is earlier than Date Received. Payment will be registered as partial payment.;ESP=La fecha de descuento de pago es anterior a la fecha de recepción. El pago se registrará como pago parcial.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PmtDiscMsg : ENU=Payment Discount Date is earlier than Date Received. Payment will be registered as partial payment.;ESP=La fecha de descuento de pago es anterior a la fecha de recepción. El pago se registrar? como pago parcial.;
    //Variable type has not been exported.
}

