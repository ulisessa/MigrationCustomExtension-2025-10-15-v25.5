tableextension 50270 tableextension50270 extends "G/L Account Where-Used"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify(Line)
        {
            Caption = 'Line';
        }
        modify("G/L Account No.")
        {
            Caption = 'G/L Account No.';
        }
    }
}

