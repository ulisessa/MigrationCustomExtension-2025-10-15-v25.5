table 50547 "Recupero IVA Rubro 3"
{

    fields
    {
        field(1; "No. mov."; Integer)
        {
            Caption = 'No. mov.';
            ToolTip = 'Specifies the value of the No. mov field.';
            DataClassification = ToBeClassified;
        }
        field(2; "Regimen informado"; Integer)
        {
            Caption = 'Regimen informado';
            ToolTip = 'Specifies the value of the Regimen informado field.';
            DataClassification = ToBeClassified;
            Description = 'Completar con "1"';
            InitValue = 1;
        }
        field(3; "Tipo de documento"; Code[2])
        {
            Caption = 'Tipo de documento de exportación';
            ToolTip = 'Specifies the value of the Tipo de documento de exportación field.';
            DataClassification = ToBeClassified;
            Description = 'Según tabla de documentos de exportación';
        }
        field(4; "Numero de documento"; Code[20])
        {
            Caption = 'Número de documento';
            ToolTip = 'Specifies the value of the Número de documento field.';
            DataClassification = ToBeClassified;
            Description = 'Completar con ceros a la izquierda';
        }
        field(5; Item; Code[4])
        {
            Caption = 'Item';
            ToolTip = 'Specifies the value of the Item field.';
            DataClassification = ToBeClassified;
        }
        field(6; "Posicion Arancelaria"; Code[12])
        {
            Caption = 'Posición Arancelaria';
            ToolTip = 'Specifies the value of the Posición Arancelaria field.';
            DataClassification = ToBeClassified;
        }
        field(7; "Unidad de medida"; Code[2])
        {
            Caption = 'Unidad de medida';
            ToolTip = 'Specifies the value of the Unidad de medida field.';
            DataClassification = ToBeClassified;
            Description = 'Según tabla unidades de medida';
        }
        field(8; Cantidad; Decimal)
        {
            Caption = 'Quantity';
            ToolTip = 'Specifies the value of the Quantity field.';
            DataClassification = ToBeClassified;
            Description = '9 enteros y 4 decimales (sin punto decimal)';
        }
        field(9; "Monto FOB en divisa origen"; Decimal)
        {
            Caption = 'Monto FOB en divisa origen';
            ToolTip = 'Specifies the value of the Monto FOB en divisa origen field.';
            DataClassification = ToBeClassified;
            Description = '13 enteros y 2 decimales (sin punto decimal)';
        }
        field(10; "Tipo de cambio"; Decimal)
        {
            Caption = 'Type of Change';
            ToolTip = 'Specifies the value of the Type of Change field.';
            DataClassification = ToBeClassified;
            Description = '4 enteros y 6 decimales (sin punto decimal)';
        }
        field(11; "Aduana de Registro"; Code[3])
        {
            Caption = 'Aduana de Registro';
            ToolTip = 'Specifies the value of the Aduana de Registro field.';
            DataClassification = ToBeClassified;
            Description = 'Según tabla de códigos de aduana';
        }
        field(12; "Aduana de Salida"; Code[3])
        {
            Caption = 'Aduana de Salida';
            ToolTip = 'Specifies the value of the Aduana de Salida field.';
            DataClassification = ToBeClassified;
            Description = 'Según tabla de códigos de aduana';
        }
        field(13; "Fecha Cumplido"; Date)
        {
            Caption = 'Fecha Cumplido';
            ToolTip = 'Specifies the value of the Fecha Cumplido field.';
            DataClassification = ToBeClassified;
            Description = 'Fto.: AAAAMMDD';
        }
        field(14; "Expo o MI"; Option)
        {
            Caption = 'Expo o MI';
            ToolTip = 'Specifies the value of the Expo o MI field.';
            DataClassification = ToBeClassified;
            OptionMembers = Expo,MI;
        }
        field(15; "Monto FOB en $"; Decimal)
        {
            Caption = 'Monto FOB en $';
            ToolTip = 'Specifies the value of the Monto FOB en $ field.';
            DataClassification = ToBeClassified;
        }
        field(16; "Insumos importados"; Decimal)
        {
            Caption = 'Insumos importados';
            ToolTip = 'Specifies the value of the Insumos importados field.';
            DataClassification = ToBeClassified;
        }
        field(17; Proyecto; Code[20])
        {
            Caption = 'Proyecto';
            ToolTip = 'Specifies the value of the Proyecto field.';
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(18; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(19; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(20; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';

        }
        field(21; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';

        }
        field(22; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';

        }
        field(23; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';

        }
        field(24; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';

        }
        field(25; "MI gravadas"; Decimal)
        {
            Caption = 'MI gravadas';
            ToolTip = 'Specifies the value of the MI gravadas field.';
            DataClassification = ToBeClassified;
        }
        field(26; "MI no gravadas&flet&segur"; Decimal)
        {
            Caption = 'MI no gravadas&flet&segur';
            ToolTip = 'Specifies the value of the MI no gravadas&flet&segur field.';
            DataClassification = ToBeClassified;
            Description = 'Ventas mercado interno no gravadas, con fletes y seguros de exportación';
        }
        field(100; "No. registro recupero IVA"; Integer)
        {
            Caption = 'No. registro recupero IVA';
            ToolTip = 'Specifies the value of the No. registro recupero IVA field.';
            DataClassification = ToBeClassified;
        }
        field(101; "No. documento interno"; Code[20])
        {
            Caption = 'No. documento interno';
            ToolTip = 'Specifies the value of the No. documento interno field.';
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

