table 50106 "Subfamilia producto"
{
    fields
    {
        field(1; "Family code"; Code[10])
        {
            Caption = 'Cód. familia';
            ToolTip = 'Specifies the value of the Cód. familia field.';
            NotBlank = true;
            TableRelation = "Familia producto";
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
            ToolTip = 'Specifies the value of the Code field.';
            NotBlank = true;
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(4; "Descripción mínima"; Code[20])
        {
            Caption = 'Descripción mínima';
            ToolTip = 'Specifies the value of the Descripción mínima field.';
        }
        field(5; "Tipo producto"; Option)
        {
            Caption = 'Item type';
            ToolTip = 'Specifies the value of the Item type field.';
            CalcFormula = Lookup("Familia producto"."Tipo producto" WHERE(Code = FIELD("Family code")));
            FieldClass = FlowField;
            OptionMembers = Consumo,Pesca;
        }
        field(6; "Kilos netos"; Decimal)
        {
            Caption = 'Kilos netos';
            ToolTip = 'Specifies the value of the Kilos netos field.';
            CalcFormula = Sum("Item Ledger Entry"."Net kilos" WHERE(Family = FIELD("Family code"),
                                                                     Subfamily = FIELD(Code),
                                                                     "Posting Date" = FIELD("Filtro fecha"),
                                                                     "Location Code" = FIELD("Filtro depósito"),
                                                                     "Entry/Exit Point" = FIELD("Filtro puerto"),
                                                                     "Global Dimension 1 Code" = FIELD("Filtro departamento"),
                                                                     "Global Dimension 3 Code" = FIELD("Filtro actividad"),
                                                                     "Global dimension 2 Code" = FIELD("Filtro marea/ciudad")));
            FieldClass = FlowField;
        }
        field(7; "Kilos brutos"; Decimal)
        {
            Caption = 'Kilos brutos';
            ToolTip = 'Specifies the value of the Kilos brutos field.';
            CalcFormula = Sum("Item Ledger Entry"."Gross kilos" WHERE(Family = FIELD("Family code"),
                                                                       Subfamily = FIELD(Code),
                                                                       "Posting Date" = FIELD("Filtro fecha"),
                                                                       "Location Code" = FIELD("Filtro depósito"),
                                                                       "Entry/Exit Point" = FIELD("Filtro puerto"),
                                                                       "Global Dimension 1 Code" = FIELD("Filtro departamento"),
                                                                       "Global Dimension 3 Code" = FIELD("Filtro actividad"),
                                                                       "Global dimension 2 Code" = FIELD("Filtro marea/ciudad")));
            FieldClass = FlowField;
        }
        field(8; "Filtro fecha"; Date)
        {
            Caption = 'Date Filter';
            ToolTip = 'Specifies the value of the Date Filter field.';
            FieldClass = FlowFilter;
        }
        field(9; "Filtro depósito"; Code[10])
        {
            Caption = 'Filtro depósito';
            ToolTip = 'Specifies the value of the Filtro depósito field.';
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(10; "Filtro puerto"; Code[10])
        {
            Caption = 'Filtro puerto';
            ToolTip = 'Specifies the value of the Filtro puerto field.';
            FieldClass = FlowFilter;
            TableRelation = "Entry/Exit Point";
        }
        field(11; "Filtro departamento"; Code[10])
        {
            Caption = 'Filtro departamento';
            ToolTip = 'Specifies the value of the Filtro departamento field.';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(12; "Filtro actividad"; Code[10])
        {
            Caption = 'Filtro actividad';
            ToolTip = 'Specifies the value of the Filtro actividad field.';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(13; "Filtro marea/ciudad"; Code[10])
        {
            Caption = 'Filtro marea/ciudad';
            ToolTip = 'Specifies the value of the Filtro marea/ciudad field.';
            FieldClass = FlowFilter;

        }
        field(14; "Filtro lote"; Code[10])
        {
            Caption = 'Filtro lote';
            ToolTip = 'Specifies the value of the Filtro lote field.';
            FieldClass = FlowFilter;
        }
        field(15; "Filtro proyecto"; Code[20])
        {
            Caption = 'Filtro proyecto';
            ToolTip = 'Specifies the value of the Filtro proyecto field.';
            FieldClass = FlowFilter;
            TableRelation = Job;
        }
        field(16; Cantidad; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE(Family = FIELD("Family code"),
                                                                  Subfamily = FIELD(Code),
                                                                  "Posting Date" = FIELD("Filtro fecha"),
                                                                  "Location Code" = FIELD("Filtro depósito"),
                                                                  "Entry/Exit Point" = FIELD("Filtro puerto"),
                                                                  "Global Dimension 1 Code" = FIELD("Filtro departamento"),
                                                                  "Global Dimension 3 Code" = FIELD("Filtro actividad"),
                                                                  "Global dimension 2 Code" = FIELD("Filtro marea/ciudad"),
                                                                  "No. proyecto" = FIELD("Filtro proyecto")));
            FieldClass = FlowField;
        }
        field(17; ID_Rubro_SENASA; Integer)
        {
            Caption = 'ID_Rubro_SENASA';
            ToolTip = 'Specifies the value of the ID_Rubro_SENASA field.';
            DataClassification = ToBeClassified;
        }
        field(18; ID_Producto_SENASA; Integer)
        {
            Caption = 'ID_Producto_SENASA';
            ToolTip = 'Specifies the value of the ID_Producto_SENASA field.';
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

