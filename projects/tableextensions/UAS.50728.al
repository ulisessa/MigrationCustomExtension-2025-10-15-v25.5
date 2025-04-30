tableextension 50728 tableextension50728 extends "CRM Annotation Coupling"
{
    Caption = 'CRM Annotation Coupling';
    fields
    {
        modify("Record Link Record ID")
        {
            Caption = 'Record Link Record ID';
        }
        modify("CRM Annotation ID")
        {
            Caption = 'CRM Annotation ID';
        }
        modify("Last Synch. DateTime")
        {
            Caption = 'Last Synch. DateTime';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "RecordLinkAlreadyCoupledErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //RecordLinkAlreadyCoupledErr : @@@=%1 - an integer;ENU=Record Link %1 is already coupled to another CRM Annotation.;ESP=Vínculo registro %1 ya está emparejado con otra anotación de CRM.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RecordLinkAlreadyCoupledErr : @@@=%1 - an integer;ENU=Record Link %1 is already coupled to another CRM Annotation.;ESP=Vínculo registro %1 ya está emparejado con otra anotación de CRM.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "CRMAnnotationAlreadyCoupledErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //CRMAnnotationAlreadyCoupledErr : @@@=%1 - a GUID;ENU=CRM Annotation %1 is already coupled to another Record Link.;ESP=Anotación de CRM %1 ya está emparejada con otro vínculo de registro.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CRMAnnotationAlreadyCoupledErr : @@@=%1 - a GUID;ENU=CRM Annotation %1 is already coupled to another Record Link.;ESP=Anotación de CRM %1 ya está emparejada con otro vínculo de registro.;
    //Variable type has not been exported.
}

