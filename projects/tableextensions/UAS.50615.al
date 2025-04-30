tableextension 50615 tableextension50615 extends "Campaign Entry"
{
    Caption = 'Campaign Entry';
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Campaign No.")
        {
            Caption = 'Campaign No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Segment No.")
        {
            Caption = 'Segment No.';
        }
        modify("No. of Interactions")
        {
            Caption = 'No. of Interactions';
        }
        modify("Duration (Min.)")
        {
            Caption = 'Duration (Min.)';
        }
        modify("Salesperson Code")
        {
            Caption = 'Salesperson Code';
        }
        modify("Register No.")
        {
            Caption = 'Register No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=%1 %2 is marked %3.\Do you wish to remove the checkmark?;ESP=%1 %2 está marcado %3.\¿Desea quitar la marca?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=%1 %2 is marked %3.\Do you wish to remove the checkmark?;ESP=%1 %2 está marcado %3.\?Desea quitar la marca?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : ENU=Do you wish to mark %1 %2 as %3?;ESP=¿Confirma que desea señalar %1 %2 como %3?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : ENU=Do you wish to mark %1 %2 as %3?;ESP=?Confirma que desea se?alar %1 %2 como %3?;
    //Variable type has not been exported.
}

