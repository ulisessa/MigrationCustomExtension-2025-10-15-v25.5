table 50544 "Recupero IVA"
{

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
        }
        field(2; "From Entry No. Purch."; Integer)
        {
            Caption = 'From Entry No.';
            ToolTip = 'Specifies the value of the From Entry No field.';
            TableRelation = "Detalle Recupero IVA"."No. mov.";
        }
        field(3; "To Entry No. Purch."; Integer)
        {
            Caption = 'To Entry No.';
            ToolTip = 'Specifies the value of the To Entry No field.';
            DataClassification = ToBeClassified;
            TableRelation = "Detalle Recupero IVA"."No. mov.";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(4; "From Entry No. Sales"; Integer)
        {
            Caption = 'Desde no mov. ventas';
            ToolTip = 'Specifies the value of the Desde no mov. ventas field.';
            DataClassification = ToBeClassified;
            TableRelation = "Recupero IVA Rubro 3"."No. mov.";
        }
        field(5; "To Entry No. Sales"; Integer)
        {
            Caption = 'Hasta no mov. ventas';
            ToolTip = 'Specifies the value of the Hasta no mov. ventas field.';
            DataClassification = ToBeClassified;
            TableRelation = "Recupero IVA Rubro 3"."No. mov.";
        }
        field(6; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
            ToolTip = 'Specifies the value of the Creation Date field.';
            DataClassification = ToBeClassified;
        }
        field(7; "User ID"; Code[50])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
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
            ToolTip = 'Specifies the value of the Período contable inicial field.';
            DataClassification = ToBeClassified;
        }
        field(9; "Final Accounting Period"; Date)
        {
            Caption = 'Período contable final';
            ToolTip = 'Specifies the value of the Período contable final field.';
            DataClassification = ToBeClassified;
        }
        field(10; "FOB Invoicing"; Decimal)
        {
            CalcFormula = Sum("Recupero IVA Rubro 3"."Monto FOB en $" WHERE("Expo o MI" = CONST(Expo),
                                                                             "No. registro recupero IVA" = FIELD("No.")));
            Caption = 'Facturación FOB';
            ToolTip = 'Specifies the value of the Facturación FOB field.';
            FieldClass = FlowField;
        }
        field(11; "Internal Commerce"; Decimal)
        {
            CalcFormula = Sum("Recupero IVA Rubro 3"."Monto FOB en $" WHERE("Expo o MI" = CONST(MI),
                                                                             "No. registro recupero IVA" = FIELD("No.")));
            Caption = 'Mercado Interno';
            ToolTip = 'Specifies the value of the Mercado Interno field.';
            FieldClass = FlowField;
        }
        field(12; "Importe Neto en $"; Decimal)
        {
            CalcFormula = Sum("Detalle Recupero IVA"."Importe Neto en $" WHERE("No. registro recupero IVA" = FIELD("No.")));
            Caption = 'Importe Neto en $';
            ToolTip = 'Specifies the value of the Importe Neto en $ field.';
            FieldClass = FlowField;
        }
        field(13; "Importe IVA Facturado en $"; Decimal)
        {
            Caption = 'Importe IVA Facturado en $';
            ToolTip = 'Specifies the value of the Importe IVA Facturado en $ field.';
            CalcFormula = Sum("Detalle Recupero IVA"."Importe IVA Facturado en $" WHERE("No. registro recupero IVA" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(14; "Importe IVA Computable"; Decimal)
        {
            Caption = 'Importe IVA Computable';
            ToolTip = 'Specifies the value of the Importe IVA Computable field.';
            CalcFormula = Sum("Detalle Recupero IVA"."Importe IVA Computable" WHERE("No. registro recupero IVA" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(15; "Monto IVA Retenido"; Decimal)
        {
            Caption = 'Monto IVA Retenido';
            ToolTip = 'Specifies the value of the Monto IVA Retenido field.';
            CalcFormula = Sum("Detalle Recupero IVA"."Monto IVA Retenido" WHERE("No. registro recupero IVA" = FIELD("No."),
                                                                                 "Monto IVA Retenido" = FILTER(<> 0)));
            FieldClass = FlowField;
        }
        field(16; "Saldo año fiscal Expo"; Decimal)
        {
            Caption = 'Saldo año fiscal Expo';
            ToolTip = 'Specifies the value of the Saldo año fiscal Expo field.';
            DataClassification = ToBeClassified;
        }
        field(17; "Saldo año fiscal MI"; Decimal)
        {
            Caption = 'Saldo año fiscal MI';
            ToolTip = 'Specifies the value of the Saldo año fiscal MI field.';
            DataClassification = ToBeClassified;
        }
        field(18; "Coeficiente aplicable"; Decimal)
        {
            Caption = 'Coeficiente aplicable';
            ToolTip = 'Specifies the value of the Coeficiente aplicable field.';
            DataClassification = ToBeClassified;
            DecimalPlaces = 2 : 4;
        }
        field(19; "Insumos importados en $"; Decimal)
        {
            Caption = 'Insumos importados en $';
            ToolTip = 'Specifies the value of the Insumos importados en $ field.';
            CalcFormula = Sum("Recupero IVA Rubro 3"."Insumos importados" WHERE("Expo o MI" = CONST(Expo),
                                                                                 "No. registro recupero IVA" = FIELD("No."),
                                                                                 "Insumos importados" = FILTER(<> 0)));
            FieldClass = FlowField;
        }
        field(20; "Saldo EXPO máximo a recuperar"; Decimal)
        {
            Caption = 'Saldo EXPO máximo a recuperar';
            ToolTip = 'Specifies the value of the Saldo EXPO máximo a recuperar field.';
            DataClassification = ToBeClassified;
        }
        field(21; "Saldo IVA máximo a recuperar"; Decimal)
        {
            Caption = 'Saldo IVA máximo a recuperar';
            ToolTip = 'Specifies the value of the Saldo IVA máximo a recuperar field.';
            DataClassification = ToBeClassified;
        }
        field(22; "MI gravadas"; Decimal)
        {
            Caption = 'MI gravadas';
            ToolTip = 'Specifies the value of the MI gravadas field.';
            CalcFormula = Sum("Recupero IVA Rubro 3"."MI gravadas" WHERE("Expo o MI" = CONST(MI),
                                                                          "No. registro recupero IVA" = FIELD("No."),
                                                                          "MI gravadas" = FILTER(<> 0)));
            Description = 'Ventas mercado interno gravadas';
            FieldClass = FlowField;
        }
        field(23; "MI no grav. & flet & segur"; Decimal)
        {
            Caption = 'MI no grav. & flet & segur';
            ToolTip = 'Specifies the value of the MI no grav. & flet & segur field.';
            CalcFormula = Sum("Recupero IVA Rubro 3"."MI no gravadas&flet&segur" WHERE("Expo o MI" = CONST(MI),
                                                                                        "No. registro recupero IVA" = FIELD("No."),
                                                                                        "MI no gravadas&flet&segur" = FILTER(<> 0)));
            Description = 'Ventas mercado interno no gravadas, con fletes y seguros de exportación';
            FieldClass = FlowField;
        }
        field(100; "IVA recuperado en esta DDJJ"; Decimal)
        {
            Caption = 'IVA recuperado en esta DDJJ';
            ToolTip = 'Specifies the value of the IVA recuperado en esta DDJJ field.';
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

