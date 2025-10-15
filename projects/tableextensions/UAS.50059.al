tableextension 50059 "Cost Journal Line Ext." extends "Cost Journal Line"
{
    Caption = 'Cost Journal Line';
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
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
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Bal. Cost Type No.")
        {
            Caption = 'Bal. Cost Type No.';
        }
        modify("Cost Center Code")
        {
            Caption = 'Cost Center Code';
        }
        modify("Cost Object Code")
        {
            Caption = 'Cost Object Code';
        }
        modify("Bal. Cost Center Code")
        {
            Caption = 'Bal. Cost Center Code';
        }
        modify("Bal. Cost Object Code")
        {
            Caption = 'Bal. Cost Object Code';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
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
        modify("Cost Entry No.")
        {
            Caption = 'Cost Entry No.';
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

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : @@@="%2 = Cost Center or Cost Object; %3 = Cost Center or Cost Object Code";ENU=Line Type must be %1 or Begin-Total in %2 %3.;ESP=Tipo línea debe ser %1 o Inicio-Total en %2 %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : @@@="%2 = Cost Center or Cost Object; %3 = Cost Center or Cost Object Code";ENU=Line Type must be %1 or Begin-Total in %2 %3.;ESP=Tipo línea debe ser %1 o Inicio-Total en %2 %3.;
    //Variable type has not been exported.
}

