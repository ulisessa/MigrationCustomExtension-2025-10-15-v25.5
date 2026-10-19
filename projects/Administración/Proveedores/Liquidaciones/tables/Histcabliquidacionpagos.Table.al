table 50571 "Hist. cab. liquidacion pagos"
{

    fields
    {
        field(1; "No. Liquidacion"; Code[20])
        {
            Caption = 'No. Liquidacion';
            ToolTip = 'Specifies the value of the No. Liquidacion field.';
        }
        field(2; "Fecha creación"; Date)
        {
            Caption = 'Creation Date';
            ToolTip = 'Specifies the value of the Creation Date field.';
        }
        field(3; Usuario; Code[50])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
            TableRelation = User."User Name";
        }
        field(4; Estado; Text[50])
        {
            Caption = 'Estado';
            ToolTip = 'Specifies the value of the Estado field.';
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No. Liquidacion")));
            FieldClass = FlowField;
        }
        field(5; "Pago mediante"; Option)
        {
            Caption = 'Pago mediante';
            ToolTip = 'Specifies the value of the Pago mediante field.';
            OptionMembers = Banco,Cuenta;
        }
        field(6; "Cód. medio de pago"; Code[20])
        {
            Caption = 'Cód. medio de pago';
            ToolTip = 'Specifies the value of the Cód. medio de pago field.';
            TableRelation = IF ("Pago mediante" = CONST(Banco)) "Bank Account"."No."
            ELSE
            IF ("Pago mediante" = CONST(Cuenta)) "G/L Account"."No.";
        }
        field(7; "Fecha pago"; Date)
        {
            Caption = 'Fecha pago';
            ToolTip = 'Specifies the value of the Fecha pago field.';
        }
        field(8; Registrado; Boolean)
        {
            Caption = 'Registrado';
            ToolTip = 'Specifies the value of the Registrado field.';
        }
        field(9; "Nombre Libro Diario"; Code[20])
        {
            Caption = 'Nombre Libro Diario';
            ToolTip = 'Specifies the value of the Nombre Libro Diario field.';
            TableRelation = "Gen. Journal Template".Name WHERE(Type = CONST(Payments));
        }
        field(10; "Nombre Sección Diario"; Code[20])
        {
            Caption = 'Journal Batch Name';
            ToolTip = 'Specifies the value of the Journal Batch Name field.';
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Nombre Libro Diario"));
        }
        field(11; Importe; Decimal)
        {
            Caption = 'Importe';
            ToolTip = 'Specifies the value of the Importe field.';
            CalcFormula = Sum("Lín. Liquidacion Pagos"."Importe a pagar" WHERE("No. Liquidacion" = FIELD("No. Liquidacion")));
            FieldClass = FlowField;
        }
        field(12; "Cód. divisa"; Code[10])
        {
            Caption = 'Currency Code';
            ToolTip = 'Specifies the value of the Currency Code field.';
            TableRelation = Currency.Code;
        }
        field(13; "Primer No. cheque"; Code[10])
        {
            Caption = 'Primer No. cheque';
            ToolTip = 'Specifies the value of the Primer No. cheque field.';
        }
    }

    keys
    {
        key(Key1; "No. Liquidacion", "Fecha creación")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }



    trigger OnModify()
    begin
        TestField(Registrado, false);
    end;

    trigger OnRename()
    begin
        TestField(Registrado, false);
    end;

    var
        rstConfComp: Record "Purchases & Payables Setup";
        rstLinLiq: Record "Lín. Liquidacion Pagos";
        rstConfUsu: Record "User Setup";
        Text001: Label 'Liquidación pagos';
        rstMensajeria: Record Mensajeria;
}

