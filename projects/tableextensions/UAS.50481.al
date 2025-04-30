tableextension 50481 tableextension50481 extends "Analysis View Budget Entry"
{
    Caption = 'Analysis View Budget Entry';
    fields
    {
        modify("Analysis View Code")
        {
            Caption = 'Analysis View Code';
        }
        modify("Business Unit Code")
        {
            Caption = 'Business Unit Code';
        }
        modify("G/L Account No.")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'G/L Account No.';
        }
        modify("Dimension 1 Value Code")
        {
            Caption = 'Dimension 1 Value Code';
        }
        modify("Dimension 2 Value Code")
        {
            Caption = 'Dimension 2 Value Code';
        }
        modify("Dimension 3 Value Code")
        {
            Caption = 'Dimension 3 Value Code';
        }
        modify("Dimension 4 Value Code")
        {
            Caption = 'Dimension 4 Value Code';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Old G/L Account No.")
        {
            Caption = 'Old G/L Account No.';
        }
    }
}

