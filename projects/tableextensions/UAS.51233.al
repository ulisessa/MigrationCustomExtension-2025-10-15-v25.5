tableextension 51233 tableextension51233 extends "Assembly Line"
{
    Caption = 'Assembly Line';
    fields
    {
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 13)".

            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
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
        modify(Position)
        {
            Caption = 'Position';
        }
        modify("Position 2")
        {
            Caption = 'Position 2';
        }
        modify("Position 3")
        {
            Caption = 'Position 3';
        }
        modify("Appl.-to Item Entry")
        {
            Caption = 'Appl.-to Item Entry';
        }
        modify("Substitution Available")
        {
            Caption = 'Substitution Available';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
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
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        strBlnk,strBlnk,strBlnk,strBlnk,strBlnk
        //--Arbu
        );
        */
        //end;
    }


    //Unsupported feature: Code Modification on "AutoReserve(PROCEDURE 148)".

    //procedure AutoReserve();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Type <> Type::Item then
      exit;

    #4..7
    if "Remaining Quantity (Base)" <> 0 then begin
      TestField("Due Date");
      ReservMgt.SetAssemblyLine(Rec);
      ReservMgt.AutoReserve(FullAutoReservation,'',"Due Date","Remaining Quantity","Remaining Quantity (Base)");
      Find;
      if not FullAutoReservation and (CurrFieldNo <> 0) then
        if Confirm(Text001,true) then begin
          Commit;
          ShowReservation;
          Find;
        end;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10
      //++Arbu
      decQty[1] := "Remaining Quantity";
      ReservMgt.AutoReserve(FullAutoReservation,'',"Due Date",decQty,"Remaining Quantity (Base)");
      //--Arbu
    #12..19
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 25)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2 %3',"Document Type","Document No.","Line No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        codDim,codDim,codDim,codDim,codDim
        //--Arbu
        );
    */
    //end;


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 26)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if SkipVerificationsThatChangeDatabase then
      exit;

    #4..15
            DimMgt.GetRecDefaultDimID(
              Rec,CurrFieldNo,TableID,No,SourceCodeSetup.Assembly,
              "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
              0,0);
          DimensionSetIDArr[2] := HeaderDimensionSetID;
        end;
    #22..24
            DimMgt.GetRecDefaultDimID(
              Rec,CurrFieldNo,TableID,No,SourceCodeSetup.Assembly,
              "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
              0,0);
          DimensionSetIDArr[1] := HeaderDimensionSetID;
        end;
    end;

    "Dimension Set ID" :=
      DimMgt.GetCombinedDimensionSetID(DimensionSetIDArr,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..18
              //++Arbu
              codDim,codDim,codDim,codDim,codDim,
              //--Arbu
    #19..27
              //++Arbu
              codDim,codDim,codDim,codDim,codDim,
              //--Arbu
    #28..33
      DimMgt.GetCombinedDimensionSetID(DimensionSetIDArr,"Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        codDim,codDim,codDim,codDim,codDim
        //--Arbu
      );
    */
    //end;


    //Unsupported feature: Code Modification on "UpdateDim(PROCEDURE 10)".

    //procedure UpdateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" := DimMgt.GetDeltaDimSetID("Dimension Set ID",NewHeaderSetID,OldHeaderSetID);
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Dimension Set ID" := DimMgt.GetDeltaDimSetID("Dimension Set ID",NewHeaderSetID,OldHeaderSetID);
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        codDim,codDim,codDim,codDim,codDim
        //--Arbu
    );
    */
    //end;

    var
        strBlnk: Code[10];


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1055)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=Automatic reservation is not possible.\Do you want to reserve items manually?;ESP=No se puede reservar automáticamente.\¿Desea reservar los productos manualmente?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=Automatic reservation is not possible.\Do you want to reserve items manually?;ESP=No se puede reservar automáticamente.\?Desea reservar los productos manualmente?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text042(Variable 1011)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text042 : ENU=When posting the Applied to Ledger Entry, %1 will be opened first.;ESP=Al registrar, se abrirá primero Liq. por mov. producto %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text042 : ENU=When posting the Applied to Ledger Entry, %1 will be opened first.;ESP=Al registrar, se abrirá primero Liq. por mov. producto %1.;
    //Variable type has not been exported.

    var
        decQty: array[3] of Decimal;
        codDim: Code[10];
}

