table 50018 "Invoice no. setup"
{

    fields
    {
        field(1; "Tipo impuesto"; Code[10])
        {
            Caption = 'Tipo impuesto';
            ToolTip = 'Specifies the value of the Tipo impuesto field.';
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = CONST ('TIPO FISCAL'));
        }
        field(2; "Actividad comercial"; Code[10])
        {
            Caption = 'Actividad comercial';
            ToolTip = 'Specifies the value of the Actividad comercial field.';
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = CONST ('PUNTO VENTA'));
        }
        field(3; "No. serie"; Code[30])
        {
            Caption = 'No. serie';
            ToolTip = 'Specifies the value of the No. serie field.';
            TableRelation = "No. Series";
        }
        field(4; "Tipo factura"; Option)
        {
            Caption = 'Tipo factura';
            ToolTip = 'Specifies the value of the Tipo factura field.';
            OptionMembers = Factura,"Nota Crédito","Nota Débito",Remito,Pedido,Oferta;
        }
        field(5; Letra; Text[30])
        {
            Caption = 'Letra';
            ToolTip = 'Specifies the value of the Letra field.';
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

