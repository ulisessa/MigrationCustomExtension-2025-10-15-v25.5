table 50020 "Withholding codes"
{
    Caption = 'Withholding codes';

    fields
    {
        field(1; "Tipo impuesto retencion"; Option)
        {
            Caption = 'Tipo impuesto retencion';
            ToolTip = 'Specifies the value of the Tipo impuesto retencion field.';
            OptionMembers = IVA,"Ingresos Brutos",Ganancias,,,,,,"Seguridad Social";
        }
        field(2; "Cod. retencion"; Code[20])
        {
            Caption = 'Cod. retencion';
            ToolTip = 'Specifies the value of the Cod. retencion field.';
        }
        field(3; Descripcion; Text[199])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(4; "Importe maximo Ctd."; Decimal)
        {
            Caption = 'Importe maximo Ctd.';
            ToolTip = 'Specifies the value of the Importe maximo Ctd field.';
        }
        field(5; "Impuesto bajo maximo"; Decimal)
        {
            Caption = 'Impuesto bajo maximo';
            ToolTip = 'Specifies the value of the Impuesto bajo maximo field.';
        }
        field(6; "Impuesto sobre maximo"; Decimal)
        {
            Caption = 'Impuesto sobre maximo';
            ToolTip = 'Specifies the value of the Impuesto sobre maximo field.';
        }
        field(7; "Cuenta retencion"; Code[20])
        {
            Caption = 'Cuenta retencion';
            ToolTip = 'Specifies the value of the Cuenta retencion field.';
        }
        field(8; "Stepwise calculation"; Boolean)
        {
            Caption = 'Stepwise calculation';
            ToolTip = 'Specifies the value of the Stepwise calculation field.';
        }
        field(9; "Codigo SICORE"; Code[20])
        {
            Caption = 'Codigo SICORE';
            ToolTip = 'Specifies the value of the Codigo SICORE field.';
        }
        field(50000; "Valores acumulados por"; Option)
        {
            Caption = 'Valores acumulados por';
            ToolTip = 'Specifies the value of the Valores acumulados por field.';
            OptionMembers = " ","Pagos mes actual","Facturas últimos 12 meses";
        }
        field(50001; "Retener ante importe > a"; Decimal)
        {
            Caption = 'Retener ante importe > a';
            ToolTip = 'Specifies the value of the Retener ante importe > a field.';
        }
        field(50002; "Verificar registro RG3594"; Boolean)
        {
            Caption = 'Verificar registro RG3594';
            ToolTip = 'Specifies the value of the Verificar registro RG3594 field.';
        }
        field(50003; "Valid from"; Date)
        {
            Caption = 'Valid From';
            ToolTip = 'Specifies the value of the Valid From field.';
        }
        field(50004; "Valid to"; Date)
        {
            Caption = 'Valid To';
            ToolTip = 'Specifies the value of the Valid To field.';
        }
        field(50005; "Act as withholding agent"; Boolean)
        {
            Caption = 'Actuar como agente de retención';
            ToolTip = 'Specifies the value of the Actuar como agente de retención field.';
            DataClassification = ToBeClassified;
        }
        field(50006; "Descripción RG"; Text[30])
        {
            Caption = 'Descripción RG';
            ToolTip = 'Specifies the value of the Descripción RG field.';
            DataClassification = ToBeClassified;
        }
        field(50007; "Base cálculo stepwise"; Option)
        {
            Caption = 'Base cálculo stepwise';
            ToolTip = 'Specifies the value of the Base cálculo stepwise field.';
            DataClassification = ToBeClassified;
            OptionMembers = "Neto factura","Total factura";
        }
        field(50008; "Tipo de regimen 7"; Code[3])
        {
            Caption = 'Tipo de regimen 7';
            ToolTip = 'Specifies the value of the Tipo de regimen 7 field.';
            DataClassification = ToBeClassified;
        }
        field(50009; "Exclusión por actividad"; Boolean)
        {
            Caption = 'Exclusión por actividad';
            ToolTip = 'Specifies the value of the Exclusión por actividad field.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                l_rst50021: Record "Withholding setup";
            begin
                if "Exclusión por actividad" then begin
                    TestField("Importe maximo Ctd.", 0);
                    TestField("Impuesto bajo maximo", 0);
                    TestField("Impuesto sobre maximo", 0);
                    TestField("Retener ante importe > a", 0);
                    TestField("Stepwise calculation", false);
                    Clear(l_rst50021);
                    l_rst50021.SetRange(l_rst50021."Tipo retenciones", "Tipo impuesto retencion");
                    l_rst50021.SetRange("Cod. retencion", "Cod. retencion");
                    if l_rst50021.FindSet then
                        Error('Un código de retención excluido por actividad no puede tener configuración.');
                end;
            end;
        }
        field(50010; "Cód. alterno superior"; Code[20])
        {
            Caption = 'Cód. alterno superior';
            ToolTip = 'Specifies the value of the Cód. alterno superior field.';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Tipo impuesto retencion", "Cod. retencion")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

