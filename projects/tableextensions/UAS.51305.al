tableextension 51305 tableextension51305 extends "General Ledger Setup"
{
    Caption = 'General Ledger Setup';
    fields
    {
        modify("Register Time")
        {
            Caption = 'Register Time';
        }
        modify("Global Dimension 1 Filter")
        {
            Caption = 'Global Dimension 1 Filter';
        }
        modify("Global Dimension 2 Filter")
        {
            Caption = 'Global Dimension 2 Filter';
        }
        modify("Mark Cr. Memos as Corrections")
        {
            Caption = 'Mark Cr. Memos as Corrections';
        }
        modify("Local Address Format")
        {
            Caption = 'Local Address Format';
            OptionCaption = 'Post Code+City,City+Post Code,City+County+Post Code,Blank Line+Post Code+City';
        }
        modify("Inv. Rounding Precision (LCY)")
        {
            Caption = 'Inv. Rounding Precision (LCY)';
        }
        modify("Inv. Rounding Type (LCY)")
        {
            OptionCaption = 'Nearest,Up,Down';
        }
        modify("Local Cont. Addr. Format")
        {
            Caption = 'Local Cont. Addr. Format';
            OptionCaption = 'First,After Company Name,Last';
        }
        modify("Bank Account Nos.")
        {
            Caption = 'Bank Account Nos.';
        }
        modify("Amount Decimal Places")
        {
            Caption = 'Amount Decimal Places';
        }
        modify("Unit-Amount Decimal Places")
        {
            Caption = 'Unit-Amount Decimal Places';
        }
        modify("Additional Reporting Currency")
        {
            TableRelation = Currency.Code;
            Caption = 'Additional Reporting Currency';
        }
        modify("LCY Code")
        {
            Caption = 'LCY Code';
        }
        modify("Appln. Rounding Precision")
        {
            Caption = 'Appln. Rounding Precision';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Shortcut Dimension 3 Code")
        {
            Caption = 'Shortcut Dimension 3 Code';
        }
        modify("Shortcut Dimension 4 Code")
        {
            Caption = 'Shortcut Dimension 4 Code';
        }
        modify("Shortcut Dimension 5 Code")
        {
            Caption = 'Shortcut Dimension 5 Code';
        }
        modify("Shortcut Dimension 6 Code")
        {
            Caption = 'Shortcut Dimension 6 Code';
        }
        modify("Shortcut Dimension 7 Code")
        {
            Caption = 'Shortcut Dimension 7 Code';
        }
        modify("Shortcut Dimension 8 Code")
        {
            Caption = 'Shortcut Dimension 8 Code';
        }
        modify("Max. VAT Difference Allowed")
        {
            Caption = 'Max. VAT Difference Allowed';
        }
        modify("VAT Rounding Type")
        {
            OptionCaption = 'Nearest,Up,Down';
        }
        modify("Max. Payment Tolerance Amount")
        {
            Caption = 'Max. Payment Tolerance Amount';
        }
        modify("Allow G/L Acc. Deletion Before")
        {
            Caption = 'Check G/L Acc. Deletion After';
        }
        modify("Last IC Transaction No.")
        {
            Caption = 'Last IC Transaction No.';
        }
        modify("Bill-to/Sell-to VAT Calc.")
        {
            Caption = 'Bill-to/Sell-to VAT Calc.';
        }
        modify("Print VAT specification in LCY")
        {
            Caption = 'Print VAT specification in LCY';
        }
        modify("Payroll Trans. Import Format")
        {
            Caption = 'Payroll Trans. Import Format';
        }
        modify("Local Currency Symbol")
        {
            Caption = 'Local Currency Symbol';
        }
        modify("Local Currency Description")
        {
            Caption = 'Local Currency Description';
        }
        modify("SEPA Non-Euro Export")
        {
            Caption = 'SEPA Non-Euro Export';
        }
        modify("SEPA Export w/o Bank Acc. Data")
        {
            Caption = 'SEPA DD Export Without IBAN And SWIFT';
        }
        modify("Payment Discount Type")
        {
            OptionCaption = 'Full Amount,Pmt. Disc. Excl. VAT,Adjust for Payment Disc.,Calc. Pmt. Disc. on Lines';
        }
        modify("Discount Calculation")
        {
            Caption = 'Discount Calculation';
            OptionCaption = ' ,Line Disc. + Inv. Disc. + Payment Disc.,Line Disc. + Inv. Disc. * Payment Disc.,Line Disc. * Inv. Disc. + Payment Disc.,Line Disc. * Inv. Disc. * Payment Disc.';
        }
        modify("Autoinvoice Nos.")
        {
            Caption = 'Autoinvoice Nos.';
        }
        modify("Autocredit Memo Nos.")
        {
            Caption = 'Autocredit Memo Nos.';
        }

        //Unsupported feature: Code Insertion (VariableCollection) on ""Allow Posting From"(Field 2).OnValidate".

        //trigger (Variable: rstLibroProd)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on ""Allow Posting From"(Field 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CheckAllowedPostingDates(0);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CheckAllowedPostingDates(0);
        Clear(rstSeguridad);
        Clear(rstSeguridadUsuario);

        if not rstSeguridadUsuario.fntSeguridadPermiso(UserId,rstSeguridad.FieldNo(rstSeguridad."Modificar rango registro")) then
          Error('Usted no está habilitado para realizar esta modificación');

        //US.ARBU - 20050415 - Inicio - Actualizar fechas de registro en diarios

        Clear(rstLibroProd);
        if rstLibroProd.FindSet then
        repeat

          rstLibroProd."Fecha registro desde" := 0D;
          //rstLibroProd."Fecha registro hasta" := 0D;
          rstLibroProd.Modify;

        until rstLibroProd.Next = 0;

        Clear(rstLibroGen);
        if rstLibroGen.FindSet then
        repeat

          rstLibroGen."Fecha registro desde" := 0D;
          //rstLibroGen."Fecha registro hasta" := 0D;
          rstLibroGen.Modify;

        until rstLibroGen.Next = 0;

        Clear(rstLibroProy);
        if rstLibroProy.FindSet then
        repeat

          rstLibroProy."Fecha registro desde" := 0D;
          //rstLibroProy."Fecha registro hasta" := 0D;
          rstLibroProy.Modify;

        until rstLibroProy.Next = 0;

        Clear(rstLibroRec);
        if rstLibroRec.FindSet then
        repeat

          rstLibroRec."Fecha registro desde" := 0D;
          //rstLibroRec."Fecha registro hasta" := 0D;
          rstLibroRec.Modify;

        until rstLibroRec.Next = 0;

        Clear(rstSecProd);
        if rstSecProd.FindSet then
        repeat

          rstSecProd."Fecha registro desde" := 0D;
          //rstSecProd."Fecha registro hasta" := 0D;
          rstSecProd.Modify;

        until rstSecProd.Next = 0;

        Clear(rstSecGen);
        if rstSecGen.FindSet then
        repeat

          rstSecGen."Fecha registro desde" := 0D;
          //rstSecGen."Fecha registro hasta" := 0D;
          rstSecGen.Modify;

        until rstSecGen.Next = 0;

        Clear(rstSecProy);
        if rstSecProy.FindSet then
        repeat

          rstSecProy."Fecha registro desde" := 0D;
          //rstSecProy."Fecha registro hasta" := 0D;
          rstSecProy.Modify;

        until rstSecProy.Next = 0;

        Clear(rstSecRec);
        if rstSecRec.FindSet then
        repeat

          rstSecRec."Fecha registro desde" := 0D;
          //rstSecRec."Fecha registro hasta" := 0D;
          rstSecRec.Modify;

        until rstSecRec.Next = 0;

        Clear(rstConfUsu);
        if rstConfUsu.FindSet then
        repeat

          rstConfUsu."Allow Posting From" := "Allow Posting From";
          //rstConfUsu."Allow Posting To" := "Allow Posting To";
          rstConfUsu.Modify;

        until rstConfUsu.Next = 0;

        //US.ARBU - 20050415 - Fin - Actualizar fechas de registro en diarios
        */
        //end;


        //Unsupported feature: Code Insertion (VariableCollection) on ""Allow Posting To"(Field 3).OnValidate".

        //trigger (Variable: rstLibroProd)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on ""Allow Posting To"(Field 3).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CheckAllowedPostingDates(0);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CheckAllowedPostingDates(0);
        Clear(rstSeguridad);
        Clear(rstSeguridadUsuario);

        if not rstSeguridadUsuario.fntSeguridadPermiso(UserId,rstSeguridad.FieldNo(rstSeguridad."Modificar rango registro")) then
          Error('Usted no está habilitado para realizar esta modificación');

        //US.ARBU - 20050415 - Inicio - Actualizar fechas de registro en diarios

        Clear(rstLibroProd);
        if rstLibroProd.FindSet then
        repeat

          //rstLibroProd."Fecha registro desde" := 0D;
          rstLibroProd."Fecha registro hasta" := 0D;
          rstLibroProd.Modify;

        until rstLibroProd.Next = 0;

        Clear(rstLibroGen);
        if rstLibroGen.FindSet then
        repeat

          //rstLibroGen."Fecha registro desde" := 0D;
          rstLibroGen."Fecha registro hasta" := 0D;
          rstLibroGen.Modify;

        until rstLibroGen.Next = 0;

        Clear(rstLibroProy);
        if rstLibroProy.FindSet then
        repeat

         // rstLibroProy."Fecha registro desde" := 0D;
          rstLibroProy."Fecha registro hasta" := 0D;
          rstLibroProy.Modify;

        until rstLibroProy.Next = 0;

        Clear(rstLibroRec);
        if rstLibroRec.FindSet then
        repeat

          //rstLibroRec."Fecha registro desde" := 0D;
          rstLibroRec."Fecha registro hasta" := 0D;
          rstLibroRec.Modify;

        until rstLibroRec.Next = 0;

        Clear(rstSecProd);
        if rstSecProd.FindSet then
        repeat

          //rstSecProd."Fecha registro desde" := 0D;
          rstSecProd."Fecha registro hasta" := 0D;
          rstSecProd.Modify;

        until rstSecProd.Next = 0;

        Clear(rstSecGen);
        if rstSecGen.FindSet then
        repeat

          //rstSecGen."Fecha registro desde" := 0D;
          rstSecGen."Fecha registro hasta" := 0D;
          rstSecGen.Modify;

        until rstSecGen.Next = 0;

        Clear(rstSecProy);
        if rstSecProy.FindSet then
        repeat

         // rstSecProy."Fecha registro desde" := 0D;
          rstSecProy."Fecha registro hasta" := 0D;
          rstSecProy.Modify;

        until rstSecProy.Next = 0;

        Clear(rstSecRec);
        if rstSecRec.FindSet then
        repeat

          //rstSecRec."Fecha registro desde" := 0D;
          rstSecRec."Fecha registro hasta" := 0D;
          rstSecRec.Modify;

        until rstSecRec.Next = 0;

        Clear(rstConfUsu);
        if rstConfUsu.FindSet then
        repeat

         // rstConfUsu."Allow Posting From" := "Allow Posting From";
          rstConfUsu."Allow Posting To" := "Allow Posting To";
          rstConfUsu.Modify;

        until rstConfUsu.Next = 0;

        //US.ARBU - 20050415 - Fin - Actualizar fechas de registro en diarios
        */
        //end;
        field(50000; "Global Dimension 3 filter"; Code[10])
        {
            Caption = 'Global Dimension 3 filter';
            ToolTip = 'Specifies the value of the Global Dimension 3 filter field.';
            CaptionClass = '1,3,3';
            FieldClass = FlowFilter;

        }
        field(50001; "Global Dimension 4 filter"; Code[10])
        {
            Caption = 'Global Dimension 4 filter';
            ToolTip = 'Specifies the value of the Global Dimension 4 filter field.';
            CaptionClass = '1,3,4';
            FieldClass = FlowFilter;

        }
        field(50002; "Global Dimension 5 filter"; Code[10])
        {
            Caption = 'Global Dimension 5 filter';
            ToolTip = 'Specifies the value of the Global Dimension 5 filter field.';
            CaptionClass = '1,3,5';
            FieldClass = FlowFilter;

        }
        field(50003; "Global dimension 6 filter"; Code[10])
        {
            Caption = 'Global dimension 6 filter';
            ToolTip = 'Specifies the value of the Global dimension 6 filter field.';
            CaptionClass = '1,3,6';
            FieldClass = FlowFilter;

        }
        field(50004; "Global Dimension 7 filter"; Code[10])
        {
            Caption = 'Global Dimension 7 filter';
            ToolTip = 'Specifies the value of the Global Dimension 7 filter field.';
            CaptionClass = '1,3,7';
            FieldClass = FlowFilter;

        }
        field(50008; CuentaRedondeo; Code[20])
        {
            Caption = 'CuentaRedondeo';
            ToolTip = 'Specifies the value of the CuentaRedondeo field.';
            NotBlank = true;
            Numeric = true;
            TableRelation = "G/L Account"."No.";
        }
        field(50009; "Cta. clientes pte. facturar"; Code[20])
        {
            Caption = 'Cta. clientes pte. facturar';
            ToolTip = 'Specifies the value of the Cta. clientes pte. facturar field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50010; "Cta. clientes fact. anticipada"; Code[20])
        {
            Caption = 'Cta. clientes fact. anticipada';
            ToolTip = 'Specifies the value of the Cta. clientes fact. anticipada field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50011; "Cta. obra ej. pte. facturar"; Code[20])
        {
            Caption = 'Cta. obra ej. pte. facturar';
            ToolTip = 'Specifies the value of the Cta. obra ej. pte. facturar field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50012; "Deducc. certificación anterior"; Code[20])
        {
            Caption = 'Deducc. certificación anterior';
            ToolTip = 'Specifies the value of the Deducc. certificación anterior field.';
        }
        field(50013; "Item presupuestario provisión"; Code[10])
        {
            Caption = 'Item presupuestario provisión';
            ToolTip = 'Specifies the value of the Item presupuestario provisión field.';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('ITEM PRESUPUESTARIO'));
        }
        field(50500; "Global Dimension 6 Dif Cambio"; Code[10])
        {
            Caption = 'Global Dimension 6 Dif Cambio';
            ToolTip = 'Specifies the value of the Global Dimension 6 Dif Cambio field.';
            CaptionClass = '1,2,6';

        }
        field(50501; "mensajería bloqueada"; Boolean)
        {
            Caption = 'mensajería bloqueada';
            ToolTip = 'Specifies the value of the mensajería bloqueada field.';
        }
        field(50502; Usuario; Text[30])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
        }
        field(50503; "No. Lín. diario general"; Integer)
        {
            Caption = 'No. Lín. diario general';
            ToolTip = 'Specifies the value of the No. Lín. diario general field.';
            TableRelation = Object.ID WHERE(Type = FILTER(Table));
        }
        field(50504; "Nombre Lín. diario general"; Text[100])
        {
            Caption = 'Nombre Lín. diario general';
            ToolTip = 'Specifies the value of the Nombre Lín. diario general field.';
            CalcFormula = Lookup(Object.Name WHERE(Type = FILTER(Table),
                                                    ID = FIELD("No. Lín. diario general")));
            FieldClass = FlowField;
        }
        field(50505; "Libro de Ajuste por Tenencia"; Code[10])
        {
            Caption = 'Libro de Ajuste por Tenencia';
            ToolTip = 'Specifies the value of the Libro de Ajuste por Tenencia field.';
        }
        field(50506; "Libro de Ajustes DifCbio"; Code[10])
        {
            Caption = 'Libro de Ajustes DifCbio';
            ToolTip = 'Specifies the value of the Libro de Ajustes DifCbio field.';
        }
        field(50507; "Coeficiente IVA Computable"; Decimal)
        {
            Caption = 'Coeficiente IVA Computable';
            ToolTip = 'Specifies the value of the Coeficiente IVA Computable field.';
            DecimalPlaces = 0 : 15;
            MaxValue = 1;
            MinValue = 0;
        }
        field(50508; "Importe mínimo agrupación"; Decimal)
        {
            Caption = 'Importe mínimo agrupación';
            ToolTip = 'Specifies the value of the Importe mínimo agrupación field.';
        }
        field(50509; "No. serie retención SS"; Code[10])
        {
            Caption = 'No. serie retención SS';
            ToolTip = 'Specifies the value of the No. serie retención SS field.';
            TableRelation = "No. Series";
        }
        field(50510; "Persona habilitada certificado"; Text[50])
        {
            Caption = 'Persona habilitada certificado';
            ToolTip = 'Specifies the value of the Persona habilitada certificado field.';
        }
        field(50511; "Carácter persona habilitada"; Text[50])
        {
            Caption = 'Carácter persona habilitada';
            ToolTip = 'Specifies the value of the Carácter persona habilitada field.';
        }
        field(50512; "Cuenta stock LAN"; Code[20])
        {
            Caption = 'Cuenta stock LAN';
            ToolTip = 'Specifies the value of the Cuenta stock LAN field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50513; "Cuenta stock CAL"; Code[20])
        {
            Caption = 'Cuenta stock CAL';
            ToolTip = 'Specifies the value of the Cuenta stock CAL field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50514; "Cuenta stock MER y OTROS"; Code[20])
        {
            Caption = 'Cuenta stock MER y OTROS';
            ToolTip = 'Specifies the value of the Cuenta stock MER y OTROS field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50515; "No. serie retención IVA"; Code[10])
        {
            Caption = 'No. serie retención IVA';
            ToolTip = 'Specifies the value of the No. serie retención IVA field.';
            TableRelation = "No. Series";
        }
        field(50516; "No. serie retención Ganancias"; Code[10])
        {
            Caption = 'No. serie retención Ganancias';
            ToolTip = 'Specifies the value of the No. serie retención Ganancias field.';
            TableRelation = "No. Series";
        }
        field(50517; "Global Dimension 3 Code"; Code[20])
        {
            Caption = 'Global Dimension 3 Code';
            ToolTip = 'Specifies the value of the Global Dimension 3 Code field.';
            Editable = true;
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                "Shortcut Dimension 3 Code" := "Global Dimension 3 Code";
            end;
        }
        field(50518; "Global Dimension 4 Code"; Code[20])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            Editable = true;
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                "Shortcut Dimension 4 Code" := "Global Dimension 4 Code";
            end;
        }
        field(50519; "Global Dimension 5 Code"; Code[20])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
            Editable = true;
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                "Shortcut Dimension 5 Code" := "Global Dimension 5 Code";
            end;
        }
        field(50520; "Global Dimension 6 Code"; Code[20])
        {
            Caption = 'Global Dimension 6 Code';
            ToolTip = 'Specifies the value of the Global Dimension 6 Code field.';
            Editable = true;
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                "Shortcut Dimension 6 Code" := "Global Dimension 6 Code";
            end;
        }
        field(50521; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            Editable = true;
            TableRelation = Dimension;

            trigger OnValidate()
            begin
                "Shortcut Dimension 7 Code" := "Global Dimension 7 Code";
            end;
        }
        field(50522; "Fiscal Type"; Code[20])
        {
            Caption = 'Fiscal Type';
            ToolTip = 'Specifies the value of the Fiscal Type field.';
            TableRelation = Dimension;
        }
        field(50523; "VAT withholding account"; Code[10])
        {
            Caption = 'VAT withholding account';
            ToolTip = 'Specifies the value of the VAT withholding account field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50524; "Winnings withholding account"; Code[10])
        {
            Caption = 'Winnings withholding account';
            ToolTip = 'Specifies the value of the Winnings withholding account field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50525; "SS withholding account"; Code[10])
        {
            Caption = 'SS withholding account';
            ToolTip = 'Specifies the value of the SS withholding account field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50526; "Puntos venta"; Code[20])
        {
            Caption = 'Puntos venta';
            ToolTip = 'Specifies the value of the Puntos venta field.';
            TableRelation = Dimension;
        }
        field(50527; "Lugar pago"; Code[20])
        {
            Caption = 'Lugar pago';
            ToolTip = 'Specifies the value of the Lugar pago field.';
            TableRelation = Dimension;
        }
        field(50528; "Detectar inconsistencias"; Boolean)
        {
            Caption = 'Detectar inconsistencias';
            ToolTip = 'Specifies the value of the Detectar inconsistencias field.';
        }
        field(50529; "GI withholding account"; Code[10])
        {
            Caption = 'GI withholding account';
            ToolTip = 'Specifies the value of the GI withholding account field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50530; "No. serie retención IIBB"; Code[10])
        {
            Caption = 'No. serie retención IIBB';
            ToolTip = 'Specifies the value of the No. serie retención IIBB field.';
            TableRelation = "No. Series";
        }
        field(50531; "GI perception account"; Code[10])
        {
            Caption = 'GI perception account';
            ToolTip = 'Specifies the value of the GI perception account field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50532; "GI retention code"; Code[10])
        {
            Caption = 'GI retention code';
            ToolTip = 'Specifies the value of the GI retention code field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = CONST("Ingresos Brutos"));
        }
        field(50533; "GI no retention code"; Code[10])
        {
            Caption = 'Cod. no retencion IIBB';
            ToolTip = 'Specifies the value of the Cod. no retencion IIBB field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = CONST("Ingresos Brutos"));
        }
        field(50534; "Apochryphal listing URL"; Text[250])
        {
            Caption = 'URL de apócrifas';
            ToolTip = 'Specifies the value of the URL de apócrifas field.';
            DataClassification = ToBeClassified;
        }
        field(50535; "Last apochryphal update"; Date)
        {
            Caption = 'Ultima actualización de apócrifos';
            ToolTip = 'Specifies the value of the Ultima actualización de apócrifos field.';
            DataClassification = ToBeClassified;
        }
        field(50536; "AFIP Doc Type Dimension"; Code[20])
        {
            Caption = 'Dimensión Tipo documento AFIP';
            ToolTip = 'Specifies the value of the Dimensión Tipo documento AFIP field.';
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }
        field(50537; "Apochryphal file ext."; Text[3])
        {
            Caption = 'Extensión archivo apoc.';
            ToolTip = 'Specifies the value of the Extensión archivo apoc field.';
            DataClassification = ToBeClassified;
        }
        field(50538; Signatary; Text[100])
        {
            Caption = 'Firmante';
            ToolTip = 'Specifies the value of the Firmante field.';
            DataClassification = ToBeClassified;
        }
        field(50539; "RG17 URL"; Text[250])
        {
            Caption = 'URL de RG17';
            ToolTip = 'Specifies the value of the URL de RG17 field.';
            DataClassification = ToBeClassified;
        }
        field(50540; "RG17 ext"; Text[3])
        {
            Caption = 'Extensión archivo RG17';
            ToolTip = 'Specifies the value of the Extensión archivo RG17 field.';
            DataClassification = ToBeClassified;
        }
        field(50541; "RG18 URL"; Text[250])
        {
            Caption = 'URL de RG18';
            ToolTip = 'Specifies the value of the URL de RG18 field.';
            DataClassification = ToBeClassified;
        }
        field(50542; "RG18 ext"; Text[3])
        {
            Caption = 'Extensión archivo RG18';
            ToolTip = 'Specifies the value of the Extensión archivo RG18 field.';
            DataClassification = ToBeClassified;
        }
        field(50543; "RG830 URL"; Text[250])
        {
            Caption = 'URL exclusiones de RG830';
            ToolTip = 'Specifies the value of the URL exclusiones de RG830 field.';
            DataClassification = ToBeClassified;
        }
        field(50544; "RG830 ext"; Text[3])
        {
            Caption = 'Extensión archivo RG830';
            ToolTip = 'Specifies the value of the Extensión archivo RG830 field.';
            DataClassification = ToBeClassified;
        }
        field(50545; "GI perception resource"; Code[20])
        {
            Caption = 'GI perception account';
            ToolTip = 'Specifies the value of the GI perception account field.';
            TableRelation = Resource."No.";
        }
        field(50546; "VAT perception account"; Code[10])
        {
            Caption = 'GI perception account';
            ToolTip = 'Specifies the value of the GI perception account field.';
            TableRelation = "G/L Account"."No.";
        }
        field(50547; "Age recovery VAT formula"; Text[30])
        {
            Caption = 'Fórmula Antigüedad recupero IVA';
            ToolTip = 'Specifies the value of the Fórmula Antigüedad recupero IVA field.';
            DataClassification = ToBeClassified;
        }
        field(50548; "General VAT rate for recovery"; Integer)
        {
            Caption = 'Alícuota general IVA para recupero';
            ToolTip = 'Specifies the value of the Alícuota general IVA para recupero field.';
            DataClassification = ToBeClassified;
        }
        field(50549; "AFIP QR URL"; Text[250])
        {
            Caption = 'URL QR AFIP';
            ToolTip = 'Specifies the value of the URL QR AFIP field.';
            DataClassification = ToBeClassified;
        }
        field(50550; "VAT recover quotient summarize"; Boolean)
        {
            Caption = 'Sumarizar coef. recupero IVA';
            ToolTip = 'Specifies the value of the Sumarizar coef. recupero IVA field.';
            DataClassification = ToBeClassified;
        }
        field(50551; "VAT recovery end date margin"; Text[30])
        {
            Caption = 'Margen fecha final recupero IVA';
            ToolTip = 'Specifies the value of the Margen fecha final recupero IVA field.';
            DataClassification = ToBeClassified;
        }
        field(50552; "Validate tax details setup"; Boolean)
        {
            Caption = 'Validar configuración detalle impuestos';
            ToolTip = 'Specifies the value of the Validar configuración detalle impuestos field.';
            DataClassification = ToBeClassified;
        }
        field(50553; "Omit in months with no exports"; Boolean)
        {
            Caption = 'Omitir en meses sin exportaciones';
            ToolTip = 'Specifies the value of the Omitir en meses sin exportaciones field.';
            DataClassification = ToBeClassified;
        }
        field(50554; "Recover VAT from"; Decimal)
        {
            Caption = 'Recuperar IVA desde';
            ToolTip = 'Specifies the value of the Recuperar IVA desde field.';
            DataClassification = ToBeClassified;
        }
        field(50555; "Recovery VAT platform"; Option)
        {
            Caption = 'Plataforma recupero IVA';
            ToolTip = 'Specifies the value of the Plataforma recupero IVA field.';
            DataClassification = ToBeClassified;
            OptionMembers = SIAP,SIR;
        }
        field(50556; "Inflation Adjustment Dimension"; Code[10])
        {
            Caption = 'Dimensión Ajuste Inflación';
            ToolTip = 'Specifies the value of the Dimensión Ajuste Inflación field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(1));
        }
        field(50557; "Filter partials from recovery"; Option)
        {
            Caption = 'Filtrar parciales en recupero';
            ToolTip = 'Specifies the value of the Filtrar parciales en recupero field.';
            DataClassification = ToBeClassified;
            OptionCaption = 'Ninguno,Productos,Recursos,Todos,Toda la factura';
            OptionMembers = "None",Items,Resources,All,"All Invoice";
        }
        field(50558; "Filter recovery by item cat."; Code[10])
        {
            Caption = 'Filtrar recupero por Categoría de producto';
            ToolTip = 'Specifies the value of the Filtrar recupero por Categoría de producto field.';
            DataClassification = ToBeClassified;
            TableRelation = "Item Category".Code;
        }
        field(50559; "Filter advance account group"; Code[10])
        {
            Caption = 'Filtrar grupo contable anticipo';
            ToolTip = 'Specifies the value of the Filtrar grupo contable anticipo field.';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Product Posting Group".Code;
        }
        field(50600; "Inflation Adjustment T.Journal"; Code[10])
        {
            Caption = 'Libro diario Ajuste x Inflación';
            ToolTip = 'Specifies the value of the Libro diario Ajuste x Inflación field.';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template".Name;
        }
        field(50601; "Inflation Adjustment B.Journal"; Code[10])
        {
            Caption = 'Sección diario Ajuste x Inflación';
            ToolTip = 'Specifies the value of the Sección diario Ajuste x Inflación field.';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Inflation Adjustment T.Journal"));
        }
        field(50602; "Inflation Adj. Account filter"; Text[250])
        {
            Caption = 'Filtro de cuentas para Ajuste x Inflación';
            ToolTip = 'Specifies the value of the Filtro de cuentas para Ajuste x Inflación field.';
            DataClassification = ToBeClassified;
        }
        field(50603; "Inflation Adj. Posting Acc."; Code[10])
        {
            Caption = 'Cuenta registro ajuste por inflación';
            ToolTip = 'Specifies the value of the Cuenta registro ajuste por inflación field.';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(50700; "LíneasFactura"; Integer)
        {
            Caption = 'LíneasFactura';
            ToolTip = 'Specifies the value of the LíneasFactura field.';
        }
        field(50716; "AFIP Certificate"; Text[250])
        {
            Caption = 'Certificado AFIP';
            ToolTip = 'Specifies the value of the Certificado AFIP field.';
            DataClassification = ToBeClassified;

        }
        field(50717; "AFIP Private Key"; Text[250])
        {
            Caption = 'Clave privada AFIP';
            ToolTip = 'Specifies the value of the Clave privada AFIP field.';
            DataClassification = ToBeClassified;

        }
        field(50718; "AFIP Result Path"; Text[250])
        {
            Caption = 'Ruta resultados AFIP';
            ToolTip = 'Specifies the value of the Ruta resultados AFIP field.';
            DataClassification = ToBeClassified;

        }
        field(50719; Signature; Text[250])
        {
            Caption = 'Signature';
            ToolTip = 'Specifies the value of the Signature field.';
            DataClassification = ToBeClassified;
        }
        field(50750; "Tipo Regimen"; Text[30])
        {
            Caption = 'Tipo Regimen';
            ToolTip = 'Specifies the value of the Tipo Regimen field.';
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }
        field(50751; "Tipo Dato Adicional"; Text[30])
        {
            Caption = 'Tipo Dato Adicional';
            ToolTip = 'Specifies the value of the Tipo Dato Adicional field.';
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }
        field(50752; "Block codes"; Text[30])
        {
            Caption = 'Códigos bloqueo';
            ToolTip = 'Specifies the value of the Códigos bloqueo field.';
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }
        field(50799; "WS - Dimension code"; Code[20])
        {
            Caption = 'WS - Dimension code';
            ToolTip = 'Specifies the value of the WS - Dimension code field.';
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }
        field(50800; "WS - Reproweb Dimension"; Code[20])
        {
            Caption = 'WS - Dimensión Reproweb';
            ToolTip = 'Specifies the value of the WS - Dimensión Reproweb field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = FIELD("WS - Dimension code"));
        }
        field(50801; "WS - CUIT Check Dimension"; Code[20])
        {
            Caption = 'WS - Dimensión Verificación CUIT';
            ToolTip = 'Specifies the value of the WS - Dimensión Verificación CUIT field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = FIELD("WS - Dimension code"));
        }
        field(50802; "WS - Taxes"; Code[20])
        {
            Caption = 'WS - Impuestos';
            ToolTip = 'Specifies the value of the WS - Impuestos field.';
            DataClassification = ToBeClassified;
            TableRelation = Dimension;
        }
        field(50803; "WS - Verif. Comprobante"; Code[20])
        {
            Caption = 'WS - Verif. Comprobante';
            ToolTip = 'Specifies the value of the WS - Verif. Comprobante field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = FIELD("WS - Dimension code"));
        }
        field(50804; "WS - Collection request"; Code[20])
        {
            Caption = 'WS - Cons. Recaudacion';
            ToolTip = 'Specifies the value of the WS - Cons. Recaudacion field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = FIELD("WS - Dimension code"));
        }
        field(55000; "Saldo bancos"; Decimal)
        {
            Caption = 'Saldo bancos';
            ToolTip = 'Specifies the value of the Saldo bancos field.';
            AutoFormatType = 1;
            Editable = false;
        }
        field(70000; "No. proyecto ajustes"; Code[20])
        {
            Caption = 'No. proyecto ajustes';
            ToolTip = 'Specifies the value of the No. proyecto ajustes field.';
            TableRelation = Job;
        }
        field(70001; "Cód. departamento ajustes"; Code[10])
        {
            Caption = 'Cód. departamento ajustes';
            ToolTip = 'Specifies the value of the Cód. departamento ajustes field.';
            TableRelation = Dimension;
        }
        field(70002; "Cód. programa ajustes"; Code[10])
        {
            Caption = 'Cód. programa ajustes';
            ToolTip = 'Specifies the value of the Cód. programa ajustes field.';
            TableRelation = Dimension;
        }
    }


    //Unsupported feature: Code Insertion on "OnModify".

    //trigger OnModify()
    //begin
    /*
    //++Arbu 2023
    if "Filter recovery by item cat." <> '' then
    begin
      if not ("Filter partials from recovery" in["Filter partials from recovery"::All,"Filter partials from recovery"::Items,"Filter partials from recovery"::"All Invoice"]) then
        Error('Sólo se puede filtrar por Categoría si se seleccion? filtrar parciales para el recupero.');
    end;
    //--Arbu 2023
    */
    //end;


    //Unsupported feature: Code Modification on "CheckAllowedPostingDates(PROCEDURE 10)".

    //procedure CheckAllowedPostingDates();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    UserSetupManagement.CheckAllowedPostingDatesRange("Allow Posting From",
      "Allow Posting To",NotificationType,DATABASE::"General Ledger Setup");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //UserSetupManagement.CheckAllowedPostingDatesRange("Allow Posting From",
      //"Allow Posting To",NotificationType,DATABASE::"General Ledger Setup");
    */
    //end;


    var
        rstLibroProd: Record "Item Journal Template";
        rstLibroGen: Record "Gen. Journal Template";
        rstLibroProy: Record "Job Journal Template";
        rstLibroRec: Record "Res. Journal Template";
        rstSecProd: Record "Item Journal Batch";
        rstSecGen: Record "Gen. Journal Batch";
        rstSecProy: Record "Job Journal Batch";
        rstSecRec: Record "Res. Journal Batch";
        rstConfUsu: Record "User Setup";


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=%1 must be rounded to the nearest %2.;ESP=Se debe redondear %1 al más cercano %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=%1 must be rounded to the nearest %2.;ESP=Se debe redondear %1 al más cercano %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text016(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text016 : ENU="Enter one number or two numbers separated by a colon. ";ESP="Introduzca uno o dos números separados por dos puntos. ";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text016 : ENU="Enter one number or two numbers separated by a colon. ";ESP="Introduzca uno o dos números separados por dos puntos. ";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text017(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text017 : ENU=The online Help for this field describes how you can fill in the field.;ESP=La ayuda en línea describe cómo utilizar este campo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text017 : ENU=The online Help for this field describes how you can fill in the field.;ESP=La ayuda en línea describe c?mo utilizar este campo.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text025(Variable 1016)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text025 : ENU=The field %1 should not be set to %2 if field %3 in %4 table is set to %5 because deadlocks can occur.;ESP=El campo %1 no debe estar establecido en %2 si el campo %3 de la tabla %4 está definido en %5 porque pueden producirse bloqueos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text025 : ENU=The field %1 should not be set to %2 if field %3 in %4 table is set to %5 because deadlocks can occur.;ESP=El campo %1 no debe estar establecido en %2 si el campo %3 de la tabla %4 está definido en %5 porque pueden producirse bloqueos.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ObsoleteErr(Variable 1617)".

    //var
    //>>>> ORIGINAL VALUE:
    //ObsoleteErr : ENU=This field is obsolete, it has been replaced by Table 248 VAT Reg. No. Srv Config.;ESP=Este campo está obsoleto, se ha sustituido por la configuración del servicio del CIF/NIF de la tabla 248.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ObsoleteErr : ENU=This field is obsolete, it has been replaced by Table 248 VAT Reg. No. Srv Config.;ESP=Este campo está obsoleto, se ha sustituido por la configuración del servicio del CIF/NIF de la tabla 248.;
    //Variable type has not been exported.

    var
        rstSeguridad: Record Seguridad;
        rstSeguridadUsuario: Record "Seguridad por usuario";
}

