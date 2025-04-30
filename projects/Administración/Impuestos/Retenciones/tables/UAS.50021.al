table 50021 "Withholding setup"
{
    Caption = 'Withholding setup';

    fields
    {
        field(1; "Tipo retenciones"; Option)
        {
            OptionMembers = IVA,"Ingresos Brutos",Ganancias,,,,,,"Seguridad Social";
        }
        field(2; "Tipo fiscal"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('TIPO FISCAL'));
        }
        field(3; "Cod. retencion"; Code[20])
        {
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FIELD("Tipo retenciones"));
        }
        field(4; "Importe pago minimo"; Decimal)
        {
        }
        field(5; "% retencion"; Decimal)
        {
        }
        field(6; "Importe retencion"; Decimal)
        {
        }
        field(7; "Importe min. retencion"; Decimal)
        {
        }
        field(8; "RT Base pago anterior"; Decimal)
        {
        }
        field(9; "RT Base este pago"; Decimal)
        {
        }
        field(10; "RT este pago"; Decimal)
        {
        }
        field(11; "RT pago anterior"; Decimal)
        {
        }
        field(12; "Importe minimo Stepwise"; Decimal)
        {
        }
        field(13; Provincia; Code[10])
        {
        }
        field(13800; Encontrado; Boolean)
        {
        }
        field(13801; "Tipo base retencion"; Option)
        {
            OptionMembers = "Total pago","total facturas","Importe IVA",,,,"Subtotal factura";
        }
        field(50000; "Porcentaje de IVA"; Decimal)
        {
        }
        field(50001; "Precio unitario maximo"; Decimal)
        {
        }
        field(50002; Detalle; Text[250])
        {
        }
        field(50003; "Registrado RG3594"; Option)
        {
            OptionMembers = " ",Activo,Suspendido,Excluido,"Inscripción cancelada";
        }
        field(50004; "Skip exclusions"; Boolean)
        {
            Caption = 'Omitir exclusiones';
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

