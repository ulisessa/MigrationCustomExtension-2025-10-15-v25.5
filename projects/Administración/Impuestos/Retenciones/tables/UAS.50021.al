table 50021 "Withholding setup"
{
    Caption = 'Withholding setup';

    fields
    {
        field(1; "Tipo retenciones"; Option)
        {
            Caption = 'Tipo retenciones';
            ToolTip = 'Specifies the value of the Tipo retenciones field.';
            OptionMembers = IVA,"Ingresos Brutos",Ganancias,,,,,,"Seguridad Social";
        }
        field(2; "Tipo fiscal"; Code[10])
        {
            Caption = 'Fiscal Type';
            ToolTip = 'Specifies the value of the Fiscal Type field.';
            TableRelation = "VAT Business Posting Group".Code;
        }
        field(3; "Cod. retencion"; Code[20])
        {
            Caption = 'Cod. retencion';
            ToolTip = 'Specifies the value of the Cod. retencion field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FIELD("Tipo retenciones"));
        }
        field(4; "Importe pago minimo"; Decimal)
        {
            Caption = 'Importe pago minimo';
            ToolTip = 'Specifies the value of the Importe pago minimo field.';
        }
        field(5; "% retencion"; Decimal)
        {
            Caption = '% retencion';
            ToolTip = 'Specifies the value of the % retencion field.';
        }
        field(6; "Importe retencion"; Decimal)
        {
            Caption = 'Importe retencion';
            ToolTip = 'Specifies the value of the Importe retencion field.';
        }
        field(7; "Importe min. retencion"; Decimal)
        {
            Caption = 'Importe min. retencion';
            ToolTip = 'Specifies the value of the Importe min. retencion field.';
        }
        field(8; "RT Base pago anterior"; Decimal)
        {
            Caption = 'RT Base pago anterior';
            ToolTip = 'Specifies the value of the RT Base pago anterior field.';
        }
        field(9; "RT Base este pago"; Decimal)
        {
            Caption = 'RT Base este pago';
            ToolTip = 'Specifies the value of the RT Base este pago field.';
        }
        field(10; "RT este pago"; Decimal)
        {
            Caption = 'RT este pago';
            ToolTip = 'Specifies the value of the RT este pago field.';
        }
        field(11; "RT pago anterior"; Decimal)
        {
            Caption = 'RT pago anterior';
            ToolTip = 'Specifies the value of the RT pago anterior field.';
        }
        field(12; "Importe minimo Stepwise"; Decimal)
        {
            Caption = 'Importe minimo Stepwise';
            ToolTip = 'Specifies the value of the Importe minimo Stepwise field.';
        }
        field(13; Provincia; Code[10])
        {
            Caption = 'Provincia';
            ToolTip = 'Specifies the value of the Provincia field.';
        }
        field(13800; Encontrado; Boolean)
        {
            Caption = 'Encontrado';
            ToolTip = 'Specifies the value of the Encontrado field.';
        }
        field(13801; "Tipo base retencion"; Option)
        {
            Caption = 'Tipo base retencion';
            ToolTip = 'Specifies the value of the Tipo base retencion field.';
            OptionMembers = "Total pago","total facturas","Importe IVA",,,,"Subtotal factura";
        }
        field(50000; "Porcentaje de IVA"; Decimal)
        {
            Caption = 'Porcentaje de IVA';
            ToolTip = 'Specifies the value of the Porcentaje de IVA field.';
        }
        field(50001; "Precio unitario maximo"; Decimal)
        {
            Caption = 'Precio unitario maximo';
            ToolTip = 'Specifies the value of the Precio unitario maximo field.';
        }
        field(50002; Detalle; Text[250])
        {
            Caption = 'Detalle';
            ToolTip = 'Specifies the value of the Detalle field.';
        }
        field(50003; "Registrado RG3594"; Option)
        {
            Caption = 'Registrado RG3594';
            ToolTip = 'Specifies the value of the Registrado RG3594 field.';
            OptionMembers = " ",Activo,Suspendido,Excluido,"Inscripción cancelada";
        }
        field(50004; "Skip exclusions"; Boolean)
        {
            Caption = 'Omitir exclusiones';
            ToolTip = 'Specifies the value of the Omitir exclusiones field.';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Tipo retenciones", "Cod. retencion", "Tipo fiscal", Provincia, "Importe pago minimo", "Importe minimo Stepwise", "% retencion", "Porcentaje de IVA")
        {
            Clustered = true;
        }
        key(Key2; "Tipo retenciones", "Tipo fiscal", "Cod. retencion", "Importe pago minimo", "% retencion")
        {
        }
    }

    fieldgroups
    {
    }
}

