table 50543 "Lín. reparto"
{

    fields
    {
        field(1; "No. Documento"; Code[30])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
            NotBlank = true;
        }
        field(2; "No. línea"; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
            InitValue = 10000;
            NotBlank = true;
        }
        field(3; "No. Producto"; Code[20])
        {
            Caption = 'Product No.';
            ToolTip = 'Specifies the value of the Product No field.';
            NotBlank = true;
            TableRelation = Item."No." WHERE("Exportación" = CONST(true),
                                              Blocked = CONST(false));

            trigger OnValidate()
            var
                rstGLS: Record "General Ledger Setup";
                rstDV: Record "Dimension Value";
            begin
                Clear(rstGLS);
                rstGLS.Get();

                Clear(rstProducto);
                if rstProducto.Get("No. Producto") then begin
                    Validate(Descripcion, rstProducto.Description);
                    Validate(Actividad, rstProducto."Global Dimension 3 Code");
                    Validate("Cod. unidad medida", rstProducto."Base Unit of Measure");
                    Clear(rstDV);
                    if rstDV.Get(rstGLS."Global Dimension 3 Code", Actividad) then
                        "Seguimiento para trazabilidad" := rstDV."Seguimiento para trazabilidad";
                end;
            end;
        }
        field(4; Descripcion; Text[200])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(9; "Location code"; Code[10])
        {
            Caption = 'Exit Location Code';
            ToolTip = 'Specifies the value of the Exit Location Code field.';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(10; "Cantidad a enviar"; Decimal)
        {
            Caption = 'Quantity to Send';
            ToolTip = 'Specifies the value of the Quantity to Send field.';
            DecimalPlaces = 0 : 2;
        }
        field(11; "Fecha ingreso"; Date)
        {
            Caption = 'Entry Date';
            ToolTip = 'Specifies the value of the Entry Date field.';
            NotBlank = true;
        }
        field(12; "Cod. unidad medida"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            ToolTip = 'Specifies the value of the Unit of Measure Code field.';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = field("No. Producto"));
        }
        field(13; Puerto; Code[20])
        {
            Caption = 'Entry/Exit Point';
            ToolTip = 'Specifies the value of the Entry/Exit Point field.';
            DataClassification = ToBeClassified;
            TableRelation = "Entry/Exit Point".Code;
        }
        field(15; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            ToolTip = 'Specifies the value of the Dimension Set ID field.';
            DataClassification = SystemMetadata;
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions();
            end;
        }
        field(14; Actividad; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Activity';
            ToolTip = 'Specifies the value of the Activity field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            var
                l_rstDV: Record "Dimension Value";
                l_rstGLS: Record "General Ledger Setup";
            begin
                Clear(l_rstGLS);
                l_rstGLS.Get();
                Clear(l_rstDV);
                if l_rstDV.Get(l_rstGLS."Global Dimension 3 Code", Actividad) then
                    "DCL application date formula" := l_rstDV."DCL application date formula";

                ValidateShortcutDimCode(3, Actividad);
            end;
        }
        field(16; "Cod. deposito"; Code[10])
        {
            Caption = 'Location Code';
            ToolTip = 'Specifies the value of the Location Code field.';
            TableRelation = Location;
        }
        field(17; "Cantidad x Unidad Medida"; Decimal)
        {
            Caption = 'Quantity per Unit of Measure';
            ToolTip = 'Specifies the value of the Quantity per Unit of Measure field.';
            InitValue = 1;

            trigger OnValidate()
            begin
                CalcFields("Existencias - UMB");
                "Cantidad para Venta" := "Existencias - UMB";
            end;
        }
        field(18; "Tipo movimiento"; Option)
        {
            Caption = 'Movement Type';
            ToolTip = 'Specifies the value of the Movement Type field.';
            FieldClass = Normal;
            OptionMembers = Stock,Venta;
        }
        field(19; "Cantidad para Venta"; Decimal)
        {
            Caption = 'Quantity for Sale';
            ToolTip = 'Specifies the value of the Quantity for Sale field.';
            DecimalPlaces = 0 : 2;
        }
        field(20; "Total a enviar"; Decimal)
        {
            Caption = 'Total to Send';
            ToolTip = 'Specifies the value of the Total to Send field.';
            CalcFormula = Sum("Lín. reparto"."Cantidad a enviar" WHERE("No. Producto" = FIELD("No. Producto"),
                                                                        "Tipo movimiento" = CONST(Venta)));
            DecimalPlaces = 0 : 2;
            FieldClass = FlowField;
        }
        field(22; Proyecto; Code[20])
        {
            Caption = 'Job';
            ToolTip = 'Specifies the value of the Job field.';
            DataClassification = ToBeClassified;
            TableRelation = Job."No." WHERE("Kilos netos pendientes" = FILTER(<> 0),
                                             "Filtro producto" = FIELD("No. Producto"),
                                             "Filtro lote" = FIELD("Lote origen"));
            ValidateTableRelation = false;

        }
        field(23; Buque; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Vessel';
            ToolTip = 'Specifies the value of the Vessel field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, Buque);
            end;
        }
        field(24; Marea; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Fishing Trip';
            ToolTip = 'Specifies the value of the Fishing Trip field.';
            TableRelation = Job."Global Dimension 2 Code" WHERE("Global Dimension 1 Code" = FIELD(Buque),
                                                                 "Kilos netos pendientes" = FILTER(<> 0),
                                                                 "Filtro producto" = FIELD("No. Producto"));
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, Marea);
            end;
        }
        field(25; "Lote origen"; Code[10])
        {
            Caption = 'Source Lot';
            ToolTip = 'Specifies the value of the Source Lot field.';
            DataClassification = ToBeClassified;
        }
        field(26; "Precio USD x KN"; Decimal)
        {
            Caption = 'Price per kilo';
            ToolTip = 'Specifies the value of the Price per kilo field.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                fntCalTotal;
            end;
        }
        field(27; "Importe USD x KN"; Decimal)
        {
            Caption = 'Total Amount (FOB)';
            ToolTip = 'Specifies the value of the Total Amount (FOB) field.';
            DataClassification = ToBeClassified;
        }
        field(28; "Seguimiento para trazabilidad"; Option)
        {
            Caption = 'Traceability Tracking';
            ToolTip = 'Specifies the value of the Traceability Tracking field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        }
        field(29; "DCL application date formula"; Text[30])
        {
            Caption = 'DCL Application Date Formula';
            ToolTip = 'Specifies the value of the DCL Application Date Formula field.';
            DataClassification = ToBeClassified;
        }
        field(2000; "Existencias - KN"; Decimal)
        {
            Caption = 'Inventory - KN';
            ToolTip = 'Specifies the value of the Inventory - KN field.';
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry"."Net kilos" WHERE("Lote origen" = FIELD(FILTER("Lote origen")),
                                                                     "Item No." = FIELD(FILTER("No. Producto")),
                                                                     "Entry/Exit Point" = FIELD(FILTER(Puerto)),
                                                                     "Location Code" = FIELD(FILTER("Cod. deposito"))));
            DecimalPlaces = 0 : 3;
        }
        field(2001; "Existencias - UMB"; Decimal)
        {
            Caption = 'Inventory - UOM';
            ToolTip = 'Specifies the value of the Inventory - UOM field.';
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Lote origen" = FIELD(FILTER("Lote origen")),
                                                                  "Item No." = FIELD(FILTER("No. Producto")),
                                                                  "Entry/Exit Point" = FIELD(FILTER(Puerto)),
                                                                  "Location Code" = FIELD(FILTER("Cod. deposito")),
                                                                  "Global Dimension 1 Code" = FIELD(FILTER(Buque)),
                                                                  "Global dimension 2 Code" = FIELD(FILTER(Marea))));
            DecimalPlaces = 0 : 2;

            trigger OnValidate()
            begin
                CalcFields("Existencias - UMB");
                if "Cantidad x Unidad Medida" <> 0 then
                    "Cantidad para Venta" := "Existencias - UMB" / "Cantidad x Unidad Medida"
                else
                    "Cantidad para Venta" := "Existencias - UMB";
            end;
        }
        field(2002; "Comprometido - UMB"; Decimal)
        {
            Caption = 'Committed - UOM';
            ToolTip = 'Specifies the value of the Committed - UOM field.';
            CalcFormula = Sum("Lín. reparto"."Reservar - UMB" WHERE("No. Producto" = FIELD(FILTER("No. Producto")),
                                                                     "Lote origen" = FIELD(FILTER("Lote origen")),
                                                                     Puerto = FIELD(FILTER(Puerto)),
                                                                     "Cod. deposito" = FIELD(FILTER("Cod. deposito")),
                                                                     Proyecto = FIELD(FILTER(Proyecto)),
                                                                     Registrado = CONST(true)));
            DecimalPlaces = 0 : 2;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                CalcFields("Existencias - UMB");
                if "Cantidad x Unidad Medida" <> 0 then
                    "Cantidad para Venta" := "Existencias - UMB" / "Cantidad x Unidad Medida"
                else
                    "Cantidad para Venta" := "Existencias - UMB";
            end;
        }
        field(2003; "Reservar - UMB"; Decimal)
        {
            Caption = 'Reserve - UOM';
            ToolTip = 'Specifies the value of the Reserve - UOM field.';
            DecimalPlaces = 0 : 2;

            trigger OnValidate()
            begin
                CalcFields("Existencias - UMB", "Existencias - KN");
                if "Cantidad x Unidad Medida" <> 0 then
                    "Cantidad para Venta" := "Existencias - UMB" / "Cantidad x Unidad Medida"
                else
                    "Cantidad para Venta" := "Existencias - UMB";
            end;
        }
        field(2004; "Reservar - KN"; Decimal)
        {
            Caption = 'Reserve - KN';
            ToolTip = 'Specifies the value of the Reserve - KN field.';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 3;

            trigger OnValidate()
            begin
                fntCalTotal;
            end;
        }
        field(2005; "Reservar - KB"; Decimal)
        {
            Caption = 'Reservar - KB';
            ToolTip = 'Specifies the value of the Reservar - KB field.';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 3;
        }
        field(2006; "Comprometido calculado - UMB"; Decimal)
        {
            Caption = 'Comprometido calculado - UMB';
            ToolTip = 'Specifies the value of the Comprometido calculado - UMB field.';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
        }
        field(2007; "Comprometido calculado - KN"; Decimal)
        {
            Caption = 'Comprometido calculado - KN';
            ToolTip = 'Specifies the value of the Comprometido calculado - KN field.';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 3;
        }
        field(2008; "Comprometido calculado - KB"; Decimal)
        {
            Caption = 'Comprometido calculado - KB';
            ToolTip = 'Specifies the value of the Comprometido calculado - KB field.';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 3;
        }
        field(2009; "Envío realizado - UMB"; Decimal)
        {
            Caption = 'Envío realizado - UMB';
            ToolTip = 'Specifies the value of the Envío realizado - UMB field.';
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No. Producto"),
                                                                  "No. reparto" = FIELD("No. Documento"),
                                                                  "Linea reparto" = FIELD("No. línea")));
            FieldClass = FlowField;
        }
        field(2010; "Envío realizado - KN"; Decimal)
        {
            Caption = 'Envío realizado - KN';
            ToolTip = 'Specifies the value of the Envío realizado - KN field.';
            CalcFormula = Sum("Item Ledger Entry"."Net kilos" WHERE("Item No." = FIELD("No. Producto"),
                                                                     "No. reparto" = FIELD("No. Documento"),
                                                                     "Linea reparto" = FIELD("No. línea")));
            DecimalPlaces = 0 : 3;
            FieldClass = FlowField;
        }
        field(2011; "Envío realizado - KB"; Decimal)
        {
            Caption = 'Envío realizado - KB';
            ToolTip = 'Specifies the value of the Envío realizado - KB field.';
            CalcFormula = Sum("Item Ledger Entry"."Gross kilos" WHERE("Item No." = FIELD("No. Producto"),
                                                                       "No. reparto" = FIELD("No. Documento"),
                                                                       "Linea reparto" = FIELD("No. línea")));
            DecimalPlaces = 0 : 3;
            FieldClass = FlowField;
        }
        field(2012; Tons; Decimal)
        {
            Caption = 'Tons';
            ToolTip = 'Specifies the value of the Tons field.';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 3;

            trigger OnValidate()
            begin
                fntCalTotal;
            end;
        }
        field(3000; Registrado; Boolean)
        {
            Caption = 'Registrado';
            ToolTip = 'Specifies the value of the Registrado field.';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No. Documento", "No. línea")
        {
            Clustered = true;
        }
        key(Key2; "No. Documento", "No. Producto")
        {
        }
        key(Key3; "Fecha ingreso")
        {
        }
        key(Key4; "No. Producto")
        {
        }
        key(Key5; "Tipo movimiento", Buque, Marea, "Cod. deposito", Puerto, "No. Producto")
        {
        }
        key(Key6; "Tipo movimiento", "No. Producto", Puerto, "Cod. deposito")
        {
        }
        key(Key7; "No. Documento", "Tipo movimiento", "Cod. deposito", Puerto, "No. Producto")
        {
        }
        key(Key8; "No. Documento", "Tipo movimiento", Buque, Marea, "Cod. deposito", Puerto, "No. Producto")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        fntTraerCabecera;
        Puerto := rstCabRep."Loading port";
        Clear(rstLinRep);
        rstLinRep.SetRange("No. Documento", "No. Documento");
        if rstLinRep.FindLast then
            "No. línea" += rstLinRep."No. línea" + 10000;
    end;

    trigger OnModify()
    begin
        Clear(rstLinRep);
        rstLinRep.SetRange("No. Producto", "No. Producto");
        rstLinRep.SetRange(Buque, Buque);
        rstLinRep.SetRange(Marea, Marea);
        rstLinRep.SetRange(Proyecto, Proyecto);
        rstLinRep.SetRange("No. Documento", "No. Documento");
        rstLinRep.SetRange("Seguimiento para trazabilidad", "Seguimiento para trazabilidad");
        rstLinRep.SetFilter("No. línea", '<>%1', "No. línea");
        if rstLinRep.FindFirst then
            Error('Ya existe una línea idéntica para este lote de producto.');
    end;

    var
        rstProducto: Record Item;
        rstCabRep: Record "Cab. Reparto";
        rstLinRep: Record "Lín. reparto";
        DimMgt: Codeunit DimensionManagement;

    procedure ShowDimensions()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            Rec, "Dimension Set ID", StrSubstNo('%1 %2 %3', TableCaption(), "No. Documento", "No. línea"), Buque, Marea);

        if OldDimSetID <> "Dimension Set ID" then begin
            UpdateShortcutDimsFromDimSet();
            ModifyIfInserted();
        end;
    end;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        // Sólo escritura hacia el conjunto: las páginas de Ventas asignan Buque y Marea
        // con ':=' desde el stock, y una relectura los borraría.
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        ModifyIfInserted();
    end;

    local procedure UpdateShortcutDimsFromDimSet()
    var
        ShortcutDimCode: array[8] of Code[20];
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
        Buque := ShortcutDimCode[1];
        Marea := ShortcutDimCode[2];
        Actividad := ShortcutDimCode[3];
    end;

    local procedure ModifyIfInserted()
    var
        l_rstLinRep: Record "Lín. reparto";
    begin
        if IsTemporary() then
            exit;

        if l_rstLinRep.Get("No. Documento", "No. línea") then
            Modify();
    end;

    local procedure fntTraerCabecera()
    begin
        Clear(rstCabRep);
        rstCabRep.Get("No. Documento");
    end;

    local procedure fntCalTotal()
    begin
        "Importe USD x KN" := "Precio USD x KN" * "Reservar - KN";
        if "Reservar - KN" = 0 then
            Tons := 0
        else
            Tons := "Reservar - KN" / 1000;
    end;
}

