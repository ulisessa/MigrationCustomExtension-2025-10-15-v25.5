table 50572 "DCL Application Lines temp"
{


    fields
    {
        field(1; "Entry no."; Integer)
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
        }
        field(2; "DCL Job no."; Code[20])
        {
            Caption = 'No. proyecto DCL';
            ToolTip = 'Specifies the value of the No. proyecto DCL field.';
            DataClassification = ToBeClassified;
            TableRelation = Job WHERE(Tipo = CONST(Productivo),
                                       Blocked = CONST(" "));


        }
        field(3; "DCL Line no."; Integer)
        {
            Caption = 'No. línea DCL';
            ToolTip = 'Specifies the value of the No. línea DCL field.';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(4; "Item entry no."; Integer)
        {
            Caption = 'No. mov. producto';
            ToolTip = 'Specifies the value of the No. mov. producto field.';
            DataClassification = ToBeClassified;
            TableRelation = "Item Ledger Entry" WHERE("Entry No." = FIELD("Item entry no."));
        }
        field(5; "Net kilos"; Decimal)
        {
            Caption = 'Kilos netos';
            ToolTip = 'Specifies the value of the Kilos netos field.';
            DataClassification = ToBeClassified;
        }
        field(6; "Origin kilos"; Decimal)
        {
            Caption = 'Kilos de origen';
            ToolTip = 'Specifies the value of the Kilos de origen field.';
            DataClassification = ToBeClassified;
        }
        field(7; "Average"; Decimal)
        {
            Caption = 'Promedio';
            ToolTip = 'Specifies the value of the Promedio field.';
            DataClassification = ToBeClassified;
        }
        field(8; "Permiso de embarque"; Code[30])
        {
            Caption = 'Boarding permission';
            ToolTip = 'Specifies the value of the Boarding permission field.';
        }
        field(9; "Production no."; Code[20])
        {
            Caption = 'No. producción';
            ToolTip = 'Specifies the value of the No. producción field.';
            DataClassification = ToBeClassified;

        }
        field(10; "Container no."; Code[20])
        {
            CalcFormula = Lookup("Sales Shipment Header"."Cód. Contenedor" WHERE("No." = FIELD("Applied document no.")));
            Caption = 'Cód. contenedor';
            ToolTip = 'Specifies the value of the Cód. contenedor field.';
            FieldClass = FlowField;
        }
        field(50000; "Applied job no."; Code[20])
        {
            Caption = 'No. proyecto aplicado';
            ToolTip = 'Specifies the value of the No. proyecto aplicado field.';
            DataClassification = ToBeClassified;
            TableRelation = "Item Ledger Entry"."Job No." WHERE("Entry No." = FIELD("Item entry no."));
        }
        field(50001; "Applied document no."; Code[20])
        {
            Caption = 'No. documento aplicado';
            ToolTip = 'Specifies the value of the No. documento aplicado field.';
            DataClassification = ToBeClassified;
        }
        field(50002; "Application type"; Option)
        {
            Caption = 'Tipo aplicación';
            ToolTip = 'Specifies the value of the Tipo aplicación field.';
            DataClassification = ToBeClassified;
            OptionCaption = 'Producción,Ajuste,Reparto,Ajuste reparto';
            OptionMembers = "Producción",Ajuste,Reparto;
        }
        field(50003; "Item entry original lot"; Code[20])
        {
            CalcFormula = Lookup("Item Ledger Entry"."Lote origen" WHERE("Entry No." = FIELD("Item entry no.")));
            Caption = 'Lote origen aplicado';
            ToolTip = 'Specifies the value of the Lote origen aplicado field.';
            FieldClass = FlowField;
        }
        field(50004; "Item no."; Code[20])
        {
            Caption = 'Item No.';
            ToolTip = 'Specifies the value of the Item No field.';
            DataClassification = ToBeClassified;
            TableRelation = Item WHERE("No." = FIELD("Item no."));
        }
        field(50005; "Original Item no."; Code[20])
        {
            Caption = 'No. producto original';
            ToolTip = 'Specifies the value of the No. producto original field.';
            DataClassification = ToBeClassified;
            TableRelation = Item WHERE("No." = FIELD("Original Item no."));
        }
        field(50006; "Document date"; Date)
        {
            CalcFormula = Lookup("Item Ledger Entry"."Posting Date" WHERE("Entry No." = FIELD("Item entry no.")));
            Caption = 'Fecha documento';
            ToolTip = 'Specifies the value of the Fecha documento field.';
            FieldClass = FlowField;
        }
        field(50007; "Line no."; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
            DataClassification = ToBeClassified;
        }
        field(50008; Activity; Code[10])
        {
            CaptionClass = '1,2,3';
            Caption = 'Actividad';
            ToolTip = 'Specifies the value of the Actividad field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
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

