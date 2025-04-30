tableextension 50081 tableextension50081 extends "Document Attachment"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Attached Date")
        {
            Caption = 'Attached Date';
        }
        modify("File Extension")
        {
            Caption = 'File Extension';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("VAT Report Config. Code")
        {
            Caption = 'VAT Report Config. Code';
        }
    }

    //Unsupported feature: Property Modification (TextConstString) on "DuplicateErr(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //DuplicateErr : ENU=This file is already attached to the document. Please choose another file.;ESP=Este archivo ya está adjunto al documento. Elija otro archivo.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DuplicateErr : ENU=This file is already attached to the document. Please choose another file.;ESP=Este archivo ya está adjunto al documento. Elija otro archivo.;
    //Variable type has not been exported.
}

