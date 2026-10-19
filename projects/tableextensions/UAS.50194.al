tableextension 50194 "G/L Account Ext." extends "G/L Account"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Account Category")
        {
            Caption = 'Account Category';
        }
        modify("No. 2")
        {
            Caption = 'No. 2';
        }
        modify("New Page")
        {
            Caption = 'New Page';
        }
        modify("No. of Blank Lines")
        {
            Caption = 'No. of Blank Lines';
        }
        modify("Last Modified Date Time")
        {
            Caption = 'Last Modified Date Time';
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

        //Unsupported feature: Property Modification (CalcFormula) on ""Net Change"(Field 32)".

        modify(Totaling)
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("Consol. Translation Method")
        {
            Caption = 'Consol. Translation Method';
            OptionCaption = 'Average Rate (Manual),Closing Rate,Historical Rate,Composite Rate,Equity Rate';
        }
        modify("Automatic Ext. Texts")
        {
            Caption = 'Automatic Ext. Texts';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
        }
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
        }

        //Unsupported feature: Property Modification (CalcFormula) on ""Additional-Currency Net Change"(Field 60)".

        modify("Default IC Partner G/L Acc. No")
        {
            Caption = 'Default IC Partner G/L Acc. No';
        }
        modify("Omit Default Descr. in Jnl.")
        {
            Caption = 'Omit Default Descr. in Jnl.';
        }
        modify("Account Subcategory Entry No.")
        {
            Caption = 'Account Subcategory Entry No.';
        }
        modify("Account Subcategory Descript.")
        {
            Caption = 'Account Subcategory Descript.';
        }
        modify("Cost Type No.")
        {
            Caption = 'Cost Type No.';
        }
        modify("Default Deferral Template Code")
        {
            Caption = 'Default Deferral Template Code';
        }
        modify("Income Stmt. Bal. Acc.")
        {
            Caption = 'Income Stmt. Bal. Acc.';
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
        field(50003; "Global Dimension 6 Code"; Code[20])
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
        field(50005; "Global dimension 3 filter"; Code[10])
        {
            Caption = 'Global dimension 3 filter';
            ToolTip = 'Specifies the value of the Global dimension 3 filter field.';
            CaptionClass = '1,3,3';
            FieldClass = FlowFilter;

        }
        field(50006; "Global Dimension 4 filter"; Code[10])
        {
            Caption = 'Global Dimension 4 filter';
            ToolTip = 'Specifies the value of the Global Dimension 4 filter field.';
            CaptionClass = '1,3,4';
            FieldClass = FlowFilter;

        }
        field(50007; "Global Dimension 5 filter"; Code[10])
        {
            Caption = 'Global Dimension 5 filter';
            ToolTip = 'Specifies the value of the Global Dimension 5 filter field.';
            CaptionClass = '1,3,5';
            FieldClass = FlowFilter;

        }
        field(50008; "Global dimension 6 filter"; Code[20])
        {
            Caption = 'Global dimension 6 filter';
            ToolTip = 'Specifies the value of the Global dimension 6 filter field.';
            CaptionClass = '1,3,6';
            FieldClass = FlowFilter;

        }
        field(50009; "Global Dimension 7 filter"; Code[20])
        {
            Caption = 'Global Dimension 7 filter';
            ToolTip = 'Specifies the value of the Global Dimension 7 filter field.';
            CaptionClass = '1,3,7';
            FieldClass = FlowFilter;

        }
        field(50010; "Registro por Dim. global 3"; Option)
        {
            Caption = 'Registro por Dim. global 3';
            ToolTip = 'Specifies the value of the Registro por Dim. global 3 field.';
            OptionMembers = " ",Obligatorio,"Igual código","Sin código";
        }
        field(50011; "Registro por Dim. global 4"; Option)
        {
            Caption = 'Registro por Dim. global 4';
            ToolTip = 'Specifies the value of the Registro por Dim. global 4 field.';
            OptionMembers = " ",Obligatorio,"Igual código","Sin código";
        }
        field(50012; "Registro por Dim. global 5"; Option)
        {
            Caption = 'Registro por Dim. global 5';
            ToolTip = 'Specifies the value of the Registro por Dim. global 5 field.';
            OptionMembers = " ",Obligatorio,"Igual código","Sin código";
        }
        field(50013; "Registro por Dim. global 6"; Option)
        {
            Caption = 'Registro por Dim. global 6';
            ToolTip = 'Specifies the value of the Registro por Dim. global 6 field.';
            OptionMembers = " ",Obligatorio,"Igual código","Sin código";
        }
        field(50014; "Registro por Dim. global 7"; Option)
        {
            Caption = 'Registro por Dim. global 7';
            ToolTip = 'Specifies the value of the Registro por Dim. global 7 field.';
            OptionMembers = " ",Obligatorio,"Igual código","Sin código";
        }
        field(50015; "Registro por proyectos"; Option)
        {
            Caption = 'Registro por proyectos';
            ToolTip = 'Specifies the value of the Registro por proyectos field.';
            OptionMembers = " ",Obligatorio,"Igual código","Sin código";
        }
        field(50016; "No. proyecto"; Code[30])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            TableRelation = Job;
        }
        field(50017; "Registro por Dim. global 1"; Option)
        {
            Caption = 'Registro por Dim. global 1';
            ToolTip = 'Specifies the value of the Registro por Dim. global 1 field.';
            OptionMembers = " ",Obligatorio,"Igual código","Sin código";
        }
        field(50018; "Registro por Dim. global 2"; Option)
        {
            Caption = 'Registro por Dim. global 2';
            ToolTip = 'Specifies the value of the Registro por Dim. global 2 field.';
            OptionMembers = " ",Obligatorio,"Igual código","Sin código";
        }
        field(50019; "Origin filter"; Code[10])
        {
            Caption = 'Filtro origen';
            ToolTip = 'Specifies the value of the Filtro origen field.';
            FieldClass = FlowFilter;
            TableRelation = "Source Code";
        }
        field(50020; "Inflation Adjustment Enabled"; Boolean)
        {
            Caption = 'Habillitar para ajuste por inflación';
            ToolTip = 'Specifies the value of the Habillitar para ajuste por inflación field.';
            DataClassification = ToBeClassified;
        }
        field(50021; "Inflation Adjustment Orig. Acc"; Code[10])
        {
            Caption = 'Cuenta Origen Ajuste Inflación';
            ToolTip = 'Specifies the value of the Cuenta Origen Ajuste Inflación field.';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(50022; "Inflation Adjustment Dest. Acc"; Code[10])
        {
            Caption = 'Cuenta Destino Ajuste Inflación';
            ToolTip = 'Specifies the value of the Cuenta Destino Ajuste Inflación field.';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(50300; "Filtro proyecto"; Code[20])
        {
            Caption = 'Filtro proyecto';
            ToolTip = 'Specifies the value of the Filtro proyecto field.';
            FieldClass = FlowFilter;
            TableRelation = Job;
        }
        field(50301; "Existe Coste real"; Boolean)
        {
            Caption = 'Existe Coste real';
            ToolTip = 'Specifies the value of the Existe Coste real field.';
            Editable = false;
        }
        field(50500; "Grupo Nota 1"; Text[50])
        {
            Caption = 'Grupo Nota 1';
            ToolTip = 'Specifies the value of the Grupo Nota 1 field.';
            TableRelation = "Grupos Nota Balance"."Descripción" WHERE(Nivel = FILTER(A));
        }
        field(50501; "Grupo Nota 2"; Text[50])
        {
            Caption = 'Grupo Nota 2';
            ToolTip = 'Specifies the value of the Grupo Nota 2 field.';
            TableRelation = "Grupos Nota Balance"."Descripción" WHERE(Nivel = FILTER(B));
            ValidateTableRelation = false;
        }
        field(50502; "Grupo Nota 3"; Text[100])
        {
            Caption = 'Grupo Nota 3';
            ToolTip = 'Specifies the value of the Grupo Nota 3 field.';
            TableRelation = "Grupos Nota Balance"."Descripción" WHERE(Nivel = FILTER(C));
            ValidateTableRelation = false;
        }
        field(50503; "Grupo Informe Costos"; Text[50])
        {
            Caption = 'Grupo Informe Costos';
            ToolTip = 'Specifies the value of the Grupo Informe Costos field.';
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('GRUPO COSTOS'));
        }
        field(50504; "Denominación común costos"; Text[50])
        {
            Caption = 'Denominación común costos';
            ToolTip = 'Specifies the value of the Denominación común costos field.';
        }
        field(50700; "Cód. retención IVA"; Code[20])
        {
            Caption = 'Cód. retención IVA';
            ToolTip = 'Specifies the value of the Cód. retención IVA field.';
            Description = 'Código para la retención de IVA en los pagos';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = CONST(IVA));
        }
        field(50701; "Cód. retención SS"; Code[20])
        {
            Caption = 'Cód. retención SS';
            ToolTip = 'Specifies the value of the Cód. retención SS field.';
            Description = 'Código para la retención de Ingresos Brutos en los pagos';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER("Ingresos Brutos"));
        }
        field(50702; "Cód. retencion ganancias"; Code[20])
        {
            Caption = 'Cód. retencion ganancias';
            ToolTip = 'Specifies the value of the Cód. retencion ganancias field.';
            Description = 'Código para la retención de ganancias en los pagos';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FILTER(Ganancias));
        }
        field(50703; "Fecha Alta"; Date)
        {
            Caption = 'Hiring date';
            ToolTip = 'Specifies the value of the Hiring date field.';
            Description = 'Fecha alta de la cuenta';
        }
        field(50704; "Fecha Baja"; Date)
        {
            Caption = 'Fecha Baja';
            ToolTip = 'Specifies the value of the Fecha Baja field.';
            Description = 'Fecha Baja de la cuenta';
        }
        field(50705; Province; Code[10])
        {
            Caption = 'Province';
            ToolTip = 'Specifies the value of the Province field.';
            Description = 'Provincia donde se genera el servicio para el calculo de INGRESOS BRUTOS';
        }
        field(50706; "Distribution method"; Option)
        {
            Caption = 'Método de distribución';
            ToolTip = 'Specifies the value of the Método de distribución field.';
            OptionCaption = ' ,Days,Kilos,Role';
            OptionMembers = " ",Days,Kilos,Role;
        }
        field(50707; "Old account no."; Code[20])
        {
            Caption = 'Old account no.';
            ToolTip = 'Specifies the value of the Old account no field.';
            DataClassification = ToBeClassified;
        }
        field(50708; "Old account name"; Text[50])
        {
            Caption = 'Old account name';
            ToolTip = 'Specifies the value of the Old account name field.';
            DataClassification = ToBeClassified;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.UpdateDefaultDim(DATABASE::"G/L Account","No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");

    SetLastModifiedDateTime;

    if CostAccSetup.Get then
      CostAccMgt.UpdateCostTypeFromGLAcc(Rec,xRec,0);

    if Indentation < 0 then
      Indentation := 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    fntActualizarSeptima;

    DimMgt.UpdateDefaultDim(DATABASE::"G/L Account","No.",
      "Global Dimension 1 Code","Global Dimension 2 Code",
      //++Arbu
      "Global Dimension 3 Code","Global Dimension 4 Code",
      "Global Dimension 5 Code","Global Dimension 6 Code",
      "Global Dimension 7 Code");
      //--Arbu

    #3..7
    //++Arbu
    "Fecha Alta" := Today;
    //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesLine.RenameNo(SalesLine.Type::"G/L Account",xRec."No.","No.");
    PurchaseLine.RenameNo(PurchaseLine.Type::"G/L Account",xRec."No.","No.");
    DimMgt.RenameDefaultDim(DATABASE::"G/L Account",xRec."No.","No.");

    SetLastModifiedDateTime;

    if CostAccSetup.ReadPermission then
      CostAccMgt.UpdateCostTypeFromGLAcc(Rec,xRec,3);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SalesLine.RenameNo(SalesLine.Type::"G/L Account",xRec."No.","No.");
    PurchaseLine.RenameNo(PurchaseLine.Type::"G/L Account",xRec."No.","No.");
    //DimMgt.RenameDefaultDim(DATABASE::"G/L Account",xRec."No.","No.");
    #4..8
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
                l_rst352."Table ID" := 15;
                l_rst352."No." := l_rstDV.Code;
                l_rst352."Dimension Code" := l_rstDV."Dimension Code";
                l_rst352."Dimension Value Code" := l_rstDV.Code;
                l_rst352."Value Posting" := l_rst352."Value Posting"::"Code Mandatory";
                if not l_rst352.Insert(true) then;

            end;

        end;

        //--Arbu 2020
    end;


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=You cannot change %1 because this account is part of one or more budgets.;ESP=No se puede cambiar la cuenta %1 porque está incluida en presupuestos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=You cannot change %1 because this account is part of one or more budgets.;ESP=No se puede cambiar la cuenta %1 porque está incluida en presupuestos.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoAccountCategoryMatchErr(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoAccountCategoryMatchErr : @@@="%1=account category value, %2=the user input.";ENU=There is no subcategory description for %1 that matches '%2'.;ESP=No hay ninguna descripción de subcategoría para %1 que coincide con '%2'.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoAccountCategoryMatchErr : @@@="%1=account category value, %2=the user input.";ENU=There is no subcategory description for %1 that matches '%2'.;ESP=No hay ninguna descripción de subCategoría para %1 que coincide con '%2'.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "GenProdPostingGroupErr(Variable 1009)".

    //var
    //>>>> ORIGINAL VALUE:
    //GenProdPostingGroupErr : @@@="%1 - caption Gen. Prod. Posting Group; %2 - G/L Account Description; %3 - G/L Account No.";ENU=%1 is not set for the %2 G/L account with no. %3.;ESP=No se ha establecido %1 para la cuenta de contabilidad %2 con n.º %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GenProdPostingGroupErr : @@@="%1 - caption Gen. Prod. Posting Group; %2 - G/L Account Description; %3 - G/L Account No.";ENU=%1 is not set for the %2 G/L account with no. %3.;ESP=No se ha establecido %1 para la cuenta de contabilidad %2 con no. %3.;
    //Variable type has not been exported.
}

