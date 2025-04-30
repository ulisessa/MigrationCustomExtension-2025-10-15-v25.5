table 50106 "Subfamilia producto"
{
    fields
    {
        field(1; "Family code"; Code[10])
        {
            Caption = 'Cód. familia';
            NotBlank = true;
            TableRelation = "Familia producto";
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Código';
            NotBlank = true;
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Descripción mínima"; Code[20])
        {
        }
        field(5; "Tipo producto"; Option)
        {
            CalcFormula = Lookup("Familia producto"."Tipo producto" WHERE(Code = FIELD("Family code")));
            FieldClass = FlowField;
            OptionMembers = Consumo,Pesca;
        }
        field(6; "Kilos netos"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry"."Net kilos" WHERE(Family = FIELD("Family code"),
                                                                     Subfamily = FIELD(Code),
                                                                     "Posting Date" = FIELD("Filtro fecha"),
                                                                     "Location Code" = FIELD("Filtro depósito"),
                                                                     "Entry/Exit Point" = FIELD("Filtro puerto"),
                                                                     "Global Dimension 1 Code" = FIELD("Filtro departamento"),
                                                                     "Global Dimension 2 Code" = FIELD("Filtro actividad"),
                                                                     "Global dimension 3 Code" = FIELD("Filtro marea/ciudad")));
            FieldClass = FlowField;
        }
        field(7; "Kilos brutos"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry"."Gross kilos" WHERE(Family = FIELD("Family code"),
                                                                       Subfamily = FIELD(Code),
                                                                       "Posting Date" = FIELD("Filtro fecha"),
                                                                       "Location Code" = FIELD("Filtro depósito"),
                                                                       "Entry/Exit Point" = FIELD("Filtro puerto"),
                                                                       "Global Dimension 1 Code" = FIELD("Filtro departamento"),
                                                                       "Global Dimension 2 Code" = FIELD("Filtro actividad"),
                                                                       "Global dimension 3 Code" = FIELD("Filtro marea/ciudad")));
            FieldClass = FlowField;
        }
        field(8; "Filtro fecha"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(9; "Filtro depósito"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(10; "Filtro puerto"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Entry/Exit Point";
        }
        field(11; "Filtro departamento"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(12; "Filtro actividad"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(13; "Filtro marea/ciudad"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(14; "Filtro lote"; Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(15; "Filtro proyecto"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Job;
        }
        field(16; Cantidad; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE(Family = FIELD("Family code"),
                                                                  Subfamily = FIELD(Code),
                                                                  "Posting Date" = FIELD("Filtro fecha"),
                                                                  "Location Code" = FIELD("Filtro depósito"),
                                                                  "Entry/Exit Point" = FIELD("Filtro puerto"),
                                                                  "Global Dimension 1 Code" = FIELD("Filtro departamento"),
                                                                  "Global Dimension 2 Code" = FIELD("Filtro actividad"),
                                                                  "Global dimension 3 Code" = FIELD("Filtro marea/ciudad"),
                                                                  "No. proyecto" = FIELD("Filtro proyecto")));
            FieldClass = FlowField;
        }
        field(17; ID_Rubro_SENASA; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18; ID_Producto_SENASA; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Family code", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Family code", "Code", Description, "Tipo producto")
        {
        }
    }
}

