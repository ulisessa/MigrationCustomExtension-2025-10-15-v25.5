tableextension 51344 tableextension51344 extends "Standard Task Quality Measure"
{
    Caption = 'Standard Task Quality Measure';
    fields
    {
        modify("Standard Task Code")
        {
            Caption = 'Standard Task Code';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Qlty Measure Code")
        {
            Caption = 'Qlty Measure Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Min. Value")
        {
            Caption = 'Min. Value';
        }
        modify("Max. Value")
        {
            Caption = 'Max. Value';
        }
    }
}

