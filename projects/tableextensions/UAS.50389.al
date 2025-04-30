tableextension 50389 tableextension50389 extends "Bank Account Statement"
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
        modify("Balance Last Statement")
        {
            Caption = 'Balance Last Statement';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "HasBankEntriesQst(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //HasBankEntriesQst : ENU=One or more bank account ledger entries in bank account %1 have been reconciled for bank account statement %2, which contain information about the bank statement. These bank ledger entries will not be modified if you delete bank account statement %2.\\Do you want to continue?;ESP=Uno o más movimientos de banco del banco %1 se han conciliado para el extracto de cuenta del banco %2, que contiene información sobre el extracto del banco. Estos movimientos de banco no se modificarán si elimina el extracto de cuenta del banco %2.\\¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //HasBankEntriesQst : ENU=One or more bank account ledger entries in bank account %1 have been reconciled for bank account statement %2, which contain information about the bank statement. These bank ledger entries will not be modified if you delete bank account statement %2.\\Do you want to continue?;ESP=Uno o más movimientos de banco del banco %1 se han conciliado para el extracto de cuenta del banco %2, que contiene información sobre el extracto del banco. Estos movimientos de banco no se modificarán si elimina el extracto de cuenta del banco %2.\\?Desea continuar?;
    //Variable type has not been exported.
}

