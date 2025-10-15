tableextension 50167 "Posted Docs. No Inc. Buf. Ext." extends "Posted Docs. With No Inc. Buf."
{
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("First Posting Description")
        {
            Caption = 'First Posting Description';
        }
        modify("Incoming Document No.")
        {
            Caption = 'Incoming Document No.';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify("G/L Account No. Filter")
        {
            Caption = 'G/L Account No. Filter';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "OnlyFirst1000Msg(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //OnlyFirst1000Msg : ENU=There are more than 1000 document numbers within the filter. Only the first 1000 are shown. Narrow your filter to get fewer document numbers.;ESP=Hay más de 1000 números de documentos en el filtro. Solo se muestran los 1000 primeros. Limite el filtro para obtener menos números de documentos.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OnlyFirst1000Msg : ENU=There are more than 1000 document numbers within the filter. Only the first 1000 are shown. Narrow your filter to get fewer document numbers.;ESP=Hay más de 1000 números de documentos en el filtro. Solo se muestran los 1000 primeros. Limite el filtro para obtener menos números de documentos.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "AlreadyAssignedIncomingDocErr(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //AlreadyAssignedIncomingDocErr : ENU=This document no. and date already has an incoming document.;ESP=Este n.º de documento y esta fecha ya tienen un documento entrante.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AlreadyAssignedIncomingDocErr : ENU=This document no. and date already has an incoming document.;ESP=Este no. de documento y esta fecha ya tienen un documento entrante.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "AlreadyIncomingDocErr(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //AlreadyIncomingDocErr : @@@="%1=document type, %2=document no., e.g. Invoice 1234.";ENU=The specified incoming document no. has already been used for %1 %2.;ESP=El n.º de documento entrante especificado ya se usó para %1 %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AlreadyIncomingDocErr : @@@="%1=document type, %2=document no., e.g. Invoice 1234.";ENU=The specified incoming document no. has already been used for %1 %2.;ESP=El no. de documento entrante especificado ya se usó para %1 %2.;
    //Variable type has not been exported.
}

