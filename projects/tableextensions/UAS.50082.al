tableextension 50082 "User Task Group Ext." extends "User Task Group"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "GroupDeleteActionMsg(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //GroupDeleteActionMsg : @@@="%1 = group code";ENU=If you delete the user task group with the code %1, any user tasks that are assigned to this group are not deleted.;ESP=Si elimina el grupo de usuarios de tareas de usuario con el código %1, no se eliminarán las tareas de usuario que están asignadas a este grupo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GroupDeleteActionMsg : @@@="%1 = group code";ENU=If you delete the user task group with the code %1, any user tasks that are assigned to this group are not deleted.;ESP=Si elimina el grupo de usuarios de tareas de usuario con el código %1, no se eliminarán las tareas de usuario que están asignadas a este grupo.;
    //Variable type has not been exported.
}

