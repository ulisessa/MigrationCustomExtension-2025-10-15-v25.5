tableextension 50443 tableextension50443 extends "Tax Group"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Last Modified DateTime")
        {
            Caption = 'Last Modified DateTime';
        }
        field(50000; Computable; Boolean)
        {
        }
        field(50001; "Nombre agrupador"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; Orden; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Mapeo IVA Buffer"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = Field."No." WHERE (TableNo = FILTER (50492));
        }
    }
}

