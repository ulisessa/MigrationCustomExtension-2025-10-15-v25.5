tableextension 50080 "User Task Ext." extends "User Task"
{
    fields
    {
        modify("Created DateTime")
        {
            Caption = 'Created Date';
        }
        modify("Completed DateTime")
        {
            Caption = 'Completed Date';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Object Type")
        {
            OptionCaption = ',,,Report,,,,,Page';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "ConfirmDeleteQst(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //ConfirmDeleteQst : ENU=This task is started but not complete, delete anyway?;ESP=Esta tarea se ha iniciado pero no se ha completado, ¿desea eliminarla de todas maneras?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ConfirmDeleteQst : ENU=This task is started but not complete, delete anyway?;ESP=Esta tarea se ha iniciado pero no se ha completado, ?desea eliminarla de todas maneras?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ConfirmDeleteAllOccurrencesQst(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //ConfirmDeleteAllOccurrencesQst : ENU=Delete all occurrences of this task?;ESP=¿Desea eliminar todas las ocurrencias de esta tarea?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ConfirmDeleteAllOccurrencesQst : ENU=Delete all occurrences of this task?;ESP=?Desea eliminar todas las ocurrencias de esta tarea?;
    //Variable type has not been exported.
}

