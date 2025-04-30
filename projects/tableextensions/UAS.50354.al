tableextension 50354 tableextension50354 extends "Job Register"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("From Entry No.")
        {
            Caption = 'From Entry No.';
        }
        modify("To Entry No.")
        {
            Caption = 'To Entry No.';
        }
        modify("Creation Date")
        {
            Caption = 'Creation Date';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Creation Time")
        {
            Caption = 'Creation Time';
        }
        field(50505; "Nombre libro diario"; Code[10])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(50598; "Usuario Anulación"; Code[20])
        {
        }
        field(50599; Anulado; Boolean)
        {
        }
    }
}

