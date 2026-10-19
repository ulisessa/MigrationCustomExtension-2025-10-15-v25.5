table 50220 "Insumos fact proyecto"
{

    fields
    {
        field(1; Factura; Code[20])
        {
            Caption = 'Factura';
            ToolTip = 'Specifies the value of the Factura field.';
        }
        field(2; "Posición arancelaria"; Code[20])
        {
            Caption = 'Posición arancelaria';
            ToolTip = 'Specifies the value of the Posición arancelaria field.';
            TableRelation = "Tariff Number"."No.";
        }
        field(3; Insumos; Decimal)
        {
            Caption = 'Insumos';
            ToolTip = 'Specifies the value of the Insumos field.';
        }
    }

    keys
    {
        key(Key1; Factura, "Posición arancelaria")
        {
            Clustered = true;
            SumIndexFields = Insumos;
        }
    }

    fieldgroups
    {
    }
}

