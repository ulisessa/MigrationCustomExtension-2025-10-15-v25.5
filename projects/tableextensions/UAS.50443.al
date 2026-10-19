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
            Caption = 'Computable';
            ToolTip = 'Specifies the value of the Computable field.';
        }
        field(50001; "Nombre agrupador"; Text[30])
        {
            Caption = 'Nombre agrupador';
            ToolTip = 'Specifies the value of the Nombre agrupador field.';
            DataClassification = ToBeClassified;
        }
        field(50002; Orden; Integer)
        {
            Caption = 'Orden';
            ToolTip = 'Specifies the value of the Orden field.';
            DataClassification = ToBeClassified;
        }
        field(50003; "Mapeo IVA Buffer"; Integer)
        {
            Caption = 'Mapeo IVA Buffer';
            ToolTip = 'Specifies the value of the Mapeo IVA Buffer field.';
            DataClassification = ToBeClassified;
            TableRelation = Field."No." WHERE (TableNo = FILTER (50492));
        }
    }
}

