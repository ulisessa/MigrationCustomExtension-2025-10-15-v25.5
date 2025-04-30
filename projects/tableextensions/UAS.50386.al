tableextension 50386 tableextension50386 extends "Check Ledger Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Bank Account No.")
        {
            Caption = 'Bank Account No.';
        }
        modify("Bank Account Ledger Entry No.")
        {
            Caption = 'Bank Account Ledger Entry No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Check Date")
        {

            //Unsupported feature: Property Modification (Name) on ""Check Date"(Field 9)".

            Caption = 'Check Date';
        }
        modify("Check No.")
        {
            Caption = 'Check No.';
        }
        modify("Entry Status")
        {
            OptionCaption = ',Printed,Voided,Posted,Financially Voided,Test Print,Exported,Transmitted';
        }
        modify("Original Entry Status")
        {
            OptionCaption = ' ,Printed,Voided,Posted,Financially Voided,,,Exported';
        }
        modify("Statement Status")
        {
            Caption = 'Statement Status';
        }
        modify("Statement No.")
        {
            Caption = 'Statement No.';
        }
        modify("Statement Line No.")
        {
            Caption = 'Statement Line No.';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Data Exch. Entry No.")
        {
            Caption = 'Data Exch. Entry No.';
        }
        modify("Data Exch. Voided Entry No.")
        {
            Caption = 'Data Exch. Voided Entry No.';
        }
    }
    keys
    {

        //Unsupported feature: Deletion (KeyCollection) on ""Bank Account No.","Check Date"(Key)".


        //Unsupported feature: Deletion (KeyCollection) on ""Bank Account No.","Entry Status","Check No.","Statement Status"(Key)".


    }


    //Unsupported feature: Code Modification on "CopyFromBankAccLedgEntry(PROCEDURE 2)".

    //procedure CopyFromBankAccLedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Bank Account No." := BankAccLedgEntry."Bank Account No.";
    "Bank Account Ledger Entry No." := BankAccLedgEntry."Entry No.";
    "Posting Date" := BankAccLedgEntry."Posting Date";
    #4..10
    "Entry Status" := "Entry Status"::Posted;
    Open := true;
    "User ID" := UserId;
    "Check Date" := BankAccLedgEntry."Posting Date";
    "Check No." := BankAccLedgEntry."Document No.";

    OnAfterCopyFromBankAccLedgEntry(Rec,BankAccLedgEntry);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..13
    //++Arbu

    //"Check Date" := BankAccLedgEntry."Posting Date";
    "Value Date" := BankAccLedgEntry."Value Date";
    //"Check No." := BankAccLedgEntry."Document No.";
    "Check No." := BankAccLedgEntry."No. cheque";

    //--Arbu


    OnAfterCopyFromBankAccLedgEntry(Rec,BankAccLedgEntry);
    */
    //end;
}

