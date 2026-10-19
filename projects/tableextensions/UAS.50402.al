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
            Caption = 'Diferencia';
            ToolTip = 'Specifies the value of the Diferencia field.';
            CalcFormula = Sum("Bank Acc. Reconciliation Line".Difference WHERE("Bank Account No." = FIELD("Filtro banco"),
                                                                                "Statement No." = FIELD("Filtro extracto"),
                                                                                Description = FIELD(Text)));
            FieldClass = FlowField;
        }
        field(50001; "Filtro banco"; Code[10])
        {
            Caption = 'Filtro banco';
            ToolTip = 'Specifies the value of the Filtro banco field.';
            FieldClass = FlowFilter;
        }
        field(50002; "Filtro extracto"; Code[10])
        {
            Caption = 'Filtro extracto';
            ToolTip = 'Specifies the value of the Filtro extracto field.';
            FieldClass = FlowFilter;
        }
        field(50003; Cuenta; Code[10])
        {
            Caption = 'Cuenta';
            ToolTip = 'Specifies the value of the Cuenta field.';
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

