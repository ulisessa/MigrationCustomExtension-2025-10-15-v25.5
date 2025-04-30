tableextension 50934 tableextension50934 extends "Service Order Allocation"
{
    Caption = 'Service Order Allocation';
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Allocation Date")
        {
            Caption = 'Allocation Date';
        }
        modify("Resource No.")
        {
            Caption = 'Resource No.';
        }
        modify("Resource Group No.")
        {
            Caption = 'Resource Group No.';
        }
        modify("Service Item Line No.")
        {
            Caption = 'Service Item Line No.';
        }
        modify("Finishing Time")
        {
            Caption = 'Finishing Time';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 11)".

            Caption = 'Description';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Service Item No.")
        {
            Caption = 'Service Item No.';
        }
        modify("Service Item Description")
        {
            Caption = 'Service Item Description';
        }
        modify("Service Item Serial No.")
        {
            Caption = 'Service Item Serial No.';
        }
        modify("Repair Status")
        {
            Caption = 'Repair Status';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "Text003(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text003 : ENU=%1 %2 is not qualified to carry out the service.;ESP=%1 %2 no está cualificado para llevar a cabo el servicio.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text003 : ENU=%1 %2 is not qualified to carry out the service.;ESP=%1 %2 no está cualificado para llevar a cabo el servicio.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text004(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text004 : ENU=%1 %2 is not working in %3 %4.;ESP=%1 %2 no está trabajando en %3 %4.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text004 : ENU=%1 %2 is not working in %3 %4.;ESP=%1 %2 no está trabajando en %3 %4.;
    //Variable type has not been exported.
}

