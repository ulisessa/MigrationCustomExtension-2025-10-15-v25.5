tableextension 50054 tableextension50054 extends "SII Sales Document Scheme Code"
{
    Caption = 'SII Sales Document Scheme Code';
    fields
    {
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Special Scheme Code")
        {
            Caption = 'Special Scheme Code';
            OptionCaption = ' ,01 General,02 Export,03 Special System,04 Gold,05 Travel Agencies,06 Groups of Entities,07 Special Cash,08  IPSI / IGIC,09 Travel Agency Services,10 Third Party,11 Business Withholding,12 Business not Withholding,13 Business Withholding and not Withholding,14 Invoice Work Certification,15 Invoice of Consecutive Nature,16 First Half 2017';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "CannotInsertMoreThanThreeCodesErr(Variable 1100000)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotInsertMoreThanThreeCodesErr : ENU=You cannot specify more than three special scheme codes for each document.;ESP=No se pueden especificar más de tres códigos de esquemas especiales para cada documento.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotInsertMoreThanThreeCodesErr : ENU=You cannot specify more than three special scheme codes for each document.;ESP=No se pueden especificar más de tres Códigos de esquemas especiales para cada documento.;
    //Variable type has not been exported.
}

