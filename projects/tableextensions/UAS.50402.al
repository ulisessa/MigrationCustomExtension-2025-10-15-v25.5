tableextension 50402 tableextension50402 extends "Transaction Specification"
{
    Caption = 'Transaction Specification';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        field(50000; Diferencia; Decimal)
        {
            CalcFormula = Sum("Bank Acc. Reconciliation Line".Difference WHERE("Bank Account No." = FIELD("Filtro banco"),
                                                                                "Statement No." = FIELD("Filtro extracto"),
                                                                                Description = FIELD(Text)));
            FieldClass = FlowField;
        }
        field(50001; "Filtro banco"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(50002; "Filtro extracto"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(50003; Cuenta; Code[10])
        {
            TableRelation = "G/L Account" WHERE("Account Type" = CONST(Posting),
                                                 Blocked = CONST(false));
        }
    }
    keys
    {
        key(Key50000; Text)
        {
        }
    }
}

