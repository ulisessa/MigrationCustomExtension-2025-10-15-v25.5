tableextension 50906 tableextension50906 extends "Service Ledger Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Service Contract No.")
        {
            Caption = 'Service Contract No.';
        }
        modify("Serv. Contract Acc. Gr. Code")
        {
            Caption = 'Serv. Contract Acc. Gr. Code';
        }
        modify("Document Line No.")
        {
            Caption = 'Document Line No.';
        }
        modify("Customer No.")
        {
            Caption = 'Customer No.';
        }
        modify("Ship-to Code")
        {
            Caption = 'Ship-to Code';
        }
        modify("Item No. (Serviced)")
        {
            Caption = 'Item No. (Serviced)';
        }
        modify("Serial No. (Serviced)")
        {
            Caption = 'Serial No. (Serviced)';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Service Item No. (Serviced)")
        {
            Caption = 'Service Item No. (Serviced)';
        }
        modify("Variant Code (Serviced)")
        {
            Caption = 'Variant Code (Serviced)';
        }
        modify("Contract Group Code")
        {
            Caption = 'Contract Group Code';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Bill-to Customer No.")
        {
            Caption = 'Bill-to Customer No.';
        }
        modify("Fault Reason Code")
        {
            Caption = 'Fault Reason Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Service Order No.")
        {
            Caption = 'Service Order No.';
        }
        modify("Job No.")
        {
            Caption = 'Job No.';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Work Type Code")
        {
            Caption = 'Work Type Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Serv. Price Adjmt. Gr. Code")
        {
            Caption = 'Serv. Price Adjmt. Gr. Code';
        }
        modify("Service Price Group Code")
        {
            Caption = 'Service Price Group Code';
        }
        modify("Apply Until Entry No.")
        {
            Caption = 'Apply Until Entry No.';
        }
        modify("Applies-to Entry No.")
        {
            Caption = 'Applies-to Entry No.';
        }
        modify("Job Task No.")
        {
            Caption = 'Job Task No.';
        }
        modify("Job Line Type")
        {
            Caption = 'Job Line Type';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            Caption = 'Global Dimension 3 Code';
            ToolTip = 'Specifies the value of the Global Dimension 3 Code field.';
            CaptionClass = '1,2,3';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
            CaptionClass = '1,2,5';

        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            Caption = 'Global Dimension 6 Code';
            ToolTip = 'Specifies the value of the Global Dimension 6 Code field.';
            CaptionClass = '1,2,6';


            trigger OnValidate()
            begin
                //IBdos Argentina - USS - 240603 - Inicio Modificación Arbumasa
                //Sólo puede modificar un usuario del mismo grupo de seguridad
            end;
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';

        }
    }
}

