tableextension 50665 tableextension50665 extends "To-do Interaction Language"
{
    Caption = 'Task Interaction Language';
    fields
    {
        modify("To-do No.")
        {
            Caption = 'Task No.';
        }
        modify("Language Code")
        {
            Caption = 'Language Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Attachment No.")
        {
            Caption = 'Attachment No.';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=Replace existing attachment?;ESP=¿Sustituir el anexo actual?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=Replace existing attachment?;ESP=?Sustituir el anexo actual?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=You cannot create attachments here.;ESP=No puede crear anexos aquí.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=You cannot create attachments here.;ESP=No puede crear anexos aquí.;
    //Variable type has not been exported.
}

