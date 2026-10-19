tableextension 50362 tableextension50362 extends "Vendor Ledger Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Vendor No.")
        {
            Caption = 'Vendor No.';
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
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Buy-from Vendor No.")
        {
            Caption = 'Buy-from Vendor No.';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Purchaser Code")
        {
            Caption = 'Purchaser Code';
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
        modify("Closed by Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Closed by Currency Code';
        }
        modify("Max. Payment Tolerance")
        {
            Caption = 'Max. Payment Tolerance';
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
        modify("Creditor No.")
        {
            Caption = 'Creditor No.';
        }
        modify("Payment Method Code")
        {
            Caption = 'Payment Method Code';
        }
        modify("Applies-to Ext. Doc. No.")
        {
            Caption = 'Applies-to Ext. Doc. No.';
        }
        modify("Autodocument No.")
        {
            Caption = 'Autodocument No.';
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
        field(50003; "Global Dimension 6 Code"; Code[20])
        {
            Caption = 'Global Dimension 6 Code';
            ToolTip = 'Specifies the value of the Global Dimension 6 Code field.';
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';

        }
        field(50005; "No. banco pagaré"; Code[20])
        {
            Caption = 'No. banco pagaré';
            ToolTip = 'Specifies the value of the No. banco pagaré field.';
            TableRelation = "Bank Account";
        }
        field(50006; "No. copias impresas"; Integer)
        {
            Caption = 'No. copias impresas';
            ToolTip = 'Specifies the value of the No. copias impresas field.';
        }
        field(50007; Ajustado; Boolean)
        {
            Caption = 'Ajustado';
            ToolTip = 'Specifies the value of the Ajustado field.';
        }
        field(50008; "Lugar de Pago"; Option)
        {
            Caption = 'Lugar de Pago';
            ToolTip = 'Specifies the value of the Lugar de Pago field.';
            OptionMembers = " ",BUE,CRV,PD,MDQ;
        }
        field(50009; "Payment block"; Boolean)
        {
            Caption = 'Pago bloqueado';
            ToolTip = 'Specifies the value of the Pago bloqueado field.';
            DataClassification = ToBeClassified;
        }
        field(50010; "Payment blocked by"; Code[10])
        {
            Caption = 'Pago bloqueado por';
            ToolTip = 'Specifies the value of the Pago bloqueado por field.';
            DataClassification = ToBeClassified;
            TableRelation = Seguridad.Grupo;
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
            TableRelation = "Bank Account";
        }
        field(50102; "No. proyecto"; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            TableRelation = Job;
        }
        field(50505; "Nombre libro diario"; Code[10])
        {
            Caption = 'Nombre libro diario';
            ToolTip = 'Specifies the value of the Nombre libro diario field.';
        }
        field(50506; "Fecha creación"; Date)
        {
            Caption = 'Creation Date';
            ToolTip = 'Specifies the value of the Creation Date field.';
        }
        field(50507; "No_ factura prov_"; Code[35])
        {
            Caption = 'No_ factura prov_';
            ToolTip = 'Specifies the value of the No_ factura prov_ field.';
            CalcFormula = Lookup("Vendor Ledger Entry"."External Document No." WHERE("Document Type" = FIELD("Applies-to Doc. Type"),
                                                                                      "Document No." = FIELD("Applies-to Doc. No.")));
            FieldClass = FlowField;
        }
        field(50508; "Cód. condición pago"; Code[20])
        {
            Caption = 'Cód. condición pago';
            ToolTip = 'Specifies the value of the Cód. condición pago field.';
            TableRelation = "Payment Terms";
        }
        field(50509; "Archivo vinculado"; Text[250])
        {
            Caption = 'Archivo vinculado';
            ToolTip = 'Specifies the value of the Archivo vinculado field.';
            CalcFormula = Lookup("Documentos digitalizados".Archivo WHERE("Nivel 8" = FIELD("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50510; "Mov. liquidación"; Boolean)
        {
            Caption = 'Mov. liquidación';
            ToolTip = 'Specifies the value of the Mov. liquidación field.';
            CalcFormula = Exist("Lín. Liquidacion Pagos" WHERE("No. mov." = FIELD("Entry No.")));
            FieldClass = FlowField;
        }
        field(50511; "Document exchange rate"; Decimal)
        {
            CalcFormula = Lookup("Purch. Inv. Header"."Currency Factor" WHERE("No." = FIELD("Document No.")));
            Caption = 'Tipo de cambio documento';
            ToolTip = 'Specifies the value of the Tipo de cambio documento field.';
            FieldClass = FlowField;
        }
        field(50512; "Estado recupero"; Option)
        {
            Caption = 'Estado recupero';
            ToolTip = 'Specifies the value of the Estado recupero field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Listo para solicitar",Solicitado;
        }
        field(50513; "No computable"; Boolean)
        {
            Caption = 'No computable';
            ToolTip = 'Specifies the value of the No computable field.';
            DataClassification = ToBeClassified;
        }
        field(50514; "Amount to Apply (LCY)"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount to Apply';
            ToolTip = 'Specifies the value of the Amount to Apply field.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                MustHaveSameSignErrB: Label 'El valor del campo %1 debe tener el mismo signo que el campo %2';
                MustNotBeLargerErrB: Label 'El valor del campo %1 debe ser superior al campo %2';
            begin
                TestField(Open, true);
                CalcFields("Remaining Amount");

                CheckBillSituation;

                if "Amount to Apply" * "Remaining Amount" < 0 then
                    FieldError("Amount to Apply", StrSubstNo(MustHaveSameSignErrB, FieldCaption("Remaining Amount")));

                if Abs("Amount to Apply") > Abs("Remaining Amount") then
                    FieldError("Amount to Apply", StrSubstNo(MustNotBeLargerErrB, FieldCaption("Remaining Amount")));
            end;
        }
        field(50596; "Applied by doc. type  Filter"; Option)
        {
            Caption = 'Applied by Doc. Type Filter';
            ToolTip = 'Specifies the value of the Applied by Doc. Type Filter field.';
            FieldClass = FlowFilter;
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund,,,,,,,,,,,,,,,Bill';
            OptionMembers = " ",Pago,Factura,Abono,"Docs. interés",Recordatorio,Reembolso,,,,,,,,,,,,,,,Efecto;
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
        field(50700; Liquidarefecto; Boolean)
        {
            Caption = 'Liquidarefecto';
            ToolTip = 'Specifies the value of the Liquidarefecto field.';
        }
        field(50701; "Cheque a la orden de"; Text[50])
        {
            Caption = 'Cheque a la orden de';
            ToolTip = 'Specifies the value of the Cheque a la orden de field.';
        }
        field(50702; "No. cheque"; Code[20])
        {
            Caption = 'No. cheque';
            ToolTip = 'Specifies the value of the No. cheque field.';
        }
    }

    keys
    {
        key(Key50000; "Cód. forma pago")
        {
        }
        key(Key50001; "Vendor No.", Open, "Due Date", "Currency Code", "Document Type")
        {
        }
    }

    //Unsupported feature: Code Modification on "DrillDownOnEntries(PROCEDURE 1)".

    //procedure DrillDownOnEntries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    VendLedgEntry.Reset;
    DtldVendLedgEntry.CopyFilter("Vendor No.",VendLedgEntry."Vendor No.");
    DtldVendLedgEntry.CopyFilter("Currency Code",VendLedgEntry."Currency Code");
    DtldVendLedgEntry.CopyFilter("Initial Entry Global Dim. 1",VendLedgEntry."Global Dimension 1 Code");
    DtldVendLedgEntry.CopyFilter("Initial Entry Global Dim. 2",VendLedgEntry."Global Dimension 2 Code");
    DtldVendLedgEntry.CopyFilter("Initial Entry Due Date",VendLedgEntry."Due Date");
    VendLedgEntry.SetCurrentKey("Vendor No.","Posting Date");
    VendLedgEntry.SetRange(Open,true);
    OnBeforeDrillDownEntries(VendLedgEntry,DtldVendLedgEntry);
    PAGE.Run(0,VendLedgEntry);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    //++Arbu
    DtldVendLedgEntry.CopyFilter("Initial Entry Global Dim. 3",VendLedgEntry."Global dimension 3 Code");
    DtldVendLedgEntry.CopyFilter("Initial Entry Global Dim. 4",VendLedgEntry."Global Dimension 4 Code");
    DtldVendLedgEntry.CopyFilter("Initial Entry Global Dim. 5",VendLedgEntry."Global Dimension 5 Code");
    DtldVendLedgEntry.CopyFilter("Initial Entry Global Dim. 6",VendLedgEntry."Global Dimension 6 Code");
    DtldVendLedgEntry.CopyFilter("Initial Entry Global Dim. 7",VendLedgEntry."Global Dimension 7 Code");
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
    VendLedgEntry.Reset;
    DtldVendLedgEntry.CopyFilter("Vendor No.",VendLedgEntry."Vendor No.");
    DtldVendLedgEntry.CopyFilter("Currency Code",VendLedgEntry."Currency Code");
    DtldVendLedgEntry.CopyFilter("Initial Entry Global Dim. 1",VendLedgEntry."Global Dimension 1 Code");
    DtldVendLedgEntry.CopyFilter("Initial Entry Global Dim. 2",VendLedgEntry."Global Dimension 2 Code");
    VendLedgEntry.SetCurrentKey("Vendor No.","Posting Date");
    VendLedgEntry.SetFilter("Date Filter",'..%1',WorkDate);
    VendLedgEntry.SetFilter("Due Date",'<%1',WorkDate);
    VendLedgEntry.SetFilter("Remaining Amount",'<>%1',0);
    OnBeforeDrillDownOnOverdueEntries(VendLedgEntry,DtldVendLedgEntry);
    PAGE.Run(0,VendLedgEntry);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    //++Arbu
    DtldVendLedgEntry.CopyFilter("Initial Entry Global Dim. 3",VendLedgEntry."Global dimension 3 Code");
    DtldVendLedgEntry.CopyFilter("Initial Entry Global Dim. 4",VendLedgEntry."Global Dimension 4 Code");
    DtldVendLedgEntry.CopyFilter("Initial Entry Global Dim. 5",VendLedgEntry."Global Dimension 5 Code");
    DtldVendLedgEntry.CopyFilter("Initial Entry Global Dim. 6",VendLedgEntry."Global Dimension 6 Code");
    DtldVendLedgEntry.CopyFilter("Initial Entry Global Dim. 7",VendLedgEntry."Global Dimension 7 Code");
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
    "Vendor No." := GenJnlLine."Account No.";
    "Posting Date" := GenJnlLine."Posting Date";
    "Document Date" := GenJnlLine."Document Date";
    #4..11
    "Vendor Posting Group" := GenJnlLine."Posting Group";
    "Global Dimension 1 Code" := GenJnlLine."Shortcut Dimension 1 Code";
    "Global Dimension 2 Code" := GenJnlLine."Shortcut Dimension 2 Code";
    "Dimension Set ID" := GenJnlLine."Dimension Set ID";
    "Purchaser Code" := GenJnlLine."Salespers./Purch. Code";
    "Source Code" := GenJnlLine."Source Code";
    #18..51
    "Do Not Send To SII" := GenJnlLine."Do Not Send To SII";

    OnAfterCopyVendLedgerEntryFromGenJnlLine(Rec,GenJnlLine);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
    //++Arbu
    "Global dimension 3 Code" := GenJnlLine."Shortcut Dimension 3 Code";
    "Global Dimension 4 Code" := GenJnlLine."Shortcut Dimension 4 Code";
    "Global Dimension 5 Code" := GenJnlLine."Shortcut Dimension 5 Code";
    "Global Dimension 6 Code" := GenJnlLine."Shortcut Dimension 6 Code";
    "Global Dimension 7 Code" := GenJnlLine."Shortcut Dimension 7 Code";
    "Lugar de Pago" := GenJnlLine."Lugar de Pago";
    "Payment block" := GenJnlLine."Payment block";
    "Payment blocked by" := GenJnlLine."Payment blocked by";
    //--Arbu
    #15..54
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


    //Unsupported feature: Property Modification (TextConstString) on "CheckBillSituationOrderErr(Variable 1100006)".

    //var
    //>>>> ORIGINAL VALUE:
    //CheckBillSituationOrderErr : @@@=%1 - document type and number;ENU=%1 cannot be applied because it is included in a payment order. To apply the document, remove it from the payment order and try again.;ESP=No se puede liquidar %1 porque está incluido en una orden de pago. Para liquidar el documento, elimínelo de la orden de pago e inténtelo de nuevo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckBillSituationOrderErr : @@@=%1 - document type and number;ENU=%1 cannot be applied because it is included in a payment order. To apply the document, remove it from the payment order and try again.;ESP=No se puede liquidar %1 porque está incluido en una orden de pago. Para liquidar el documento, elimínelo de la orden de pago e inténtelo de nuevo.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CheckBillSituationPostedErr(Variable 1100004)".

    //var
    //>>>> ORIGINAL VALUE:
    //CheckBillSituationPostedErr : @@@=%1 - document type and number;ENU=%1 cannot be applied because it is included in a posted payment order.;ESP=No se puede liquidar %1 porque está incluido en una orden de pago registrada.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CheckBillSituationPostedErr : @@@=%1 - document type and number;ENU=%1 cannot be applied because it is included in a posted payment order.;ESP=No se puede liquidar %1 porque está incluido en una orden de pago registrada.;
    //Variable type has not been exported.

    var
        rstInfoEmpresa: Record "Company Information";
}

