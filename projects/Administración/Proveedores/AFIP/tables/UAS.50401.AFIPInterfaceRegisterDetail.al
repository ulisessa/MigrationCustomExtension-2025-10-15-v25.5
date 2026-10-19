table 50401 "AFIP Interface Register detail"
{

    fields
    {
        field(1; "Entry no."; Integer)
        {
            Caption = 'No. mov.';
            ToolTip = 'Specifies the value of the No. mov field.';
            DataClassification = ToBeClassified;
        }
        field(2; "Date and Time"; DateTime)
        {
            Caption = 'Date and Time';
            ToolTip = 'Specifies the value of the Date and Time field.';
            DataClassification = ToBeClassified;
        }
        field(3; Time; Time)
        {
            Caption = 'Time';
            ToolTip = 'Specifies the value of the Time field.';
            DataClassification = ToBeClassified;
        }
        field(4; "User ID"; Code[50])
        {
            Caption = 'User ID';
            ToolTip = 'Specifies the value of the User ID field.';
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
                //++ArbuUserMgt.LookupUserID("User ID");
            end;
        }
        field(5; "Table No."; Integer)
        {
            Caption = 'Table No.';
            ToolTip = 'Specifies the value of the Table No field.';
            DataClassification = ToBeClassified;
            TableRelation = AllObj."Object ID" WHERE("Object Type" = CONST(Table));
        }
        field(6; "Table Caption"; Text[250])
        {
            CalcFormula = Lookup(AllObjWithCaption."Object Caption" WHERE("Object Type" = CONST(Table),
                                                                           "Object ID" = FIELD("Table No.")));
            Caption = 'Table Caption';
            ToolTip = 'Specifies the value of the Table Caption field.';
            FieldClass = FlowField;
        }
        field(7; "Field No."; Integer)
        {
            Caption = 'Field No.';
            ToolTip = 'Specifies the value of the Field No field.';
            DataClassification = ToBeClassified;
            TableRelation = Field."No." WHERE(TableNo = FIELD("Table No."));
        }
        field(8; "Field Caption"; Text[80])
        {
            CalcFormula = Lookup(Field."Field Caption" WHERE(TableNo = FIELD("Table No."),
                                                              "No." = FIELD("Field No.")));
            Caption = 'Field Caption';
            ToolTip = 'Specifies the value of the Field Caption field.';
            FieldClass = FlowField;
        }
        field(9; "Type of Change"; Option)
        {
            Caption = 'Type of Change';
            ToolTip = 'Specifies the value of the Type of Change field.';
            DataClassification = ToBeClassified;
            OptionCaption = 'Insertion,Modification,Deletion,"No change"';
            OptionMembers = Insertion,Modification,Deletion,"No change";
        }
        field(10; "Old Value"; Text[250])
        {
            Caption = 'Old Value';
            ToolTip = 'Specifies the value of the Old Value field.';
            DataClassification = ToBeClassified;
        }
        field(11; "New Value"; Text[250])
        {
            Caption = 'New Value';
            ToolTip = 'Specifies the value of the New Value field.';
            DataClassification = ToBeClassified;
        }
        field(12; "Clave registro"; Text[250])
        {
            Caption = 'Clave registro';
            ToolTip = 'Specifies the value of the Clave registro field.';
            DataClassification = ToBeClassified;
        }
        field(100; "Register entry no."; Integer)
        {
            Caption = 'Log Entry No.';
            ToolTip = 'Specifies the value of the Log Entry No field.';
            DataClassification = ToBeClassified;
            TableRelation = "AFIP Interface Register"."Entry no." WHERE("Entry no." = FIELD("Entry no."));
        }
        field(101; "Imported document entry no."; Integer)
        {
            Caption = 'No. mov. documento importado';
            ToolTip = 'Specifies the value of the No. mov. documento importado field.';
            DataClassification = ToBeClassified;
            TableRelation = "Documentos digitalizados".Linea WHERE(Linea = FIELD("Imported document entry no."));
        }
        field(102; Ommit; Boolean)
        {
            Caption = 'Omitir';
            ToolTip = 'Specifies the value of the Omitir field.';
            DataClassification = ToBeClassified;
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
