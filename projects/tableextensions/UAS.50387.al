tableextension 50387 tableextension50387 extends "Bank Acc. Reconciliation"
{
    Caption = 'Bank Acc. Reconciliation';
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
        modify("Total Transaction Amount")
        {
            Caption = 'Total Transaction Amount';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Import Posted Transactions")
        {
            OptionCaption = ' ,Yes,No';
        }
        modify("Copy VAT Setup to Jnl. Line")
        {
            Caption = 'Copy VAT Setup to Jnl. Line';
        }

        //Unsupported feature: Code Insertion (VariableCollection) on ""Statement No."(Field 2).OnValidate".

        //trigger (Variable: rstBRL)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on ""Statement No."(Field 2).OnValidate".

        //trigger "(Field 2)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField("Bank Account No.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TestField("Bank Account No.");
        BankAcc.LockTable;
        BankAcc.Get("Bank Account No.");
        BankAcc."Last Statement No." := "Statement No.";
        BankAcc.Modify;

        //++Arbu
        if xRec."Statement No." <> '' then
        begin

          Clear(rstBRL);
          rstBRL.SetRange("Bank Account No.",xRec."Bank Account No.");
          if rstBRL.FindSet then
          repeat

            if rstBRL."Statement No." = xRec."Statement No." then
            begin

              Clear(rstBRLNew);
              rstBRLNew.Get(rstBRL."Bank Account No.",rstBRL."Statement No.",rstBRL."Statement Line No.");
              rstBRLNew.Rename(rstBRL."Bank Account No.","Statement No.",rstBRL."Statement Line No.");

            end;

          until rstBRL.Next = 0;

        end;
        //++Arbu
        */
        //end;


        //Unsupported feature: Code Modification on ""Balance Last Statement"(Field 5).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField("Statement Type","Statement Type"::"Bank Reconciliation");
        BankAcc.Get("Bank Account No.");
        if "Balance Last Statement" <> BankAcc."Balance Last Statement" then
        #4..7
               BankAcc.TableCaption)
          then
            "Balance Last Statement" := xRec."Balance Last Statement";
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..10

        //++Arbu 2020
        "Statement Ending Balance" := "Balance Last Statement"+"Statement imported amount";
        //--Arbu 2020
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
        field(50000; "Statement imported amount"; Decimal)
        {
            Caption = 'Importe importado extracto';

            trigger OnValidate()
            begin
                //++Arbu 2020
                "Statement Ending Balance" := "Balance Last Statement" + "Statement imported amount";
                //--Arbu 2020
            end;
        }
        field(50001; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(50002; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(50003; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(50004; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(50005; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
    }


    //Unsupported feature: Code Insertion (VariableCollection) on "OnDelete".

    //trigger (Variable: rst272)()
    //Parameters and return type have not been exported.
    //begin
    /*
    */
    //end;


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if BankAccReconLine.LinesExist(Rec) then
      BankAccReconLine.DeleteAll(true);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if BankAccReconLine.LinesExist(Rec) then
      BankAccReconLine.DeleteAll(true);

    //++Arbu
    {
    CLEAR(rst272);
    IF rst272.FIND('-') THEN
    REPEAT

      IF rst272."Statement No." = "Statement No." THEN
      BEGIN

        rst272."Entry Status" := rst272."Entry Status"::Posted;
        rst272."Statement Status" := 0;
        rst272."Statement No." := '';
        rst272."Statement Line No." := 0;
        rst272.MODIFY;

      END;

    UNTIL rst272.NEXT = 0;

    CLEAR(rst271);
    IF rst271.FIND('-') THEN
    REPEAT

      IF rst271."Statement No." = "Statement No." THEN
      BEGIN

        rst271."Statement Status" := 0;
        rst271."Statement No." := '';
        rst271."Statement Line No." := 0;
        rst271.MODIFY;

      END;

    UNTIL rst271.NEXT = 0;
    }
    //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Error(RenameErr,TableCaption);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //ERROR(RenameErr,TABLECAPTION);
    */
    //end;


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 22)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SourceCodeSetup.Get;
    TableID[1] := Type1;
    No[1] := No1;
    #4..8
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,SourceCodeSetup."Payment Reconciliation Journal",
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",0,0);

    if (OldDimSetID <> "Dimension Set ID") and LinesExist then begin
      Modify;
      UpdateAllLineDim("Dimension Set ID",OldDimSetID);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code",
        //--Arbu
        0,0);
    #13..17
    */
    //end;


    //Unsupported feature: Code Modification on "MatchSingle(PROCEDURE 5)".

    //procedure MatchSingle();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    MatchBankRecLines.MatchSingle(Rec,DateRange);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //++Arbu
    MatchBankRecLines.OmitirConciliados(blnNoCalcularConciliados);
    //--Arbu
    //++Arbu 2020
    MatchBankRecLines.SoloConciliarImportes(blnSoloImportes);
    //--Arbu 2020
    MatchBankRecLines.MatchSingle(Rec,DateRange);
    */
    //end;

    //Unsupported feature: Property Modification (Attributes) on "ImportBankStatement(PROCEDURE 6)".


    //Unsupported feature: Property Modification (Name) on "ImportBankStatement(PROCEDURE 6)".



    //Unsupported feature: Code Modification on "ImportBankStatement(PROCEDURE 6)".

    //procedure ImportBankStatement();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if BankAccountCouldBeUsedForImport then begin
      DataExch.Init;
      ProcessBankAccRecLines.ImportBankStatement(Rec,DataExch);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if BankAccountCouldBeUsedForImport then begin
      DataExch.Init;
    //  ProcessBankAccRecLines.ImportBankStatement(Rec,DataExch);
    end;
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDocDim(PROCEDURE 3)".

    //procedure ShowDocDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OldDimSetID := "Dimension Set ID";
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2',TableCaption,"Statement No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");

    if OldDimSetID <> "Dimension Set ID" then begin
      Modify;
      UpdateAllLineDim("Dimension Set ID",OldDimSetID);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code"
        //--Arbu
        );
    #6..10
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateAllLineDim(PROCEDURE 34)".

    //procedure UpdateAllLineDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    // Update all lines with changed dimensions.
    if NewParentDimSetID = OldParentDimSetID then
      exit;
    #4..14
          DimMgt.UpdateGlobalDimFromDimSetID(
            BankAccReconciliationLine."Dimension Set ID",
            BankAccReconciliationLine."Shortcut Dimension 1 Code",
            BankAccReconciliationLine."Shortcut Dimension 2 Code");
          BankAccReconciliationLine.Modify;
        end;
      until BankAccReconciliationLine.Next = 0;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..17
            BankAccReconciliationLine."Shortcut Dimension 2 Code",
            //++Arbu
            BankAccReconciliationLine."Shortcut Dimension 3 Code",BankAccReconciliationLine."Shortcut Dimension 4 Code",
            BankAccReconciliationLine."Shortcut Dimension 5 Code",BankAccReconciliationLine."Shortcut Dimension 6 Code",
            BankAccReconciliationLine."Shortcut Dimension 7 Code"
            //--Arbu
            );
    #19..22
    */
    //end;


    //Unsupported feature: Code Modification on "ImportStatement(PROCEDURE 13)".

    //procedure ImportStatement();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    exit(ProcessBankAccRecLines.ImportBankStatement(BankAccReconciliation,DataExch))
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //EXIT(ProcessBankAccRecLines.ImportBankStatement(BankAccReconciliation,DataExch))
    */
    //end;


    procedure OmitirConciliados(l_blnNoCalcularConciliados: Boolean)
    begin
        blnNoCalcularConciliados := l_blnNoCalcularConciliados;
    end;

    procedure SoloConciliarImportes(l_blnSoloImportes: Boolean)
    begin
        blnSoloImportes := l_blnSoloImportes;
    end;

    var
        rstBRL: Record "Bank Acc. Reconciliation Line";
        rstBRLNew: Record "Bank Acc. Reconciliation Line";

    var
        rst272: Record "Check Ledger Entry";
        rst271: Record "Bank Account Ledger Entry";


    //Unsupported feature: Property Modification (TextConstString) on "BalanceQst(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //BalanceQst : @@@="%1=Balance Last Statement field caption;%2=field caption;%3=table caption";ENU=%1 is different from %2 on the %3. Do you want to change the value?;ESP=%1 es diferente del %2 en el %3. ¿Confirma que desea cambiar el valor?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BalanceQst : @@@="%1=Balance Last Statement field caption;%2=field caption;%3=table caption";ENU=%1 is different from %2 on the %3. Do you want to change the value?;ESP=%1 es diferente del %2 en el %3. ?Confirma que desea cambiar el valor?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "YouChangedDimQst(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //YouChangedDimQst : ENU=You may have changed a dimension.\\Do you want to update the lines?;ESP=Puede que haya cambiado una dimensión.\\¿Desea actualizar las líneas?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //YouChangedDimQst : ENU=You may have changed a dimension.\\Do you want to update the lines?;ESP=Puede que haya cambiado una dimensión.\\?Desea actualizar las líneas?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoBankAccountsMsg(Variable 1010)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoBankAccountsMsg : ENU=You have not set up a bank account.\To use the payments import process, set up a bank account.;ESP=No ha configurado ninguna cuenta bancaria.\Para usar el proceso de importación de pagos, configure una cuenta bancaria.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoBankAccountsMsg : ENU=You have not set up a bank account.\To use the payments import process, set up a bank account.;ESP=No ha configurado ninguna cuenta bancaria.\Para usar el proceso de importación de pagos, configure una cuenta bancaria.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoBankAccWithFileFormatMsg(Variable 1011)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoBankAccWithFileFormatMsg : ENU=No bank account exists that is ready for import of bank statement files.\Fill the Bank Statement Import Format field on the card of the bank account that you want to use.;ESP=No existen cuentas bancarias listas para la importación de los archivos de extracto bancario.\Rellene el campo Formato de importación de extractos bancarios de la ficha de la cuenta bancaria que desee usar.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoBankAccWithFileFormatMsg : ENU=No bank account exists that is ready for import of bank statement files.\Fill the Bank Statement Import Format field on the card of the bank account that you want to use.;ESP=No existen cuentas bancarias listas para la importación de los archivos de extracto bancario.\Rellene el campo Formato de importación de extractos bancarios de la ficha de la cuenta bancaria que desee usar.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "PostHighConfidentLinesQst(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //PostHighConfidentLinesQst : ENU=All imported bank statement lines were applied with high confidence level.\Do you want to post the payment applications?;ESP=Todas las líneas del extracto bancario importado se aplicaron con un nivel de confianza elevado.\¿Desea registrar las liquidaciones de pago?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PostHighConfidentLinesQst : ENU=All imported bank statement lines were applied with high confidence level.\Do you want to post the payment applications?;ESP=Todas las líneas del extracto bancario importado se aplicaron con un nivel de confianza elevado.\?Desea registrar las liquidaciones de pago?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "MustHaveValueQst(Variable 1015)".

    //var
    //>>>> ORIGINAL VALUE:
    //MustHaveValueQst : ENU=The bank account must have a value in %1. Do you want to open the bank account card?;ESP=La cuenta bancaria debe tener un valor en %1. ¿Desea abrir la tarjeta de cuenta bancaria?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MustHaveValueQst : ENU=The bank account must have a value in %1. Do you want to open the bank account card?;ESP=La cuenta bancaria debe tener un valor en %1. ?Desea abrir la tarjeta de cuenta bancaria?;
    //Variable type has not been exported.

    var
        blnNoCalcularConciliados: Boolean;
        blnSoloImportes: Boolean;
}

