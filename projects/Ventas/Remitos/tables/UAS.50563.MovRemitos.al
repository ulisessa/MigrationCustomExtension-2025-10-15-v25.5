table 50563 "Mov. remitos"
{


    fields
    {
        field(1; "No. documento"; Code[20])
        {
            Caption = 'Document No.';
            ToolTip = 'Specifies the value of the Document No field.';
        }
        field(2; "No. línea"; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
        }
        field(3; "No. producto"; Code[20])
        {
            Caption = 'Item No.';
            ToolTip = 'Specifies the value of the Item No field.';
            TableRelation = Item."No.";
        }
        field(4; Lote; Code[30])
        {
            Caption = 'Lote';
            ToolTip = 'Specifies the value of the Lote field.';
            TableRelation = "Item Ledger Entry" WHERE("Lot No." = FIELD(Lote));
        }
        field(5; Cantidad; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
        }
        field(6; "Kilos brutos"; Decimal)
        {
            Caption = 'Kilos brutos';
            ToolTip = 'Specifies the value of the Kilos brutos field.';
        }
        field(7; "Kilos netos"; Decimal)
        {
            Caption = 'Kilos netos';
            ToolTip = 'Specifies the value of the Kilos netos field.';
        }
        field(8; "Lote origen"; Code[20])
        {
            Caption = 'Lote origen';
            ToolTip = 'Specifies the value of the Lote origen field.';
        }
        field(9; Buque; Code[10])
        {
            Caption = 'Buque';
            ToolTip = 'Specifies the value of the Buque field.';
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(10; Marea; Code[10])
        {
            Caption = 'Marea';
            ToolTip = 'Specifies the value of the Marea field.';
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

        }
        field(11; "Cód. depósito"; Code[10])
        {
            Caption = 'Cód. depósito';
            ToolTip = 'Specifies the value of the Cód. depósito field.';
            TableRelation = Location;
        }
        field(12; "Cód. caja"; Code[10])
        {
            Caption = 'Cód. caja';
            ToolTip = 'Specifies the value of the Cód. caja field.';
        }
        field(13; "Puerto/Aeropuerto"; Code[10])
        {
            Caption = 'Puerto/Aeropuerto';
            ToolTip = 'Specifies the value of the Puerto/Aeropuerto field.';
            TableRelation = "Entry/Exit Point";
        }
        field(14; "No. pallet"; Code[10])
        {
            Caption = 'Pallet no.';
            ToolTip = 'Specifies the value of the Pallet no field.';
        }
        field(104; "No. reparto"; Code[20])
        {
            Caption = 'No. reparto';
            ToolTip = 'Specifies the value of the No. reparto field.';
            DataClassification = ToBeClassified;
        }
        field(105; "Linea reparto"; Integer)
        {
            Caption = 'Linea reparto';
            ToolTip = 'Specifies the value of the Linea reparto field.';
            DataClassification = ToBeClassified;
        }
        field(106; "Seguimiento para trazabilidad"; Option)
        {
            Caption = 'Seguimiento para trazabilidad';
            ToolTip = 'Specifies the value of the Seguimiento para trazabilidad field.';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        }
        field(107; "DCL application date formula"; Text[30])
        {
            Caption = 'Fórmula de aplicación de fechas de DCL';
            ToolTip = 'Specifies the value of the Fórmula de aplicación de fechas de DCL field.';
            DataClassification = ToBeClassified;
        }
        field(108; "MSC"; Boolean)
        {
            Caption = 'MSC';
            ToolTip = 'Specifies the value of the MSC field.';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No. documento", "No. línea", "Seguimiento para trazabilidad")
        {
            Clustered = true;
        }
        key(Key2; "No. producto", "Lote origen")
        {
            SumIndexFields = Cantidad, "Kilos brutos", "Kilos netos";
        }
        key(Key3; Buque, Marea, "No. producto", "Lote origen")
        {
            SumIndexFields = Cantidad, "Kilos brutos", "Kilos netos";
        }
    }

    fieldgroups
    {
    }

    var
        rstProducto: Record Item;
}

