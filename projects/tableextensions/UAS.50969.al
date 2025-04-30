tableextension 50969 tableextension50969 extends "Electronic Document Format"
{
    Caption = 'Electronic Document Format';
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
        modify("Codeunit Caption")
        {
            Caption = 'Codeunit Caption';
        }
        modify("Delivery Codeunit Caption")
        {
            Caption = 'Delivery Codeunit Caption';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "NonExistingDocumentFormatErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //NonExistingDocumentFormatErr : @@@=%1 : document format, %2 document use eq Invoice;ENU=The electronic document format %1 does not exist for the document type %2.;ESP=El formato de documento electrónico %1 no existe para el tipo de documento %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NonExistingDocumentFormatErr : @@@=%1 : document format, %2 document use eq Invoice;ENU=The electronic document format %1 does not exist for the document type %2.;ESP=El formato de documento electrónico %1 no existe para el tipo de documento %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ElectronicDocumentNotCreatedErr(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //ElectronicDocumentNotCreatedErr : ENU=The electronic document has not been created.;ESP=El documento electrónico no se creó.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ElectronicDocumentNotCreatedErr : ENU=The electronic document has not been created.;ESP=El documento electrónico no se creó.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "ElectronicFormatErr(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //ElectronicFormatErr : @@@="%1=Specified Electronic Format";ENU=The electronic format %1 does not exist.;ESP=El formato electrónico %1 no existe.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ElectronicFormatErr : @@@="%1=Specified Electronic Format";ENU=The electronic format %1 does not exist.;ESP=El formato electrónico %1 no existe.;
    //Variable type has not been exported.
}

