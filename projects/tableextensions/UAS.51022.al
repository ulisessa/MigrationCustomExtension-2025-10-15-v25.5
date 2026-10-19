tableextension 51022 tableextension51022 extends "BG/PO Post. Buffer"
{
    fields
    {
        modify("Gain - Loss Amount (LCY)")
        {
            Caption = 'Gain - Loss Amount (LCY)';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        field(50000; "Global dimension 3 Code"; Code[10])
        {
            Caption = 'Global dimension 3 Code';
            ToolTip = 'Specifies the value of the Global dimension 3 Code field.';
            CaptionClass = '1,2,3';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
            CaptionClass = '1,2,5';

        }
        field(50003; "Global dimension 6 Code"; Code[10])
        {
            Caption = 'Global dimension 6 Code';
            ToolTip = 'Specifies the value of the Global dimension 6 Code field.';
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';

        }
    }
}

