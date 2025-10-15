tableextension 50270 "G/L Account Where-Used Ext." extends "G/L Account Where-Used"
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

