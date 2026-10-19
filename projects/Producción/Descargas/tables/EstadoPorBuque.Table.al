table 50112 "Vessel Status"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Vessel Code"; code[20])
        {
            Caption = 'Vessel Code';
            ToolTip = 'Specifies the value of the Vessel Code field.';
            NotBlank = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Status"; enum "Vessel Status")
        {
            Caption = 'Status';
            ToolTip = 'Specifies the value of the Status field.';
            DataClassification = ToBeClassified;
        }
        field(3; "Start Date"; Date)
        {
            Caption = 'Start Date';
            ToolTip = 'Specifies the value of the Start Date field.';
            NotBlank = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Vessel Code", Status, "Start Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}