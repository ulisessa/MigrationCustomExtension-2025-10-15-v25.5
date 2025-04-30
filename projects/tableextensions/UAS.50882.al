tableextension 50882 tableextension50882 extends "Phys. Invt. Order Header"
{
    Caption = 'Phys. Invt. Order Header';
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 10)".

            Caption = 'Description';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Posting No. Series")
        {
            Caption = 'Posting No. Series';
        }
        modify("No. Series")
        {
            Caption = 'No. Series';
        }
        modify("Posting No.")
        {
            Caption = 'Posting No.';
        }
        modify("Last Posting No.")
        {
            Caption = 'Last Posting No.';
        }
        modify("No. Finished Recordings")
        {
            Caption = 'No. Finished Recordings';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }

        //Unsupported feature: Code Insertion (VariableCollection) on ""Dimension Set ID"(Field 480).OnValidate".

        //trigger (Variable: strBlnk)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on ""Dimension Set ID"(Field 480).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DimManagement.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        DimManagement.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
            //++ARbu
            strBlnk,strBlnk,strBlnk,strBlnk,strBlnk
            //--Arbu
        );
        */
        //end;
    }

    //Unsupported feature: Variable Insertion (Variable: strBlnk) (VariableCollection) on "ShowDocDim(PROCEDURE 7)".



    //Unsupported feature: Code Modification on "ShowDocDim(PROCEDURE 7)".

    //procedure ShowDocDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OldDimSetID := "Dimension Set ID";
    "Dimension Set ID" :=
      DimManagement.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2',TableCaption,"No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    if OldDimSetID <> "Dimension Set ID" then begin
      Modify;
      if PhysInvtOrderLinesExist then
        UpdateAllLineDim("Dimension Set ID",OldDimSetID);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++ARbu
        strBlnk,strBlnk,strBlnk,strBlnk,strBlnk
        //--Arbu
        );
    #6..10
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: strBlnk) (VariableCollection) on "UpdateAllLineDim(PROCEDURE 9)".



    //Unsupported feature: Code Modification on "UpdateAllLineDim(PROCEDURE 9)".

    //procedure UpdateAllLineDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if NewParentDimSetID = OldParentDimSetID then
      exit;
    if not Confirm(UpdateDimQst) then
    #4..12
          PhysInvtOrderLine."Dimension Set ID" := NewDimSetID;
          DimManagement.UpdateGlobalDimFromDimSetID(
            PhysInvtOrderLine."Dimension Set ID",PhysInvtOrderLine."Shortcut Dimension 1 Code",
            PhysInvtOrderLine."Shortcut Dimension 2 Code");
          PhysInvtOrderLine.Modify;
        end;
      until PhysInvtOrderLine.Next = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..15
            PhysInvtOrderLine."Shortcut Dimension 2 Code",
                //++ARbu
        strBlnk,strBlnk,strBlnk,strBlnk,strBlnk
        //--Arbu
        );
    #17..19
    */
    //end;

    var
        strBlnk: Code[10];


    //Unsupported feature: Property Modification (TextConstString) on "ConfirmChangeQst(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //ConfirmChangeQst : @@@="%1 = field caption, %2 = Posting Date";ENU=%1 will be reset in all order lines. Do you want to change %2?;ESP=%1se restablecerá en todas las líneas de pedido. ¿Desea cambiar %2?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ConfirmChangeQst : @@@="%1 = field caption, %2 = Posting Date";ENU=%1 will be reset in all order lines. Do you want to change %2?;ESP=%1se restablecer? en todas las líneas de pedido. ?Desea cambiar %2?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "UpdateDimQst(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //UpdateDimQst : ENU=You may have changed a dimension.\\Do you want to update the lines?;ESP=Puede que haya cambiado una dimensión.\\¿Desea actualizar las líneas?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //UpdateDimQst : ENU=You may have changed a dimension.\\Do you want to update the lines?;ESP=Puede que haya cambiado una dimensión.\\?Desea actualizar las líneas?;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "MoreThanOneLineErr(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //MoreThanOneLineErr : @@@=%1 Order No. %2 Item No. %3 Variant Code %4 Location Code %5 Bin Code;ENU=There are more than one order lines in Order %1 for Item No. %2, Variant Code %3, Location Code %4, Bin Code %5.;ESP=Hay más de una línea de pedido en el pedido %1 para el producto n.º %2, código de variante %3, código de almacén %4, código de ubicación %5.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MoreThanOneLineErr : @@@=%1 Order No. %2 Item No. %3 Variant Code %4 Location Code %5 Bin Code;ENU=There are more than one order lines in Order %1 for Item No. %2, Variant Code %3, Location Code %4, Bin Code %5.;ESP=Hay más de una línea de pedido en el pedido %1 para el producto no. %2, código de variante %3, código de almacén %4, código de ubicación %5.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "NoLineErr(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //NoLineErr : @@@=%1 Order No. %2 Item No. %3 Variant Code %4 Location Code %5 Bin Code;ENU=There are no order line in Order %1 for Item No. %2, Variant Code %3, Location Code %4, Bin Code %5.;ESP=No hay ninguna línea de pedido en el pedido %1 para el producto n.º %2, código de variante %3, código de almacén %4, código de ubicación %5.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NoLineErr : @@@=%1 Order No. %2 Item No. %3 Variant Code %4 Location Code %5 Bin Code;ENU=There are no order line in Order %1 for Item No. %2, Variant Code %3, Location Code %4, Bin Code %5.;ESP=No hay ninguna línea de pedido en el pedido %1 para el producto no. %2, código de variante %3, código de almacén %4, código de ubicación %5.;
    //Variable type has not been exported.
}

