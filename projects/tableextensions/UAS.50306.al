tableextension 50306 tableextension50306 extends "Cust. Ledger Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Customer No.")
        {
            Caption = 'Customer No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Currency Code")
        {
            Caption = 'Currency Code';
        }
        modify("Profit (LCY)")
        {
            Caption = 'Profit (LCY)';
        }
        modify("Sell-to Customer No.")
        {
            Caption = 'Sell-to Customer No.';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Salesperson Code")
        {
            Caption = 'Salesperson Code';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Applies-to Doc. No.")
        {
            Caption = 'Applies-to Doc. No.';
        }
        modify("Closed by Entry No.")
        {
            Caption = 'Closed by Entry No.';
        }
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Transaction No.")
        {
            Caption = 'Transaction No.';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Calculate Interest")
        {
            Caption = 'Calculate Interest';
        }
        modify("Closing Interest Calculated")
        {
            Caption = 'Closing Interest Calculated';
        }
        modify("Closed by Currency Code")
        {
            Caption = 'Closed by Currency Code';
        }
        modify("Max. Payment Tolerance")
        {
            Caption = 'Max. Payment Tolerance';
        }
        modify("Last Issued Reminder Level")
        {
            Caption = 'Last Issued Reminder Level';
        }
        modify("IC Partner Code")
        {
            Caption = 'IC Partner Code';
        }
        modify("Reversed by Entry No.")
        {
            Caption = 'Reversed by Entry No.';
        }
        modify("Reversed Entry No.")
        {
            Caption = 'Reversed Entry No.';
        }
        modify("Payment Terms Code")
        {
            Caption = 'Payment Terms Code';
        }
        modify("Payment Method Code")
        {
            Caption = 'Payment Method Code';
        }
        modify("Applies-to Ext. Doc. No.")
        {
            Caption = 'Applies-to Ext. Doc. No.';
        }
        modify("Direct Debit Mandate ID")
        {
            Caption = 'Direct Debit Mandate ID';
        }
        modify("Special Scheme Code")
        {
            Caption = 'Special Scheme Code';
        }
        modify("Correction Type")
        {
            Caption = 'Correction Type';
            OptionCaption = ' ,Replacement,Difference,Removal';
        }
        modify("Corrected Invoice No.")
        {
            Caption = 'Corrected Invoice No.';
        }
        modify("SII First Summary Doc. No.")
        {
            Caption = 'First Summary Doc. No.';
        }
        modify("SII Last Summary Doc. No.")
        {
            Caption = 'Last Summary Doc. No.';
        }
        modify("Bill No.")
        {
            Caption = 'Bill No.';
        }
        modify("Document Situation")
        {
            Caption = 'Document Situation';
        }
        modify("Applies-to Bill No.")
        {
            Caption = 'Applies-to Bill No.';
        }
        field(50000; "Global dimension 3 Code"; Code[10])
        {
            Caption = 'Global dimension 3 Code';
            ToolTip = 'Specifies the value of the Global dimension 3 Code field.';
            CaptionClass = '1,2,3';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
            CaptionClass = '1,2,5';

        }
        field(50003; "Global dimension 6 Code"; Code[20])
        {
            Caption = 'Global dimension 6 Code';
            ToolTip = 'Specifies the value of the Global dimension 6 Code field.';
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';

        }
        field(50005; "No. proyecto"; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            TableRelation = Job;
        }
        field(50006; "No. certificación"; Code[10])
        {
            Caption = 'No. certificación';
            ToolTip = 'Specifies the value of the No. certificación field.';
        }
        field(50007; Ajustado; Boolean)
        {
            Caption = 'Ajustado';
            ToolTip = 'Specifies the value of the Ajustado field.';
        }
        field(50008; "USD Amount"; Decimal)
        {
            Caption = 'USD Amount';
            ToolTip = 'Specifies the value of the USD Amount field.';
            CalcFormula = Sum("Sales Invoice Line"."Importe USD" WHERE("Document No." = FIELD("Document No."),
                                                                        "Bill-to Customer No." = FIELD("Customer No.")));
            FieldClass = FlowField;
        }
        field(50009; "Credit USD Amount"; Decimal)
        {
            Caption = 'Credit USD Amount';
            ToolTip = 'Specifies the value of the Credit USD Amount field.';
            CalcFormula = Sum("Sales Cr.Memo Line"."Importe USD" WHERE("Document No." = FIELD("Document No."),
                                                                        "Bill-to Customer No." = FIELD("Customer No.")));
            FieldClass = FlowField;
        }
        field(50012; "Descripción 2"; Text[250])
        {
            Caption = 'Description 2';
            ToolTip = 'Specifies the value of the Description 2 field.';
        }
        field(50100; "Cód. forma pago"; Code[10])
        {
            Caption = 'Payment Method Code';
            ToolTip = 'Specifies the value of the Payment Method Code field.';
        }
        field(50503; "RRR&G Procesado"; Boolean)
        {
            Caption = 'RRR&G Procesado';
            ToolTip = 'Specifies the value of the RRR&G Procesado field.';
            DataClassification = ToBeClassified;
        }
        field(50505; "Nombre libro diario"; Code[10])
        {
            Caption = 'Nombre libro diario';
            ToolTip = 'Specifies the value of the Nombre libro diario field.';
        }
        field(50597; "Fecha anulación"; Date)
        {
            Caption = 'Fecha anulación';
            ToolTip = 'Specifies the value of the Fecha anulación field.';
        }
        field(50598; "Usuario Anulación"; Code[20])
        {
            Caption = 'Usuario Anulación';
            ToolTip = 'Specifies the value of the Usuario Anulación field.';
        }
        field(50599; Anulado; Boolean)
        {
            Caption = 'Anulado';
            ToolTip = 'Specifies the value of the Anulado field.';
        }
        field(50700; "No. cheque"; Code[20])
        {
            Caption = 'No. cheque';
            ToolTip = 'Specifies the value of the No. cheque field.';
        }
        field(50701; "Cód. banco cliente"; Code[20])
        {
            Caption = 'Cust. Bank Acc. Code';
            ToolTip = 'Specifies the value of the Cust. Bank Acc. Code field.';
        }
    }


    //Unsupported feature: Code Modification on "DrillDownOnEntries(PROCEDURE 1)".

    //procedure DrillDownOnEntries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CustLedgEntry.Reset;
    DtldCustLedgEntry.CopyFilter("Customer No.",CustLedgEntry."Customer No.");
    DtldCustLedgEntry.CopyFilter("Currency Code",CustLedgEntry."Currency Code");
    DtldCustLedgEntry.CopyFilter("Initial Entry Global Dim. 1",CustLedgEntry."Global Dimension 1 Code");
    DtldCustLedgEntry.CopyFilter("Initial Entry Global Dim. 2",CustLedgEntry."Global Dimension 2 Code");
    DtldCustLedgEntry.CopyFilter("Initial Entry Due Date",CustLedgEntry."Due Date");
    CustLedgEntry.SetCurrentKey("Customer No.","Posting Date");
    CustLedgEntry.SetRange(Open,true);
    OnBeforeDrillDownEntries(CustLedgEntry,DtldCustLedgEntry);
    PAGE.Run(0,CustLedgEntry);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    //++Arbu
    DtldCustLedgEntry.CopyFilter("Initial Entry Global Dim. 3",CustLedgEntry."Global dimension 3 Code");
    DtldCustLedgEntry.CopyFilter("Initial Entry Global Dim. 4",CustLedgEntry."Global Dimension 4 Code");
    DtldCustLedgEntry.CopyFilter("Initial Entry Global Dim. 5",CustLedgEntry."Global Dimension 5 Code");
    DtldCustLedgEntry.CopyFilter("Initial Entry Global Dim. 6",CustLedgEntry."Global dimension 6 Code");
    DtldCustLedgEntry.CopyFilter("Initial Entry Global Dim. 7",CustLedgEntry."Global Dimension 7 Code");
    //--Arbu
    #6..10
    */
    //end;


    //Unsupported feature: Code Modification on "DrillDownOnOverdueEntries(PROCEDURE 4)".

    //procedure DrillDownOnOverdueEntries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CustLedgEntry.Reset;
    DtldCustLedgEntry.CopyFilter("Customer No.",CustLedgEntry."Customer No.");
    DtldCustLedgEntry.CopyFilter("Currency Code",CustLedgEntry."Currency Code");
    DtldCustLedgEntry.CopyFilter("Initial Entry Global Dim. 1",CustLedgEntry."Global Dimension 1 Code");
    DtldCustLedgEntry.CopyFilter("Initial Entry Global Dim. 2",CustLedgEntry."Global Dimension 2 Code");
    CustLedgEntry.SetCurrentKey("Customer No.","Posting Date");
    CustLedgEntry.SetFilter("Date Filter",'<%1',Today);
    CustLedgEntry.SetFilter("Due Date",'<%1',Today);
    CustLedgEntry.SetFilter("Remaining Amount",'<>%1',0);
    OnBeforeDrillDownOnOverdueEntries(CustLedgEntry,DtldCustLedgEntry);
    PAGE.Run(0,CustLedgEntry);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    //++Arbu
    DtldCustLedgEntry.CopyFilter("Initial Entry Global Dim. 3",CustLedgEntry."Global dimension 3 Code");
    DtldCustLedgEntry.CopyFilter("Initial Entry Global Dim. 4",CustLedgEntry."Global Dimension 4 Code");
    DtldCustLedgEntry.CopyFilter("Initial Entry Global Dim. 5",CustLedgEntry."Global Dimension 5 Code");
    DtldCustLedgEntry.CopyFilter("Initial Entry Global Dim. 6",CustLedgEntry."Global dimension 6 Code");
    DtldCustLedgEntry.CopyFilter("Initial Entry Global Dim. 7",CustLedgEntry."Global Dimension 7 Code");
    //--Arbu

    #6..11
    */
    //end;


    //Unsupported feature: Code Modification on "CopyFromGenJnlLine(PROCEDURE 6)".

    //procedure CopyFromGenJnlLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Customer No." := GenJnlLine."Account No.";
    "Posting Date" := GenJnlLine."Posting Date";
    "Document Date" := GenJnlLine."Document Date";
    #4..12
    "Customer Posting Group" := GenJnlLine."Posting Group";
    "Global Dimension 1 Code" := GenJnlLine."Shortcut Dimension 1 Code";
    "Global Dimension 2 Code" := GenJnlLine."Shortcut Dimension 2 Code";
    "Dimension Set ID" := GenJnlLine."Dimension Set ID";
    "Salesperson Code" := GenJnlLine."Salespers./Purch. Code";
    "Source Code" := GenJnlLine."Source Code";
    #19..50
    "Do Not Send To SII" := GenJnlLine."Do Not Send To SII";

    OnAfterCopyCustLedgerEntryFromGenJnlLine(Rec,GenJnlLine);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..15
    //++Arbu
    "Global dimension 3 Code" := GenJnlLine."Shortcut Dimension 3 Code";
    "Global Dimension 4 Code" := GenJnlLine."Shortcut Dimension 4 Code";
    "Global Dimension 5 Code" := GenJnlLine."Shortcut Dimension 5 Code";
    "Global dimension 6 Code" := GenJnlLine."Shortcut Dimension 6 Code";
    "Global Dimension 7 Code" := GenJnlLine."Shortcut Dimension 7 Code";
    //--Arbu
    #16..53
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text1100000(Variable 1100001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100000 : ENU=Payment Discount (VAT Excl.);ESP=% Dto. P.P. (IVA excluído);
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100000 : ENU=Payment Discount (VAT Excl.);ESP=% Dto. P.P. (IVA exclu?do);
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotChangePmtMethodErr(Variable 1100003)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotChangePmtMethodErr : ENU=For Cartera-based bills and invoices, you cannot change the Payment Method Code to this value.;ESP=Para los efectos y las facturas basadas en Cartera, no puede modificar el Código de forma de pago a este valor.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotChangePmtMethodErr : ENU=For Cartera-based bills and invoices, you cannot change the Payment Method Code to this value.;ESP=Para los efectos y las facturas basadas en Cartera, no puede modificar el Código de forma de pago a este valor.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CheckBillSituationGroupErr(Variable 1100006)".

    //var
    //>>>> ORIGINAL VALUE:
    //CheckBillSituationGroupErr : @@@=%1 - document type and number;ENU=%1 cannot be applied because it is included in a bill group. To apply the document, remove it from the bill group and try again.;ESP=No se puede liquidar %1 porque está incluido en una remesa. Para liquidar el documento, elimínelo de la remesa e inténtelo de nuevo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckBillSituationGroupErr : @@@=%1 - document type and number;ENU=%1 cannot be applied because it is included in a bill group. To apply the document, remove it from the bill group and try again.;ESP=No se puede liquidar %1 porque está incluido en una remesa. Para liquidar el documento, elimínelo de la remesa e inténtelo de nuevo.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CheckBillSituationPostedErr(Variable 1100004)".

    //var
    //>>>> ORIGINAL VALUE:
    //CheckBillSituationPostedErr : @@@=%1 - document type and number;ENU=%1 cannot be applied because it is included in a posted bill group.;ESP=No se puede liquidar %1 porque que está incluido en una remesa registrada.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckBillSituationPostedErr : @@@=%1 - document type and number;ENU=%1 cannot be applied because it is included in a posted bill group.;ESP=No se puede liquidar %1 porque que está incluido en una remesa registrada.;
    //Variable type has not been exported.
}

