tableextension 50141 "Posted Payment Recon. Hdr Ext." extends "Posted Payment Recon. Hdr"
{
    Caption = 'Posted Payment Recon. Hdr';
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
    }

    //Unsupported feature: Property Modification (TextConstString) on "HasBankEntriesQst(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //HasBankEntriesQst : ENU=One or more bank account ledger entries in bank account %1 have been reconciled for bank account statement %2, and contain information about the bank statement. These bank ledger entries will not be modified if you delete bank account statement %2.\\Do you want to continue?;ESP=Uno o más movimientos de cuenta bancaria de la cuenta bancaria %1 se han conciliado para el extracto de cuenta bancaria %2 y contiene información sobre el extracto del banco. Estos movimientos de banco no se modificarán si elimina el extracto de cuenta bancaria %2.\\¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //HasBankEntriesQst : ENU=One or more bank account ledger entries in bank account %1 have been reconciled for bank account statement %2, and contain information about the bank statement. These bank ledger entries will not be modified if you delete bank account statement %2.\\Do you want to continue?;ESP=Uno o más movimientos de cuenta bancaria de la cuenta bancaria %1 se han conciliado para el extracto de cuenta bancaria %2 y contiene información sobre el extracto del banco. Estos movimientos de banco no se modificarán si elimina el extracto de cuenta bancaria %2.\\?Desea continuar?;
    //Variable type has not been exported.
}

