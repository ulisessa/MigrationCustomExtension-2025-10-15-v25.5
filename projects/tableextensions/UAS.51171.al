tableextension 51171 tableextension51171 extends "Gen. Journal Line"
{
    Caption = 'Gen. Journal Line';
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Account No.")
        {
            Caption = 'Account No.';
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
        modify("Profit (LCY)")
        {
            Caption = 'Profit (LCY)';
        }
        modify("Bill-to/Pay-to No.")
        {
            Caption = 'Bill-to/Pay-to No.';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Salespers./Purch. Code")
        {
            Caption = 'Salespers./Purch. Code';
        }
        modify("Pending Approval")
        {
            Caption = 'Pending Approval';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("System-Created Entry")
        {
            Caption = 'System-Created Entry';
        }
        modify("Applies-to Doc. No.")
        {
            Caption = 'Applies-to Doc. No.';
        }
        modify("Job No.")
        {
            Caption = 'Job No.';
        }
        modify("VAT Posting")
        {
            OptionCaption = 'Automatic VAT Entry,Manual VAT Entry';
        }
        modify("Payment Terms Code")
        {
            Caption = 'Payment Terms Code';
        }
        modify("Business Unit Code")
        {
            Caption = 'Business Unit Code';
        }
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Recurring Frequency")
        {
            Caption = 'Recurring Frequency';
        }
        modify("VAT Calculation Type")
        {
            Caption = 'VAT Calculation Type';
        }
        modify("Bal. VAT Calculation Type")
        {
            Caption = 'Bal. VAT Calculation Type';
        }
        modify(Correction)
        {
            Caption = 'Correction';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Source No.")
        {
            Caption = 'Source No.';
        }
        modify("Posting No. Series")
        {
            Caption = 'Posting No. Series';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
        }
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
        }
        modify("Use Tax")
        {
            Caption = 'Use Tax';
        }
        modify("Bal. Tax Area Code")
        {
            Caption = 'Bal. Tax Area Code';
        }
        modify("Bal. Tax Group Code")
        {
            Caption = 'Bal. Tax Group Code';
        }
        modify("Bal. Use Tax")
        {
            Caption = 'Bal. Use Tax';
        }
        modify("Source Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Source Currency Code';
        }
        modify("Reversing Entry")
        {
            Caption = 'Reversing Entry';
        }
        modify("Ship-to/Order Address Code")
        {
            Caption = 'Ship-to/Order Address Code';
        }
        modify("IC Partner Code")
        {
            Caption = 'IC Partner Code';
        }
        modify("IC Direction")
        {
            Caption = 'IC Direction';
        }
        modify("IC Partner Transaction No.")
        {
            Caption = 'IC Partner Transaction No.';
        }
        modify("Sell-to/Buy-from No.")
        {
            Caption = 'Sell-to/Buy-from No.';
        }
        modify("VAT Registration No.")
        {
            Caption = 'VAT Registration No.';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("Financial Void")
        {
            Caption = 'Financial Void';
        }
        modify("Copy VAT Setup to Jnl. Lines")
        {
            Caption = 'Copy VAT Setup to Jnl. Lines';
        }
        modify("Incoming Document Entry No.")
        {
            Caption = 'Incoming Document Entry No.';
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
        modify("Has Payment Export Error")
        {
            Caption = 'Has Payment Export Error';
        }
        modify("Job Task No.")
        {
            Caption = 'Job Task No.';
        }
        modify("Job Line Discount %")
        {
            Caption = 'Job Line Discount %';
        }
        modify("Job Line Disc. Amount (LCY)")
        {
            Caption = 'Job Line Disc. Amount (LCY)';
        }
        modify("Job Unit Of Measure Code")
        {
            Caption = 'Job Unit Of Measure Code';
        }
        modify("Job Line Type")
        {
            Caption = 'Job Line Type';
        }
        modify("Job Line Discount Amount")
        {
            Caption = 'Job Line Discount Amount';
        }
        modify("Job Line Amount")
        {
            Caption = 'Job Line Amount';
        }
        modify("Job Line Amount (LCY)")
        {
            Caption = 'Job Line Amount (LCY)';
        }
        modify("Job Currency Code")
        {
            Caption = 'Job Currency Code';
        }
        modify("Job Planning Line No.")
        {
            Caption = 'Job Planning Line No.';
        }
        modify("Direct Debit Mandate ID")
        {
            Caption = 'Direct Debit Mandate ID';
        }
        modify("Data Exch. Entry No.")
        {
            Caption = 'Data Exch. Entry No.';
        }
        modify("Payer Information")
        {
            Caption = 'Payer Information';
        }
        modify("Transaction Information")
        {
            Caption = 'Transaction Information';
        }
        modify("Data Exch. Line No.")
        {
            Caption = 'Data Exch. Line No.';
        }
        modify("Applied Automatically")
        {
            Caption = 'Applied Automatically';
        }
        modify("Deferral Code")
        {
            Caption = 'Deferral Code';
        }
        modify("Deferral Line No.")
        {
            Caption = 'Deferral Line No.';
        }
        modify("Campaign No.")
        {
            Caption = 'Campaign No.';
        }
        modify("Prod. Order No.")
        {
            Caption = 'Prod. Order No.';
        }
        modify("Depreciation Book Code")
        {
            Caption = 'Depreciation Book Code';
        }
        modify("No. of Depreciation Days")
        {
            Caption = 'No. of Depreciation Days';
        }
        modify("Maintenance Code")
        {
            Caption = 'Maintenance Code';
        }
        modify("Insurance No.")
        {
            Caption = 'Insurance No.';
        }
        modify("Budgeted FA No.")
        {
            Caption = 'Budgeted FA No.';
        }
        modify("FA Reclassification Entry")
        {
            Caption = 'FA Reclassification Entry';
        }
        modify("FA Error Entry No.")
        {
            Caption = 'FA Error Entry No.';
        }
        modify("Source Line No.")
        {
            Caption = 'Source Line No.';
        }
        modify("Last Modified DateTime")
        {
            Caption = 'Last Modified DateTime';
        }
        modify("Journal Batch Id")
        {
            Caption = 'Journal Batch Id';
        }
        modify("Transaction No.")
        {
            Caption = 'Transaction No.';
        }
        modify("AutoDoc. No.")
        {
            Caption = 'AutoDoc. No.';
        }
        modify("Statistical Code")
        {
            Caption = 'Statistical Code';
        }
        modify("Sales Special Scheme Code")
        {
            Caption = 'Sales Special Scheme Code';
        }
        modify("Purch. Special Scheme Code")
        {
            Caption = 'Purch. Special Scheme Code';
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
        modify("Applies-to Bill No.")
        {
            Caption = 'Applies-to Bill No.';
        }

        //Unsupported feature: Code Modification on ""Applies-to Doc. No."(Field 36).OnValidate".

        //trigger  No()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if SuppressCommit then
          PaymentToleranceMgt.SetSuppressCommit(true);

        if "Applies-to Doc. No." <> xRec."Applies-to Doc. No." then
          ClearCustVendApplnEntry;
        #6..75
          xRec.ClearAppliedGenJnlLine;
        end;

        case "Account Type" of
          "Account Type"::Customer:
            GetCustLedgerEntry;
        #82..89

        if "Applies-to Doc. Type" = "Applies-to Doc. Type"::Invoice then
          UpdateAppliesToInvoiceID;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //IF SuppressCommit THEN
          //PaymentToleranceMgt.SetSuppressCommit(TRUE);
        #3..78
        //++Arbu

        if ("Applies-to Doc. Type" <> 0) and ("Applies-to Doc. No." <> '') then
        begin

          case "Account Type" of

            "Account Type"::Customer:
            begin

              Clear(MovClie);
              MovClie.SetRange("Document Type","Applies-to Doc. Type");
              MovClie.SetRange("Document No.","Applies-to Doc. No.");
              if MovClie.Find('-') then
              begin

                Validate("Shortcut Dimension 1 Code",MovClie."Global Dimension 1 Code");
                Validate("Shortcut Dimension 2 Code",MovClie."Global Dimension 2 Code");
                Validate("Shortcut Dimension 3 Code",MovClie."Global dimension 3 Code");
                Validate("Shortcut Dimension 4 Code",MovClie."Global Dimension 4 Code");
                Validate("Shortcut Dimension 5 Code",MovClie."Global Dimension 5 Code");
                Validate("Shortcut Dimension 6 Code",MovClie."Global dimension 6 Code");
                Validate("Shortcut Dimension 7 Code",MovClie."Global Dimension 7 Code");

              end;

            end;

            "Account Type"::Vendor:
            begin

              Clear(MovProv);
              MovProv.SetRange("Document Type","Applies-to Doc. Type");
              MovProv.SetRange("Document No.","Applies-to Doc. No.");
              if MovProv.Find('-') then
              begin

                Validate("Shortcut Dimension 1 Code",MovProv."Global Dimension 1 Code");
                Validate("Shortcut Dimension 2 Code",MovProv."Global Dimension 2 Code");
                Validate("Shortcut Dimension 3 Code",MovProv."Global dimension 3 Code");
                Validate("Shortcut Dimension 4 Code",MovProv."Global Dimension 4 Code");
                Validate("Shortcut Dimension 5 Code",MovProv."Global Dimension 5 Code");
                Validate("Shortcut Dimension 6 Code",MovProv."Global Dimension 6 Code");
                Validate("Shortcut Dimension 7 Code",MovProv."Global Dimension 7 Code");
                if "Applies-to Doc. Type" = "Applies-to Doc. Type"::"Credit Memo" then
                  "Allow Zero-Amount Posting" := true;
                MovProv.TestField("Payment block",false);
              end;

            end;

          end;

        end;

        //--Arbu

        #79..92
        */
        //end;


        //Unsupported feature: Code Modification on ""Job No."(Field 42).OnValidate".

        //trigger "(Field 42)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "Job No." = xRec."Job No." then
          exit;

        #4..12
            DATABASE::Campaign,"Campaign No.");
          exit;
        end;

        TestField("Account Type","Account Type"::"G/L Account");

        if "Bal. Account No." <> '' then
          if not ("Bal. Account Type" in ["Bal. Account Type"::"G/L Account","Bal. Account Type"::"Bank Account"]) then
            Error(Text016,FieldCaption("Bal. Account Type"));
        #22..29
          DimMgt.TypeToTableID1("Bal. Account Type"),"Bal. Account No.",
          DATABASE::"Salesperson/Purchaser","Salespers./Purch. Code",
          DATABASE::Campaign,"Campaign No.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..15
        //++Arbu

        //TESTFIELD("Account Type","Account Type"::"G/L Account");

        //--Arbu
        #19..32
        */
        //end;


        //Unsupported feature: Code Modification on ""VAT Base Amount"(Field 71).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetCurrency;
        "VAT Base Amount" := Round("VAT Base Amount",Currency."Amount Rounding Precision");
        case "VAT Calculation Type" of
        #4..25
              "VAT Amount" :=
                SalesTaxCalculate.CalculateTax(
                  "Tax Area Code","Tax Group Code","Tax Liable","Posting Date",
                  "VAT Base Amount",Quantity,"Currency Factor");
              OnAfterSalesTaxCalculateCalculateTax(Rec,CurrFieldNo);
              if "VAT Base Amount" <> 0 then
                "VAT %" := Round(100 * "VAT Amount" / "VAT Base Amount",0.00001)
        #33..38
        end;
        OnValidateVATBaseAmountOnBeforeValidateAmount(Rec,Currency);
        Validate(Amount);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..28
                  "VAT Base Amount",Quantity,"Currency Factor",
                  //++Arbu
                  "Bill-to/Pay-to No.","VAT Calculation Type",'',Amount
                  //--Arbu
                  );
        #30..41
        */
        //end;


        //Unsupported feature: Code Modification on ""Bal. VAT Base Amount"(Field 72).OnValidate".

        //trigger  VAT Base Amount"(Field 72)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetCurrency;
        "Bal. VAT Base Amount" := Round("Bal. VAT Base Amount",Currency."Amount Rounding Precision");
        case "Bal. VAT Calculation Type" of
        #4..25
              "Bal. VAT Amount" :=
                SalesTaxCalculate.CalculateTax(
                  "Bal. Tax Area Code","Bal. Tax Group Code","Bal. Tax Liable",
                  "Posting Date","Bal. VAT Base Amount",Quantity,"Currency Factor");
              OnAfterSalesTaxCalculateCalculateTax(Rec,CurrFieldNo);
              if "Bal. VAT Base Amount" <> 0 then
                "Bal. VAT %" := Round(100 * "Bal. VAT Amount" / "Bal. VAT Base Amount",0.00001)
        #33..37
            end;
        end;
        Validate(Amount);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..28
                  "Posting Date","Bal. VAT Base Amount",Quantity,"Currency Factor",
                  //++Arbu
                  "Bill-to/Pay-to No.","VAT Calculation Type",'',Amount
                  //--Arbu
                  );
        #30..40
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
        field(50005; "Reg. consumo en proyecto"; Boolean)
        {
            Caption = 'Reg. consumo en proyecto';
            ToolTip = 'Specifies the value of the Reg. consumo en proyecto field.';
            Description = 'Sí = Generar apunte pry desde diario';
            Editable = true;
        }
        field(50009; "Permiso de embarque"; Code[30])
        {
            Caption = 'Boarding permission';
            ToolTip = 'Specifies the value of the Boarding permission field.';
        }
        field(50010; "Carpeta importación"; Code[20])
        {
            Caption = 'Carpeta importación';
            ToolTip = 'Specifies the value of the Carpeta importación field.';
        }
        field(50011; "Lugar de Pago"; Option)
        {
            Caption = 'Lugar de Pago';
            ToolTip = 'Specifies the value of the Lugar de Pago field.';
            OptionMembers = " ",BUE,CRV,PD,MDQ;
        }
        field(50012; "Descripción 2"; Text[150])
        {
            Caption = 'Description 2';
            ToolTip = 'Specifies the value of the Description 2 field.';
        }
        field(50013; "Retención"; Boolean)
        {
            Caption = 'Retención';
            ToolTip = 'Specifies the value of the Retención field.';
        }
        field(50014; "No. documento relacionado"; Code[20])
        {
            Caption = 'No. documento relacionado';
            ToolTip = 'Specifies the value of the No. documento relacionado field.';
        }
        field(50015; "No. línea doc. relacionado"; Integer)
        {
            Caption = 'No. línea doc. relacionado';
            ToolTip = 'Specifies the value of the No. línea doc. relacionado field.';
        }
        field(50016; "Concepto general"; Text[50])
        {
            Caption = 'Concepto general';
            ToolTip = 'Specifies the value of the Concepto general field.';
        }
        field(50017; "No. liquidación"; Code[20])
        {
            Caption = 'No. liquidación';
            ToolTip = 'Specifies the value of the No. liquidación field.';
        }
        field(50018; "Aprobar pago sin liquidar"; Boolean)
        {
            Caption = 'Aprobar pago sin liquidar';
            ToolTip = 'Specifies the value of the Aprobar pago sin liquidar field.';

            trigger OnValidate()
            begin
                if ("Account Type" = "Account Type"::Vendor) and (("Applies-to Doc. Type" = "Applies-to Doc. Type"::" ")
                   or ("Applies-to Doc. No." = '')) then begin

                    if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Aprobar pago sin vincular")) then
                        Error('Usted no está habilitado para aprobar este pago');

                end;
            end;
        }
        field(50019; "Concepto proyecto"; Code[10])
        {
            Caption = 'Job concept';
            ToolTip = 'Specifies the value of the Job concept field.';
            TableRelation = "Concepto proyecto";
        }
        field(50020; "Estado RG3594"; Option)
        {
            Caption = 'Estado RG3594';
            ToolTip = 'Specifies the value of the Estado RG3594 field.';
            CalcFormula = Lookup(Vendor."Registrado RG3594" WHERE("No." = FIELD("Account No.")));
            FieldClass = FlowField;
            OptionMembers = " ",Activo,Suspendido,Excluido,"Inscripción cancelada";
        }
        field(50021; "Payment block"; Boolean)
        {
            Caption = 'Pago bloqueado';
            ToolTip = 'Specifies the value of the Pago bloqueado field.';
            DataClassification = ToBeClassified;
        }
        field(50022; "Payment blocked by"; Code[10])
        {
            Caption = 'Pago bloqueado por';
            ToolTip = 'Specifies the value of the Pago bloqueado por field.';
            DataClassification = ToBeClassified;
            TableRelation = Seguridad.Grupo;
        }
        field(50142; "Ommit position validation"; Boolean)
        {
            Caption = 'Omitir validación de posición';
            ToolTip = 'Specifies the value of the Omitir validación de posición field.';
            DataClassification = ToBeClassified;
        }
        field(50212; "Factor divisa operacion"; Decimal)
        {
            Caption = 'Factor divisa operacion';
            ToolTip = 'Specifies the value of the Factor divisa operacion field.';
        }
        field(50213; "Valor divisa operacion"; Decimal)
        {
            Caption = 'Valor divisa operacion';
            ToolTip = 'Specifies the value of the Valor divisa operacion field.';
        }
        field(50500; ProyectoMeta4; Code[20])
        {
            Caption = 'ProyectoMeta4';
            ToolTip = 'Specifies the value of the ProyectoMeta4 field.';
        }
        field(50505; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50506; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50507; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50508; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50509; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
        field(50510; "Id. Sociedad"; Code[10])
        {
            Caption = 'Id. Sociedad';
            ToolTip = 'Specifies the value of the Id. Sociedad field.';
        }
        field(50511; "Id. Empleado"; Code[20])
        {
            Caption = 'Id. Empleado';
            ToolTip = 'Specifies the value of the Id. Empleado field.';
        }
        field(50512; "Cod. cuenta"; Code[20])
        {
            Caption = 'Cod. cuenta';
            ToolTip = 'Specifies the value of the Cod. cuenta field.';
        }
        field(50513; "Proy."; Code[20])
        {
            Caption = 'Proy.';
            ToolTip = 'Specifies the value of the Proy field.';
        }
        field(50514; "Id. Empresa"; Code[10])
        {
            Caption = 'Id. Empresa';
            ToolTip = 'Specifies the value of the Id. Empresa field.';
        }
        field(50515; "Fecha pago"; Date)
        {
            Caption = 'Fecha pago';
            ToolTip = 'Specifies the value of the Fecha pago field.';
        }
        field(50516; "Fecha imputacion"; Date)
        {
            Caption = 'Fecha imputacion';
            ToolTip = 'Specifies the value of the Fecha imputacion field.';
        }
        field(50517; "Tipo imputacion"; Code[10])
        {
            Caption = 'Tipo imputacion';
            ToolTip = 'Specifies the value of the Tipo imputacion field.';
        }
        field(50518; "Id. categoria"; Code[10])
        {
            Caption = 'Id. categoria';
            ToolTip = 'Specifies the value of the Id. categoria field.';
        }
        field(50519; "Nombre categoria"; Text[50])
        {
            Caption = 'Nombre categoria';
            ToolTip = 'Specifies the value of the Nombre categoria field.';
        }
        field(50520; "Id. puesto"; Code[10])
        {
            Caption = 'Id. puesto';
            ToolTip = 'Specifies the value of the Id. puesto field.';
        }
        field(50521; "Nombre puesto"; Text[50])
        {
            Caption = 'Nombre puesto';
            ToolTip = 'Specifies the value of the Nombre puesto field.';
        }
        field(50522; "Id. nacionalidad"; Code[10])
        {
            Caption = 'Id. nacionalidad';
            ToolTip = 'Specifies the value of the Id. nacionalidad field.';
        }
        field(50523; "Fecha sicore"; Date)
        {
            Caption = 'Fecha sicore';
            ToolTip = 'Specifies the value of the Fecha sicore field.';
        }
        field(50524; Importe; Decimal)
        {
            Caption = 'Importe';
            ToolTip = 'Specifies the value of the Importe field.';
        }
        field(50525; "Fecha de importacion"; DateTime)
        {
            Caption = 'Fecha de importacion';
            ToolTip = 'Specifies the value of the Fecha de importacion field.';
        }
        field(50526; Buque; Code[10])
        {
            Caption = 'Buque';
            ToolTip = 'Specifies the value of the Buque field.';
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50527; Marea; Code[10])
        {
            Caption = 'Marea';
            ToolTip = 'Specifies the value of the Marea field.';
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50528; Costo; Code[10])
        {
            Caption = 'Costo';
            ToolTip = 'Specifies the value of the Costo field.';
        }
        field(50529; Region; Option)
        {
            Caption = 'Region';
            ToolTip = 'Specifies the value of the Region field.';
            DataClassification = ToBeClassified;
            OptionMembers = "901 - CABA","902 - Buenos Aires","903 - Catamarca","904 - Córdoba","905 - Corrientes","906 - Chaco","907 - Chubut","908 - Entre Ríos","909 - Formosa","910 - Jujuy","911 - La Pampa","912 - La Rioja","913 - Mendoza","914 - Misiones","915 - Neuquén","916 - Río Negro","917 - Salta","918 - San Juan","919 - San Luis","920 - Santa Cruz","921 - Santa Fe","922 - Santiago del Estero","923 - Tierra del Fuego","924 -Tucumán";
        }
        field(50530; "Balance (DA)"; Decimal)
        {
            Caption = 'Balance (DA)';
            ToolTip = 'Specifies the value of the Balance (DA) field.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50700; "Cód. retención IVA"; Code[20])
        {
            Caption = 'Cód. retención IVA';
            ToolTip = 'Specifies the value of the Cód. retención IVA field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(IVA));
        }
        field(50701; "Cód. retención IB"; Code[20])
        {
            Caption = 'Cód. retención IB';
            ToolTip = 'Specifies the value of the Cód. retención IB field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
        }
        field(50702; "Cód. retención ganancias"; Code[20])
        {
            Caption = 'Cód. retención ganancias';
            ToolTip = 'Specifies the value of the Cód. retención ganancias field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = CONST(Ganancias));
        }
        field(50703; "No. cheque"; Code[10])
        {
            Caption = 'No. cheque';
            ToolTip = 'Specifies the value of the No. cheque field.';

            trigger OnValidate()
            begin
                if CopyStr("No. cheque", 1, 1) = '0' then
                    Error('El primer caracter del Cheque no puede ser 0');
            end;
        }
        field(50704; Provincia; Code[10])
        {
            Caption = 'Provincia';
            ToolTip = 'Specifies the value of the Provincia field.';
            TableRelation = Area;
        }
        field(50705; "Tipo fiscal"; Code[10])
        {
            Caption = 'Fiscal Type';
            ToolTip = 'Specifies the value of the Fiscal Type field.';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('TIPO FISCAL'));
            ObsoleteTag = '12/2025';
            ObsoleteState = Pending;
            ObsoleteReason = 'Reemplazado por campo Grupo Registro IVA Negocio';
        }
        field(50706; "Punto de venta"; Code[10])
        {
            Caption = 'Punto de venta';
            ToolTip = 'Specifies the value of the Punto de venta field.';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('PUNTO VENTA'));
        }
        field(50707; Letra; Text[10])
        {
            Caption = 'Letra';
            ToolTip = 'Specifies the value of the Letra field.';
        }
        field(50708; "Cheque a la orden de"; Text[50])
        {
            Caption = 'Cheque a la orden de';
            ToolTip = 'Specifies the value of the Cheque a la orden de field.';
        }
        field(50709; "Value Date"; Date)
        {
            Caption = 'Check Date';
            ToolTip = 'Specifies the value of the Check Date field.';
        }
    }


    //Unsupported feature: Code Insertion (VariableCollection) on "OnDelete".

    //trigger (Variable: rst17)()
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
    ApprovalsMgmt.OnCancelGeneralJournalLineApprovalRequest(Rec);

    // Lines are deleted 1 by 1, this actually check if this is the last line in the General journal Bach
    #4..26
      "Journal Batch Name",0,'',"Line No.");

    Validate("Incoming Document Entry No.",0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..29
    //++Arbu
    Clear(rst17);
    rst17.SetRange("Document No.","Document No.");
    if not rst17.FindFirst then
      begin

        Clear(rstBufferRetenciones);
        rstBufferRetenciones.SetRange(rstBufferRetenciones."No. documento","Document No.");
        rstBufferRetenciones.DeleteAll;

      end;

    //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GenJnlAlloc.LockTable;
    LockTable;

    #4..10

    ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
    ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");

    if ("Bank Payment Type" = "Bank Payment Type"::"Electronic Payment") and ("Account Type" = "Account Type"::Vendor) then
      ElectPmtMgmt.GetTransferType("Account No.",Amount,"Transfer Type",false);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..13
    //++Arbu
    ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
    ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
    ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
    ValidateShortcutDimCode(6,"Shortcut Dimension 6 Code");
    ValidateShortcutDimCode(7,"Shortcut Dimension 7 Code");
    //--Arbu

    {
    //++Arbu
    IF ("Bank Payment Type" = "Bank Payment Type"::"Electronic Payment") AND ("Account Type" = "Account Type"::Vendor) THEN
      ElectPmtMgmt.GetTransferType("Account No.",Amount,"Transfer Type",FALSE);
    //--Arbu
    }
    */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetLastModifiedDateTime;

    IsHandled := false;
    OnModifyOnBeforeTestCheckPrinted(Rec,IsHandled);
    if not IsHandled then
      TestField("Check Printed",false);

    if ("Bank Payment Type" = "Bank Payment Type"::"Electronic Payment") and ("Account Type" = "Account Type"::Vendor) then begin
      ElectPmtMgmt.GetTransferType("Account No.",Amount,"Transfer Type",false);
      Modify;
    end;

    if ("Applies-to ID" = '') and (xRec."Applies-to ID" <> '') then
      ClearCustVendApplnEntry;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    {
    //++Arbu
    IF ("Bank Payment Type" = "Bank Payment Type"::"Electronic Payment") AND ("Account Type" = "Account Type"::Vendor) THEN BEGIN
      ElectPmtMgmt.GetTransferType("Account No.",Amount,"Transfer Type",FALSE);
      MODIFY;
    END;
    //--Arbu
    }
    #12..14
    */
    //end;


    //Unsupported feature: Code Modification on "CheckDocNoBasedOnNoSeries(PROCEDURE 74)".

    //procedure CheckDocNoBasedOnNoSeries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsHandled := false;
    OnBeforeCheckDocNoBasedOnNoSeries(Rec,LastDocNo,NoSeriesCode,NoSeriesMgtInstance,IsHandled);
    if IsHandled then
    #4..8
    if (LastDocNo = '') or ("Document No." <> LastDocNo) then begin
      DocNo := NoSeriesMgtInstance.GetNextNo(NoSeriesCode,"Posting Date",false);
      if not "Exported to Payment File" then
        if "Document No." <> DocNo then begin
          NoSeriesMgtInstance.TestManualWithDocumentNo(NoSeriesCode,"Document No.");  // allow use of manual document numbers.
          NoSeriesMgtInstance.ClearNoSeriesLine;
        end;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
      //++Arbu
      begin
        if "No. liquidación" = '' then
      //--Arbu
          TestField("Document No.",NoSeriesMgtInstance.GetNextNo(NoSeriesCode,"Posting Date",false));

    {    IF "Document No." <> DocNo THEN BEGIN
          NoSeriesMgtInstance.TestManualWithDocumentNo(NoSeriesCode,"Document No.");  // allow use of manual document numbers.
          NoSeriesMgtInstance.ClearNoSeriesLine;
        END;
     } //++Arbu
      end;
      //++Arbu
    end;
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: l_intLine) (VariableCollection) on "RenumberDocNoOnLines(PROCEDURE 69)".



    //Unsupported feature: Code Modification on "RenumberDocNoOnLines(PROCEDURE 69)".

    //procedure RenumberDocNoOnLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    FirstDocNo := DocNo;
    with GenJnlLine2 do begin
      SetCurrentKey("Journal Template Name","Journal Batch Name","Document No.","Bal. Account No.");
      SetRange("Journal Template Name","Journal Template Name");
      SetRange("Journal Batch Name","Journal Batch Name");
      LastGenJnlLine.Init;
      First := true;
      if FindSet then begin
        repeat
          if (FirstDocNo <> GetTempRenumberDocumentNo) and (GetFilter("Document No.") = '') then begin
            Commit;
            Clear(NoSeriesMgt);
            TempFirstDocNo := NoSeriesMgt.TryGetNextNo(GenJnlBatch."No. Series","Posting Date");
            if (FirstDocNo <> TempFirstDocNo) and (FirstDocNo <> IncStr(TempFirstDocNo)) then begin
              DocNo := TempFirstDocNo;
              FirstDocNo := DocNo;
              First := true;
            end;
          end;
          if "Document No." = FirstDocNo then
            exit;
          if not First and
             (("Document No." <> PrevDocNo) or
              ("Posting Date" <> PrevPostingDate) or
              (("Bal. Account No." <> '') and ("Document No." = ''))) and
             not LastGenJnlLine.EmptyLine
          then
            DocNo := IncStr(DocNo);
          PrevDocNo := "Document No.";
          PrevPostingDate := "Posting Date";
          if "Document No." <> '' then begin
            if "Applies-to ID" = "Document No." then
              RenumberAppliesToID(GenJnlLine2,"Document No.",DocNo);
            RenumberAppliesToDocNo(GenJnlLine2,"Document No.",DocNo);
          end;
          GenJnlLine3.Get("Journal Template Name","Journal Batch Name","Line No.");
          GenJnlLine3."Document No." := DocNo;
          GenJnlLine3.Modify;
          First := false;
          LastGenJnlLine := GenJnlLine2
        until Next = 0
      end
    end
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    FirstDocNo := DocNo;
    l_intLine := 0;
    #2..9
                  //++Arbu
                  if l_intLine <> "Line No." then
                  begin
                    l_intLine := "Line No.";
                        //--Arbu
                        if "Document No." = FirstDocNo then
                          exit;
            if (FirstDocNo <> GetTempRenumberDocumentNo) and (GetFilter("Document No.") = '') then begin
              Commit;
              Clear(NoSeriesMgt);
              TempFirstDocNo := NoSeriesMgt.TryGetNextNo(GenJnlBatch."No. Series","Posting Date");
              if (FirstDocNo <> TempFirstDocNo) and (FirstDocNo <> IncStr(TempFirstDocNo)) then begin
                DocNo := TempFirstDocNo;
                FirstDocNo := DocNo;
                First := true;
              end;
            end;

            if "Document No." = FirstDocNo then
              exit;
            if not First and
               (("Document No." <> PrevDocNo) or
                ("Posting Date" <> PrevPostingDate) or
                (("Bal. Account No." <> '') and ("Document No." = ''))) and
               not LastGenJnlLine.EmptyLine
            then
              DocNo := IncStr(DocNo);
            PrevDocNo := "Document No.";
            PrevPostingDate := "Posting Date";
            if "Document No." <> '' then begin
              if "Applies-to ID" = "Document No." then
                RenumberAppliesToID(GenJnlLine2,"Document No.",DocNo);
              RenumberAppliesToDocNo(GenJnlLine2,"Document No.",DocNo);
            end;
            GenJnlLine3.Get("Journal Template Name","Journal Batch Name","Line No.");
            GenJnlLine3."Document No." := DocNo;
            GenJnlLine3.Modify;
            First := false;
            LastGenJnlLine := GenJnlLine2
                      //++Arbu
                      end;
                  //--Arbu
        until Next = 0;
        //++Arbu
        if DocNo <> FirstTempDocNo then
          GenerarLinRetencion(GenJnlLine3,false);
        //--Arbu
      end;
    end;
    */
    //end;


    //Unsupported feature: Code Modification on "CheckGLAcc(PROCEDURE 7)".

    //procedure CheckGLAcc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GLAcc.CheckGLAcc;
    if GLAcc."Direct Posting" or ("Journal Template Name" = '') or "System-Created Entry" then
      exit;
    if "Posting Date" <> 0D then
      if "Posting Date" = ClosingDate("Posting Date") then
        exit;

    CheckDirectPosting(GLAcc);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    //US.ARBU - 2004-02-09 - Inicio modificación para la validación de Entrada Directa por grupo de seguridad

    if not cduImpDire.ImputacionDirecta(GLAcc."No.") then
    begin

      Message('Usted no puede realizar imputaciones directas sobre la cuenta %1.',GLAcc.Name);
      Error('Se ha cancelado la operación');

    end
    else
      exit;

    CheckDirectPosting(GLAcc);
    */
    //end;


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 13)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TableID[1] := Type1;
    No[1] := No1;
    TableID[2] := Type2;
    #4..11

    "Shortcut Dimension 1 Code" := '';
    "Shortcut Dimension 2 Code" := '';
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,"Source Code","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",0,0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
    //++Arbu
    "Shortcut Dimension 3 Code" := '';
    "Shortcut Dimension 4 Code" := '';
    "Shortcut Dimension 5 Code" := '';
    "Shortcut Dimension 6 Code" := '';
    "Shortcut Dimension 7 Code" := '';
    //--Arbu

    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,"Source Code","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
                //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code",
        //--Arbu
        0,0);
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 26)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2 %3',"Journal Template Name","Journal Batch Name","Line No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code"
        //--Arbu
        );
    */
    //end;


    //Unsupported feature: Code Modification on "LookUpAppliesToDocCust(PROCEDURE 35)".

    //procedure LookUpAppliesToDocCust();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsHandled := false;
    OnBeforeLookUpAppliesToDocCust(Rec,AccNo,IsHandled);
    if IsHandled then
    #4..51
      SetAmountWithCustLedgEntry;
      UpdateDocumentTypeAndAppliesTo(CustLedgEntry."Document Type",CustLedgEntry."Document No.");
      "Applies-to Bill No." := CustLedgEntry."Bill No.";
      OnLookUpAppliesToDocCustOnAfterUpdateDocumentTypeAndAppliesTo(Rec,CustLedgEntry);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..54
      //++Arbu
      "Shortcut Dimension 1 Code" := CustLedgEntry."Global Dimension 1 Code";
      "Shortcut Dimension 2 Code" := CustLedgEntry."Global Dimension 2 Code";
      "Shortcut Dimension 3 Code" := CustLedgEntry."Global dimension 3 Code";
      "Shortcut Dimension 4 Code" := CustLedgEntry."Global Dimension 4 Code";
      "Shortcut Dimension 5 Code" := CustLedgEntry."Global Dimension 5 Code";
      "Shortcut Dimension 6 Code" := CustLedgEntry."Global dimension 6 Code";
      "Shortcut Dimension 7 Code" := CustLedgEntry."Global Dimension 7 Code";
      //--Arbu
      OnLookUpAppliesToDocCustOnAfterUpdateDocumentTypeAndAppliesTo(Rec,CustLedgEntry);
    end;
    */
    //end;


    //Unsupported feature: Code Modification on "LookUpAppliesToDocVend(PROCEDURE 36)".

    //procedure LookUpAppliesToDocVend();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsHandled := false;
    OnBeforeLookUpAppliesToDocVend(Rec,AccNo,IsHandled);
    if IsHandled then
    #4..58
      UpdateDocumentTypeAndAppliesTo(VendLedgEntry."Document Type",VendLedgEntry."Document No.");
      "Applies-to Bill No." := VendLedgEntry."Bill No.";
      OnLookUpAppliesToDocVendOnAfterUpdateDocumentTypeAndAppliesTo(Rec,VendLedgEntry);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..61
      //++Arbu
      "Shortcut Dimension 1 Code" := CustLedgEntry."Global Dimension 1 Code";
      "Shortcut Dimension 2 Code" := CustLedgEntry."Global Dimension 2 Code";
      "Shortcut Dimension 3 Code" := CustLedgEntry."Global dimension 3 Code";
      "Shortcut Dimension 4 Code" := CustLedgEntry."Global Dimension 4 Code";
      "Shortcut Dimension 5 Code" := CustLedgEntry."Global Dimension 5 Code";
      "Shortcut Dimension 6 Code" := CustLedgEntry."Global dimension 6 Code";
      "Shortcut Dimension 7 Code" := CustLedgEntry."Global Dimension 7 Code";
      //--Arbu
    end;
    */
    //end;


    //Unsupported feature: Code Modification on "FindFirstCustLedgEntryWithAppliesToID(PROCEDURE 54)".

    //procedure FindFirstCustLedgEntryWithAppliesToID();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CustLedgEntry.Reset;
    CustLedgEntry.SetCurrentKey("Customer No.","Applies-to ID",Open);
    CustLedgEntry.SetRange("Customer No.",AccNo);
    CustLedgEntry.SetRange("Applies-to ID",AppliesToID);
    CustLedgEntry.SetRange(Open,true);
    exit(CustLedgEntry.FindFirst)
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    exit(CustLedgEntry.FindFirst);
    */
    //end;


    //Unsupported feature: Code Modification on "FindFirstCustLedgEntryWithAppliesToDocNo(PROCEDURE 55)".

    //procedure FindFirstCustLedgEntryWithAppliesToDocNo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CustLedgEntry.Reset;
    CustLedgEntry.SetCurrentKey("Document No.");
    CustLedgEntry.SetRange("Document No.",AppliestoDocNo);
    CustLedgEntry.SetRange("Document Type","Applies-to Doc. Type");
    CustLedgEntry.SetRange("Bill No.","Applies-to Bill No.");
    CustLedgEntry.SetRange("Customer No.",AccNo);
    CustLedgEntry.SetRange(Open,true);
    exit(CustLedgEntry.FindFirst)
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
    exit(CustLedgEntry.FindFirst);
    */
    //end;


    //Unsupported feature: Code Modification on "FindFirstVendLedgEntryWithAppliesToID(PROCEDURE 58)".

    //procedure FindFirstVendLedgEntryWithAppliesToID();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    VendLedgEntry.Reset;
    VendLedgEntry.SetCurrentKey("Vendor No.","Applies-to ID",Open);
    VendLedgEntry.SetRange("Vendor No.",AccNo);
    VendLedgEntry.SetRange("Applies-to ID",AppliesToID);
    VendLedgEntry.SetRange(Open,true);
    exit(VendLedgEntry.FindFirst)
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    exit(VendLedgEntry.FindFirst);
    */
    //end;


    //Unsupported feature: Code Modification on "FindFirstVendLedgEntryWithAppliesToDocNo(PROCEDURE 59)".

    //procedure FindFirstVendLedgEntryWithAppliesToDocNo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    VendLedgEntry.Reset;
    VendLedgEntry.SetCurrentKey("Document No.");
    VendLedgEntry.SetRange("Document No.",AppliestoDocNo);
    VendLedgEntry.SetRange("Document Type","Applies-to Doc. Type");
    VendLedgEntry.SetRange("Bill No.","Applies-to Bill No.");
    VendLedgEntry.SetRange("Vendor No.",AccNo);
    VendLedgEntry.SetRange(Open,true);
    exit(VendLedgEntry.FindFirst)
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7
    exit(VendLedgEntry.FindFirst);
    */
    //end;


    //Unsupported feature: Code Modification on "FindFirstEmplLedgEntryWithAppliesToID(PROCEDURE 191)".

    //procedure FindFirstEmplLedgEntryWithAppliesToID();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    EmplLedgEntry.Reset;
    EmplLedgEntry.SetCurrentKey("Employee No.","Applies-to ID",Open);
    EmplLedgEntry.SetRange("Employee No.",AccNo);
    EmplLedgEntry.SetRange("Applies-to ID",AppliesToID);
    EmplLedgEntry.SetRange(Open,true);
    exit(EmplLedgEntry.FindFirst)
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    exit(EmplLedgEntry.FindFirst);
    */
    //end;


    //Unsupported feature: Code Modification on "FindFirstEmplLedgEntryWithAppliesToDocNo(PROCEDURE 190)".

    //procedure FindFirstEmplLedgEntryWithAppliesToDocNo();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    EmplLedgEntry.Reset;
    EmplLedgEntry.SetCurrentKey("Document No.");
    EmplLedgEntry.SetRange("Document No.",AppliestoDocNo);
    EmplLedgEntry.SetRange("Document Type","Applies-to Doc. Type");
    EmplLedgEntry.SetRange("Employee No.",AccNo);
    EmplLedgEntry.SetRange(Open,true);
    exit(EmplLedgEntry.FindFirst)
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    exit(EmplLedgEntry.FindFirst);
    */
    //end;


    //Unsupported feature: Code Modification on "SetSuppressCommit(PROCEDURE 299)".

    //procedure SetSuppressCommit();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SuppressCommit := NewSuppressCommit;
    PaymentToleranceMgt.SetSuppressCommit(SuppressCommit);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SuppressCommit := NewSuppressCommit;
    //PaymentToleranceMgt.SetSuppressCommit(SuppressCommit);
    */
    //end;


    //Unsupported feature: Code Modification on "CopyDimensionsFromJobTaskLine(PROCEDURE 82)".

    //procedure CopyDimensionsFromJobTaskLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" := TempJobJnlLine."Dimension Set ID";
    "Shortcut Dimension 1 Code" := TempJobJnlLine."Shortcut Dimension 1 Code";
    "Shortcut Dimension 2 Code" := TempJobJnlLine."Shortcut Dimension 2 Code";
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
        //++Arbu
    "Shortcut Dimension 3 Code" := TempJobJnlLine."Shortcut Dimension 3 Code";
    "Shortcut Dimension 4 Code" := TempJobJnlLine."Shortcut Dimension 4 Code";
    "Shortcut Dimension 5 Code" := TempJobJnlLine."Shortcut Dimension 5 Code";
    "Shortcut Dimension 6 Code" := TempJobJnlLine."Shortcut Dimension 6 Code";
    "Shortcut Dimension 7 Code" := TempJobJnlLine."Shortcut Dimension 7 Code";
    //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "GetVendorAccount(PROCEDURE 115)".

    //procedure GetVendorAccount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Vend.Get("Account No.");
    Vend.CheckBlockedVendOnJnls(Vend,"Document Type",false);
    CheckICPartner(Vend."IC Partner Code","Account Type","Account No.");
    UpdateDescription(Vend.Name);
    "Payment Method Code" := Vend."Payment Method Code";
    "Creditor No." := Vend."Creditor No.";

    OnGenJnlLineGetVendorAccount(Vend);

    Validate("Recipient Bank Account",Vend."Preferred Bank Account Code");
    #11..35
    CheckPaymentTolerance;

    OnAfterAccountNoOnValidateGetVendorAccount(Rec,Vend,CurrFieldNo);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    //++Arbu
    if ("Document Type"= "Document Type"::Payment) and (Vend."Sin Autorizacion Pago" = true) then
          Error('No se puede realizar un pago al proveedor %1, %2, dado que no presenta la documentación reglamentaria requerida'+
                    'por la AFIP',Vend."No.",Vend.Name);
    "Cheque a la orden de" := Vend."Cheque a la orden de";
    "Lugar de Pago" := Vend."Lugar de Pago";
    if ("Document Type"= "Document Type"::Payment) and (Vend."Sin Autorizacion Pago" = true) then
          Error('No se puede realizar un pago al proveedor %1, %2, dado que no presenta la documentación reglamentaria requerida'+
                    'por la AFIP',Vend."No.",Vend.Name);
    "Shortcut Dimension 1 Code" := Vend."Global Dimension 1 Code";
    "Shortcut Dimension 2 Code" := Vend."Global Dimension 2 Code";
    "Shortcut Dimension 3 Code" := Vend."Global Dimension 3 Code";
    "Shortcut Dimension 4 Code" := Vend."Global Dimension 4 Code";
    "Shortcut Dimension 5 Code" := Vend."Global Dimension 5 Code";
    "Shortcut Dimension 6 Code" := Vend."Global Dimension 6 Code";
    "Shortcut Dimension 7 Code" := Vend."Global Dimension 7 Code";
    Description := Vend.Name;
    //--Arbu
    #8..38
    */
    //end;


    //Unsupported feature: Code Modification on "GetVendorBalAccount(PROCEDURE 123)".

    //procedure GetVendorBalAccount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Vend.Get("Bal. Account No.");
    Vend.CheckBlockedVendOnJnls(Vend,"Document Type",false);
    CheckICPartner(Vend."IC Partner Code","Bal. Account Type","Bal. Account No.");
    #4..9
    "Payment Terms Code" := Vend."Payment Terms Code";
    Validate("Bill-to/Pay-to No.","Bal. Account No.");
    Validate("Sell-to/Buy-from No.","Bal. Account No.");
    if ("Account No." = '') or ("Account Type" = "Account Type"::"G/L Account") then
      "Currency Code" := Vend."Currency Code";
    if ("Account Type" = "Account Type"::"Bank Account") and ("Currency Code" = '') then
    #16..27
    CheckPaymentTolerance;

    OnAfterAccountNoOnValidateGetVendorBalAccount(Rec,Vend,CurrFieldNo);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..12
    //++Arbu
    if ("Document Type"= "Document Type"::Payment) and (Vend."Sin Autorizacion Pago" = true) then
          Error('No se puede realizar un pago al proveedor %1, %2, dado que no presenta la documentación reglamentaria requerida'+
                    'por la AFIP',Vend."No.",Vend.Name);
    "Cheque a la orden de" := Vend."Cheque a la orden de";
    "Lugar de Pago" := Vend."Lugar de Pago";
    if ("Document Type"= "Document Type"::Payment) and (Vend."Sin Autorizacion Pago" = true) then
          Error('No se puede realizar un pago al proveedor %1, %2, dado que no presenta la documentación reglamentaria requerida'+
                    'por la AFIP',Vend."No.",Vend.Name);
    "Shortcut Dimension 1 Code" := Vend."Global Dimension 1 Code";
    "Shortcut Dimension 2 Code" := Vend."Global Dimension 2 Code";
    "Shortcut Dimension 3 Code" := Vend."Global Dimension 3 Code";
    "Shortcut Dimension 4 Code" := Vend."Global Dimension 4 Code";
    "Shortcut Dimension 5 Code" := Vend."Global Dimension 5 Code";
    "Shortcut Dimension 6 Code" := Vend."Global Dimension 6 Code";
    "Shortcut Dimension 7 Code" := Vend."Global Dimension 7 Code";
    Description := Vend.Name;
    //--Arbu
    #13..30
    */
    //end;


    //Unsupported feature: Code Modification on "GetBankAccount(PROCEDURE 116)".

    //procedure GetBankAccount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    BankAcc.Get("Account No.");
    BankAcc.TestField(Blocked,false);
    if ReplaceDescription then
    #4..16
      if SetCurrencyCode("Bal. Account Type","Bal. Account No.") then
        BankAcc.TestField("Currency Code","Currency Code")
      else
        "Currency Code" := BankAcc."Currency Code";
    ClearPostingGroups;

    OnAfterAccountNoOnValidateGetBankAccount(Rec,BankAcc,CurrFieldNo);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..19
              begin
        "Currency Code" := BankAcc."Currency Code";
        //++Arbu
        "Shortcut Dimension 1 Code" := BankAcc."Global Dimension 1 Code";
        "Shortcut Dimension 2 Code" := BankAcc."Global Dimension 2 Code";
        "Shortcut Dimension 3 Code" := BankAcc."Global Dimension 3 Code";
        "Shortcut Dimension 4 Code" := BankAcc."Global Dimension 4 Code";
        "Shortcut Dimension 5 Code" := BankAcc."Global Dimension 5 Code";
        "Shortcut Dimension 6 Code" := BankAcc."Global Dimension 6 Code";
        "Shortcut Dimension 7 Code" := BankAcc."Global Dimension 7 Code";
        //--Arbu
              end;
    #21..23
    */
    //end;


    //Unsupported feature: Code Modification on "GetBankBalAccount(PROCEDURE 124)".

    //procedure GetBankBalAccount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    BankAcc.Get("Bal. Account No.");
    BankAcc.TestField(Blocked,false);
    if "Account No." = '' then
    #4..16
      else
        ClearCurrencyCode
    else
      if SetCurrencyCode("Bal. Account Type","Bal. Account No.") then
        BankAcc.TestField("Currency Code","Currency Code")
      else
        "Currency Code" := BankAcc."Currency Code";
    ClearBalancePostingGroups;

    OnAfterAccountNoOnValidateGetBankBalAccount(Rec,BankAcc,CurrFieldNo);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..19
        begin
    #20..22
              begin
        "Currency Code" := BankAcc."Currency Code";
        //++Arbu
        "Shortcut Dimension 1 Code" := BankAcc."Global Dimension 1 Code";
        "Shortcut Dimension 2 Code" := BankAcc."Global Dimension 2 Code";
        "Shortcut Dimension 3 Code" := BankAcc."Global Dimension 3 Code";
        "Shortcut Dimension 4 Code" := BankAcc."Global Dimension 4 Code";
        "Shortcut Dimension 5 Code" := BankAcc."Global Dimension 5 Code";
        "Shortcut Dimension 6 Code" := BankAcc."Global Dimension 6 Code";
        "Shortcut Dimension 7 Code" := BankAcc."Global Dimension 7 Code";
        //--Arbu
               end;
        end;
    #24..26
    */
    //end;


    //Unsupported feature: Code Modification on "GetFAAccount(PROCEDURE 117)".

    //procedure GetFAAccount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    FA.Get("Account No.");
    FA.TestField(Blocked,false);
    FA.TestField(Inactive,false);
    FA.TestField("Budgeted Asset",false);
    UpdateDescription(FA.Description);
    GetFADeprBook("Account No.");
    GetFAVATSetup;
    GetFAAddCurrExchRate;

    OnAfterAccountNoOnValidateGetFAAccount(Rec,FA);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
    //++Arbu
    "Shortcut Dimension 1 Code" := FA."Global Dimension 1 Code";
    "Shortcut Dimension 2 Code" := FA."Global Dimension 2 Code";
    "Shortcut Dimension 3 Code" := FA."Global Dimension 3 Code";
    "Shortcut Dimension 4 Code" := FA."Global Dimension 4 Code";
    "Shortcut Dimension 5 Code" := FA."Global Dimension 5 Code";
    "Shortcut Dimension 6 Code" := FA."Global Dimension 6 Code";
    "Shortcut Dimension 7 Code" := FA."Global Dimension 7 Code";
    //--Arbu

    OnAfterAccountNoOnValidateGetFAAccount(Rec,FA);
    */
    //end;


    //Unsupported feature: Code Modification on "GetFABalAccount(PROCEDURE 125)".

    //procedure GetFABalAccount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    FA.Get("Bal. Account No.");
    FA.TestField(Blocked,false);
    FA.TestField(Inactive,false);
    #4..6
    GetFADeprBook("Bal. Account No.");
    GetFAVATSetup;
    GetFAAddCurrExchRate;

    OnAfterAccountNoOnValidateGetFABalAccount(Rec,FA);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9
        //++Arbu
        "Shortcut Dimension 1 Code" := FA."Global Dimension 1 Code";
        "Shortcut Dimension 2 Code" := FA."Global Dimension 2 Code";
        "Shortcut Dimension 3 Code" := FA."Global Dimension 3 Code";
        "Shortcut Dimension 4 Code" := FA."Global Dimension 4 Code";
        "Shortcut Dimension 5 Code" := FA."Global Dimension 5 Code";
        "Shortcut Dimension 6 Code" := FA."Global Dimension 6 Code";
        "Shortcut Dimension 7 Code" := FA."Global Dimension 7 Code";
        //--Arbu

    OnAfterAccountNoOnValidateGetFABalAccount(Rec,FA);
    */
    //end;

    procedure "--ARBUMASA"()
    begin
    end;


    //Unsupported feature: Property Modification (TextConstString) on ""Statistical Code"(Field 10705).OnLookup.Text1100000(Variable 1100008)".

    //var
    //>>>> ORIGINAL VALUE:
    //"Statistical Code" : ENU=Select the Value from Table Statistical Code,Select the Value from Table Tariff No.;ESP=Selecc. valor en Código estadístico de la tabla,Selecc. valor en Cód. arancelario de la tabla;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //"Statistical Code" : ENU=Select the Value from Table Statistical Code,Select the Value from Table Tariff No.;ESP=Selecc. valor en Código estad?stico de la tabla,Selecc. valor en Cód. arancelario de la tabla;
    //Variable type has not been exported.

    var
        rst17: Record "G/L Entry";


    //Unsupported feature: Property Modification (TextConstString) on "ChangeCurrencyQst(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //ChangeCurrencyQst : @@@="%1=FromCurrencyCode, %2=ToCurrencyCode";ENU=The Currency Code in the Gen. Journal Line will be changed from %1 to %2.\\Do you want to continue?;ESP=El Cód. divisa de Lín. diario general debe cambiarse de %1 a %2.\\¿Quiere continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ChangeCurrencyQst : @@@="%1=FromCurrencyCode, %2=ToCurrencyCode";ENU=The Currency Code in the Gen. Journal Line will be changed from %1 to %2.\\Do you want to continue?;ESP=El Cód. divisa de Lín. diario general debe cambiarse de %1 a %2.\\?Quiere continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "UpdateInterruptedErr(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //UpdateInterruptedErr : ENU=The update has been interrupted to respect the warning.;ESP=Se ha interrumpido la actualización para respetar la advertencia.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UpdateInterruptedErr : ENU=The update has been interrupted to respect the warning.;ESP=Se ha interrumpido la actualización para respetar la advertencia.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=The %1 option can only be used internally in the system.;ESP=La opción %1 es de uso interno del sistema.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=The %1 option can only be used internally in the system.;ESP=La opción %1 es de uso interno del sistema.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text013(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text013 : ENU=The %1 must not be more than %2.;ESP=%1 no debe ser más que %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text013 : ENU=The %1 must not be more than %2.;ESP=%1 no debe ser más que %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text014(Variable 1054)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text014 : @@@="%1=Caption of Table Customer, %2=Customer No, %3=Caption of field Bill-to Customer No, %4=Value of Bill-to customer no.";ENU=The %1 %2 has a %3 %4.\\Do you still want to use %1 %2 in this journal line?;ESP=%1 %2 tiene %3 %4.\\¿Todavía quiere utilizar %1 %2 en esta línea del diario?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text014 : @@@="%1=Caption of Table Customer, %2=Customer No, %3=Caption of field Bill-to Customer No, %4=Value of Bill-to customer no.";ENU=The %1 %2 has a %3 %4.\\Do you still want to use %1 %2 in this journal line?;ESP=%1 %2 tiene %3 %4.\\?Todavía quiere utilizar %1 %2 en esta línea del diario?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text015(Variable 1058)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text015 : ENU=You are not allowed to apply and post an entry to an entry with an earlier posting date.\\Instead, post %1 %2 and then apply it to %3 %4.;ESP=No tiene permiso para aplicar ni registrar un movimiento con una fecha de registro anterior.\\En su lugar, registre %1 %2 y, a continuación, aplíquelo a %3 %4.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text015 : ENU=You are not allowed to apply and post an entry to an entry with an earlier posting date.\\Instead, post %1 %2 and then apply it to %3 %4.;ESP=No tiene permiso para aplicar ni registrar un movimiento con una fecha de registro anterior.\\En su lugar, registre %1 %2 y, a continuación, aplíquelo a %3 %4.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text016(Variable 1062)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text016 : ENU=%1 must be G/L Account or Bank Account.;ESP=%1 debería ser una cuenta o banco.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text016 : ENU=%1 must be G/L Account or Bank Account.;ESP=%1 debería ser una cuenta o banco.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text1100100(Variable 1100000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text1100100 : ENU=% cannot be applied, since it is included in a payment order.;ESP=% no se puede aplicar porque está incluido en una orden de pago.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text1100100 : ENU=% cannot be applied, since it is included in a payment order.;ESP=% no se puede aplicar porque está incluido en una orden de pago.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ExportAgainQst(Variable 1038)".

    //var
    //>>>> ORIGINAL VALUE:
    //ExportAgainQst : ENU=One or more of the selected lines have already been exported. Do you want to export them again?;ESP=Una o más de las líneas seleccionadas ya se han exportado. ¿Desea repetir la exportación?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ExportAgainQst : ENU=One or more of the selected lines have already been exported. Do you want to export them again?;ESP=Una o más de las líneas seleccionadas ya se han exportado. ?Desea repetir la exportación?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NotExistErr(Variable 1068)".

    //var
    //>>>> ORIGINAL VALUE:
    //NotExistErr : @@@="%1=Document number";ENU=Document number %1 does not exist or is already closed.;ESP=El número de documento %1 no existe o ya está cerrado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NotExistErr : @@@="%1=Document number";ENU=Document number %1 does not exist or is already closed.;ESP=El número de documento %1 no existe o ya está cerrado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DocNoFilterErr(Variable 1047)".

    //var
    //>>>> ORIGINAL VALUE:
    //DocNoFilterErr : ENU=The document numbers cannot be renumbered while there is an active filter on the Document No. field.;ESP=Los números de documento no se pueden renumerar mientras haya un filtro activo en el campo No. documento.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DocNoFilterErr : ENU=The document numbers cannot be renumbered while there is an active filter on the Document No. field.;ESP=Los números de documento no se pueden renumerar mientras haya un filtro activo en el campo No.documento.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DueDateMsg(Variable 1150)".

    //var
    //>>>> ORIGINAL VALUE:
    //DueDateMsg : ENU=This posting date will cause an overdue payment.;ESP=Esta fecha de registro resultará en un pago vencido.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DueDateMsg : ENU=This posting date will cause an overdue payment.;ESP=Esta fecha de registro resultará en un pago vencido.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CalcPostDateMsg(Variable 1169)".

    //var
    //>>>> ORIGINAL VALUE:
    //CalcPostDateMsg : ENU=Processing payment journal lines #1##########;ESP=Procesando líns. diario pagos #1##########;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalcPostDateMsg : ENU=Processing payment journal lines #1##########;ESP=Procesando líns. diario pagos #1##########;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "OnlyLocalCurrencyForEmployeeErr(Variable 1030)".

    //var
    //>>>> ORIGINAL VALUE:
    //OnlyLocalCurrencyForEmployeeErr : ENU=The value of the Currency Code field must be empty. General journal lines in foreign currency are not supported for employee account type.;ESP=El valor del campo Cód. divisa debe estar vacío. No se admiten líneas del diario general en la divisa extranjera para el tipo de cuenta de empleado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnlyLocalCurrencyForEmployeeErr : ENU=The value of the Currency Code field must be empty. General journal lines in foreign currency are not supported for employee account type.;ESP=El valor del campo Cód. divisa debe estar vacío. No se admiten líneas del diario general en la divisa extranjera para el tipo de cuenta de empleado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "AccTypeNotSupportedErr(Variable 1031)".

    //var
    //>>>> ORIGINAL VALUE:
    //AccTypeNotSupportedErr : ENU=You cannot specify a deferral code for this type of account.;ESP=No se puede especificar un código de fraccionamiento para este tipo de cuenta.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AccTypeNotSupportedErr : ENU=You cannot specify a deferral code for this type of account.;ESP=No se puede especificar un código de fraccionamiento para este tipo de cuenta.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SalespersonPurchPrivacyBlockErr(Variable 1933)".

    //var
    //>>>> ORIGINAL VALUE:
    //SalespersonPurchPrivacyBlockErr : @@@="%1 = salesperson / purchaser code.";ENU=Privacy Blocked must not be true for Salesperson / Purchaser %1.;ESP=La opción Privacidad bloqueada no debe ser verdadera para el Vendedor/Comprador %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalespersonPurchPrivacyBlockErr : @@@="%1 = salesperson / purchaser code.";ENU=Privacy Blocked must not be true for Salesperson / Purchaser %1.;ESP=La opción Privacidad bloqueada no debe ser verdadera para el Vendedor/Comprador %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "BlockedEmplErr(Variable 1032)".

    //var
    //>>>> ORIGINAL VALUE:
    //BlockedEmplErr : @@@="%1 = Employee no. ";ENU=You cannot export file because employee %1 is blocked due to privacy.;ESP=No puede exportar el archivo porque el empleado %1 está bloqueado por motivos de privacidad.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BlockedEmplErr : @@@="%1 = Employee no. ";ENU=You cannot export file because employee %1 is blocked due to privacy.;ESP=No puede exportar el archivo porque el empleado %1 está bloqueado por motivos de privacidad.;
    //Variable type has not been exported.

    var
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstSeguridad: Record Seguridad;
        Proyecto: Record Job;
        Recu: Record Resource;
        PunProy: Record Job;
        rstBufferRetenciones: Record "Invoice Withholding Buffer";
        MovClie: Record "Cust. Ledger Entry";
        MovProv: Record "Vendor Ledger Entry";
        rstCabV: Record "Sales Header";
        FirstTempDocNo: Label 'RENUMBERED-000000001';
}

