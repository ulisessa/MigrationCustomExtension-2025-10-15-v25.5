table 50023 "Withholding details"
{
    Caption = 'Withholding expemtions';

    fields
    {
        field(1; "Cod. proveedor/cliente"; Code[20])
        {
            Caption = 'Cod. proveedor/cliente';
            ToolTip = 'Specifies the value of the Cod. proveedor/cliente field.';
            TableRelation = IF ("Tipo registro" = CONST(Compra)) Vendor."No."
            ELSE
            IF ("Tipo registro" = CONST(Venta)) Customer."No.";
        }
        field(2; "Tipo retención"; Option)
        {
            Caption = 'Tipo retención';
            ToolTip = 'Specifies the value of the Tipo retención field.';
            OptionMembers = IVA,"Ingresos Brutos",Ganancias,,,,,,"Seguridad Social","Agente de retención IVA";
        }
        field(3; "% exención"; Decimal)
        {
            Caption = '% exención';
            ToolTip = 'Specifies the value of the % exención field.';
        }
        field(4; "Fecha efectividad retencion"; Date)
        {
            Caption = 'Fecha efectividad retencion';
            ToolTip = 'Specifies the value of the Fecha efectividad retencion field.';
        }
        field(5; "Cód. retención"; Code[20])
        {
            Caption = 'Cód. retención';
            ToolTip = 'Specifies the value of the Cód. retención field.';
            TableRelation = "Withholding codes"."Cod. retencion" WHERE("Tipo impuesto retencion" = FIELD("Tipo retención"));
        }
        field(6; Importe; Decimal)
        {
            Caption = 'Importe';
            ToolTip = 'Specifies the value of the Importe field.';
        }
        field(7; "Fecha documento"; Date)
        {
            Caption = 'Fecha documento';
            ToolTip = 'Specifies the value of the Fecha documento field.';
        }
        field(8; "% percepcion"; Decimal)
        {
            Caption = '% percepcion';
            ToolTip = 'Specifies the value of the % percepcion field.';
        }
        field(9; "% retencion"; Decimal)
        {
            Caption = '% retencion';
            ToolTip = 'Specifies the value of the % retencion field.';
        }
        field(10; "Tipo registro"; Option)
        {
            Caption = 'Tipo registro';
            ToolTip = 'Specifies the value of the Tipo registro field.';
            OptionMembers = Compra,Venta;
        }
        field(50000; "No. documento"; Code[100])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
        }
        field(50001; "Fecha emisión boletin"; Date)
        {
            Caption = 'Fecha emisión boletin';
            ToolTip = 'Specifies the value of the Fecha emisión boletin field.';
        }
        field(50002; "Descripción"; Text[100])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
            DataClassification = ToBeClassified;
        }
        field(50003; "Periodo fiscal"; Code[10])
        {
            Caption = 'Periodo fiscal';
            ToolTip = 'Specifies the value of the Periodo fiscal field.';
            DataClassification = ToBeClassified;
        }
        field(50004; "Razon social Proveedor"; Text[100])
        {
            Caption = 'Razon social Proveedor';
            ToolTip = 'Specifies the value of the Razon social Proveedor field.';
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("Cod. proveedor/cliente")));
            FieldClass = FlowField;
        }
        field(50005; "VAT Registration No."; Text[20])
        {
            CalcFormula = Lookup(Vendor."VAT Registration No." WHERE("No." = FIELD("Cod. proveedor/cliente")));
            Caption = 'VAT Registration No.';
            ToolTip = 'Specifies the value of the VAT Registration No field.';
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
        key(Key1; "Tipo registro", "Cod. proveedor/cliente", "Tipo retención", "Fecha efectividad retencion", "Cód. retención")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

