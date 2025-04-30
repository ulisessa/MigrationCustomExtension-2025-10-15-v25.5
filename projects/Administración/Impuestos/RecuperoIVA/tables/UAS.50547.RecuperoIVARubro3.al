table 50547 "Recupero IVA Rubro 3"
{

    fields
    {
        field(1; "No. mov."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Regimen informado"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Completar con "1"';
            InitValue = 1;
        }
        field(3; "Tipo de documento"; Code[2])
        {
            Caption = 'Tipo de documento de exportación';
            DataClassification = ToBeClassified;
            Description = 'Según tabla de documentos de exportación';
        }
        field(4; "Numero de documento"; Code[20])
        {
            Caption = 'Número de documento';
            DataClassification = ToBeClassified;
            Description = 'Completar con ceros a la izquierda';
        }
        field(5; Item; Code[4])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Posicion Arancelaria"; Code[12])
        {
            Caption = 'Posición Arancelaria';
            DataClassification = ToBeClassified;
        }
        field(7; "Unidad de medida"; Code[2])
        {
            DataClassification = ToBeClassified;
            Description = 'Según tabla unidades de medida';
        }
        field(8; Cantidad; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = '9 enteros y 4 decimales (sin punto decimal)';
        }
        field(9; "Monto FOB en divisa origen"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = '13 enteros y 2 decimales (sin punto decimal)';
        }
        field(10; "Tipo de cambio"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = '4 enteros y 6 decimales (sin punto decimal)';
        }
        field(11; "Aduana de Registro"; Code[3])
        {
            DataClassification = ToBeClassified;
            Description = 'Según tabla de códigos de aduana';
        }
        field(12; "Aduana de Salida"; Code[3])
        {
            DataClassification = ToBeClassified;
            Description = 'Según tabla de códigos de aduana';
        }
        field(13; "Fecha Cumplido"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Fto.: AAAAMMDD';
        }
        field(14; "Expo o MI"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Expo,MI;
        }
        field(15; "Monto FOB en $"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Insumos importados"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; Proyecto; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(18; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(19; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(20; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(21; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(22; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
        }
        field(23; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));
        }
        field(24; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
        }
        field(25; "MI gravadas"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "MI no gravadas&flet&segur"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Ventas mercado interno no gravadas, con fletes y seguros de exportación';
        }
        field(100; "No. registro recupero IVA"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(101; "No. documento interno"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No. mov.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

