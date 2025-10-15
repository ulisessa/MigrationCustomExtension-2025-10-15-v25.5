table 50572 "DCL Application Lines temp"
{


    fields
    {
        field(1; "Entry no."; Integer)
        {
            Caption = 'No. movimiento';
        }
        field(2; "DCL Job no."; Code[20])
        {
            Caption = 'No. proyecto DCL';
            DataClassification = ToBeClassified;
            TableRelation = Job WHERE(Tipo = CONST(Productivo),
                                       Blocked = CONST(" "));


        }
        field(3; "DCL Line no."; Integer)
        {
            Caption = 'No. línea DCL';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(4; "Item entry no."; Integer)
        {
            Caption = 'No. mov. producto';
            DataClassification = ToBeClassified;
            TableRelation = "Item Ledger Entry" WHERE("Entry No." = FIELD("Item entry no."));
        }
        field(5; "Net kilos"; Decimal)
        {
            Caption = 'Kilos netos';
            DataClassification = ToBeClassified;
        }
        field(6; "Origin kilos"; Decimal)
        {
            Caption = 'Kilos de origen';
            DataClassification = ToBeClassified;
        }
        field(7; "Average"; Decimal)
        {
            Caption = 'Promedio';
            DataClassification = ToBeClassified;
        }
        field(8; "Permiso de embarque"; Code[30])
        {
            Caption = 'Permiso de embarque';
        }
        field(9; "Production no."; Code[20])
        {
            Caption = 'No. producción';
            DataClassification = ToBeClassified;

        }
        field(10; "Container no."; Code[20])
        {
            CalcFormula = Lookup("Sales Shipment Header"."Cód. Contenedor" WHERE("No." = FIELD("Applied document no.")));
            Caption = 'Cód. contenedor';
            FieldClass = FlowField;
        }
        field(50000; "Applied job no."; Code[20])
        {
            Caption = 'No. proyecto aplicado';
            DataClassification = ToBeClassified;
            TableRelation = "Item Ledger Entry"."Job No." WHERE("Entry No." = FIELD("Item entry no."));
        }
        field(50001; "Applied document no."; Code[20])
        {
            Caption = 'No. documento aplicado';
            DataClassification = ToBeClassified;
        }
        field(50002; "Application type"; Option)
        {
            Caption = 'Tipo aplicación';
            DataClassification = ToBeClassified;
            OptionCaption = 'Producción,Ajuste,Reparto,Ajuste reparto';
            OptionMembers = "Producción",Ajuste,Reparto;
        }
        field(50003; "Item entry original lot"; Code[20])
        {
            CalcFormula = Lookup("Item Ledger Entry"."Lote origen" WHERE("Entry No." = FIELD("Item entry no.")));
            Caption = 'Lote origen aplicado';
            FieldClass = FlowField;
        }
        field(50004; "Item no."; Code[20])
        {
            Caption = 'No. producto';
            DataClassification = ToBeClassified;
            TableRelation = Item WHERE("No." = FIELD("Item no."));
        }
        field(50005; "Original Item no."; Code[20])
        {
            Caption = 'No. producto original';
            DataClassification = ToBeClassified;
            TableRelation = Item WHERE("No." = FIELD("Original Item no."));
        }
        field(50006; "Document date"; Date)
        {
            CalcFormula = Lookup("Item Ledger Entry"."Posting Date" WHERE("Entry No." = FIELD("Item entry no.")));
            Caption = 'Fecha documento';
            FieldClass = FlowField;
        }
        field(50007; "Line no."; Integer)
        {
            Caption = 'No. línea';
            DataClassification = ToBeClassified;
        }
        field(50008; Activity; Code[10])
        {
            Caption = 'Actividad';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
    }

    keys
    {
        key(Key1; "Entry no.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

