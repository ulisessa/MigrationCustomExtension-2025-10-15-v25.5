tableextension 201 "Resource Price" extends "Resource Price" //OriginalId
{
    fields
    {
        field(50000; "Cust. price group"; Code[10])
        {
            Caption = 'Grupo precio cliente';
            ToolTip = 'Specifies the value of the Grupo precio cliente field.';
            DataClassification = ToBeClassified;
            TableRelation = "Customer Price Group".Code;
        }
        field(50001; "From date"; Date)
        {
            Caption = 'Desde fecha';
            ToolTip = 'Specifies the value of the Desde fecha field.';
            DataClassification = ToBeClassified;
        }
        field(50002; "To date"; Date)
        {
            Caption = 'Hasta fecha';
            ToolTip = 'Specifies the value of the Hasta fecha field.';
            DataClassification = ToBeClassified;
        }
        field(50003; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            ToolTip = 'Specifies the value of the Dimension Set ID field.';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(50004; "Item Category Code"; Code[10])
        {
            Caption = 'Item Category Code';
            ToolTip = 'Specifies the value of the Item Category Code field.';
            TableRelation = "Item Category";
        }
        field(50005; Name; Text[100])
        {
            Caption = 'Name';
            ToolTip = 'Specifies the value of the Name field.';
            CalcFormula = Lookup(Resource.Name WHERE("No." = FIELD(Code)));
            FieldClass = FlowField;
        }
        field(50100; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50101; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50102; "Shortcut Dimension 3 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
            DataClassification = ToBeClassified;

        }
        field(50103; "Shortcut Dimension 4 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
            DataClassification = ToBeClassified;

        }
        field(50104; "Shortcut Dimension 5 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
            DataClassification = ToBeClassified;

        }
        field(50105; "Shortcut Dimension 6 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
            DataClassification = ToBeClassified;

        }
        field(50106; "Shortcut Dimension 7 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
            DataClassification = ToBeClassified;

        }
    }
}