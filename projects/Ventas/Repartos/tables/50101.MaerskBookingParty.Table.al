table 50108 "Maersk Booking Party"
{
    Caption = 'Maersk Booking Party';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            ToolTip = 'Specifies the value of the Entry No field.';
            AutoIncrement = true;
        }
        field(2; "Carrier Booking Ref."; Code[50])
        {
            Caption = 'Carrier Booking Ref.';
            ToolTip = 'Specifies the value of the Carrier Booking Ref field.';
        }
        field(3; "Role Code"; Code[10])
        {
            Caption = 'Role Code';
            ToolTip = 'Specifies the value of the Role Code field.';
        }
        field(4; "Party Key"; Code[50])
        {
            Caption = 'Party Key';
            ToolTip = 'Specifies the value of the Party Key field.';
        }
        field(40; "Party Name"; Text[100])
        {
            Caption = 'Party Name';
            ToolTip = 'Specifies the value of the Party Name field.';
        }
        field(41; "Party Id (Carrier)"; Text[50])
        {
            Caption = 'Party Id (Carrier)';
            ToolTip = 'Specifies the value of the Party Id (Carrier) field.';
        }
        field(42; "Tax/Reg Id"; Text[30])
        {
            Caption = 'Tax/Reg Id';
            ToolTip = 'Specifies the value of the Tax/Reg Id field.';
        }
        field(43; "Country Code"; Code[2])
        {
            Caption = 'Country Code';
            ToolTip = 'Specifies the value of the Country Code field.';
        }
        field(44; City; Text[50])
        {
            Caption = 'City';
            ToolTip = 'Specifies the value of the City field.';
        }
        field(45; "Address Line 1"; Text[100])
        {
            Caption = 'Address Line 1';
            ToolTip = 'Specifies the value of the Address Line 1 field.';
        }
        field(46; "Address Line 2"; Text[100])
        {
            Caption = 'Address Line 2';
            ToolTip = 'Specifies the value of the Address Line 2 field.';
        }
        field(47; "Contact Name"; Text[80])
        {
            Caption = 'Contact Name';
            ToolTip = 'Specifies the value of the Contact Name field.';
        }
        field(48; "Contact Email"; Text[100])
        {
            Caption = 'Contact Email';
            ToolTip = 'Specifies the value of the Contact Email field.';
        }
        field(49; "Contact Phone"; Text[40])
        {
            Caption = 'Contact Phone';
            ToolTip = 'Specifies the value of the Contact Phone field.';
        }
        field(90; "Source Hash"; Text[88])
        {
            Caption = 'Source Hash';
            ToolTip = 'Specifies the value of the Source Hash field.';
        }
        field(91; "Inserted (UTC)"; DateTime)
        {
            Caption = 'Inserted (UTC)';
            ToolTip = 'Specifies the value of the Inserted (UTC) field.';
        }
        field(92; "Modified (UTC)"; DateTime)
        {
            Caption = 'Modified (UTC)';
            ToolTip = 'Specifies the value of the Modified (UTC) field.';
        }
        field(93; "Is Deleted"; Boolean)
        {
            Caption = 'Is Deleted';
            ToolTip = 'Specifies the value of the Is Deleted field.';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key("Carrier Booking Ref."; "Role Code", "Party Key")
        {
        }
        key(ByBooking; "Carrier Booking Ref.") { }
        key(ByRole; "Carrier Booking Ref.", "Role Code") { }
    }
}
