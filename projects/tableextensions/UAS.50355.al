tableextension 50355 tableextension50355 extends "Source Code Setup"
{
    Caption = 'Source Code Setup';
    fields
    {
        modify("Close Income Statement")
        {
            Caption = 'Close Income Statement';
        }
        modify(Consolidation)
        {
            Caption = 'Consolidation';
        }
        modify("VAT Settlement")
        {
            Caption = 'VAT Settlement';
        }
        modify("Compress G/L")
        {
            Caption = 'Compress G/L';
        }
        modify("Compress VAT Entries")
        {
            Caption = 'Compress VAT Entries';
        }
        modify("Compress Cust. Ledger")
        {
            Caption = 'Compress Cust. Ledger';
        }
        modify("Compress Vend. Ledger")
        {
            Caption = 'Compress Vend. Ledger';
        }
        modify("Compress Item Ledger")
        {
            Caption = 'Compress Item Ledger';
        }
        modify("Compress Res. Ledger")
        {
            Caption = 'Compress Res. Ledger';
        }
        modify("Compress Job Ledger")
        {
            Caption = 'Compress Job Ledger';
        }
        modify("Phys. Inventory Journal")
        {
            Caption = 'Phys. Inventory Journal';
        }
        modify("Compress Bank Acc. Ledger")
        {
            Caption = 'Compress Bank Acc. Ledger';
        }
        modify("Compress Check Ledger")
        {
            Caption = 'Compress Check Ledger';
        }
        modify("Financially Voided Check")
        {
            Caption = 'Financially Voided Check';
        }
        modify("Finance Charge Memo")
        {
            Caption = 'Finance Charge Memo';
        }
        modify("Trans. Bank Rec. to Gen. Jnl.")
        {
            Caption = 'Trans. Bank Rec. to Gen. Jnl.';
        }
        modify(Reversal)
        {
            Caption = 'Reversal';
        }
        modify("Payment Reconciliation Journal")
        {
            Caption = 'Payment Reconciliation Journal';
        }
        modify("Cost Allocation")
        {
            Caption = 'Cost Allocation';
        }
        modify(Flushing)
        {
            Caption = 'Flushing';
        }
        modify("Production Journal")
        {
            Caption = 'Production Journal';
        }
        modify("Compress FA Ledger")
        {
            Caption = 'Compress FA Ledger';
        }
        modify("Compress Maintenance Ledger")
        {
            Caption = 'Compress Maintenance Ledger';
        }
        modify("Compress Insurance Ledger")
        {
            Caption = 'Compress Insurance Ledger';
        }
        modify("Phys. Invt. Orders")
        {
            Caption = 'Phys. Invt. Orders';
        }
        modify("Service Management")
        {
            Caption = 'Service Management';
        }
        modify("Whse. Item Journal")
        {
            Caption = 'Whse. Item Journal';
        }
        modify("Whse. Phys. Invt. Journal")
        {
            Caption = 'Whse. Phys. Invt. Journal';
        }
        modify("Whse. Reclassification Journal")
        {
            Caption = 'Whse. Reclassification Journal';
        }
        modify("Whse. Put-away")
        {
            Caption = 'Whse. Put-away';
        }
        modify("Compress Whse. Entries")
        {
            Caption = 'Compress Whse. Entries';
        }
        field(50000; "Inflation posting"; Code[10])
        {
            Caption = 'Registro inflación';
            DataClassification = ToBeClassified;
            TableRelation = "Source Code";
        }
    }
}

