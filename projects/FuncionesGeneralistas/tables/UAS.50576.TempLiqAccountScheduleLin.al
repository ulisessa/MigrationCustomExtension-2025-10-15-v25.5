table 50576 "Temp Liq. Account Schedule Lin"
{

    fields
    {
        field(1; "Schedule Name"; Code[10])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Row No."; Code[10])
        {
        }
        field(4; Description; Text[80])
        {
        }
        field(5; Totaling; Text[250])
        {
        }
        field(6; "Totaling Type"; Option)
        {
            OptionMembers = "Posting Accounts","Total Accounts",Formula,,,"Set Base For Percent";
        }
        field(7; "New Page"; Boolean)
        {
        }
        field(16; Show; Option)
        {
            OptionMembers = Yes,No,"If Any Column Not Zero","When Positive Balance","When Negative Balance";
        }
        field(19; "Dimension 1 Totaling"; Text[80])
        {
        }
        field(20; "Dimension 2 Totaling"; Text[80])
        {
        }
        field(21; "Dimension 3 Totaling"; Text[80])
        {
        }
        field(22; "Dimension 4 Totaling"; Text[80])
        {
        }
        field(23; Bold; Boolean)
        {
        }
        field(24; Italic; Boolean)
        {
        }
        field(25; Underline; Boolean)
        {
        }
        field(26; "Show Opposite Sign"; Boolean)
        {
        }
        field(27; "Row Type"; Option)
        {
            OptionMembers = "Net Change","Balance at Date","Beginning Balance";
        }
        field(28; "Amount Type"; Option)
        {
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

