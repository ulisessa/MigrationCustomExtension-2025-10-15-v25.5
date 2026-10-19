table 50576 "Temp Liq. Account Schedule Lin"
{

    fields
    {
        field(1; "Schedule Name"; Code[10])
        {
            Caption = 'Schedule Name';
            ToolTip = 'Specifies the value of the Schedule Name field.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            ToolTip = 'Specifies the value of the Line No field.';
        }
        field(3; "Row No."; Code[10])
        {
            Caption = 'Row No.';
            ToolTip = 'Specifies the value of the Row No field.';
        }
        field(4; Description; Text[80])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(5; Totaling; Text[250])
        {
            Caption = 'Totaling';
            ToolTip = 'Specifies the value of the Totaling field.';
        }
        field(6; "Totaling Type"; Option)
        {
            Caption = 'Totaling Type';
            ToolTip = 'Specifies the value of the Totaling Type field.';
            OptionMembers = "Posting Accounts","Total Accounts",Formula,,,"Set Base For Percent";
        }
        field(7; "New Page"; Boolean)
        {
            Caption = 'New Page';
            ToolTip = 'Specifies the value of the New Page field.';
        }
        field(16; Show; Option)
        {
            Caption = 'Show';
            ToolTip = 'Specifies the value of the Show field.';
            OptionMembers = Yes,No,"If Any Column Not Zero","When Positive Balance","When Negative Balance";
        }
        field(19; "Dimension 1 Totaling"; Text[80])
        {
            Caption = 'Dimension 1 Totaling';
            ToolTip = 'Specifies the value of the Dimension 1 Totaling field.';
        }
        field(20; "Dimension 2 Totaling"; Text[80])
        {
            Caption = 'Dimension 2 Totaling';
            ToolTip = 'Specifies the value of the Dimension 2 Totaling field.';
        }
        field(21; "Dimension 3 Totaling"; Text[80])
        {
            Caption = 'Dimension 3 Totaling';
            ToolTip = 'Specifies the value of the Dimension 3 Totaling field.';
        }
        field(22; "Dimension 4 Totaling"; Text[80])
        {
            Caption = 'Dimension 4 Totaling';
            ToolTip = 'Specifies the value of the Dimension 4 Totaling field.';
        }
        field(23; Bold; Boolean)
        {
            Caption = 'Bold';
            ToolTip = 'Specifies the value of the Bold field.';
        }
        field(24; Italic; Boolean)
        {
            Caption = 'Italic';
            ToolTip = 'Specifies the value of the Italic field.';
        }
        field(25; Underline; Boolean)
        {
            Caption = 'Underline';
            ToolTip = 'Specifies the value of the Underline field.';
        }
        field(26; "Show Opposite Sign"; Boolean)
        {
            Caption = 'Show Opposite Sign';
            ToolTip = 'Specifies the value of the Show Opposite Sign field.';
        }
        field(27; "Row Type"; Option)
        {
            Caption = 'Row Type';
            ToolTip = 'Specifies the value of the Row Type field.';
            OptionMembers = "Net Change","Balance at Date","Beginning Balance";
        }
        field(28; "Amount Type"; Option)
        {
            Caption = 'Amount Type';
            ToolTip = 'Specifies the value of the Amount Type field.';
            OptionMembers = "Net Amount","Debit Amount","Credit Amount";
        }
    }

    keys
    {
        key(Key1; "Schedule Name", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

