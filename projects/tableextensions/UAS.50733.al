tableextension 50733 tableextension50733 extends "Production Order"
{
    Caption = 'Production Order';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Description)
        {
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
        modify("Source No.")
        {
            Caption = 'Source No.';
        }
        modify("Routing No.")
        {
            Caption = 'Routing No.';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify("Replan Ref. No.")
        {
            Caption = 'Replan Ref. No.';
        }
        modify("Low-Level Code")
        {
            Caption = 'Low-Level Code';
        }
        modify("Capacity No. Filter")
        {
            Caption = 'Capacity No. Filter';
        }
        modify("Expected Operation Cost Amt.")
        {
            Caption = 'Expected Operation Cost Amt.';
        }
        modify("Planned Order No.")
        {
            Caption = 'Planned Order No.';
        }
        modify("Firm Planned Order No.")
        {
            Caption = 'Firm Planned Order No.';
        }
        modify("Simulated Order No.")
        {
            Caption = 'Simulated Order No.';
        }

        //Unsupported feature: Code Modification on ""Dimension Set ID"(Field 480).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        field(50503; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50504; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50505; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50506; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50507; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
    }


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 8)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TableID[1] := Type1;
    No[1] := No1;
    OnAfterCreateDimTableIDs(Rec,CurrFieldNo,TableID,No);

    "Shortcut Dimension 1 Code" := '';
    "Shortcut Dimension 2 Code" := '';
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,'',"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",0,0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    //++Arbu
    "Shortcut Dimension 3 Code" := '';
    "Shortcut Dimension 4 Code" := '';
    "Shortcut Dimension 5 Code" := '';
    "Shortcut Dimension 6 Code" := '';
    "Shortcut Dimension 7 Code" := '';
    //--Arbu
    "Dimension Set ID" :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID,No,'',"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code",
        //--Arbu
        0,0);
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDocDim(PROCEDURE 18)".

    //procedure ShowDocDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OldDimSetID := "Dimension Set ID";
    TestField("No.");
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2',TableCaption,"No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    if OldDimSetID <> "Dimension Set ID" then begin
      if Status = Status::Finished then
        Error(Text011);
      Modify;
      if SalesLinesExist then
        UpdateAllLineDim("Dimension Set ID",OldDimSetID);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code"
        //--Arbu
        );
    #7..13
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateAllLineDim(PROCEDURE 34)".

    //procedure UpdateAllLineDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    // Update all lines with changed dimensions.

    if NewParentDimSetID = OldParentDimSetID then
    #4..15
        if ProdOrderLine."Dimension Set ID" <> NewDimSetID then begin
          ProdOrderLine."Dimension Set ID" := NewDimSetID;
          DimMgt.UpdateGlobalDimFromDimSetID(
            ProdOrderLine."Dimension Set ID",ProdOrderLine."Shortcut Dimension 1 Code",ProdOrderLine."Shortcut Dimension 2 Code");
          ProdOrderLine.Modify;
          ProdOrderLine.UpdateProdOrderCompDim(NewDimSetID,OldDimSetID);
        end;
      until ProdOrderLine.Next = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..18
            ProdOrderLine."Dimension Set ID",ProdOrderLine."Shortcut Dimension 1 Code",ProdOrderLine."Shortcut Dimension 2 Code",
                                             //++Arbu
                                             ProdOrderLine."Shortcut Dimension 3 Code",ProdOrderLine."Shortcut Dimension 4 Code",
                                             ProdOrderLine."Shortcut Dimension 5 Code",ProdOrderLine."Shortcut Dimension 6 Code",
                                             ProdOrderLine."Shortcut Dimension 7 Code"
                                             //--Arbu
                                             );
    #20..23
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : @@@="%1 = Document status; %2 = Table caption; %3 = Field value; %4 = Table Caption";ENU=You cannot delete %1 %2 %3 because there is at least one %4 associated with it.;ESP=No puede eliminar %1 %2 %3 porque existe al menos un %4 asociado a él.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : @@@="%1 = Document status; %2 = Table caption; %3 = Field value; %4 = Table Caption";ENU=You cannot delete %1 %2 %3 because there is at least one %4 associated with it.;ESP=No puede eliminar %1 %2 %3 porque existe al menos un %4 asociado a él.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text002(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text002 : @@@="%1 = Field caption; %2 = Document status; %3 = Table caption; %4 = Field value; %5 = Table Caption";ENU=You cannot change %1 on %2 %3 %4 because there is at least one %5 associated with it.;ESP=No puede cambiar el %1 en %2 %3 %4 porque existe al menos un %5 asociado a él.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text002 : @@@="%1 = Field caption; %2 = Document status; %3 = Table caption; %4 = Field value; %5 = Table Caption";ENU=You cannot change %1 on %2 %3 %4 because there is at least one %5 associated with it.;ESP=No puede cambiar el %1 en %2 %3 %4 porque existe al menos un %5 asociado a él.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "MultiLevelMsg(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //MultiLevelMsg : ENU=The production order contains lines connected in a multi-level structure and the production order lines have not been automatically rescheduled.\Use Refresh if you want to reschedule the lines.;ESP=La orden de producción contiene líneas conectadas con una estructura multinivel y las líneas de la orden de producción no se han replanificado automáticamente.\Actualice si desea volver a planificar las líneas.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MultiLevelMsg : ENU=The production order contains lines connected in a multi-level structure and the production order lines have not been automatically rescheduled.\Use Refresh if you want to reschedule the lines.;ESP=La orden de producción contiene líneas conectadas con una estructura multinivel y las líneas de la orden de producción no se han replanificado automáticamente.\Actualice si desea volver a planificar las líneas.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text010(Variable 1023)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text010 : ENU=You may have changed a dimension.\\Do you want to update the lines?;ESP=Puede que haya cambiado una dimensión.\\¿Desea actualizar las líneas?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text010 : ENU=You may have changed a dimension.\\Do you want to update the lines?;ESP=Puede que haya cambiado una dimensión.\\?Desea actualizar las líneas?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text011(Variable 1024)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text011 : ENU=You cannot change Finished Production Order dimensions.;ESP=No puede cambiar las dimensiones de una Orden producción terminada.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text011 : ENU=You cannot change Finished Production Order dimensions.;ESP=No puede cambiar las dimensiones de una Orden producción terminada.;
    //Variable type has not been exported.
}

