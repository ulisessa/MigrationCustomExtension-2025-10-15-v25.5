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
            Caption = 'Nombre libro diario';
            ToolTip = 'Specifies the value of the Nombre libro diario field.';
            TableRelation = "Gen. Journal Template";
        }
        field(50598; "Usuario Anulación"; Code[20])
        {
            Caption = 'Usuario Anulación';
            ToolTip = 'Specifies the value of the Usuario Anulación field.';
        }
        field(50599; Anulado; Boolean)
        {
            Caption = 'Anulado';
            ToolTip = 'Specifies the value of the Anulado field.';
        }
    }
}

