table 50540 "General Translation"
{
    Caption = 'General translation';
    DataPerCompany = false;

    fields
    {
        field(1; "Object Type"; Option)
        {
            Caption = 'Object Type';
            ToolTip = 'Specifies the value of the Object Type field.';
            OptionCaption = 'Tabla';
            OptionMembers = "Table";
        }
        field(2; "Object ID"; Integer)
        {
            Caption = 'Object ID';
            ToolTip = 'Specifies the value of the Object ID field.';
            NotBlank = true;
        }
        field(3; "Language ID"; Code[10])
        {
            Caption = 'Language ID';
            ToolTip = 'Specifies the value of the Language ID field.';
            TableRelation = Language;
        }
        field(4; "No."; Code[10])
        {
            Caption = 'No.';
            ToolTip = 'Specifies the value of the No field.';
            DataClassification = ToBeClassified;
        }
        field(5; "Name/Desciption"; Text[250])
        {
            Caption = 'Object Name';
            ToolTip = 'Specifies the value of the Object Name field.';
        }
    }

    keys
    {
        key(Key1; "Object Type", "Object ID", "Language ID", "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

