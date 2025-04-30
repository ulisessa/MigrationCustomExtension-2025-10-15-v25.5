table 50544 "Recupero IVA"
{

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(2; "From Entry No. Purch."; Integer)
        {
            Caption = 'From Entry No.';
            TableRelation = "Detalle Recupero IVA"."No. mov.";
        }
        field(3; "To Entry No. Purch."; Integer)
        {
            Caption = 'To Entry No.';
            DataClassification = ToBeClassified;
            TableRelation = "Detalle Recupero IVA"."No. mov.";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(4; "From Entry No. Sales"; Integer)
        {
            Caption = 'Desde no mov. ventas';
            DataClassification = ToBeClassified;
            TableRelation = "Recupero IVA Rubro 3"."No. mov.";
        }
        field(5; "To Entry No. Sales"; Integer)
        {
            Caption = 'Hasta no mov. ventas';
            DataClassification = ToBeClassified;
            TableRelation = "Recupero IVA Rubro 3"."No. mov.";
        }
        field(6; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            DataClassification = ToBeClassified;
        }
        field(7; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
            end;
        }
        field(8; "Initial Accounting Period"; Date)
        {
            Caption = 'Período contable inicial';
            DataClassification = ToBeClassified;
        }
        field(9; "Final Accounting Period"; Date)
        {
            Caption = 'Período contable final';
            DataClassification = ToBeClassified;
        }
        field(10; "FOB Invoicing"; Decimal)
        {
            CalcFormula = Sum("Recupero IVA Rubro 3"."Monto FOB en $" WHERE("Expo o MI" = CONST(Expo),
                                                                             "No. registro recupero IVA" = FIELD("No.")));
            Caption = 'Facturación FOB';
            FieldClass = FlowField;
        }
        field(11; "Internal Commerce"; Decimal)
        {
            CalcFormula = Sum("Recupero IVA Rubro 3"."Monto FOB en $" WHERE("Expo o MI" = CONST(MI),
                                                                             "No. registro recupero IVA" = FIELD("No.")));
            Caption = 'Mercado Interno';
            FieldClass = FlowField;
        }
        field(12; "Importe Neto en $"; Decimal)
        {
            CalcFormula = Sum("Detalle Recupero IVA"."Importe Neto en $" WHERE("No. registro recupero IVA" = FIELD("No.")));
            Caption = 'Importe Neto en $';
            FieldClass = FlowField;
        }
        field(13; "Importe IVA Facturado en $"; Decimal)
        {
            CalcFormula = Sum("Detalle Recupero IVA"."Importe IVA Facturado en $" WHERE("No. registro recupero IVA" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(14; "Importe IVA Computable"; Decimal)
        {
            CalcFormula = Sum("Detalle Recupero IVA"."Importe IVA Computable" WHERE("No. registro recupero IVA" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(15; "Monto IVA Retenido"; Decimal)
        {
            CalcFormula = Sum("Detalle Recupero IVA"."Monto IVA Retenido" WHERE("No. registro recupero IVA" = FIELD("No."),
                                                                                 "Monto IVA Retenido" = FILTER(<> 0)));
            FieldClass = FlowField;
        }
        field(16; "Saldo año fiscal Expo"; Decimal)
        {
            Caption = 'Saldo año fiscal Expo';
            DataClassification = ToBeClassified;
        }
        field(17; "Saldo año fiscal MI"; Decimal)
        {
            Caption = 'Saldo año fiscal MI';
            DataClassification = ToBeClassified;
        }
        field(18; "Coeficiente aplicable"; Decimal)
        {
            Caption = 'Coeficiente aplicable';
            DataClassification = ToBeClassified;
            DecimalPlaces = 2 : 4;
        }
        field(19; "Insumos importados en $"; Decimal)
        {
            CalcFormula = Sum("Recupero IVA Rubro 3"."Insumos importados" WHERE("Expo o MI" = CONST(Expo),
                                                                                 "No. registro recupero IVA" = FIELD("No."),
                                                                                 "Insumos importados" = FILTER(<> 0)));
            FieldClass = FlowField;
        }
        field(20; "Saldo EXPO máximo a recuperar"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Saldo IVA máximo a recuperar"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "MI gravadas"; Decimal)
        {
            CalcFormula = Sum("Recupero IVA Rubro 3"."MI gravadas" WHERE("Expo o MI" = CONST(MI),
                                                                          "No. registro recupero IVA" = FIELD("No."),
                                                                          "MI gravadas" = FILTER(<> 0)));
            Description = 'Ventas mercado interno gravadas';
            FieldClass = FlowField;
        }
        field(23; "MI no grav. & flet & segur"; Decimal)
        {
            CalcFormula = Sum("Recupero IVA Rubro 3"."MI no gravadas&flet&segur" WHERE("Expo o MI" = CONST(MI),
                                                                                        "No. registro recupero IVA" = FIELD("No."),
                                                                                        "MI no gravadas&flet&segur" = FILTER(<> 0)));
            Description = 'Ventas mercado interno no gravadas, con fletes y seguros de exportación';
            FieldClass = FlowField;
        }
        field(100; "IVA recuperado en esta DDJJ"; Decimal)
        {
            CalcFormula = Sum("Recupero IVA Rubro 7"."IVA recuperado" WHERE("No. registro recupero IVA" = FIELD("No.")));
            FieldClass = FlowField;
            TableRelation = "Recupero IVA Rubro 7"."IVA recuperado" WHERE("No. registro recupero IVA" = FIELD("No."));
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

