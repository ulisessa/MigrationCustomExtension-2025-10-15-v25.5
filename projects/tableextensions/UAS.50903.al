tableextension 50903 tableextension50903 extends "Service Item Group"
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
        modify("Default Contract Discount %")
        {
            Caption = 'Default Contract Discount %';
        }
        modify("Default Serv. Price Group Code")
        {
            Caption = 'Default Serv. Price Group Code';
        }
        modify("Default Response Time (Hours)")
        {
            Caption = 'Default Response Time (Hours)';
        }
    }

    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.RenameDefaultDim(DATABASE::"Service Item Group",xRec.Code,Code);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //++ARbu DimMgt.RenameDefaultDim(DATABASE::"Service Item Group",xRec.Code,Code);
    */
    //end;
}

