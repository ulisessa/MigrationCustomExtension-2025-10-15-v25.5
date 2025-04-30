tableextension 50711 tableextension50711 extends "Coupling Record Buffer"
{
    Caption = 'Coupling Record Buffer';
    fields
    {
        modify("Sync Action")
        {
            Caption = 'Sync Action';
            OptionCaption = 'Do Not Synchronize,To Integration Table,From Integration Table';
        }
        modify("Saved Sync Action")
        {
            Caption = 'Saved Sync Action';
            OptionCaption = 'Do Not Synchronize,To Integration Table,From Integration Table';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "InitialSynchDisabledErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //InitialSynchDisabledErr : ENU=No initial synchronization direction was specified because initial synchronization was disabled.;ESP=No se ha especificado ninguna dirección de sincronización inicial, porque la sincronización inicial se ha deshabilitado.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InitialSynchDisabledErr : ENU=No initial synchronization direction was specified because initial synchronization was disabled.;ESP=No se ha especificado ninguna dirección de sincronización inicial, porque la sincronización inicial se ha deshabilitado.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoSuchCRMRecordErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoSuchCRMRecordErr : @@@="%1 = The record name entered by the user, %2 = CRM product name";ENU=A record with the name %1 does not exist in %2.;ESP=No existe ningún registro con el nombre %1 en %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoSuchCRMRecordErr : @@@="%1 = The record name entered by the user, %2 = CRM product name";ENU=A record with the name %1 does not exist in %2.;ESP=No existe ningún registro con el nombre %1 en %2.;
    //Variable type has not been exported.
}

