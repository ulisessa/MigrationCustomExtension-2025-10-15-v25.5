table 50018 "Invoice no. setup"
{

    fields
    {
        field(1; "Tipo impuesto"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = CONST ('TIPO FISCAL'));
        }
        field(2; "Actividad comercial"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = CONST ('PUNTO VENTA'));
        }
        field(3; "No. serie"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(4; "Tipo factura"; Option)
        {
            OptionMembers = Factura,"Nota Crédito","Nota Débito",Remito,Pedido,Oferta;
        }
        field(5; Letra; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Tipo factura", "Tipo impuesto", "Actividad comercial")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

