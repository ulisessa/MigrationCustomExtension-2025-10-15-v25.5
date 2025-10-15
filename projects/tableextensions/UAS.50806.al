tableextension 50806 tableextension50806 extends "Ins. Coverage Ledger Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Insurance No.")
        {
            Caption = 'Insurance No.';
        }
        modify("FA No.")
        {
            Caption = 'FA No.';
        }
        modify("FA Description")
        {
            Caption = 'FA Description';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("FA Class Code")
        {
            Caption = 'FA Class Code';
        }
        modify("FA Subclass Code")
        {
            Caption = 'FA Subclass Code';
        }
        modify("FA Location Code")
        {
            Caption = 'FA Location Code';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            CaptionClass = '1,2,3';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            CaptionClass = '1,2,5';

        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            CaptionClass = '1,2,6';


            trigger OnValidate()
            begin
                //IBdos Argentina - USS - 240603 - Inicio Modificación Arbumasa
                //Sólo puede modificar un usuario del mismo grupo de seguridad
            end;
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';

        }
    }
}

