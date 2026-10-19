table 50573 "Temp Liq. Journal Template"
{

    fields
    {
        field(1; Name; Code[10])
        {
            Caption = 'Name';
            ToolTip = 'Specifies the value of the Name field.';
        }
        field(2; Description; Text[80])
        {
            Caption = 'Description';
            ToolTip = 'Specifies the value of the Description field.';
        }
        field(5; "Test Report ID"; Integer)
        {
            Caption = 'Test Report ID';
            ToolTip = 'Specifies the value of the Test Report ID field.';
        }
        field(6; "Form ID"; Integer)
        {
            Caption = 'Form ID';
            ToolTip = 'Specifies the value of the Form ID field.';
        }
        field(7; "Posting Report ID"; Integer)
        {
            Caption = 'Posting Report ID';
            ToolTip = 'Specifies the value of the Posting Report ID field.';
        }
        field(8; "Force Posting Report"; Boolean)
        {
            Caption = 'Force Posting Report';
            ToolTip = 'Specifies the value of the Force Posting Report field.';
        }
        field(10; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            ToolTip = 'Specifies the value of the Source Code field.';
        }
        field(11; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            ToolTip = 'Specifies the value of the Reason Code field.';
        }
        field(12; Recurring; Boolean)
        {
            Caption = 'Recurring';
            ToolTip = 'Specifies the value of the Recurring field.';
        }
        field(13; "Test Report Name"; Text[30])
        {
            Caption = 'Test Report Name';
            ToolTip = 'Specifies the value of the Test Report Name field.';
        }
        field(14; "Form Name"; Text[30])
        {
            Caption = 'Form Name';
            ToolTip = 'Specifies the value of the Form Name field.';
        }
        field(15; "Posting Report Name"; Text[30])
        {
            Caption = 'Posting Report Name';
            ToolTip = 'Specifies the value of the Posting Report Name field.';
        }
        field(16; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            ToolTip = 'Specifies the value of the No. Series field.';
        }
        field(17; "Posting No. Series"; Code[10])
        {
            Caption = 'Posting No. Series';
            ToolTip = 'Specifies the value of the Posting No. Series field.';
        }
    }

    keys
    {
        key(Key1; Name)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

