tableextension 50491 tableextension50491 extends "Dimension Code Amount Buffer"
{
    Caption = 'Dimension Code Amount Buffer';
    fields
    {
        modify("Line Code")
        {
            Caption = 'Line Code';
        }
        modify("Column Code")
        {
            Caption = 'Column Code';
        }
    }
}

