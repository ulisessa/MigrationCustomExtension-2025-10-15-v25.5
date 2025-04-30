tableextension 50473 tableextension50473 extends "Default Dimension Priority"
{
    fields
    {
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Table Caption")
        {
            Caption = 'Table Caption';
        }
    }

    //Unsupported feature: Code Modification on "GetDefaultDimTableList(PROCEDURE 1)".

    //procedure GetDefaultDimTableList();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.DefaultDimObjectNoList(TempAllObjWithCaption);
    DimMgt.InsertObject(TempAllObjWithCaption,DATABASE::"Service Contract Header");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    DimMgt.SetupObjectNoList(TempAllObjWithCaption);
    DimMgt.InsertObject(TempAllObjWithCaption,DATABASE::"Service Contract Header");
    */
    //end;
}

