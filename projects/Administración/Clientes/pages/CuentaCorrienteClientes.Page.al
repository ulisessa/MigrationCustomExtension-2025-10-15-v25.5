page 50565 "Cuenta Corriente Clientes"
{
    PageType = List;
    Permissions = TableData "Cust. Ledger Entry" = rimd;
    SourceTable = "Cust. Ledger Entry";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Entry No."; "Entry No.")
                {
                }
                field("Customer No."; "Customer No.")
                {
                }
                field("Posting Date"; "Posting Date")
                {
                }
                field("Document Type"; "Document Type")
                {
                }
                field("Document No."; "Document No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Currency Code"; "Currency Code")
                {
                }
                field(Amount; Amount)
                {
                }
                field("Remaining Amount"; "Remaining Amount")
                {
                }
                field("Original Amt. (LCY)"; "Original Amt. (LCY)")
                {
                }
                field("Remaining Amt. (LCY)"; "Remaining Amt. (LCY)")
                {
                }
                field("Amount (LCY)"; "Amount (LCY)")
                {
                }
                field("Sales (LCY)"; "Sales (LCY)")
                {
                }
                field("Profit (LCY)"; "Profit (LCY)")
                {
                }
                field("Inv. Discount (LCY)"; "Inv. Discount (LCY)")
                {
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                }
                field("Customer Posting Group"; "Customer Posting Group")
                {
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                }
                field("Salesperson Code"; "Salesperson Code")
                {
                }
                field("User ID"; "User ID")
                {
                }
                field("Source Code"; "Source Code")
                {
                }
                field("On Hold"; "On Hold")
                {
                }
                field("Applies-to Doc. Type"; "Applies-to Doc. Type")
                {
                }
                field("Applies-to Doc. No."; "Applies-to Doc. No.")
                {
                }
                field(Open; Open)
                {
                }
                field("Due Date"; "Due Date")
                {
                }
                field("Pmt. Discount Date"; "Pmt. Discount Date")
                {
                }
                field("Original Pmt. Disc. Possible"; "Original Pmt. Disc. Possible")
                {
                }
                field("Pmt. Disc. Given (LCY)"; "Pmt. Disc. Given (LCY)")
                {
                }
                field(Positive; Positive)
                {
                }
                field("Closed by Entry No."; "Closed by Entry No.")
                {
                }
                field("Closed at Date"; "Closed at Date")
                {
                }
                field("Closed by Amount"; "Closed by Amount")
                {
                }
                field("Applies-to ID"; "Applies-to ID")
                {
                }
                field("Journal Batch Name"; "Journal Batch Name")
                {
                }
                field("Reason Code"; "Reason Code")
                {
                }
                field("Bal. Account Type"; "Bal. Account Type")
                {
                }
                field("Bal. Account No."; "Bal. Account No.")
                {
                }
                field("Transaction No."; "Transaction No.")
                {
                }
                field("Closed by Amount (LCY)"; "Closed by Amount (LCY)")
                {
                }
                field("Debit Amount"; "Debit Amount")
                {
                }
                field("Credit Amount"; "Credit Amount")
                {
                }
                field("Debit Amount (LCY)"; "Debit Amount (LCY)")
                {
                }
                field("Credit Amount (LCY)"; "Credit Amount (LCY)")
                {
                }
                field("Document Date"; "Document Date")
                {
                }
                field("External Document No."; "External Document No.")
                {
                }
                field("Calculate Interest"; "Calculate Interest")
                {
                }
                field("Closing Interest Calculated"; "Closing Interest Calculated")
                {
                }
                field("No. Series"; "No. Series")
                {
                }
                field("Closed by Currency Code"; "Closed by Currency Code")
                {
                }
                field("Closed by Currency Amount"; "Closed by Currency Amount")
                {
                }
                field("No. cheque"; "No. cheque")
                {
                }
                field("Cód. banco cliente"; "Cód. banco cliente")
                {
                }
                field("Global dimension 3 Code"; "Global dimension 3 Code")
                {
                }
                field("Global Dimension 4 Code"; "Global Dimension 4 Code")
                {
                }
                field("Global Dimension 5 Code"; "Global Dimension 5 Code")
                {
                }
                field("Global dimension 6 Code"; "Global dimension 6 Code")
                {
                }
                field("Global Dimension 7 Code"; "Global Dimension 7 Code")
                {
                }
                field("No. proyecto"; "No. proyecto")
                {
                }
                field("No. certificación"; "No. certificación")
                {
                }
                field(Ajustado; Ajustado)
                {
                }
                field("Descripción 2"; "Descripción 2")
                {
                }
                field("Cód. forma pago"; "Cód. forma pago")
                {
                }
                field("Bill No."; "Bill No.")
                {
                }
                field("Document Situation"; "Document Situation")
                {
                }
                field("Applies-to Bill No."; "Applies-to Bill No.")
                {
                }
                field("Document Status"; "Document Status")
                {
                }
            }
        }
    }

    actions
    {
    }
}

