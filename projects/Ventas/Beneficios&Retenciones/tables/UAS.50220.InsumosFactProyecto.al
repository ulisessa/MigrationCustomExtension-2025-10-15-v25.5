table 50220 "Insumos fact proyecto"
{

    fields
    {
        field(1; Factura; Code[20])
        {
        }
        field(2; "Posición arancelaria"; Code[20])
        {
            TableRelation = "Tariff Number"."No.";
        }
        field(3; Insumos; Decimal)
        {
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

