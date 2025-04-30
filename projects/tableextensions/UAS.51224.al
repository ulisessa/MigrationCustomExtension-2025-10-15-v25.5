tableextension 51224 tableextension51224 extends "Assembly Header"
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 3)".

            Caption = 'Description';
        }
        modify("Search Description")
        {
            Caption = 'Search Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Creation Date")
        {
            Caption = 'Creation Date';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Item No.")
        {
            Caption = 'Item No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Planning Flexibility")
        {
            Caption = 'Planning Flexibility';
        }
        modify("Posting No.")
        {
            Caption = 'Posting No.';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Posting No. Series")
        {
            Caption = 'Posting No. Series';
        }

        //Unsupported feature: Code Modification on ""Dimension Set ID"(Field 480).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        SetCurrentFieldNum(FieldNo("Dimension Set ID"));
        if "Dimension Set ID" <> xRec."Dimension Set ID" then
          AssemblyLineMgt.UpdateAssemblyLines(Rec,xRec,FieldNo("Dimension Set ID"),false,CurrFieldNo,CurrentFieldNum);
        ClearCurrentFieldNum(FieldNo("Dimension Set ID"));
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..4
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        strBlnk,strBlnk,strBlnk,strBlnk,strBlnk
        //--Arbu
        );
        */
        //end;
    }


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 4)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SourceCodeSetup.Get;
    TableID[1] := Type1;
    No[1] := No1;
    #4..7
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,SourceCodeSetup.Assembly,
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",0,0);
    if "No." <> '' then
      DimMgt.UpdateGlobalDimFromDimSetID(
        "Dimension Set ID",
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        "Shortcut Dimension 1 Code",
        //--Arbu
        0,0);
    #12..14
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        "Shortcut Dimension 1 Code"
        //--Arbu
        );
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 30)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OldDimSetId := "Dimension Set ID";
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2',"Document Type","No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    if OldDimSetId <> "Dimension Set ID" then begin
      SetCurrentFieldNum(FieldNo("Dimension Set ID"));
      AssemblyLineMgt.UpdateAssemblyLines(Rec,xRec,FieldNo("Dimension Set ID"),false,CurrFieldNo,CurrentFieldNum);
      ClearCurrentFieldNum(FieldNo("Dimension Set ID"));
      Modify(true);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 1 Code","Shortcut Dimension 1 Code","Shortcut Dimension 1 Code",
        "Shortcut Dimension 1 Code","Shortcut Dimension 1 Code"
        //--Arbu
        );
    #6..11
    */
    //end;

    var
        strBlnk: Code[10];


        //Unsupported feature: Property Modification (TextConstString) on "Text013(Variable 1020)".

        //var
        //>>>> ORIGINAL VALUE:
        //Text013 : ENU=Do you want to update %1?;ESP=¿Desea actualizar %1?;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //Text013 : ENU=Do you want to update %1?;ESP=?Desea actualizar %1?;
        //Variable type has not been exported.
}

