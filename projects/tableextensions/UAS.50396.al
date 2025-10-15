tableextension 50396 tableextension50396 extends "Entry/Exit Point"
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
        field(50000; "País"; Text[30])
        {
            TableRelation = "Country/Region";
        }
        field(50001; "Descripción 2"; Text[199])
        {
        }
        field(50002; "Cantidad facturada"; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line".Quantity WHERE("Posting Date" = FIELD("Filtro fecha"),
                                                                   "Job No." = FIELD("Filtro proyecto"),
                                                                   "Shortcut Dimension 1 Code" = FIELD("Filtro buque"),
                                                                   "Shortcut Dimension 2 Code" = FIELD("Filtro marea"),
                                                                   "Shortcut Dimension 3 Code" = FIELD("Filtro actividad"),
                                                                   "Puerto destino" = FIELD(Code)));
            FieldClass = FlowField;
        }
        field(50003; "Kilos netos facturados"; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line"."Net kilos" WHERE("Posting Date" = FIELD("Filtro fecha"),
                                                                      "Job No." = FIELD("Filtro proyecto"),
                                                                      "Shortcut Dimension 1 Code" = FIELD("Filtro buque"),
                                                                      "Shortcut Dimension 2 Code" = FIELD("Filtro marea"),
                                                                      "Shortcut Dimension 3 Code" = FIELD("Filtro actividad"),
                                                                      "Puerto destino" = FIELD(Code)));
            FieldClass = FlowField;
        }
        field(50004; "Kilos brutos facturados"; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line"."Gross kilos" WHERE("Posting Date" = FIELD("Filtro fecha"),
                                                                        "Job No." = FIELD("Filtro proyecto"),
                                                                        "Shortcut Dimension 1 Code" = FIELD("Filtro buque"),
                                                                        "Shortcut Dimension 2 Code" = FIELD("Filtro marea"),
                                                                        "Shortcut Dimension 3 Code" = FIELD("Filtro actividad"),
                                                                        "Puerto destino" = FIELD(Code)));
            FieldClass = FlowField;
        }
        field(50005; "Importe USD x destino"; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line"."Importe USD" WHERE("Posting Date" = FIELD("Filtro fecha"),
                                                                        "Job No." = FIELD("Filtro proyecto"),
                                                                        "Shortcut Dimension 1 Code" = FIELD("Filtro buque"),
                                                                        "Shortcut Dimension 2 Code" = FIELD("Filtro marea"),
                                                                        "Shortcut Dimension 3 Code" = FIELD("Filtro actividad"),
                                                                        "Puerto destino" = FIELD(Code)));
            FieldClass = FlowField;
        }
        field(50006; "Cantidad facturada x origen"; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line".Quantity WHERE("Posting Date" = FIELD("Filtro fecha"),
                                                                   "Job No." = FIELD("Filtro proyecto"),
                                                                   "Shortcut Dimension 1 Code" = FIELD("Filtro buque"),
                                                                   "Shortcut Dimension 2 Code" = FIELD("Filtro marea"),
                                                                   "Shortcut Dimension 3 Code" = FIELD("Filtro actividad"),
                                                                   "Exit Point" = FIELD(Code)));
            FieldClass = FlowField;
        }
        field(50007; "Kilos netos facturados origen"; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line"."Net kilos" WHERE("Posting Date" = FIELD("Filtro fecha"),
                                                                      "Job No." = FIELD("Filtro proyecto"),
                                                                      "Shortcut Dimension 1 Code" = FIELD("Filtro buque"),
                                                                      "Shortcut Dimension 2 Code" = FIELD("Filtro marea"),
                                                                      "Shortcut Dimension 3 Code" = FIELD("Filtro actividad"),
                                                                      "Exit Point" = FIELD(Code)));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
        }
        field(50008; "Kilos brutos facturados origen"; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line"."Gross kilos" WHERE("Posting Date" = FIELD("Filtro fecha"),
                                                                        "Job No." = FIELD("Filtro proyecto"),
                                                                        "Shortcut Dimension 1 Code" = FIELD("Filtro buque"),
                                                                        "Shortcut Dimension 2 Code" = FIELD("Filtro marea"),
                                                                        "Shortcut Dimension 3 Code" = FIELD("Filtro actividad"),
                                                                        "Exit Point" = FIELD(Code)));
            FieldClass = FlowField;
        }
        field(50009; "Importe USD x origen"; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line"."Importe USD" WHERE("Posting Date" = FIELD("Filtro fecha"),
                                                                        "Job No." = FIELD("Filtro proyecto"),
                                                                        "Shortcut Dimension 1 Code" = FIELD("Filtro buque"),
                                                                        "Shortcut Dimension 2 Code" = FIELD("Filtro marea"),
                                                                        "Shortcut Dimension 3 Code" = FIELD("Filtro actividad"),
                                                                        "Exit Point" = FIELD(Code)));
            FieldClass = FlowField;
        }
        field(50010; "Informe remito"; Integer)
        {
            TableRelation = Object.ID WHERE(Type = FILTER(Report));
        }
        field(50011; Grupo; Code[20])
        {
            TableRelation = Seguridad;
        }
        field(50012; "No. aduana"; Code[3])
        {
            DataClassification = ToBeClassified;
        }
        field(50100; "Filtro fecha"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50101; "Filtro proyecto"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Job;
        }
        field(50102; "Filtro buque"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = Dimension;
        }
        field(50103; "Filtro marea"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(50104; "Filtro actividad"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = Dimension;
        }
        field(50998; "Importe x orden"; Decimal)
        {
        }
        field(50999; Orden; Integer)
        {
        }
    }
}

