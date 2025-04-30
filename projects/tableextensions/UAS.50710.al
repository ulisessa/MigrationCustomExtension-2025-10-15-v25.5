tableextension 50710 tableextension50710 extends "CRM Integration Record"
{
    Caption = 'CRM Integration Record';
    fields
    {
        modify("Integration ID")
        {
            Caption = 'Integration ID';
        }
        modify("Last Synch. Modified On")
        {
            Caption = 'Last Synch. Modified On';
        }
        modify("Last Synch. CRM Modified On")
        {
            Caption = 'Last Synch. CRM Modified On';
        }
        modify("Last Synch. Result")
        {
            Caption = 'Last Synch. Result';
        }
        modify("Last Synch. CRM Result")
        {
            Caption = 'Last Synch. CRM Result';
        }
        modify("Last Synch. Job ID")
        {
            Caption = 'Last Synch. Job ID';
        }
        modify("Last Synch. CRM Job ID")
        {
            Caption = 'Last Synch. CRM Job ID';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "IntegrationRecordNotFoundErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //IntegrationRecordNotFoundErr : ENU=The integration record for entity %1 was not found.;ESP=No se encontró el registro de integración de la entidad %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IntegrationRecordNotFoundErr : ENU=The integration record for entity %1 was not found.;ESP=No se encontró el registro de integración de la entidad %1.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CRMIdAlreadyMappedErr(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //CRMIdAlreadyMappedErr : @@@="%1 ID of the record, %2 ID of the already mapped record, %3 = CRM product name";ENU=Cannot couple %1 to this %3 record, because the %3 record is already coupled to %2.;ESP=No se puede emparejar %1 a este registro de %3 porque el registro de %3 ya está emparejado con %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CRMIdAlreadyMappedErr : @@@="%1 ID of the record, %2 ID of the already mapped record, %3 = CRM product name";ENU=Cannot couple %1 to this %3 record, because the %3 record is already coupled to %2.;ESP=No se puede emparejar %1 a este registro de %3 porque el registro de %3 ya está emparejado con %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "RecordIdAlreadyMappedErr(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //RecordIdAlreadyMappedErr : @@@=%1 ID from the record, %2 ID of the already mapped record;ENU=Cannot couple the %2 record to %1, because %1 is already coupled to another %2 record.;ESP=No se puede emparejar el registro de %2 a %1 porque %1 ya está emparejado con otro registro de %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RecordIdAlreadyMappedErr : @@@=%1 ID from the record, %2 ID of the already mapped record;ENU=Cannot couple the %2 record to %1, because %1 is already coupled to another %2 record.;ESP=No se puede emparejar el registro de %2 a %1 porque %1 ya está emparejado con otro registro de %2.;
    //Variable type has not been exported.
}

