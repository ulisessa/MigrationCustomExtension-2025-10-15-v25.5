tableextension 50902 tableextension50902 extends "Service Order Type"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 2)".

            Caption = 'Description';
        }
    }

    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.RenameDefaultDim(DATABASE::"Service Order Type",xRec.Code,Code);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //++ARbu DimMgt.RenameDefaultDim(DATABASE::"Service Order Type",xRec.Code,Code);
    */
    //end;
}

