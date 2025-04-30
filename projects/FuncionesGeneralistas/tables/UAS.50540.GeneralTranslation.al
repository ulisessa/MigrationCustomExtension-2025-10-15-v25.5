table 50540 "General Translation"
{
    Caption = 'General translation';
    DataPerCompany = false;

    fields
    {
        field(1; "Object Type"; Option)
        {
            Caption = 'Object Type';
            OptionCaption = 'Tabla';
            OptionMembers = "Table";
        }
        field(2; "Object ID"; Integer)
        {
            Caption = 'Object ID';
            NotBlank = true;
        }
        field(3; "Language ID"; Code[10])
        {
            Caption = 'Language ID';
            TableRelation = Language;
        }
        field(4; "No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Name/Desciption"; Text[250])
        {
            Caption = 'Object Name';
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

