tableextension 50228 "Resource Ext." extends Resource
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
        modify("Social Security No.")
        {
            Caption = 'Social Security No.';
        }
        modify(Education)
        {
            Caption = 'Education';
        }
        modify("Employment Date")
        {
            Caption = 'Employment Date';
        }
        modify("Resource Group No.")
        {
            Caption = 'Resource Group No.';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Profit %")
        {
            Caption = 'Profit %';
        }
        modify("Price/Profit Calculation")
        {
            Caption = 'Price/Profit Calculation';
            OptionCaption = 'Profit=Price-Cost,Price=Cost+Profit,No Relationship';
        }
        modify("Vendor No.")
        {
            Caption = 'Vendor No.';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Post Code")
        {
            Caption = 'Post Code';
        }
        modify("Automatic Ext. Texts")
        {
            Caption = 'Automatic Ext. Texts';
        }
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
        }
        modify("Country/Region Code")
        {
            Caption = 'Country/Region Code';
        }
        modify("IC Partner Purch. G/L Acc. No.")
        {
            Caption = 'IC Partner Purch. G/L Acc. No.';
        }
        modify("Default Deferral Template Code")
        {
            Caption = 'Default Deferral Template Code';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            Caption = 'Global Dimension 3 Code';
            ToolTip = 'Specifies the value of the Global Dimension 3 Code field.';
            CaptionClass = '1,2,3';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Global Dimension 3 Code");
            end;
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            CaptionClass = '1,2,4';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Global Dimension 4 Code");
            end;
        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
            CaptionClass = '1,2,5';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Global Dimension 5 Code");
            end;
        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            Caption = 'Global Dimension 6 Code';
            ToolTip = 'Specifies the value of the Global Dimension 6 Code field.';
            CaptionClass = '1,2,6';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Global Dimension 6 Code");
            end;
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Global Dimension 7 Code");
            end;
        }
        field(50005; "Cód. grupo seguridad"; Code[10])
        {
            Caption = 'Cód. grupo seguridad';
            ToolTip = 'Specifies the value of the Cód. grupo seguridad field.';
            TableRelation = Seguridad;
        }
        field(50006; "Específico"; Code[18])
        {
            Caption = 'Específico';
            ToolTip = 'Specifies the value of the Específico field.';
        }
        field(50007; "Subfamilia recurso"; Code[5])
        {
            Caption = 'Subfamilia recurso';
            ToolTip = 'Specifies the value of the Subfamilia recurso field.';
            TableRelation = "Subfamilia recurso"."Cód. subfamilia recurso" WHERE("Familia recurso" = FIELD("Resource Group No."));
        }
        field(50008; "Cód. provincia domicilio"; Code[10])
        {
            Caption = 'Cód. provincia domicilio';
            ToolTip = 'Specifies the value of the Cód. provincia domicilio field.';
        }
        field(50009; "Nombre provincia domicilio"; Text[50])
        {
            Caption = 'Nombre provincia domicilio';
            ToolTip = 'Specifies the value of the Nombre provincia domicilio field.';
        }
        field(50013; "Texto Exportaciones"; Text[250])
        {
            Caption = 'Texto Exportaciones';
            ToolTip = 'Specifies the value of the Texto Exportaciones field.';
        }
        field(50014; "Recurso de facturación directa"; Boolean)
        {
            Caption = 'Recurso de facturación directa';
            ToolTip = 'Specifies the value of the Recurso de facturación directa field.';

        }
        field(50015; xGrupo; Code[10])
        {
            Caption = 'xGrupo';
            ToolTip = 'Specifies the value of the xGrupo field.';

        }
        field(50018; "xCod. Unidad"; Text[10])
        {
            Caption = 'xCod. Unidad';
            ToolTip = 'Specifies the value of the xCod. Unidad field.';
        }
        field(50019; "Tipo retención"; Code[10])
        {
            Caption = 'Tipo retención';
            ToolTip = 'Specifies the value of the Tipo retención field.';
        }
        field(50020; "Cód. retención IVA"; Code[20])
        {
            Caption = 'Cód. retención IVA';
            ToolTip = 'Specifies the value of the Cód. retención IVA field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = CONST(IVA));
        }
        field(50021; "Cód. retención SS"; Code[20])
        {
            Caption = 'Cód. retención SS';
            ToolTip = 'Specifies the value of the Cód. retención SS field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
        }
        field(50022; "Cód. retención ganancias"; Code[20])
        {
            Caption = 'Cód. retención ganancias';
            ToolTip = 'Specifies the value of the Cód. retención ganancias field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(Ganancias));
        }
        field(50023; "Cod. IIBB"; Code[20])
        {
            Caption = 'Cod. IIBB';
            ToolTip = 'Specifies the value of the Cod. IIBB field.';
            DataClassification = ToBeClassified;
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
        }
        field(50024; "Gross winnings perception code"; Code[10])
        {
            Caption = 'Cód. percepción IIBB';
            ToolTip = 'Specifies the value of the Cód. percepción IIBB field.';
            DataClassification = ToBeClassified;
        }
        field(50040; "xRango Unidad"; Text[10])
        {
            Caption = 'xRango Unidad';
            ToolTip = 'Specifies the value of the xRango Unidad field.';
            FieldClass = FlowFilter;
        }
        field(50100; "CIF/NIF"; Text[20])
        {
            Caption = 'VAT Registration No.';
            ToolTip = 'Specifies the value of the VAT Registration No field.';

            trigger OnValidate()
            begin
                //>>DATA3
                //GestiónCIFNIF.ComprobarCIFNIF("CIF/NIF");
                //<<DATA3
            end;
        }
        field(50101; xProvincia; Text[30])
        {
            Caption = 'xProvincia';
            ToolTip = 'Specifies the value of the xProvincia field.';
        }
        field(50102; "xIVA Repercutido"; Code[10])
        {
            Caption = 'xIVA Repercutido';
            ToolTip = 'Specifies the value of the xIVA Repercutido field.';
        }
        field(50190; "xCod. Subprograma"; Code[10])
        {
            Caption = 'xCod. Subprograma';
            ToolTip = 'Specifies the value of the xCod. Subprograma field.';
            TableRelation = "Employee Entry";
        }
        field(50200; "pat_Número de Empresa"; Integer)
        {
            Caption = 'pat_Número de Empresa';
            ToolTip = 'Specifies the value of the pat_Número de Empresa field.';
        }
        field(50201; pat_Apellido; Text[30])
        {
            Caption = 'pat_Apellido';
            ToolTip = 'Specifies the value of the pat_Apellido field.';
        }
        field(50202; pat_Nombre; Text[30])
        {
            Caption = 'pat_Nombre';
            ToolTip = 'Specifies the value of the pat_Nombre field.';
        }
        field(50203; "pat_Tipo de documento"; Integer)
        {
            Caption = 'pat_Tipo de documento';
            ToolTip = 'Specifies the value of the pat_Tipo de documento field.';
        }
        field(50204; "pat_No. documento"; Text[30])
        {
            Caption = 'pat_No. documento';
            ToolTip = 'Specifies the value of the pat_No. documento field.';
        }
        field(50205; "pat_Provincia documento"; Integer)
        {
            Caption = 'pat_Provincia documento';
            ToolTip = 'Specifies the value of the pat_Provincia documento field.';
        }
        field(50206; pat_Nacionalidad; Text[10])
        {
            Caption = 'pat_Nacionalidad';
            ToolTip = 'Specifies the value of the pat_Nacionalidad field.';
        }
        field(50207; "pat_Fecha nacimiento"; Date)
        {
            Caption = 'pat_Fecha nacimiento';
            ToolTip = 'Specifies the value of the pat_Fecha nacimiento field.';
            AutoFormatExpression = 'DD/MM/YYYY';
        }
        field(50208; pat_Sexo; Text[4])
        {
            Caption = 'pat_Sexo';
            ToolTip = 'Specifies the value of the pat_Sexo field.';
        }
        field(50209; "pat_Estado civil"; Text[1])
        {
            Caption = 'pat_Estado civil';
            ToolTip = 'Specifies the value of the pat_Estado civil field.';
        }
        field(50210; "pat_Calle domicilio particular"; Text[50])
        {
            Caption = 'pat_Calle domicilio particular';
            ToolTip = 'Specifies the value of the pat_Calle domicilio particular field.';
        }
        field(50211; "pat_Número puerta dom. part."; Text[30])
        {
            Caption = 'pat_Número puerta dom. part.';
            ToolTip = 'Specifies the value of the pat_Número puerta dom. part field.';
        }
        field(50212; "pat_Piso dom. part."; Text[10])
        {
            Caption = 'pat_Piso dom. part.';
            ToolTip = 'Specifies the value of the pat_Piso dom. part field.';
        }
        field(50213; "pat_Unidad dom. part."; Text[2])
        {
            Caption = 'pat_Unidad dom. part.';
            ToolTip = 'Specifies the value of the pat_Unidad dom. part field.';
        }
        field(50214; "pat_Localidad dom. part."; Text[50])
        {
            Caption = 'pat_Localidad dom. part.';
            ToolTip = 'Specifies the value of the pat_Localidad dom. part field.';
        }
        field(50215; "pat_Cód. postal dom. part."; Text[30])
        {
            Caption = 'pat_Cód. postal dom. part.';
            ToolTip = 'Specifies the value of the pat_Cód. postal dom. part field.';
        }
        field(50216; "pat_Cód. provincia dom. part."; Text[30])
        {
            Caption = 'pat_Cód. provincia dom. part.';
            ToolTip = 'Specifies the value of the pat_Cód. provincia dom. part field.';
        }
        field(50217; "pat_Tipo cuenta solicitada"; Integer)
        {
            Caption = 'pat_Tipo cuenta solicitada';
            ToolTip = 'Specifies the value of the pat_Tipo cuenta solicitada field.';
        }
        field(50218; "pat_Cód. ident. AFIP"; Text[17])
        {
            Caption = 'pat_Cód. ident. AFIP';
            ToolTip = 'Specifies the value of the pat_Cód. ident. AFIP field.';
        }
        field(50219; "pat_No. ident. AFIP"; Text[30])
        {
            Caption = 'pat_No. ident. AFIP';
            ToolTip = 'Specifies the value of the pat_No. ident. AFIP field.';
        }
        field(50220; "pat_Ingresos netos"; Decimal)
        {
            Caption = 'pat_Ingresos netos';
            ToolTip = 'Specifies the value of the pat_Ingresos netos field.';
        }
        field(50221; "pat_ Categoría/Cargo/Rango"; Text[50])
        {
            Caption = 'pat_ Categoría/Cargo/Rango';
            ToolTip = 'Specifies the value of the pat_ Categoría/Cargo/Rango field.';
        }
        field(50222; "pat_Fecha ingreso laboral"; Date)
        {
            Caption = 'pat_Fecha ingreso laboral';
            ToolTip = 'Specifies the value of the pat_Fecha ingreso laboral field.';
        }
        field(50223; "pat_Dependencia de pago"; Text[15])
        {
            Caption = 'pat_Dependencia de pago';
            ToolTip = 'Specifies the value of the pat_Dependencia de pago field.';
        }
        field(50224; "pat_Cód. postal dep. pago"; Text[30])
        {
            Caption = 'pat_Cód. postal dep. pago';
            ToolTip = 'Specifies the value of the pat_Cód. postal dep. pago field.';
        }
        field(50225; "pat_Teléfono - prefijo país/p"; Text[4])
        {
            Caption = 'pat_Teléfono - prefijo país/p';
            ToolTip = 'Specifies the value of the pat_Teléfono - prefijo país/p field.';
        }
        field(50226; "pat_Teléfono - característica"; Text[4])
        {
            Caption = 'pat_Teléfono - característica';
            ToolTip = 'Specifies the value of the pat_Teléfono - característica field.';
        }
        field(50227; "pat_Teléfono - Número"; Text[5])
        {
            Caption = 'pat_Teléfono - Número';
            ToolTip = 'Specifies the value of the pat_Teléfono - Número field.';
        }
        field(50228; pat_CBU; Text[250])
        {
            Caption = 'pat_CBU';
            ToolTip = 'Specifies the value of the pat_CBU field.';
        }
        field(50500; "Posición Planta"; Code[20])
        {
            Caption = 'Posición Planta';
            ToolTip = 'Specifies the value of the Posición Planta field.';
        }
        field(50501; "Categoría"; Code[10])
        {
            Caption = 'Categoría';
            ToolTip = 'Specifies the value of the Categoría field.';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('CATEGORIAS'));
        }
        field(50502; Puesto; Code[10])
        {
            Caption = 'Puesto';
            ToolTip = 'Specifies the value of the Puesto field.';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('PUESTOS'));
        }
        field(50503; "Workday code"; Code[10])
        {
            Caption = 'Workday code';
            ToolTip = 'Specifies the value of the Workday code field.';
            TableRelation = Workday;
        }
        field(50504; "Flexible o restricto"; Option)
        {
            Caption = 'Flexible o restricto';
            ToolTip = 'Specifies the value of the Flexible o restricto field.';
            OptionMembers = Restricto,Flexible;
        }
        field(50506; "Salario básico"; Decimal)
        {
            Caption = 'Salario básico';
            ToolTip = 'Specifies the value of the Salario básico field.';
        }
        field(50507; "Payroll posting group"; Code[10])
        {
            Caption = 'Payroll posting group';
            ToolTip = 'Specifies the value of the Payroll posting group field.';

        }
        field(50508; Estado; Text[50])
        {
            Caption = 'Estado';
            ToolTip = 'Specifies the value of the Estado field.';
        }
        field(50509; "Viejo No."; Code[30])
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';

            trigger OnValidate()
            var
                ResSetup: Record "Resources Setup";
                NoSeriesMgt: Codeunit "No. Series";
            begin
                if "No." <> xRec."No." then begin
                    ResSetup.Get;
                    NoSeriesMgt.TestManual(ResSetup."Resource Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(50510; "Cta. compras"; Code[30])
        {
            CalcFormula = Lookup("General Posting Setup"."Purch. Account" WHERE("Gen. Prod. Posting Group" = FIELD("Gen. Prod. Posting Group")));
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
            FieldClass = FlowField;

            trigger OnValidate()
            var
                ResSetup: Record "Resources Setup";
                NoSeriesMgt: Codeunit "No. Series";
            begin
                if "No." <> xRec."No." then begin
                    ResSetup.Get;
                    NoSeriesMgt.TestManual(ResSetup."Resource Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(50511; "Nombre Cta. compras"; Code[100])
        {
            CalcFormula = Lookup("G/L Account".Name WHERE("No." = FIELD("Cta. compras")));
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
            FieldClass = FlowField;

            trigger OnValidate()
            var
                ResSetup: Record "Resources Setup";
                NoSeriesMgt: Codeunit "No. Series";
            begin
                if "No." <> xRec."No." then begin
                    ResSetup.Get;
                    NoSeriesMgt.TestManual(ResSetup."Resource Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(50512; "Actividad AFIP"; Code[10])
        {
            Caption = 'Actividad AFIP';
            ToolTip = 'Specifies the value of the Actividad AFIP field.';
            DataClassification = ToBeClassified;
            TableRelation = "Actividad AFIP"."No. actividad";
        }
        field(60000; "Fecha baja"; Date)
        {
            Caption = 'Fecha baja';
            ToolTip = 'Specifies the value of the Fecha baja field.';
        }
        field(60001; Centro; Text[4])
        {
            Caption = 'Centro';
            ToolTip = 'Specifies the value of the Centro field.';
        }
        field(60002; "No. proyecto"; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            TableRelation = Job;
        }
        field(60003; Centro1; Code[1])
        {
            Caption = 'Centro1';
            ToolTip = 'Specifies the value of the Centro1 field.';
        }
        field(60400; "Filtro proyecto"; Code[20])
        {
            Caption = 'Filtro proyecto';
            ToolTip = 'Specifies the value of the Filtro proyecto field.';
            FieldClass = FlowFilter;
            TableRelation = Job;
        }
        field(60401; "Filtro conceptos"; Code[10])
        {
            Caption = 'Filtro conceptos';
            ToolTip = 'Specifies the value of the Filtro conceptos field.';
            FieldClass = FlowFilter;
        }
        field(60402; cambio; Integer)
        {
            Caption = 'cambio';
            ToolTip = 'Specifies the value of the cambio field.';
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "No." = '' then begin
      ResSetup.Get;
      ResSetup.TestField("Resource Nos.");
    #4..7
      if GetRangeMin("Resource Group No.") = GetRangeMax("Resource Group No.") then
        Validate("Resource Group No.",GetRangeMin("Resource Group No."));

    DimMgt.UpdateDefaultDim(
      DATABASE::Resource,"No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10
    fntActualizarSeptima;

    DimMgt.UpdateDefaultDim(
      DATABASE::Resource,"No.",
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
    SalesLine.RenameNo(SalesLine.Type::Resource,xRec."No.","No.");
    DimMgt.RenameDefaultDim(DATABASE::Resource,xRec."No.","No.");

    "Last Date Modified" := Today;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SalesLine.RenameNo(SalesLine.Type::Resource,xRec."No.","No.");
    //DimMgt.RenameDefaultDim(DATABASE::Resource,xRec."No.","No.");

    "Last Date Modified" := Today;
    fntActualizarSeptima
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
                l_rst352."Table ID" := 156;
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


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=Do you want to change %1?;ESP=¿Confirma que desea cambiar %1?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=Do you want to change %1?;ESP=?Confirma que desea cambiar %1?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1022)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.;ESP=Para poder usar Online Map, primero debe rellenar la ventana Configuración Online Map.\Consulte Configuración de Online Map en la Ayuda.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.;ESP=Para poder usar Online Map, primero debe rellenar la ventana Configuración Online Map.\Consulte Configuración de Online Map en la Ayuda.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1024)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=%1 cannot be changed since unprocessed time sheet lines exist for this resource.;ESP=%1 no se puede cambiar puesto que existen líneas del parte de horas no procesadas para este recurso.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=%1 cannot be changed since unprocessed time sheet lines exist for this resource.;ESP=%1 no se puede cambiar puesto que existen líneas del parte de horas no procesadas para este recurso.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1025)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : @@@=You cannot delete Resource LIFT since unprocessed time sheet lines exist for this resource.;ENU=You cannot delete %1 %2 because unprocessed time sheet lines exist for this resource.;ESP=No se puede eliminar %1 %2 porque existen líneas de parte de horas no procesadas para este recurso.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : @@@=You cannot delete Resource LIFT since unprocessed time sheet lines exist for this resource.;ENU=You cannot delete %1 %2 because unprocessed time sheet lines exist for this resource.;ESP=No se puede eliminar %1 %2 porque existen líneas de parte de horas no procesadas para este recurso.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "BaseUnitOfMeasureQtyMustBeOneErr(Variable 1026)".

    //var
    //>>>> ORIGINAL VALUE:
    //BaseUnitOfMeasureQtyMustBeOneErr : @@@="%1 Name of Unit of measure (e.g. BOX, PCS, KG...), %2 Qty. of %1 per base unit of measure ";ENU=The quantity per base unit of measure must be 1. %1 is set up with %2 per unit of measure.;ESP=La cantidad por unidad de medida base debe ser 1. %1 está configurada con %2 por unidad de medida.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BaseUnitOfMeasureQtyMustBeOneErr : @@@="%1 Name of Unit of measure (e.g. BOX, PCS, KG...), %2 Qty. of %1 per base unit of measure ";ENU=The quantity per base unit of measure must be 1. %1 is set up with %2 per unit of measure.;ESP=La cantidad por unidad de medida base debe ser 1. %1 está configurada con %2 por unidad de medida.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CannotDeleteResourceErr(Variable 1027)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotDeleteResourceErr : @@@="%1 = Resource No.";ENU=You cannot delete resource %1 because it is used in one or more job planning lines.;ESP=No puede eliminar el recurso %1 porque se usa en una o más líneas de planificación de proyecto.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotDeleteResourceErr : @@@="%1 = Resource No.";ENU=You cannot delete resource %1 because it is used in one or more job planning lines.;ESP=No puede eliminar el recurso %1 porque se usa en una o más líneas de planificación de proyecto.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "SalesDocumentExistsErr(Variable 1028)".

    //var
    //>>>> ORIGINAL VALUE:
    //SalesDocumentExistsErr : @@@="%1 = Resource No.";ENU=You cannot delete resource %1 because there are one or more outstanding %2 that include this resource.;ESP=No puede borrar el recurso %1 porque hay uno o más %2 pendientes que incluyen este recurso.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //SalesDocumentExistsErr : @@@="%1 = Resource No.";ENU=You cannot delete resource %1 because there are one or more outstanding %2 that include this resource.;ESP=No puede borrar el recurso %1 porque hay uno o más %2 pendientes que incluyen este recurso.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "PrivacyBlockedPostErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //PrivacyBlockedPostErr : @@@="%1=resource no.";ENU=You cannot post this line because resource %1 is blocked due to privacy.;ESP=No puede registrar esta línea porque el recurso %1 está bloqueado por motivos de privacidad.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PrivacyBlockedPostErr : @@@="%1=resource no.";ENU=You cannot post this line because resource %1 is blocked due to privacy.;ESP=No puede registrar esta línea porque el recurso %1 está bloqueado por motivos de privacidad.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "PrivacyBlockedErr(Variable 1021)".

    //var
    //>>>> ORIGINAL VALUE:
    //PrivacyBlockedErr : @@@="%1=resource no.";ENU=You cannot create this line because resource %1 is blocked due to privacy.;ESP=No puede crear esta línea porque el recurso %1 está bloqueado por motivos de privacidad.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //PrivacyBlockedErr : @@@="%1=resource no.";ENU=You cannot create this line because resource %1 is blocked due to privacy.;ESP=No puede crear esta línea porque el recurso %1 está bloqueado por motivos de privacidad.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ConfirmBlockedPrivacyBlockedQst(Variable 1030)".

    //var
    //>>>> ORIGINAL VALUE:
    //ConfirmBlockedPrivacyBlockedQst : ENU=If you change the Blocked field, the Privacy Blocked field is changed to No. Do you want to continue?;ESP=Si cambia el campo Bloqueado, se cambiará el campo Privacidad bloqueada a No. ¿Desea continuar?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ConfirmBlockedPrivacyBlockedQst : ENU=If you change the Blocked field, the Privacy Blocked field is changed to No. Do you want to continue?;ESP=Si cambia el campo Bloqueado, se cambiar? el campo Privacidad bloqueada a No. ?Desea continuar?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CanNotChangeBlockedDueToPrivacyBlockedErr(Variable 1029)".

    //var
    //>>>> ORIGINAL VALUE:
    //CanNotChangeBlockedDueToPrivacyBlockedErr : ENU=The Blocked field cannot be changed because the user is blocked for privacy reasons.;ESP=No se puede cambiar el campo Bloqueado porque el usuario está bloqueado por motivos de privacidad.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CanNotChangeBlockedDueToPrivacyBlockedErr : ENU=The Blocked field cannot be changed because the user is blocked for privacy reasons.;ESP=No se puede cambiar el campo Bloqueado porque el usuario está bloqueado por motivos de privacidad.;
    //Variable type has not been exported.

    var
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstSeguridad: Record Seguridad;
        rstMensajeria: Record Mensajeria;
        rstConfUsu: Record "User Setup";
}

enumextension 50228 codTipoRecurso extends "Resource Type"
{
    value(10; Expense) { }
    value(11; Sale) { }

}