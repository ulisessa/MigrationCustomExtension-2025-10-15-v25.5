table 50571 "Hist. cab. liquidacion pagos"
{

    fields
    {
        field(1; "No. Liquidacion"; Code[20])
        {
        }
        field(2; "Fecha creación"; Date)
        {
        }
        field(3; Usuario; Code[50])
        {
            TableRelation = User."User Name";
        }
        field(4; Estado; Text[50])
        {
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No. Liquidacion")));
            FieldClass = FlowField;
        }
        field(5; "Pago mediante"; Option)
        {
            OptionMembers = Banco,Cuenta;
        }
        field(6; "Cód. medio de pago"; Code[20])
        {
            TableRelation = IF ("Pago mediante" = CONST(Banco)) "Bank Account"."No."
            ELSE
            IF ("Pago mediante" = CONST(Cuenta)) "G/L Account"."No.";
        }
        field(7; "Fecha pago"; Date)
        {
        }
        field(8; Registrado; Boolean)
        {
        }
        field(9; "Nombre Libro Diario"; Code[20])
        {
            TableRelation = "Gen. Journal Template".Name WHERE(Type = CONST(Payments));
        }
        field(10; "Nombre Sección Diario"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Nombre Libro Diario"));
        }
        field(11; Importe; Decimal)
        {
            CalcFormula = Sum("Lín. Liquidacion Pagos"."Importe a pagar" WHERE("No. Liquidacion" = FIELD("No. Liquidacion")));
            FieldClass = FlowField;
        }
        field(12; "Cód. divisa"; Code[10])
        {
            TableRelation = Currency.Code;
        }
        field(13; "Primer No. cheque"; Code[10])
        {
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

