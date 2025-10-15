tableextension 50055 "SII Purch. Doc.SchemeCode Ext" extends "SII Purch. Doc. Scheme Code"
{
    Caption = 'SII Purch. Doc. Scheme Code';
    fields
    {
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Special Scheme Code")
        {
            Caption = 'Special Scheme Code';
            OptionCaption = ' ,01 General,02 Special System Activities,03 Special System,04 Gold,05 Travel Agencies,06 Groups of Entities,07 Special Cash,08  IPSI / IGIC,09 Intra-Community Acquisition,12 Business Premises Leasing Operations,13 Import (Without DUA),14 First Half 2017';
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

