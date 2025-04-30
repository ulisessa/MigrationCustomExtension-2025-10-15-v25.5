table 50570 "Lín. Liquidacion Pagos"
{

    fields
    {
        field(1; "No. Liquidacion"; Code[20])
        {
        }
        field(2; "No. mov."; Integer)
        {
            AutoIncrement = false;
        }
        field(3; "No. proveedor"; Code[20])
        {
        }
        field(4; "No. documento"; Code[20])
        {
        }
        field(5; "No. documento externo"; Code[30])
        {
        }
        field(6; "Fecha registro"; Date)
        {
        }
        field(7; "Fecha vencimiento"; Date)
        {
        }
        field(8; "Cód. divisa"; Code[10])
        {
        }
        field(9; Importe; Decimal)
        {
        }
        field(10; "Importe a pagar"; Decimal)
        {
        }
        field(11; "Importe pendiente"; Decimal)
        {
        }
        field(12; "Fecha pago"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "No. Liquidacion", "Fecha vencimiento", "No. mov.")
        {
            Clustered = true;
            SumIndexFields = Importe, "Importe a pagar";
        }
        key(Key2; "No. Liquidacion", "No. proveedor")
        {
            SumIndexFields = Importe, "Importe a pagar";
        }
        key(Key3; "Cód. divisa")
        {
            SumIndexFields = Importe, "Importe a pagar";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Clear(rstConfComp);
        rstConfComp.Get();
    end;

    var
        rstConfComp: Record "Purchases & Payables Setup";
}

