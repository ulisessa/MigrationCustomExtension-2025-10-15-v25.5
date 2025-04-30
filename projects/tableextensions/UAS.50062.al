tableextension 50062 tableextension50062 extends "Cost Entry"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Cost Type No.")
        {
            Caption = 'Cost Type No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Cost Center Code")
        {
            Caption = 'Cost Center Code';
        }
        modify("Cost Object Code")
        {
            Caption = 'Cost Object Code';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("G/L Account")
        {
            TableRelation = "G/L Account"."No.";
        }
        modify("G/L Entry No.")
        {
            Caption = 'G/L Entry No.';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("System-Created Entry")
        {
            Caption = 'System-Created Entry';
        }
        modify("Allocated with Journal No.")
        {
            Caption = 'Allocated with Register No.';
        }
        modify("Batch Name")
        {
            Caption = 'Batch Name';
        }
        modify("Allocation Description")
        {
            Caption = 'Allocation Description';
        }
        modify("Allocation ID")
        {
            Caption = 'Allocation ID';
        }
    }
}

