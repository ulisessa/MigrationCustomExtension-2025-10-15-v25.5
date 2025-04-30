table 50020 "Withholding codes"
{
    Caption = 'Withholding codes';

    fields
    {
        field(1; "Tipo impuesto retencion"; Option)
        {
            OptionMembers = IVA,"Ingresos Brutos",Ganancias,,,,,,"Seguridad Social";
        }
        field(2; "Cod. retencion"; Code[20])
        {
        }
        field(3; Descripcion; Text[199])
        {
        }
        field(4; "Importe maximo Ctd."; Decimal)
        {
        }
        field(5; "Impuesto bajo maximo"; Decimal)
        {
        }
        field(6; "Impuesto sobre maximo"; Decimal)
        {
        }
        field(7; "Cuenta retencion"; Code[20])
        {
        }
        field(8; "Stepwise calculation"; Boolean)
        {
        }
        field(9; "Codigo SICORE"; Code[20])
        {
        }
        field(50000; "Valores acumulados por"; Option)
        {
            OptionMembers = " ","Pagos mes actual","Facturas últimos 12 meses";
        }
        field(50001; "Retener ante importe > a"; Decimal)
        {
        }
        field(50002; "Verificar registro RG3594"; Boolean)
        {
        }
        field(50003; "Valid from"; Date)
        {
            Caption = 'Válido desde';
        }
        field(50004; "Valid to"; Date)
        {
            Caption = 'Válido hasta';
        }
        field(50005; "Act as withholding agent"; Boolean)
        {
            Caption = 'Actuar como agente de retención';
            DataClassification = ToBeClassified;
        }
        field(50006; "Descripción RG"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50007; "Base cálculo stepwise"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Neto factura","Total factura";
        }
        field(50008; "Tipo de regimen 7"; Code[3])
        {
            DataClassification = ToBeClassified;
        }
        field(50009; "Exclusión por actividad"; Boolean)
        {
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

