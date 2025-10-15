table 50563 "Mov. remitos"
{


    fields
    {
        field(1; "No. documento"; Code[20])
        {
        }
        field(2; "No. línea"; Integer)
        {
        }
        field(3; "No. producto"; Code[20])
        {
            TableRelation = Item."No.";
        }
        field(4; Lote; Code[30])
        {
            TableRelation = "Item Ledger Entry" WHERE("Lot No." = FIELD(Lote));
        }
        field(5; Cantidad; Decimal)
        {
        }
        field(6; "Kilos brutos"; Decimal)
        {
        }
        field(7; "Kilos netos"; Decimal)
        {
        }
        field(8; "Lote origen"; Code[20])
        {
        }
        field(9; Buque; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(10; Marea; Code[10])
        {

        }
        field(11; "Cód. depósito"; Code[10])
        {
            TableRelation = Location;
        }
        field(12; "Cód. caja"; Code[10])
        {
        }
        field(13; "Puerto/Aeropuerto"; Code[10])
        {
            TableRelation = "Entry/Exit Point";
        }
        field(14; "No. pallet"; Code[10])
        {
        }
        field(104; "No. reparto"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(105; "Linea reparto"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(106; "Seguimiento para trazabilidad"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Post-Expo - Controlar contra DCL","No controlar contra DCL","Pre-Expo - Controlar contra DCL";
        }
        field(107; "DCL application date formula"; Text[30])
        {
            Caption = 'Fórmula de aplicación de fechas de DCL';
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

