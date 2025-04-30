tableextension 50618 tableextension50618 extends "Logged Segment"
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Segment No.")
        {
            Caption = 'Segment No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("No. of Interactions")
        {
            Caption = 'No. of Interactions';
        }
        modify("No. of Campaign Entries")
        {
            Caption = 'No. of Campaign Entries';
        }
        modify("Creation Date")
        {
            Caption = 'Creation Date';
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


    //Unsupported feature: Property Modification (TextConstString) on "Text005(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text005 : ENU=Do you wish to remove the checkmark from the selected %1 lines?;ESP=¿Confirma que desea eliminar la marca de activación para las lín. %1 selec.?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text005 : ENU=Do you wish to remove the checkmark from the selected %1 lines?;ESP=?Confirma que desea eliminar la marca de activación para las lín. %1 selec.?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU="Do you wish to mark the selected %1 lines as %2? ";ESP="¿Confirma que desea señalar las líneas %1 seleccionadas como %2? ";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU="Do you wish to mark the selected %1 lines as %2? ";ESP="?Confirma que desea se?alar las líneas %1 seleccionadas como %2? ";
    //Variable type has not been exported.
}

