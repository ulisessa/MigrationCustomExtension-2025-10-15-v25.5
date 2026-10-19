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
            Caption = 'País';
            ToolTip = 'Specifies the value of the País field.';
            TableRelation = "Country/Region";
        }
        field(50001; "Descripción 2"; Text[199])
        {
            Caption = 'Description 2';
            ToolTip = 'Specifies the value of the Description 2 field.';
        }
        field(50002; "Cantidad facturada"; Decimal)
        {
            Caption = 'Cantidad facturada';
            ToolTip = 'Specifies the value of the Cantidad facturada field.';
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
            Caption = 'Kilos netos facturados';
            ToolTip = 'Specifies the value of the Kilos netos facturados field.';
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
            Caption = 'Kilos brutos facturados';
            ToolTip = 'Specifies the value of the Kilos brutos facturados field.';
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
            Caption = 'Importe USD x destino';
            ToolTip = 'Specifies the value of the Importe USD x destino field.';
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
            Caption = 'Cantidad facturada x origen';
            ToolTip = 'Specifies the value of the Cantidad facturada x origen field.';
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
            Caption = 'Kilos netos facturados origen';
            ToolTip = 'Specifies the value of the Kilos netos facturados origen field.';
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
            Caption = 'Kilos brutos facturados origen';
            ToolTip = 'Specifies the value of the Kilos brutos facturados origen field.';
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
            Caption = 'Importe USD x origen';
            ToolTip = 'Specifies the value of the Importe USD x origen field.';
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
            Caption = 'Informe remito';
            ToolTip = 'Specifies the value of the Informe remito field.';
            TableRelation = Object.ID WHERE(Type = FILTER(Report));
        }
        field(50011; Grupo; Code[20])
        {
            Caption = 'Grupo';
            ToolTip = 'Specifies the value of the Grupo field.';
            TableRelation = Seguridad;
        }
        field(50012; "No. aduana"; Code[3])
        {
            Caption = 'No. aduana';
            ToolTip = 'Specifies the value of the No. aduana field.';
            DataClassification = ToBeClassified;
        }
        field(50100; "Filtro fecha"; Date)
        {
            Caption = 'Date Filter';
            ToolTip = 'Specifies the value of the Date Filter field.';
            FieldClass = FlowFilter;
        }
        field(50101; "Filtro proyecto"; Code[20])
        {
            Caption = 'Filtro proyecto';
            ToolTip = 'Specifies the value of the Filtro proyecto field.';
            FieldClass = FlowFilter;
            TableRelation = Job;
        }
        field(50102; "Filtro buque"; Code[10])
        {
            Caption = 'Filtro buque';
            ToolTip = 'Specifies the value of the Filtro buque field.';
            FieldClass = FlowFilter;
            TableRelation = Dimension;
        }
        field(50103; "Filtro marea"; Code[10])
        {
            Caption = 'Filtro marea';
            ToolTip = 'Specifies the value of the Filtro marea field.';
            FieldClass = FlowFilter;
        }
        field(50104; "Filtro actividad"; Code[10])
        {
            Caption = 'Filtro actividad';
            ToolTip = 'Specifies the value of the Filtro actividad field.';
            FieldClass = FlowFilter;
            TableRelation = Dimension;
        }
        field(50998; "Importe x orden"; Decimal)
        {
            Caption = 'Importe x orden';
            ToolTip = 'Specifies the value of the Importe x orden field.';
        }
        field(50999; Orden; Integer)
        {
            Caption = 'Orden';
            ToolTip = 'Specifies the value of the Orden field.';
        }
    }
}

