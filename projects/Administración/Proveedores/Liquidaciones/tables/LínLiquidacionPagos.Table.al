table 50570 "Lín. Liquidacion Pagos"
{

    fields
    {
        field(1; "No. Liquidacion"; Code[20])
        {
            Caption = 'No. Liquidacion';
            ToolTip = 'Specifies the value of the No. Liquidacion field.';
        }
        field(2; "No. mov."; Integer)
        {
            Caption = 'No. mov.';
            ToolTip = 'Specifies the value of the No. mov field.';
            AutoIncrement = false;
        }
        field(3; "No. proveedor"; Code[20])
        {
            Caption = 'Vendor No.';
            ToolTip = 'Specifies the value of the Vendor No field.';
        }
        field(4; "No. documento"; Code[20])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
        }
        field(5; "No. documento externo"; Code[30])
        {
            Caption = 'External Document No.';
            ToolTip = 'Specifies the value of the External Document No field.';
        }
        field(6; "Fecha registro"; Date)
        {
            Caption = 'Fecha registro';
            ToolTip = 'Specifies the value of the Fecha registro field.';
        }
        field(7; "Fecha vencimiento"; Date)
        {
            Caption = 'Fecha vencimiento';
            ToolTip = 'Specifies the value of the Fecha vencimiento field.';
        }
        field(8; "Cód. divisa"; Code[10])
        {
            Caption = 'Currency Code';
            ToolTip = 'Specifies the value of the Currency Code field.';
        }
        field(9; Importe; Decimal)
        {
            Caption = 'Importe';
            ToolTip = 'Specifies the value of the Importe field.';
        }
        field(10; "Importe a pagar"; Decimal)
        {
            Caption = 'Importe a pagar';
            ToolTip = 'Specifies the value of the Importe a pagar field.';
        }
        field(11; "Importe pendiente"; Decimal)
        {
            Caption = 'Importe pendiente';
            ToolTip = 'Specifies the value of the Importe pendiente field.';
        }
        field(12; "Fecha pago"; Date)
        {
            Caption = 'Fecha pago';
            ToolTip = 'Specifies the value of the Fecha pago field.';
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

