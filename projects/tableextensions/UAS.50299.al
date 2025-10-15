tableextension 50299 tableextension50299 extends "Res. Ledger Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Resource No.")
        {
            Caption = 'Resource No.';
        }
        modify("Resource Group No.")
        {
            Caption = 'Resource Group No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Work Type Code")
        {
            Caption = 'Work Type Code';
        }
        modify("Job No.")
        {
            Caption = 'Job No.';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
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
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("Source No.")
        {
            TableRelation = IF ("Source Type" = CONST(Customer)) Customer."No."
            ELSE
            IF ("Source Type" = CONST(Vendor)) Vendor."No.";
            Caption = 'Source No.';
        }
        modify("Order No.")
        {
            Caption = 'Order No.';
        }
        modify("Order Line No.")
        {
            Caption = 'Order Line No.';
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
        field(50003; "Global Dimension 6 Code"; Code[20])
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
        field(50005; "Document line no."; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
}

