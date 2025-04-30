table 50023 "Withholding details"
{
    Caption = 'Withholding expemtions';

    fields
    {
        field(1; "Cod. proveedor/cliente"; Code[20])
        {
            TableRelation = IF ("Tipo registro" = CONST (Compra)) Vendor."No."
            ELSE
            IF ("Tipo registro" = CONST (Venta)) Customer."No.";
        }
        field(2; "Tipo retención"; Option)
        {
            OptionMembers = IVA,"Ingresos Brutos",Ganancias,,,,,,"Seguridad Social","Agente de retención IVA";
        }
        field(3; "% exención"; Decimal)
        {
        }
        field(4; "Fecha efectividad retencion"; Date)
        {
        }
        field(5; "Cód. retención"; Code[20])
        {
            TableRelation = "Withholding codes"."Cod. retencion" WHERE ("Tipo impuesto retencion" = FIELD ("Tipo retención"));
        }
        field(6; Importe; Decimal)
        {
        }
        field(7; "Fecha documento"; Date)
        {
        }
        field(8; "% percepcion"; Decimal)
        {
        }
        field(9; "% retencion"; Decimal)
        {
        }
        field(10; "Tipo registro"; Option)
        {
            OptionMembers = Compra,Venta;
        }
        field(50000; "No. documento"; Code[100])
        {
        }
        field(50001; "Fecha emisión boletin"; Date)
        {
        }
        field(50002; "Descripción"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Periodo fiscal"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Razon social Proveedor"; Text[100])
        {
            CalcFormula = Lookup (Vendor.Name WHERE ("No." = FIELD ("Cod. proveedor/cliente")));
            FieldClass = FlowField;
        }
        field(50005; "VAT Registration No."; Text[20])
        {
            CalcFormula = Lookup (Vendor."VAT Registration No." WHERE ("No." = FIELD ("Cod. proveedor/cliente")));
            Caption = 'VAT Registration No.';
            FieldClass = FlowField;

            trigger OnValidate()
            var
                VATRegNoFormat: Record "VAT Registration No. Format";
            begin
            end;
        }
    }

    keys
    {
        key(Key1; "Tipo registro", "Cod. proveedor/cliente", "Tipo retención", "Fecha efectividad retencion")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

