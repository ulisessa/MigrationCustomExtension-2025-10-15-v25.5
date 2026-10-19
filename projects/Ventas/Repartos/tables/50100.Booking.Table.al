table 50107 Booking
{
    Caption = 'Booking';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Carrier Booking Ref."; Code[50])
        {
            Caption = 'Carrier Booking Ref.';
            ToolTip = 'Specifies the value of the Carrier Booking Ref field.';
        }
        field(2; "Carrier Booking Req. Ref."; Code[50])
        {
            Caption = 'Carrier Booking Req. Ref.';
            ToolTip = 'Specifies the value of the Carrier Booking Req. Ref field.';
        }
        field(3; "Booking Status"; Code[20])
        {
            Caption = 'Booking Status';
            ToolTip = 'Specifies the value of the Booking Status field.';
        }
        field(4; "Service Contract Ref."; Code[50])
        {
            Caption = 'Service Contract Ref.';
            ToolTip = 'Specifies the value of the Service Contract Ref field.';
        }
        field(5; "Product Code"; Code[30])
        {
            Caption = 'Product Code';
            ToolTip = 'Specifies the value of the Product Code field.';
        }
        field(6; "Version Id"; Code[20])
        {
            Caption = 'Version Id';
            ToolTip = 'Specifies the value of the Version Id field.';
        }
        field(7; "Created At (UTC)"; DateTime)
        {
            Caption = 'Created At (UTC)';
            ToolTip = 'Specifies the value of the Created At (UTC) field.';
        }
        field(8; "Last Retrieved (UTC)"; DateTime)
        {
            Caption = 'Last Retrieved (UTC)';
            ToolTip = 'Specifies the value of the Last Retrieved (UTC) field.';
        }
        field(30; "Place of Receipt Code"; Code[20])
        {
            Caption = 'Place of Receipt Code';
            ToolTip = 'Specifies the value of the Place of Receipt Code field.';
        }
        field(31; "Place of Receipt Name"; Text[100])
        {
            Caption = 'Place of Receipt Name';
            ToolTip = 'Specifies the value of the Place of Receipt Name field.';
        }
        field(32; "Place of Delivery Code"; Code[20])
        {
            Caption = 'Place of Delivery Code';
            ToolTip = 'Specifies the value of the Place of Delivery Code field.';
        }
        field(33; "Place of Delivery Name"; Text[100])
        {
            Caption = 'Place of Delivery Name';
            ToolTip = 'Specifies the value of the Place of Delivery Name field.';
        }
        field(34; "Port of Loading"; Code[10])
        {
            Caption = 'Port of Loading';
            ToolTip = 'Specifies the value of the Port of Loading field.';
        }
        field(35; "Port of Discharge"; Code[10])
        {
            Caption = 'Port of Discharge';
            ToolTip = 'Specifies the value of the Port of Discharge field.';
        }
        field(90; "Raw Response JSON"; Blob)
        {
            Caption = 'Raw Response JSON';
            ToolTip = 'Specifies the value of the Raw Response JSON field.';
        }
        field(91; "ETag/Version"; Text[80])
        {
            Caption = 'ETag/Version';
            ToolTip = 'Specifies the value of the ETag/Version field.';
        }
        field(92; "Source API Base URL"; Text[250])
        {
            Caption = 'Source API Base URL';
            ToolTip = 'Specifies the value of the Source API Base URL field.';
        }
    }
    keys
    {
        key(PK; "Carrier Booking Ref.")
        {
            Clustered = true;
        }
    }
}
