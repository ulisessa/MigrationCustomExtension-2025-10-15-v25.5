tableextension 50139 "Payment App. Proposal Ext." extends "Payment Application Proposal"
{
    Caption = 'Payment Application Proposal';
    fields
    {
        modify("Bank Account No.")
        {
            Caption = 'Bank Account No.';
        }
        modify("Statement No.")
        {
            Caption = 'Statement No.';
        }
        modify("Statement Line No.")
        {
            Caption = 'Statement Line No.';
        }
        modify("Account No.")
        {
            Caption = 'Account No.';
        }
        modify("Applies-to Entry No.")
        {
            Caption = 'Applies-to Entry No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 34)".

            Caption = 'Description';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("External Document No.")
        {

            //Unsupported feature: Property Modification (Data type) on ""External Document No."(Field 37)".

            Caption = 'External Document No.';
        }
        modify("Sorting Order")
        {
            Caption = 'Sorting Order';
        }
    }

    //Unsupported feature: Code Modification on "UpdateLedgEntryDisc(PROCEDURE 42)".

    //procedure UpdateLedgEntryDisc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestField("Applies-to Entry No.");
    AppliedPmtEntry.TransferFields(Rec);
    BankAccReconLine.Get("Statement Type","Bank Account No.","Statement No.","Statement Line No.");

    case "Account Type" of
      "Account Type"::Customer:
        BankAccReconPost.ApplyCustLedgEntry(
          AppliedPmtEntry,'',BankAccReconLine."Transaction Date",
          "Pmt. Disc. Due Date","Pmt. Disc. Tolerance Date","Remaining Pmt. Disc. Possible");
      "Account Type"::Vendor:
        BankAccReconPost.ApplyVendLedgEntry(
          AppliedPmtEntry,'',BankAccReconLine."Transaction Date",
          "Pmt. Disc. Due Date","Pmt. Disc. Tolerance Date","Remaining Pmt. Disc. Possible");
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    //++Arbu
    {
    CASE "Account Type" OF
    #6..13
    END;
    }
    //--Arbu
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "StmtAmtIsFullyAppliedErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //StmtAmtIsFullyAppliedErr : ENU=The statement amount is already fully applied.;ESP=El importe del extracto ya se aplicó por completo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //StmtAmtIsFullyAppliedErr : ENU=The statement amount is already fully applied.;ESP=El importe del extracto ya se aplicó por completo.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotChangeAppliedLineErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotChangeAppliedLineErr : ENU=You cannot change the line because the entry is applied. Remove the applied entry first.;ESP=No puede cambiar la línea porque se ha liquidado el movimiento. Primero quite el movimiento liquidado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotChangeAppliedLineErr : ENU=You cannot change the line because the entry is applied. Remove the applied entry first.;ESP=No puede cambiar la línea porque se ha liquidado el movimiento. Primero quite el movimiento liquidado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "TransactionDateIsBeforePostingDateMsg(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //TransactionDateIsBeforePostingDateMsg : @@@="%1 Transaction Date; %2: Posting Date";ENU=The transaction date %1 is before the posting date %2.;ESP=La fecha de transacción %1 es anterior a la fecha de registro %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TransactionDateIsBeforePostingDateMsg : @@@="%1 Transaction Date; %2: Posting Date";ENU=The transaction date %1 is before the posting date %2.;ESP=La fecha de transacción %1 es anterior a la fecha de registro %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "WantToApplyCreditMemoAndInvoicesMsg(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //WantToApplyCreditMemoAndInvoicesMsg : ENU=If you want to apply credit memos and invoices, we recommend that you start by applying credit memos and then apply all others entries.;ESP=Si desea liquidar abonos y facturas, se recomienda liquidar los abonos primero y, a continuación, liquidar el resto de los movimientos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //WantToApplyCreditMemoAndInvoicesMsg : ENU=If you want to apply credit memos and invoices, we recommend that you start by applying credit memos and then apply all others entries.;ESP=Si desea liquidar abonos y facturas, se recomienda liquidar los abonos primero y, a continuación, liquidar el resto de los movimientos.;
    //Variable type has not been exported.
}

