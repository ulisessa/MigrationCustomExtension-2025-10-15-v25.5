tableextension 50265 tableextension50265 extends "Reversal Entry"
{
    Caption = 'Reversal Entry';
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("G/L Register No.")
        {
            Caption = 'G/L Register No.';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Transaction No.")
        {
            Caption = 'Transaction No.';
        }
        modify("Source No.")
        {
            Caption = 'Source No.';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Account No.")
        {
            Caption = 'Account No.';
        }
        modify("FA Posting Category")
        {
            Caption = 'FA Posting Category';
        }
        modify("Reversal Type")
        {
            Caption = 'Reversal Type';
            OptionCaption = 'Transaction,Register';
        }
    }

    //Unsupported feature: Variable Insertion (Variable: GLReg) (VariableCollection) on "ReverseRegister(PROCEDURE 9)".


    //Unsupported feature: Code Modification on "ReverseRegister(PROCEDURE 9)".

    //procedure ReverseRegister();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CheckRegister(RegisterNo);
    ReverseEntries(RegisterNo,"Reversal Type"::Register);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CheckRegister(RegisterNo);
    GLReg.Get(RegisterNo);
    if GLReg.Reversed then
      Error(Text010,GLReg.TableCaption,GLReg."No.");
    //++Arbu
    //IF GLReg."Journal Batch Name" = '' THEN
    if (GLReg."Journal Batch Name" = '') and not (fntVerificarPermisos) then
      TempReversalEntry.TestFieldError;
    //--Arbu
    ReverseEntries(RegisterNo,"Reversal Type"::Register);
    */
    //end;


    //Unsupported feature: Code Modification on "ReverseEntries(PROCEDURE 32)".

    //procedure ReverseEntries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsHandled := false;
    OnBeforeReverseEntries(Number,RevType,IsHandled);
    if IsHandled then
    #4..8
      PAGE.RunModal(PAGE::"Reverse Entries",TempReversalEntry)
    else begin
      ReversalPost.SetPrint(false);
      ReversalPost.SetHideDialog(HideWarningDialogs);
      ReversalPost.Run(TempReversalEntry);
    end;
    TempReversalEntry.DeleteAll;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
      //ReversalPost.SetHideDialog(HideWarningDialogs);
      //++Arbu
      ReversalPost.fntReversaLote(blnLote);
      ReversalPost.fntChangeDate(datFechaRegistro);
      //--Arbu
    #13..15
    */
    //end;


    //Unsupported feature: Code Modification on "CheckEntries(PROCEDURE 14)".

    //procedure CheckEntries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DtldCustLedgEntry.LockTable;
    DtldVendLedgEntry.LockTable;
    DetailedEmployeeLedgerEntry.LockTable;
    #4..18
    if not SkipCheck then begin
      if GLEntry.IsEmpty then
        Error(CannotReverseDeletedErr,GLEntry.TableCaption,GLAcc.TableCaption);
      if GLEntry.Find('-') then begin
        if GLEntry."Journal Batch Name" = '' then
          TestFieldError;
        repeat
          CheckGLAcc(GLEntry,BalanceCheckAmount,BalanceCheckAddCurrAmount);
        until GLEntry.Next = 0;
    #28..95
    OnAfterCheckEntries;

    DateComprReg.CheckMaxDateCompressed(MaxPostingDate,1);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..21
      //++Arbu
      if GLEntry.Find('-') then begin
        //IF GLEntry."Journal Batch Name" = '' THEN
        if (GLEntry."Journal Batch Name" = '') and not (fntVerificarPermisos) then
          TestFieldError;

      //--Arbu

    #25..98
    */
    //end;


    //Unsupported feature: Code Modification on "CheckPostingDate(PROCEDURE 23)".

    //procedure CheckPostingDate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if GenJnlCheckLine.DateNotAllowed(PostingDate) then
      Error(Text001,Caption,EntryNo);
    if PostingDate > MaxPostingDate then
      MaxPostingDate := PostingDate;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //++Arbu
    if datFechaRegistro = 0D then
    begin
    //--Arbu
    #1..4
    //++Arbu
    end
    else
    begin

      if GenJnlCheckLine.DateNotAllowed(datFechaRegistro) then
        Error(Text001,Caption,EntryNo);

      if datFechaRegistro > MaxPostingDate then
        MaxPostingDate := datFechaRegistro;

    end;
    //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "InsertFromGLEntry(PROCEDURE 40)".

    //procedure InsertFromGLEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TempRevertTransactionNo.FindSet;
    repeat
      if RevType = RevType::Transaction then
    #4..13
          TempReversalEntry."Account No." := GLAcc."No.";
          TempReversalEntry."Account Name" := GLAcc.Name;
          TempReversalEntry.CopyFromGLEntry(GLEntry);
          TempReversalEntry."Line No." := NextLineNo;
          NextLineNo := NextLineNo + 1;
          TempReversalEntry.Insert;
        until GLEntry.Next = 0;
    until TempRevertTransactionNo.Next = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..16
          //++Arbu
          if datFechaRegistro = 0D then
            TempReversalEntry."Posting Date" := GLEntry."Posting Date"
          else
            TempReversalEntry."Posting Date" := datFechaRegistro;
          //--Arbu
    #17..21
    */
    //end;


    //Unsupported feature: Code Modification on "CopyFromCustLedgEntry(PROCEDURE 57)".

    //procedure CopyFromCustLedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Entry No." := CustLedgEntry."Entry No.";
    "Posting Date" := CustLedgEntry."Posting Date";
    "Source Code" := CustLedgEntry."Source Code";
    "Journal Batch Name" := CustLedgEntry."Journal Batch Name";
    "Transaction No." := CustLedgEntry."Transaction No.";
    "Currency Code" := CustLedgEntry."Currency Code";
    #7..18
    "Bal. Account No." := CustLedgEntry."Bal. Account No.";

    OnAfterCopyFromCustLedgEntry(Rec,CustLedgEntry);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Entry No." := CustLedgEntry."Entry No.";
    "Source Code" := CustLedgEntry."Source Code";
        //++Arbu
    //"Posting Date" := CustLedgEntry."Posting Date";
        if datFechaRegistro = 0D then
              "Posting Date" := CustLedgEntry."Posting Date"
        else
              "Posting Date" := datFechaRegistro;
        //--Arbu
    #4..21
    */
    //end;


    //Unsupported feature: Code Modification on "CopyFromBankAccLedgEntry(PROCEDURE 53)".

    //procedure CopyFromBankAccLedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Entry No." := BankAccLedgEntry."Entry No.";
    "Posting Date" := BankAccLedgEntry."Posting Date";
    "Source Code" := BankAccLedgEntry."Source Code";
    "Journal Batch Name" := BankAccLedgEntry."Journal Batch Name";
    "Transaction No." := BankAccLedgEntry."Transaction No.";
    #6..16
    "Bal. Account No." := BankAccLedgEntry."Bal. Account No.";

    OnAfterCopyFromBankAccLedgEntry(Rec,BankAccLedgEntry);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Entry No." := BankAccLedgEntry."Entry No.";
        //++Arbu
        //ReversalEntry."Posting Date" := BankAccLedgEntry."Posting Date";
        if datFechaRegistro = 0D then
              TempReversalEntry."Posting Date" := BankAccLedgEntry."Posting Date"
        else
              TempReversalEntry."Posting Date" := datFechaRegistro;
        //--Arbu
    #3..19
    */
    //end;


    //Unsupported feature: Code Modification on "CopyFromFALedgEntry(PROCEDURE 51)".

    //procedure CopyFromFALedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Entry No." := FALedgEntry."Entry No.";
    "Posting Date" := FALedgEntry."Posting Date";
    "FA Posting Category" := FALedgEntry."FA Posting Category";
    "FA Posting Type" := FALedgEntry."FA Posting Type" + 1;
    "Source Code" := FALedgEntry."Source Code";
    #6..15
    "Bal. Account No." := FALedgEntry."Bal. Account No.";

    OnAfterCopyFromFALedgEntry(Rec,FALedgEntry);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Entry No." := FALedgEntry."Entry No.";
        //++Arbu
        //ReversalEntry."Posting Date" := FALedgEntry."Posting Date";
        if datFechaRegistro = 0D then
              TempReversalEntry."Posting Date" := FALedgEntry."Posting Date"
        else
              TempReversalEntry."Posting Date" := datFechaRegistro;
        //--Arbu
    #3..18
    */
    //end;


    //Unsupported feature: Code Modification on "CopyFromMaintenanceEntry(PROCEDURE 49)".

    //procedure CopyFromMaintenanceEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Entry No." := MaintenanceLedgEntry."Entry No.";
    "Posting Date" := MaintenanceLedgEntry."Posting Date";
    "Source Code" := MaintenanceLedgEntry."Source Code";
    "Journal Batch Name" := MaintenanceLedgEntry."Journal Batch Name";
    "Transaction No." := MaintenanceLedgEntry."Transaction No.";
    #6..13
    "Bal. Account No." := MaintenanceLedgEntry."Bal. Account No.";

    OnAfterCopyFromMaintenanceEntry(Rec,MaintenanceLedgEntry);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Entry No." := MaintenanceLedgEntry."Entry No.";
        TempReversalEntry."Account Name" := FA.Description;
        //++Arbu
        //ReversalEntry."Posting Date" := MaintenanceLedgEntry."Posting Date";
        if datFechaRegistro = 0D then
              TempReversalEntry."Posting Date" := MaintenanceLedgEntry."Posting Date"
        else
              TempReversalEntry."Posting Date" := datFechaRegistro;
        //--Arbu
    #3..16
    */
    //end;


    //Unsupported feature: Code Modification on "CopyFromVATEntry(PROCEDURE 47)".

    //procedure CopyFromVATEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Entry No." := VATEntry."Entry No.";
    "Posting Date" := VATEntry."Posting Date";
    "Source Code" := VATEntry."Source Code";
    "Transaction No." := VATEntry."Transaction No.";
    Amount := VATEntry.Amount;
    "Amount (LCY)" := VATEntry.Amount;
    "Document Type" := VATEntry."Document Type";
    "Document No." := VATEntry."Document No.";

    OnAfterCopyFromVATEntry(Rec,VATEntry);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Entry No." := VATEntry."Entry No.";
        //++Arbu
        //ReversalEntry."Posting Date" := VATEntry."Posting Date";
        if datFechaRegistro = 0D then
          TempReversalEntry."Posting Date" := VATEntry."Posting Date"
        else
          TempReversalEntry."Posting Date" := datFechaRegistro;
        //--Arbu
    #3..10
    */
    //end;


    //Unsupported feature: Code Modification on "CopyFromVendLedgEntry(PROCEDURE 55)".

    //procedure CopyFromVendLedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Entry No." := VendLedgEntry."Entry No.";
    "Posting Date" := VendLedgEntry."Posting Date";
    "Source Code" := VendLedgEntry."Source Code";
    "Journal Batch Name" := VendLedgEntry."Journal Batch Name";
    "Transaction No." := VendLedgEntry."Transaction No.";
    #6..18
    "Bal. Account No." := VendLedgEntry."Bal. Account No.";

    OnAfterCopyFromVendLedgEntry(Rec,VendLedgEntry);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Entry No." := VendLedgEntry."Entry No.";
        //++Arbu
    //"Posting Date" := VendLedgEntry."Posting Date";
        if datFechaRegistro = 0D then
              "Posting Date" := VendLedgEntry."Posting Date"
        else
              "Posting Date" := datFechaRegistro;
        //--Arbu
    #3..21
    */
    //end;

    procedure fntVerificarPermisos(): Boolean
    var
        rstSeguridad: Record Seguridad;
        rstUsuario: Record "User Setup";
    begin
        Clear(rstSeguridad);
        Clear(rstUsuario);

        rstUsuario.Get(UserId);
        rstSeguridad.Get(rstUsuario.Grupo);

        exit(rstSeguridad."Revertir mov. contabilidad");
    end;

    procedure fntChangeDate(l_datFechaRegistro: Date)
    begin
        datFechaRegistro := l_datFechaRegistro;
    end;

    procedure fntReversaLote(l_blnLote: Boolean)
    begin
        blnLote := l_blnLote;
    end;


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=You cannot reverse %1 No. %2 because the entry is either applied to an entry or has been changed by a batch job.;ESP=No es posible revertir %1 No. %2, el movimiento liquida otro movimiento o fue modificado por un trabajo por lotes.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=You cannot reverse %1 No. %2 because the entry is either applied to an entry or has been changed by a batch job.;ESP=No es posible revertir %1 No.%2, el movimiento liquida otro movimiento o fue modificado por un trabajo por lotes.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=You cannot reverse %1 No. %2 because the posting date is not within the allowed posting period.;ESP=No es posible revertir %1 No. %2, la fecha de registro no corresponde al periodo de registro aceptado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=You cannot reverse %1 No. %2 because the posting date is not within the allowed posting period.;ESP=No es posible revertir %1 No.%2, la fecha de registro no corresponde al periodo de registro aceptado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1016)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=You cannot reverse the transaction because it is out of balance.;ESP=No es posible revertir la transacción porque está descuadrada.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=You cannot reverse the transaction because it is out of balance.;ESP=No es posible revertir la transacción porque está descuadrada.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1017)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=You cannot reverse %1 No. %2 because the entry has a related check ledger entry.;ESP=No es posible revertir %1 No. %2, existe una entrada de registro de cheque correspondiente al movimiento.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=You cannot reverse %1 No. %2 because the entry has a related check ledger entry.;ESP=No es posible revertir %1 No.%2, existe una entrada de registro de cheque correspondiente al movimiento.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1020)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=You cannot reverse %1 No. %2 because the %3 is not within the allowed posting period.;ESP=No es posible revertir %1 No. %2, %3 no corresponde al periodo de registro aceptado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=You cannot reverse %1 No. %2 because the %3 is not within the allowed posting period.;ESP=No es posible revertir %1 No.%2, %3 no corresponde al periodo de registro aceptado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1022)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=You cannot reverse %1 No. %2 because the entry is closed.;ESP=No es posible revertir %1 No. %2, el movimiento ha sido cerrado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=You cannot reverse %1 No. %2 because the entry is closed.;ESP=No es posible revertir %1 No.%2, el movimiento ha sido cerrado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text007(Variable 1021)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text007 : ENU=You cannot reverse %1 No. %2 because the entry is included in a bank account reconciliation line. The bank reconciliation has not yet been posted.;ESP=No es posible revertir %1 No. %2, el movimiento está incluido en una línea de reconciliación de cuentas que aún no se ha registrado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text007 : ENU=You cannot reverse %1 No. %2 because the entry is included in a bank account reconciliation line. The bank reconciliation has not yet been posted.;ESP=No es posible revertir %1 No.%2, el movimiento está incluido en una línea de reconciliación de cuentas que aún no se ha registrado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text008(Variable 1019)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text008 : ENU=You cannot reverse the transaction because the %1 has been sold.;ESP=No es posible revertir la transacción, se ha vendido el %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text008 : ENU=You cannot reverse the transaction because the %1 has been sold.;ESP=No es posible revertir la transacción, se ha vendido el %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotReverseDeletedErr(Variable 1025)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotReverseDeletedErr : @@@="%1 and %2 = table captions";ENU=The transaction cannot be reversed, because the %1 has been compressed or a %2 has been deleted.;ESP=No es posible revertir la transacción, se comprimió el %1 o se eliminó un %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotReverseDeletedErr : @@@="%1 and %2 = table captions";ENU=The transaction cannot be reversed, because the %1 has been compressed or a %2 has been deleted.;ESP=No es posible revertir la transacción, se comprimi? el %1 o se elimiNo.un %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text010(Variable 1023)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text010 : ENU=You cannot reverse %1 No. %2 because the register has already been involved in a reversal.;ESP=No es posible revertir %1 No. %2, el registro ya se ha incluido en una reversión.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text010 : ENU=You cannot reverse %1 No. %2 because the register has already been involved in a reversal.;ESP=No es posible revertir %1 No.%2, el registro ya se ha incluido en una reversión.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text011(Variable 1026)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text011 : ENU=You cannot reverse %1 No. %2 because the entry has already been involved in a reversal.;ESP=No es posible revertir %1 No. %2, el movimiento ya se ha incluido en una reversión.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text011 : ENU=You cannot reverse %1 No. %2 because the entry has already been involved in a reversal.;ESP=No es posible revertir %1 No.%2, el movimiento ya se ha incluido en una reversión.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "PostedAndAppliedSameTransactionErr(Variable 1028)".

    //var
    //>>>> ORIGINAL VALUE:
    //PostedAndAppliedSameTransactionErr : @@@="%1=""G/L Register No.""";ENU=You cannot reverse register number %1 because it contains customer or vendor or employee ledger entries that have been posted and applied in the same transaction.\\You must reverse each transaction in register number %1 separately.;ESP=No puede revertir el número de registro %1 porque contiene movimientos contables de cliente o proveedor o empleado registrados y aplicados en la misma transacción.\\Debe revertir por separado cada transacción en el número de registro %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PostedAndAppliedSameTransactionErr : @@@="%1=""G/L Register No.""";ENU=You cannot reverse register number %1 because it contains customer or vendor or employee ledger entries that have been posted and applied in the same transaction.\\You must reverse each transaction in register number %1 separately.;ESP=No puede revertir el número de registro %1 porque contiene movimientos contables de cliente o proveedor o empleado registrados y aplicados en la misma transacción.\\Debe revertir por separado cada transacción en el número de registro %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text013(Variable 1039)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text013 : ENU=You cannot reverse %1 No. %2 because the entry has an associated Realized Gain/Loss entry.;ESP=No es posible revertir %1 No. %2 porque la entrada tiene un movimiento Beneficio/pérdida realizado asociado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text013 : ENU=You cannot reverse %1 No. %2 because the entry has an associated Realized Gain/Loss entry.;ESP=No es posible revertir %1 No.%2 porque la entrada tiene un movimiento Beneficio/pérdida realizado asociado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "UnrealizedVATReverseErr(Variable 1027)".

    //var
    //>>>> ORIGINAL VALUE:
    //UnrealizedVATReverseErr : ENU=You cannot reverse %1 No. %2 because the entry has an associated Unrealized VAT Entry.;ESP=No es posible revertir %1 No. %2 porque la entrada tiene un movimiento IVA no realizado asociado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UnrealizedVATReverseErr : ENU=You cannot reverse %1 No. %2 because the entry has an associated Unrealized VAT Entry.;ESP=No es posible revertir %1 No.%2 porque la entrada tiene un movimiento IVA no realizado asociado.;
    //Variable type has not been exported.

    var
        datFechaRegistro: Date;
        blnLote: Boolean;
        FA: Record "Fixed Asset";
}

