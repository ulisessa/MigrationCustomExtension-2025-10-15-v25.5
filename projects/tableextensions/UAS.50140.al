tableextension 50140 "Applied Payment Entry Ext." extends "Applied Payment Entry"
{
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
    }

    //Unsupported feature: Code Modification on "InclPmtDisc(PROCEDURE 20)".

    //procedure InclPmtDisc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetDiscInfo(PmtDiscDueDate,PmtDiscToleranceDate,RemPmtDiscPossible);
    if not ("Document Type" in ["Document Type"::"Credit Memo","Document Type"::Invoice]) then
      exit(false);
    #4..6
      BankAccReconLine."Account No." := "Account No.";
    end;
    UsePmtDisc := (BankAccReconLine."Transaction Date" <= PmtDiscDueDate) and (RemPmtDiscPossible <> 0);
    if UseAppliedAmt then
      PaymentToleranceManagement.PmtTolPmtReconJnl(BankAccReconLine);
    if (not UsePmtDisc) and (not IsAcceptedPmtDiscTolerance) then
      exit(false);

    #15..17
      AmtApplied := BankAccReconLine.Difference + GetOldAppliedAmtInclDisc + GetAmtAppliedToOtherStmtLines;

    exit(Abs(AmtApplied) >= Abs(GetRemAmt - RemPmtDiscPossible - GetAcceptedPmtTolerance));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9
    //++Arbu
    {IF UseAppliedAmt THEN
      PaymentToleranceManagement.PmtTolPmtReconJnl(BankAccReconLine);
    }
    //--Arbu
    #12..20
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "CurrencyMismatchErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //CurrencyMismatchErr : ENU=Currency codes on bank account %1 and ledger entry %2 do not match.;ESP=Los códigos de divisa en la cuenta bancaria %1 y el movimiento de contabilidad %2 no coinciden.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CurrencyMismatchErr : ENU=Currency codes on bank account %1 and ledger entry %2 do not match.;ESP=Los Códigos de divisa en la cuenta bancaria %1 y el movimiento de contabilidad %2 no coinciden.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "AmtCannotExceedErr(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //AmtCannotExceedErr : ENU=The Amount to Apply cannot exceed %1. This is because the Remaining Amount on the entry is %2 and the amount assigned to other statement lines is %3.;ESP=El importe que se va a aplicar no puede superar %1. Esto se debe a que el importe restante del movimiento es %2 y el importe asignado a otras líneas de extracto es %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AmtCannotExceedErr : ENU=The Amount to Apply cannot exceed %1. This is because the Remaining Amount on the entry is %2 and the amount assigned to other statement lines is %3.;ESP=El importe que se va a aplicar no puede superar %1. Esto se debe a que el importe restante del movimiento es %2 y el importe asignado a otras líneas de extracto es %3.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotApplyStmtLineErr(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotApplyStmtLineErr : @@@="%1 = Account Type, %2 = Account No., %3 = Account Type, %4 = Account No.";ENU=You cannot apply to %1 %2 because the statement line already contains an application to %3 %4.;ESP=No puede liquidar en %1 %2 porque la línea de extracto ya contiene una liquidación en %3 %4.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotApplyStmtLineErr : @@@="%1 = Account Type, %2 = Account No., %3 = Account Type, %4 = Account No.";ENU=You cannot apply to %1 %2 because the statement line already contains an application to %3 %4.;ESP=No puede liquidar en %1 %2 porque la línea de extracto ya contiene una liquidación en %3 %4.;
    //Variable type has not been exported.
}

