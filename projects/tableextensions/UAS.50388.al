tableextension 50388 tableextension50388 extends "Bank Acc. Reconciliation Line"
{
    Caption = 'Bank Acc. Reconciliation Line';

    //Unsupported feature: Property Insertion (PasteIsValid) on ""Bank Acc. Reconciliation Line"(Table 274)".

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
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Check No.")
        {
            Caption = 'Check No.';
        }
        modify("Additional Transaction Info")
        {
            Caption = 'Additional Transaction Info';
        }
        modify("Data Exch. Entry No.")
        {
            Caption = 'Data Exch. Entry No.';
        }
        modify("Data Exch. Line No.")
        {
            Caption = 'Data Exch. Line No.';
        }
        modify("Account No.")
        {
            Caption = 'Account No.';
        }
        modify("Transaction Text")
        {
            Caption = 'Transaction Text';
        }
        modify("Related-Party Bank Acc. No.")
        {
            Caption = 'Related-Party Bank Acc. No.';
        }
        modify("Related-Party Address")
        {
            Caption = 'Related-Party Address';
        }
        modify("Payment Reference No.")
        {
            Caption = 'Payment Reference No.';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Sorting Order")
        {
            Caption = 'Sorting Order';
        }
        modify("Parent Line No.")
        {
            Caption = 'Parent Line No.';
        }
        modify("Transaction ID")
        {
            Caption = 'Transaction ID';
        }

        //Unsupported feature: Code Modification on ""Account No."(Field 22).OnValidate".

        //trigger "(Field 22)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField("Applied Amount",0);
        CreateDim(
          DimMgt.TypeToTableID1("Account Type"),"Account No.",
          DATABASE::"Salesperson/Purchaser",GetSalepersonPurchaserCode);
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..4
        //DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;


        //Unsupported feature: Code Modification on ""Dimension Set ID"(Field 480).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        field(50000; "No. cheque interno"; Code[10])
        {
            Caption = 'No. cheque interno';
            ToolTip = 'Specifies the value of the No. cheque interno field.';
            CalcFormula = Lookup("Bank Account Ledger Entry"."No. cheque" WHERE("Statement No." = FIELD("Statement No."),
                                                                                "Statement Line No." = FIELD("Statement Line No.")));
            FieldClass = FlowField;
        }
        field(50001; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
            DataClassification = ToBeClassified;


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(50002; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
            DataClassification = ToBeClassified;


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(50003; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
            DataClassification = ToBeClassified;


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(50004; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';
            DataClassification = ToBeClassified;


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(50005; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';
            DataClassification = ToBeClassified;


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
    }


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Error(Text000,TableCaption);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //ERROR(Text000,TABLECAPTION);
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 25)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet("Dimension Set ID",StrSubstNo('%1 %2 %3',TableCaption,"Statement No.","Statement Line No."));
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet("Dimension Set ID",StrSubstNo('%1 %2 %3',TableCaption,"Statement No.","Statement Line No."));
    //DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 26)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SourceCodeSetup.Get;
    TableID[1] := Type1;
    No[1] := No1;
    #4..7
    "Shortcut Dimension 1 Code" := '';
    "Shortcut Dimension 2 Code" := '';
    BankAccReconciliation.Get("Statement Type","Bank Account No.","Statement No.");
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,SourceCodeSetup."Payment Reconciliation Journal",
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",BankAccReconciliation."Dimension Set ID",DATABASE::"Bank Account");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10
    {"Dimension Set ID" :=
    #12..14
        }
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=Delete application?;ESP=¿Confirma que desea eliminar la conciliación?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=Delete application?;ESP=?Confirma que desea eliminar la conciliación?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=Update canceled.;ESP=Actualización cancelada.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=Update canceled.;ESP=Actualización cancelada.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "TransactionAmountMustNotBeZeroErr(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //TransactionAmountMustNotBeZeroErr : ENU=The Transaction Amount field must have a value that is not 0.;ESP=El campo Importe de la transacción debe tener un valor que no sea 0.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TransactionAmountMustNotBeZeroErr : ENU=The Transaction Amount field must have a value that is not 0.;ESP=El campo Importe de la transacción debe tener un valor que no sea 0.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CreditTheAccountQst(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //CreditTheAccountQst : @@@=%1 is the account name, %2 is the amount that is not applied (there is filed on the page named Remaining Amount To Apply);ENU=The remaining amount to apply is %2.\\Do you want to create a new payment application line that will debit or credit %1 with the remaining amount when you post the payment?;ESP=El Importe pendiente de liquidación es %2.\\¿Quiere crear una nueva línea de liquidación de pago que debitará o acreditará en %1 el importe pendiente cuando registre el pago?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CreditTheAccountQst : @@@=%1 is the account name, %2 is the amount that is not applied (there is filed on the page named Remaining Amount To Apply);ENU=The remaining amount to apply is %2.\\Do you want to create a new payment application line that will debit or credit %1 with the remaining amount when you post the payment?;ESP=El Importe pendiente de liquidación es %2.\\?Quiere crear una nueva línea de liquidación de pago que debitar? o acreditar? en %1 el importe pendiente cuando registre el pago?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ExcessiveAmountErr(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //ExcessiveAmountErr : @@@=%1 is the amount that is not applied (there is filed on the page named Remaining Amount To Apply);ENU=The remaining amount to apply is %1.;ESP=El importe pendiente de liquidación es %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ExcessiveAmountErr : @@@=%1 is the amount that is not applied (there is filed on the page named Remaining Amount To Apply);ENU=The remaining amount to apply is %1.;ESP=El importe pendiente de liquidación es %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ImportPostedTransactionsQst(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //ImportPostedTransactionsQst : ENU=The bank statement contains payments that are already applied, but the related bank account ledger entries are not closed.\\Do you want to include these payments in the import?;ESP=El extracto bancario contiene pagos ya liquidados, pero los movimientos de banco relacionados no están cerrados.\\¿Quiere incluir estos pagos en la importación?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ImportPostedTransactionsQst : ENU=The bank statement contains payments that are already applied, but the related bank account ledger entries are not closed.\\Do you want to include these payments in the import?;ESP=El extracto bancario contiene pagos ya liquidados, pero los movimientos de banco relacionados no están cerrados.\\?Quiere incluir estos pagos en la importación?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ICPartnerAccountTypeQst(Variable 1015)".

    //var
    //>>>> ORIGINAL VALUE:
    //ICPartnerAccountTypeQst : ENU=The resulting entry will be of type IC Transaction, but no Intercompany Outbox transaction will be created. \\Do you want to use the IC Partner account type anyway?;ESP=El movimiento resultante será del tipo Transacción IC, pero no se creará ninguna transacción de bandeja de salida entre empresas vinculadas. \\¿Desea usar el tipo de cuenta de socio IC de todas maneras?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ICPartnerAccountTypeQst : ENU=The resulting entry will be of type IC Transaction, but no Intercompany Outbox transaction will be created. \\Do you want to use the IC Partner account type anyway?;ESP=El movimiento resultante será del tipo Transacción IC, pero no se creará ninguna transacción de bandeja de salida entre empresas vinculadas. \\?Desea usar el tipo de cuenta de socio IC de todas maneras?;
    //Variable type has not been exported.
}

