tableextension 50384 tableextension50384 extends "Bank Account"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Address)
        {
            Caption = 'Address';
        }
        modify("Address 2")
        {
            Caption = 'Address 2';
        }
        modify(City)
        {
            Caption = 'City';
        }
        modify("Phone No.")
        {
            Caption = 'Phone No.';
        }
        modify("Telex No.")
        {
            Caption = 'Telex No.';
        }
        modify("Bank Account No.")
        {
            Caption = 'Bank Account No.';
        }
        modify("Transit No.")
        {
            Caption = 'Transit No.';
        }
        modify("Territory Code")
        {
            Caption = 'Territory Code';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Chain Name")
        {
            Caption = 'Chain Name';
        }
        modify("Min. Balance")
        {
            Caption = 'Min. Balance';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
        modify("Statistics Group")
        {
            Caption = 'Statistics Group';
        }
        modify("Our Contact Code")
        {
            Caption = 'Our Contact Code';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Last Statement No.")
        {
            Caption = 'Last Statement No.';
        }
        modify("Last Payment Statement No.")
        {
            Caption = 'Last Payment Statement No.';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Global Dimension 1 Filter")
        {
            Caption = 'Global Dimension 1 Filter';
        }
        modify("Global Dimension 2 Filter")
        {
            Caption = 'Global Dimension 2 Filter';
        }
        modify("Fax No.")
        {
            Caption = 'Fax No.';
        }
        modify("Telex Answer Back")
        {
            Caption = 'Telex Answer Back';
        }
        modify("Post Code")
        {
            Caption = 'Post Code';
        }
        modify("Last Check No.")
        {
            Caption = 'Last Check No.';
        }
        modify("Balance Last Statement")
        {
            Caption = 'Balance Last Statement';
        }
        modify("Bank Branch No.")
        {
            Caption = 'Bank Branch No.';
        }
        modify("E-Mail")
        {
            Caption = 'Email';
        }
        modify("Check Report ID")
        {
            Caption = 'Check Report ID';
        }
        modify("SWIFT Code")
        {
            Caption = 'SWIFT Code';
        }
        modify("Bank Statement Import Format")
        {
            Caption = 'Bank Statement Import Format';
        }
        modify("Credit Transfer Msg. Nos.")
        {
            Caption = 'Credit Transfer Msg. Nos.';
        }
        modify("Direct Debit Msg. Nos.")
        {
            Caption = 'Direct Debit Msg. Nos.';
        }
        modify("SEPA Direct Debit Exp. Format")
        {
            Caption = 'SEPA Direct Debit Exp. Format';
        }
        modify("Transaction Import Timespan")
        {
            Caption = 'Transaction Import Timespan';
        }
        modify("Automatic Stmt. Import Enabled")
        {
            Caption = 'Automatic Stmt. Import Enabled';
        }
        modify("Creditor No.")
        {
            Caption = 'Creditor No.';
        }
        modify("Payment Export Format")
        {
            Caption = 'Payment Export Format';
        }
        modify("Bank Clearing Code")
        {
            Caption = 'Bank Clearing Code';
        }
        modify("Bank Clearing Standard")
        {
            Caption = 'Bank Clearing Standard';
        }
        modify("Positive Pay Export Code")
        {
            Caption = 'Positive Pay Export Code';
        }
        modify("CCC Bank No.")
        {
            Caption = 'CCC Bank No.';
        }
        modify("CCC Bank Branch No.")
        {
            Caption = 'CCC Bank Branch No.';
        }
        modify("CCC Control Digits")
        {
            Caption = 'CCC Control Digits';
        }
        modify("CCC Bank Account No.")
        {
            Caption = 'CCC Bank Account No.';
        }
        modify("CCC No.")
        {
            Caption = 'CCC No.';
        }
        modify("Last E-Pay Export File Name")
        {
            Caption = 'Last E-Pay Export File Name';
        }
        modify("Last Remittance Advice No.")
        {
            Caption = 'Last Remittance Advice No.';
        }
        modify("Las E-Pay File Creation No.")
        {
            Caption = 'Las E-Pay File Creation No.';
        }
        modify("Delay for Notices")
        {
            Caption = 'Delay for Notices';
        }
        modify("Credit Limit for Discount")
        {
            Caption = 'Credit Limit for Discount';
        }
        modify("Last Bill Gr. No.")
        {
            Caption = 'Last Bill Gr. No.';
        }
        modify("Date of Last Post. Bill Gr.")
        {
            Caption = 'Date of Last Post. Bill Gr.';
        }
        modify("Operation Fees Code")
        {
            Caption = 'Operation Fees Code';
        }
        modify("Dealing Type Filter")
        {
            Caption = 'Dealing Type Filter';
        }
        modify("Category Filter")
        {
            Caption = 'Category Filter';
        }
        modify("Customer Ratings Code")
        {
            Caption = 'Customer Ratings Code';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,2,3';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Global Dimension 3 Code");
            end;
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,2,4';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Global Dimension 4 Code");
            end;
        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,2,5';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Global Dimension 5 Code");
            end;
        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,2,6';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Global Dimension 6 Code");
            end;
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Global Dimension 7 Code");
            end;
        }
        field(50005; "Global Dimension 3 filter"; Code[10])
        {
            CaptionClass = '1,3,3';
            FieldClass = FlowFilter;

        }
        field(50006; "Global Dimension 4 filter"; Code[10])
        {
            CaptionClass = '1,3,4';
            FieldClass = FlowFilter;

        }
        field(50007; "Global Dimension 5 filter"; Code[10])
        {
            CaptionClass = '1,3,5';
            FieldClass = FlowFilter;

        }
        field(50008; "Global Dimension 6 filter"; Code[10])
        {
            CaptionClass = '1,3,6';
            FieldClass = FlowFilter;

        }
        field(50009; "Global Dimension 7 filter"; Code[20])
        {
            CaptionClass = '1,3,7';
            FieldClass = FlowFilter;

        }
        field(50010; "Post dated check account"; Code[10])
        {
            Caption = 'Cuenta cheques diferidos';
            TableRelation = "G/L Account"."No.";
        }
        field(50011; "Tipo cuenta"; Code[2])
        {
            DataClassification = ToBeClassified;
        }
        field(50012; CBU; Code[30])
        {
            Caption = 'CBU';
            DataClassification = ToBeClassified;
        }
        field(50013; "Only reconciliate amounts/chq"; Boolean)
        {
            Caption = 'Sólo conciiliar importes y cheque';
            DataClassification = ToBeClassified;
        }
        field(50014; "Reconciliate amounts"; Boolean)
        {
            Caption = 'Reconciliar importes';
            DataClassification = ToBeClassified;
        }
        field(50015; "Manual conciliation"; Boolean)
        {
            Caption = 'Conciliación manual';
            DataClassification = ToBeClassified;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "No." = '' then begin
      GLSetup.Get;
      GLSetup.TestField("Bank Account Nos.");
    #4..8
    if not InsertFromContact then
      UpdateContFromBank.OnInsert(Rec);

    DimMgt.UpdateDefaultDim(
      DATABASE::"Bank Account","No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
    fntActualizarSeptima;

    DimMgt.UpdateDefaultDim(
      DATABASE::"Bank Account","No.",
      "Global Dimension 1 Code","Global Dimension 2 Code",
      //++Arbu
      "Global Dimension 3 Code","Global Dimension 4 Code",
      "Global Dimension 5 Code","Global Dimension 6 Code",
      "Global Dimension 7 Code");
      //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.RenameDefaultDim(DATABASE::"Bank Account",xRec."No.","No.");
    "Last Date Modified" := Today;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //DimMgt.RenameDefaultDim(DATABASE::"Bank Account",xRec."No.","No.");
    "Last Date Modified" := Today;
    */
    //end;


    //Unsupported feature: Code Modification on "IsContactUpdateNeeded(PROCEDURE 49)".

    //procedure IsContactUpdateNeeded();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    UpdateNeeded :=
      (Name <> xRec.Name) or
      ("Search Name" <> xRec."Search Name") or
    #4..19
      ("Home Page" <> xRec."Home Page");

    if not UpdateNeeded and not IsTemporary then
      UpdateNeeded := BankContUpdate.ContactNameIsBlank("No.");

    OnAfterIsUpdateNeeded(xRec,Rec,UpdateNeeded);
    exit(UpdateNeeded);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..22
    //  UpdateNeeded := BankContUpdate.ContactNameIsBlank("No.");
    #24..26
    */
    //end;

    local procedure fntActualizarSeptima()
    var
        l_rstGLS: Record "General Ledger Setup";
        l_rstD: Record Dimension;
        l_rstDV: Record "Dimension Value";
        l_rst352: Record "Default Dimension";
    begin
        //++Arbu 2020
        //Cambiar el nombre de la dimensión global 7 a Relación Costo
        Clear(l_rstGLS);
        l_rstGLS.Get();
        if l_rstGLS."Global Dimension 7 Code" <> '' then begin

            Clear(l_rstD);
            l_rstD.SetRange(Code, l_rstGLS."Global Dimension 7 Code");
            if l_rstD.FindFirst then begin

                Clear(l_rstDV);
                l_rstDV."Dimension Code" := l_rstD.Code;
                l_rstDV.Code := "No.";
                l_rstDV.Name := CopyStr(Name, 1, 50);
                l_rstDV."Dimension Value Type" := l_rstDV."Dimension Value Type"::Standard;
                l_rstDV."Global Dimension No." := 7;
                if not l_rstDV.Insert(true) then;

                Clear(l_rst352);
                l_rst352."Table ID" := 270;
                l_rst352."No." := l_rstDV.Code;
                l_rst352."Dimension Code" := l_rstDV."Dimension Code";
                l_rst352."Dimension Value Code" := l_rstDV.Code;
                l_rst352."Value Posting" := l_rst352."Value Posting"::"Code Mandatory";
                if not l_rst352.Insert(true) then;

                "Global Dimension 7 Code" := l_rstDV.Code;

            end;

        end;

        //--Arbu 2020
    end;


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=Do you wish to create a contact for %1 %2?;ESP=¿Confirma que desea crear un contacto para %1 %2?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=Do you wish to create a contact for %1 %2?;ESP=?Confirma que desea crear un contacto para %1 %2?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.;ESP=Para poder usar Online Map, primero debe rellenar la ventana Configuración Online Map.\Consulte Configuración de Online Map en la Ayuda.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.;ESP=Para poder usar Online Map, primero debe rellenar la ventana Configuración Online Map.\Consulte Configuración de Online Map en la Ayuda.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text1100001(Variable 1100008)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100001 : ENU=You cannot change %1 because there are one or more posted payment orders for this bank account.;ESP=No se puede cambiar el banco %1 porque tiene órdenes pago registradas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100001 : ENU=You cannot change %1 because there are one or more posted payment orders for this bank account.;ESP=No se puede cambiar el banco %1 porque tiene órdenes pago registradas.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DataExchNotSetErr(Variable 1016)".

    //var
    //>>>> ORIGINAL VALUE:
    //DataExchNotSetErr : ENU=The Data Exchange Code field must be filled.;ESP=Debe completarse el campo Código de intercambio de datos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DataExchNotSetErr : ENU=The Data Exchange Code field must be filled.;ESP=Debe completarse el campo Código de intercambio de datos.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "BankStmtScheduledDownloadDescTxt(Variable 1018)".

    //var
    //>>>> ORIGINAL VALUE:
    //BankStmtScheduledDownloadDescTxt : @@@=%1 - Bank Account name;ENU=%1 Bank Statement Import;ESP=Importación extracto bancario %1;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BankStmtScheduledDownloadDescTxt : @@@=%1 - Bank Account name;ENU=%1 Bank Statement Import;ESP=Importación extracto bancario %1;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "JobQEntriesCreatedQst(Variable 1019)".

    //var
    //>>>> ORIGINAL VALUE:
    //JobQEntriesCreatedQst : ENU=A job queue entry for import of bank statements has been created.\\Do you want to open the Job Queue Entry window?;ESP=Se creó un movimiento de la cola de proyectos para la importación de extractos bancarios.\\¿Quiere abrir la ventana Mov. cola proyecto?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //JobQEntriesCreatedQst : ENU=A job queue entry for import of bank statements has been created.\\Do you want to open the Job Queue Entry window?;ESP=Se creó un movimiento de la cola de proyectos para la importación de extractos bancarios.\\?Quiere abrir la ventana Mov. cola proyecto?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "TransactionImportTimespanMustBePositiveErr(Variable 1020)".

    //var
    //>>>> ORIGINAL VALUE:
    //TransactionImportTimespanMustBePositiveErr : ENU=The value in the Number of Days Included field must be a positive number not greater than 9999.;ESP=El valor del campo Número de días incluidos debe ser un número positivo menor que 9999.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //TransactionImportTimespanMustBePositiveErr : ENU=The value in the Number of Days Included field must be a positive number not greater than 9999.;ESP=El valor del campo Número de días incluidos debe ser un número positivo menor que 9999.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "MFANotSupportedErr(Variable 1021)".

    //var
    //>>>> ORIGINAL VALUE:
    //MFANotSupportedErr : ENU=Cannot setup automatic bank statement import because the selected bank requires multi-factor authentication.;ESP=No se puede configurar la importación automática de extractos bancarios porque el banco seleccionado requiere la autenticación multifactor.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MFANotSupportedErr : ENU=Cannot setup automatic bank statement import because the selected bank requires multi-factor authentication.;ESP=No se puede configurar la importación automática de extractos bancarios porque el banco seleccionado requiere la autenticación multifactor.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "BankAccNotLinkedErr(Variable 1023)".

    //var
    //>>>> ORIGINAL VALUE:
    //BankAccNotLinkedErr : ENU=This bank account is not linked to an online bank account.;ESP=Este banco no está vinculado a un banco en línea.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BankAccNotLinkedErr : ENU=This bank account is not linked to an online bank account.;ESP=Este banco no está vinculado a un banco en línea.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "AutoLogonNotPossibleErr(Variable 1024)".

    //var
    //>>>> ORIGINAL VALUE:
    //AutoLogonNotPossibleErr : ENU=Automatic logon is not possible for this bank account.;ESP=El inicio de sesión automático no es posible para este banco.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AutoLogonNotPossibleErr : ENU=Automatic logon is not possible for this bank account.;ESP=El inicio de sesión automático no es posible para este banco.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ConfirmDeleteBalancingBankAccountQst(Variable 1027)".

    //var
    //>>>> ORIGINAL VALUE:
    //ConfirmDeleteBalancingBankAccountQst : ENU=This bank account is used as balancing account on the Payment Registration Setup page.\\Are you sure you want to delete it?;ESP=Esta cuenta bancaria se utiliza como cuenta de contrapartida en la página Configuración de registro de pago.\\¿Seguro que desea eliminarla?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ConfirmDeleteBalancingBankAccountQst : ENU=This bank account is used as balancing account on the Payment Registration Setup page.\\Are you sure you want to delete it?;ESP=Esta cuenta bancaria se utiliza como cuenta de contrapartida en la p?gina Configuración de registro de pago.\\?Seguro que desea eliminarla?;
    //Variable type has not been exported.
}

