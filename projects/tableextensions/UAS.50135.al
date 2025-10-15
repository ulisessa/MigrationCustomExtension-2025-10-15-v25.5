tableextension 50135 "Doc. Exch. Service Setup Ext." extends "Doc. Exch. Service Setup"
{
    Caption = 'Doc. Exch. Service Setup';
    fields
    {
        modify("Sign-in URL")
        {
            Caption = 'Sign-in URL';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "JobQEntriesCreatedQst(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //JobQEntriesCreatedQst : ENU=A job queue entry for exchanging documents has been created.\\Do you want to open the Job Queue Entries window?;ESP=Se creó un movimiento de la cola de proyectos para intercambiar documentos.\\¿Desea abrir la ventana Movs. cola proyecto?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //JobQEntriesCreatedQst : ENU=A job queue entry for exchanging documents has been created.\\Do you want to open the Job Queue Entries window?;ESP=Se creó un movimiento de la cola de proyectos para intercambiar documentos.\\?Desea abrir la ventana Movs. cola proyecto?;
    //Variable type has not been exported.
}

