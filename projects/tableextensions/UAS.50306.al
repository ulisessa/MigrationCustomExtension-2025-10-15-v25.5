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
            CaptionClass = '1,1,3';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,1,4';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,1,5';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(50003; "Global dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,1,6';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,1,7';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
        field(50005; "No. proyecto"; Code[20])
        {
            TableRelation = Job;
        }
        field(50006; "No. certificación"; Code[10])
        {
        }
        field(50007; Ajustado; Boolean)
        {
        }
        field(50008; "USD Amount"; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line"."Importe USD" WHERE("Document No." = FIELD("Document No."),
                                                                        "Bill-to Customer No." = FIELD("Customer No.")));
            FieldClass = FlowField;
        }
        field(50009; "Credit USD Amount"; Decimal)
        {
            CalcFormula = Sum("Sales Cr.Memo Line"."Importe USD" WHERE("Document No." = FIELD("Document No."),
                                                                        "Bill-to Customer No." = FIELD("Customer No.")));
            FieldClass = FlowField;
        }
        field(50012; "Descripción 2"; Text[250])
        {
        }
        field(50100; "Cód. forma pago"; Code[10])
        {
        }
        field(50503; "RRR&G Procesado"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50505; "Nombre libro diario"; Code[10])
        {
        }
        field(50597; "Fecha anulación"; Date)
        {
        }
        field(50598; "Usuario Anulación"; Code[20])
        {
        }
        field(50599; Anulado; Boolean)
        {
        }
        field(50700; "No. cheque"; Code[20])
        {
        }
        field(50701; "Cód. banco cliente"; Code[20])
        {
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

