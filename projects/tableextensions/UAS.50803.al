tableextension 50803 tableextension50803 extends "Maintenance Ledger Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("G/L Entry No.")
        {
            Caption = 'G/L Entry No.';
        }
        modify("FA No.")
        {
            Caption = 'FA No.';
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
        modify("FA No./Budgeted FA No.")
        {
            Caption = 'FA No./Budgeted FA No.';
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
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Transaction No.")
        {
            Caption = 'Transaction No.';
        }
        modify("FA Class Code")
        {
            Caption = 'FA Class Code';
        }
        modify("Depreciation Book Code")
        {
            Caption = 'Depreciation Book Code';
        }
        modify("Maintenance Code")
        {
            Caption = 'Maintenance Code';
        }
        modify(Correction)
        {
            Caption = 'Correction';
        }
        modify("Automatic Entry")
        {
            Caption = 'Automatic Entry';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
        }
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
        }
        modify("Use Tax")
        {
            Caption = 'Use Tax';
        }
        modify("Reversed by Entry No.")
        {
            Caption = 'Reversed by Entry No.';
        }
        modify("Reversed Entry No.")
        {
            Caption = 'Reversed Entry No.';
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

