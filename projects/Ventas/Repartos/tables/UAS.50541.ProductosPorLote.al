table 50541 "Productos por lote"
{

    fields
    {
        field(1; "No. documento"; Code[30])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
        }
        field(2; "No. Producto"; Code[20])
        {
            Caption = 'Item No.';
            ToolTip = 'Specifies the value of the Item No field.';
            TableRelation = Item WHERE("Tipo producto" = CONST(Pesca));
        }
        field(3; Descripcion; Text[200])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(4; "No. Lote"; Code[30])
        {
            Caption = 'No. Lote';
            ToolTip = 'Specifies the value of the No. Lote field.';
            NotBlank = false;
        }
        field(5; Puerto; Code[20])
        {
            Caption = 'Puerto';
            ToolTip = 'Specifies the value of the Puerto field.';
        }
        field(6; "Fecha descarga"; Date)
        {
            Caption = 'Fecha descarga';
            ToolTip = 'Specifies the value of the Fecha descarga field.';
        }
        field(7; "Existencias Kilos Netos"; Decimal)
        {
            Caption = 'Existencias Kilos Netos';
            ToolTip = 'Specifies the value of the Existencias Kilos Netos field.';
            CalcFormula = Sum("Item Ledger Entry"."Net kilos" WHERE("Posting Date" = FIELD("Filtro fecha"),
                                                                     "Global Dimension 1 Code" = FIELD("Global dimension 1 filter"),
                                                                     "Global Dimension 2 Code" = FIELD("Global dimension 2 filter"),
                                                                     "Location Code" = FIELD("Cod. deposito"),
                                                                     "Global dimension 3 Code" = FIELD("Global dimension 3 filter"),
                                                                     "Global Dimension 4 Code" = FIELD("Global dimension 4 filter"),
                                                                     "Global Dimension 5 Code" = FIELD("Global dimension 5 filter"),
                                                                     "Global dimension 6 Code" = FIELD("Global dimension 6 filter"),
                                                                     "Global Dimension 7 Code" = FIELD("Global dimension 7 filter"),
                                                                     "Entry/Exit Point" = FIELD(Puerto),
                                                                     "Item No." = FIELD("Filtro Producto")));
            FieldClass = FlowField;
        }
        field(8; "Existencias Kilos Netos x Lote"; Decimal)
        {
            Caption = 'Existencias Kilos Netos x Lote';
            ToolTip = 'Specifies the value of the Existencias Kilos Netos x Lote field.';
            CalcFormula = Sum("Item Ledger Entry"."Net kilos" WHERE("Posting Date" = FIELD("Filtro fecha"),
                                                                     "Global Dimension 1 Code" = FIELD("Global Dimension 1"),
                                                                     "Global Dimension 2 Code" = FIELD("Global dimension 2 filter"),
                                                                     "Location Code" = FIELD("Cod. deposito"),
                                                                     "Global dimension 3 Code" = FIELD("Global Dimension 3"),
                                                                     "Global Dimension 4 Code" = FIELD("Global dimension 4 filter"),
                                                                     "Global Dimension 5 Code" = FIELD("Global dimension 5 filter"),
                                                                     "Global dimension 6 Code" = FIELD("Global dimension 6 filter"),
                                                                     "Global Dimension 7 Code" = FIELD("Global dimension 7 filter"),
                                                                     "Entry/Exit Point" = FIELD(Puerto),
                                                                     "Item No." = FIELD("Filtro Producto")));
            FieldClass = FlowField;
        }
        field(9; "Existencias UMB"; Decimal)
        {
            Caption = 'Existencias UMB';
            ToolTip = 'Specifies the value of the Existencias UMB field.';
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No. Producto"),
                                                                  "Posting Date" = FIELD("Filtro fecha"),
                                                                  "Global Dimension 1 Code" = FIELD("Global Dimension 1"),
                                                                  "Global Dimension 2 Code" = FIELD("Global dimension 2 filter"),
                                                                  "Location Code" = FIELD("Cod. deposito"),
                                                                  "Global dimension 3 Code" = FIELD("Global dimension 3 filter"),
                                                                  "Global Dimension 4 Code" = FIELD("Global dimension 4 filter"),
                                                                  "Global Dimension 5 Code" = FIELD("Global dimension 5 filter"),
                                                                  "Global dimension 6 Code" = FIELD("Global dimension 6 filter"),
                                                                  "Global Dimension 7 Code" = FIELD("Global dimension 7 filter"),
                                                                  "Entry/Exit Point" = FIELD(Puerto),
                                                                  "Item No." = FIELD("No. Producto")));
            FieldClass = FlowField;
        }
        field(10; "Existencias UMB x Lote"; Decimal)
        {
            Caption = 'Existencias UMB x Lote';
            ToolTip = 'Specifies the value of the Existencias UMB x Lote field.';
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Filtro Producto"),
                                                                  "Entry/Exit Point" = FIELD(Puerto),
                                                                  "Posting Date" = FIELD("Filtro fecha"),
                                                                  "Global Dimension 1 Code" = FIELD("Global Dimension 1"),
                                                                  "Global Dimension 2 Code" = FIELD("Global dimension 2 filter"),
                                                                  "Location Code" = FIELD("Cod. deposito"),
                                                                  "Global dimension 3 Code" = FIELD("Global dimension 3 filter"),
                                                                  "Global Dimension 4 Code" = FIELD("Global dimension 4 filter"),
                                                                  "Global Dimension 5 Code" = FIELD("Global dimension 5 filter"),
                                                                  "Global dimension 6 Code" = FIELD("Global dimension 6 filter"),
                                                                  "Global Dimension 7 Code" = FIELD("Global dimension 7 filter")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                "Cantidad a enviar" := "Existencias UMB x Lote";
            end;
        }
        field(13; Seleccionar; Boolean)
        {
            Caption = 'Seleccionar';
            ToolTip = 'Specifies the value of the Seleccionar field.';

            trigger OnValidate()
            begin
                if Seleccionar then
                    "Cantidad a enviar" := "Existencias UMB x Lote"
                else
                    "Cantidad a enviar" := 0;
            end;
        }
        field(14; "Cantidad a enviar"; Decimal)
        {
            Caption = 'Cantidad a enviar';
            ToolTip = 'Specifies the value of the Cantidad a enviar field.';
            CalcFormula = Sum("Lín. reparto"."Cantidad a enviar" WHERE("No. Producto" = FIELD("Filtro Producto"),
                                                                        Buque = FIELD("Global Dimension 1"),
                                                                        Marea = FIELD("Global Dimension 3"),
                                                                        "Tipo movimiento" = CONST(Venta),
                                                                        Puerto = FIELD(Puerto),
                                                                        "Cod. deposito" = FIELD("Cod. deposito")));
            FieldClass = FlowField;
        }
        field(15; "Cantidad total a enviar"; Decimal)
        {
            Caption = 'Cantidad total a enviar';
            ToolTip = 'Specifies the value of the Cantidad total a enviar field.';
            CalcFormula = Sum("Lín. reparto"."Cantidad a enviar" WHERE("No. Documento" = FIELD("No. documento"),
                                                                        "No. Producto" = FIELD("Filtro Producto"),
                                                                        Buque = FIELD("Global Dimension 1"),
                                                                        Marea = FIELD("Global Dimension 3")));
            FieldClass = FlowField;
        }
        field(16; "Tipo movimiento"; Option)
        {
            Caption = 'Tipo movimiento';
            ToolTip = 'Specifies the value of the Tipo movimiento field.';
            OptionMembers = Stock,Venta;
        }
        field(17; "Cantidad reservada"; Decimal)
        {
            Caption = 'Cantidad reservada';
            ToolTip = 'Specifies the value of the Cantidad reservada field.';
            CalcFormula = Sum("Sales Line"."Outstanding Qty. (Base)" WHERE("Document Type" = CONST(Order),
                                                                            Type = CONST(Item),
                                                                            "No." = FIELD("Filtro Producto"),
                                                                            "Lote origen" = FIELD(FILTER("No. Lote")),
                                                                            "Shortcut Dimension 1 Code" = FIELD("Global Dimension 1"),
                                                                            "Shortcut Dimension 3 Code" = FIELD("Global Dimension 3"),
                                                                            "Exit Point" = FIELD(Puerto),
                                                                            "Location Code" = FIELD("Cod. deposito")));
            FieldClass = FlowField;
        }
        field(18; "Existencias históricas"; Decimal)
        {
            Caption = 'Existencias históricas';
            ToolTip = 'Specifies the value of the Existencias históricas field.';
        }
        field(19; "Cantidad enviada"; Decimal)
        {
            Caption = 'Cantidad enviada';
            ToolTip = 'Specifies the value of the Cantidad enviada field.';
        }
        field(20; "Cod. deposito"; Code[10])
        {
            Caption = 'Cod. deposito';
            ToolTip = 'Specifies the value of the Cod. deposito field.';
            TableRelation = Location;
        }
        field(21; "Global Dimension 1"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(22; "Global Dimension 3"; Code[10])
        {
            Caption = 'Global Dimension 3';
            ToolTip = 'Specifies the value of the Global Dimension 3 field.';
            CaptionClass = '1,2,3';

        }
        field(30; "Cantidad pendiente en pedidos"; Decimal)
        {
            Caption = 'Cantidad pendiente en pedidos';
            ToolTip = 'Specifies the value of the Cantidad pendiente en pedidos field.';
            CalcFormula = Sum("Sales Line"."Qty. to Ship" WHERE("Document Type" = CONST(Order),
                                                                 Type = CONST(Item),
                                                                 "No." = FIELD("Filtro Producto"),
                                                                 "Exit Point" = FIELD("Filtro Puerto"),
                                                                 "Location Code" = FIELD("Filtro deposito"),
                                                                 "Lote origen" = FIELD(FILTER("Filtro Lote origen")),
                                                                 "Shortcut Dimension 1 Code" = FIELD("Global Dimension 1"),
                                                                 "Shortcut Dimension 3 Code" = FIELD("Global Dimension 3")));
            FieldClass = FlowField;
        }
        field(100; "Filtro fecha"; Date)
        {
            Caption = 'Date Filter';
            ToolTip = 'Specifies the value of the Date Filter field.';
            FieldClass = FlowFilter;
        }
        field(101; "Global dimension 1 filter"; Code[10])
        {
            Caption = 'Global dimension 1 filter';
            ToolTip = 'Specifies the value of the Global dimension 1 filter field.';
            CaptionClass = '1,3,1';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(102; "Global dimension 2 filter"; Code[10])
        {
            Caption = 'Global dimension 2 filter';
            ToolTip = 'Specifies the value of the Global dimension 2 filter field.';
            CaptionClass = '1,3,2';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(103; "Filtro deposito"; Code[10])
        {
            Caption = 'Filtro deposito';
            ToolTip = 'Specifies the value of the Filtro deposito field.';
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(104; "Filtro caja"; Code[10])
        {
            Caption = 'Filtro caja';
            ToolTip = 'Specifies the value of the Filtro caja field.';
            FieldClass = FlowFilter;
        }
        field(105; "Global dimension 3 filter"; Code[10])
        {
            Caption = 'Global dimension 3 filter';
            ToolTip = 'Specifies the value of the Global dimension 3 filter field.';
            CaptionClass = '1,3,3';
            FieldClass = FlowFilter;

        }
        field(106; "Global dimension 4 filter"; Code[10])
        {
            Caption = 'Global dimension 4 filter';
            ToolTip = 'Specifies the value of the Global dimension 4 filter field.';
            CaptionClass = '1,3,4';
            FieldClass = FlowFilter;

        }
        field(107; "Global dimension 5 filter"; Code[10])
        {
            Caption = 'Global dimension 5 filter';
            ToolTip = 'Specifies the value of the Global dimension 5 filter field.';
            CaptionClass = '1,3,5';
            FieldClass = FlowFilter;

        }
        field(108; "Global dimension 6 filter"; Code[10])
        {
            Caption = 'Global dimension 6 filter';
            ToolTip = 'Specifies the value of the Global dimension 6 filter field.';
            CaptionClass = '1,3,6';
            FieldClass = FlowFilter;

        }
        field(109; "Global dimension 7 filter"; Code[10])
        {
            Caption = 'Global dimension 7 filter';
            ToolTip = 'Specifies the value of the Global dimension 7 filter field.';
            CaptionClass = '1,3,7';
            FieldClass = FlowFilter;

        }
        field(110; "Filtro Puerto"; Code[10])
        {
            Caption = 'Filtro Puerto';
            ToolTip = 'Specifies the value of the Filtro Puerto field.';
            FieldClass = FlowFilter;
            TableRelation = "Entry/Exit Point";
        }
        field(111; "Filtro Sección diario producto"; Code[10])
        {
            Caption = 'Filtro Sección diario producto';
            ToolTip = 'Specifies the value of the Filtro Sección diario producto field.';
            FieldClass = FlowFilter;
            TableRelation = "Item Journal Batch".Name;
        }
        field(112; "Filtro No. lote"; Code[30])
        {
            Caption = 'Filtro No. lote';
            ToolTip = 'Specifies the value of the Filtro No. lote field.';
            FieldClass = FlowFilter;
            TableRelation = "Item Ledger Entry"."Lot No.";
        }
        field(113; "Filtro Producto"; Code[20])
        {
            Caption = 'Filtro Producto';
            ToolTip = 'Specifies the value of the Filtro Producto field.';
            FieldClass = FlowFilter;
        }
        field(114; "Cod. unidad medida"; Code[10])
        {
            Caption = 'Cod. unidad medida';
            ToolTip = 'Specifies the value of the Cod. unidad medida field.';
        }
        field(115; "Cantidad x Unidad Medida"; Decimal)
        {
            Caption = 'Cantidad x Unidad Medida';
            ToolTip = 'Specifies the value of the Cantidad x Unidad Medida field.';
        }
        field(116; "Filtro Lote origen"; Code[20])
        {
            Caption = 'Filtro Lote origen';
            ToolTip = 'Specifies the value of the Filtro Lote origen field.';
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1; "No. documento", "No. Lote", "Tipo movimiento", "No. Producto", "Cod. deposito", Puerto)
        {
            Clustered = true;
        }
        key(Key2; "No. documento", "No. Lote", "No. Producto", Puerto, "Tipo movimiento")
        {
        }
        key(Key3; "No. documento", "No. Lote", Puerto, "Tipo movimiento")
        {
        }
        key(Key4; "No. documento", "Fecha descarga")
        {
        }
        key(Key5; "No. documento", "Tipo movimiento", "Fecha descarga", "Cod. deposito", Puerto)
        {
        }
        key(Key6; Puerto, "No. Lote", "Cod. deposito", "No. Producto")
        {
        }
        key(Key7; "No. documento", "No. Lote", Puerto, "Cod. deposito", "Tipo movimiento")
        {
        }
        key(Key8; "No. documento", "Global Dimension 1", "Global Dimension 3", Puerto, "Tipo movimiento")
        {
        }
    }

    fieldgroups
    {
    }
}

