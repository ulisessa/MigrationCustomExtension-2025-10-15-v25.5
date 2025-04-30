tableextension 50883 tableextension50883 extends "Phys. Invt. Order Line"
{
    Caption = 'Phys. Invt. Order Line';
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
        modify("On Recording Lines")
        {
            Caption = 'On Recording Lines';
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
        modify("Bin Code")
        {
            Caption = 'Bin Code';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 30)".

            Caption = 'Description';
        }
        modify("Description 2")
        {
            Caption = 'Description 2';
        }
        modify("Base Unit of Measure Code")
        {
            Caption = 'Base Unit of Measure Code';
        }
        modify("Last Item Ledger Entry No.")
        {
            Caption = 'Last Item Ledger Entry No.';
        }
        modify("No. Finished Rec.-Lines")
        {
            Caption = 'No. Finished Rec.-Lines';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Shelf No.")
        {
            Caption = 'Shelf No.';
        }
        modify("Item Category Code")
        {
            Caption = 'Item Category Code';
        }
        modify("Phys Invt Counting Period Code")
        {
            Caption = 'Phys Invt Counting Period Code';
        }
        modify("Phys Invt Counting Period Type")
        {
            Caption = 'Phys Invt Counting Period Type';
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
            //++ARbu
            strBlnk,strBlnk,strBlnk,strBlnk,strBlnk
            //--Arbu
        );
        */
        //end;
    }

    //Unsupported feature: Variable Insertion (Variable: strBlnk) (VariableCollection) on "ShowDimensions(PROCEDURE 11)".



    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 11)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if EmptyLine then
      exit;
    "Dimension Set ID" :=
      DimManagement.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2 %3',TableCaption,"Document No.","Line No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
            //++ARbu
        strBlnk,strBlnk,strBlnk,strBlnk,strBlnk
        //--Arbu
        );
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: strBlnk) (VariableCollection) on "CreateDim(PROCEDURE 12)".



    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 12)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SourceCodeSetup.Get;
    TableID[1] := Type1;
    No[1] := No1;
    #4..7
    GetPhysInvtOrderHeader;
    "Dimension Set ID" :=
      DimManagement.GetDefaultDimID(TableID,No,SourceCodeSetup."Phys. Invt. Orders","Shortcut Dimension 1 Code",
        "Shortcut Dimension 2 Code",PhysInvtOrderHeader."Dimension Set ID",0);
    DimManagement.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10
        "Shortcut Dimension 2 Code",
            //++ARbu
        strBlnk,strBlnk,strBlnk,strBlnk,strBlnk
        //--Arbu
        ,PhysInvtOrderHeader."Dimension Set ID",0);
    DimManagement.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++ARbu
        strBlnk,strBlnk,strBlnk,strBlnk,strBlnk
        //--Arbu

        );
    */
    //end;

    var
        strBlnk: Code[10];


    //Unsupported feature: Property Modification (TextConstString) on "CannotSetErr(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //CannotSetErr : @@@="%1 and %2 - Decimal, %3 = Text";ENU="You cannot use item tracking because there is a difference between the values of the fields Qty. Expected (Base) = %1 and Qty. Exp. Item Tracking (Base) = %2.\%3";ESP="No puede usar las líneas de seguimiento de uso porque hay una diferencia entre los valores de los campos Cant. esperada (base) = %1 y Cant. esperada líneas seg. (base) = %2.\%3";
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CannotSetErr : @@@="%1 and %2 - Decimal, %3 = Text";ENU="You cannot use item tracking because there is a difference between the values of the fields Qty. Expected (Base) = %1 and Qty. Exp. Item Tracking (Base) = %2.\%3";ESP="No puede usar las líneas de seguimiento de uso porque hay una diferencia entre los valores de los campos Cant. esperada (base) = %1 y Cant. esperada líneas seg. (base) = %2.\%3";
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "IndenitiedValuesMsg(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //IndenitiedValuesMsg : @@@=%1,%2,%3,%4 - field captions;ENU=Identified values on the line:  %1 %2 %3 %4.;ESP=Valores identificados en la línea:  %1 %2 %3 %4.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IndenitiedValuesMsg : @@@=%1,%2,%3,%4 - field captions;ENU=Identified values on the line:  %1 %2 %3 %4.;ESP=Valores identificados en la línea:  %1 %2 %3 %4.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "DifferentSumErr(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //DifferentSumErr : @@@="%1 = text";ENU=The value of the Qty. Recorded (Base) field is different from the sum of all Quantity (Base) fields on related physical inventory recordings.%1;ESP=El valor del campo cantidad registrada (Base) es diferente de la suma de todos los campos de cantidad (Base) en los registros relacionados del inventario físico.%1;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DifferentSumErr : @@@="%1 = text";ENU=The value of the Qty. Recorded (Base) field is different from the sum of all Quantity (Base) fields on related physical inventory recordings.%1;ESP=El valor del campo cantidad registrada (Base) es diferente de la suma de todos los campos de cantidad (Base) en los registros relacionados del inventario físico.%1;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "MustSpecifyErr(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //MustSpecifyErr : @@@="%1 = Recording No., %2 = Text";ENU=You must specify a serial number or lot number on physical inventory recording line %1 when the Use Item Tracking check box is selected.%2;ESP=Debe especificar un número de serie o de lote en la línea de registro de inventario físico %1 cuando se activa la casilla Usar seguimiento de producto.%2;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MustSpecifyErr : @@@="%1 = Recording No., %2 = Text";ENU=You must specify a serial number or lot number on physical inventory recording line %1 when the Use Item Tracking check box is selected.%2;ESP=Debe especificar un número de serie o de lote en la línea de registro de inventario físico %1 cuando se activa la casilla Usar seguimiento de producto.%2;
    //Variable type has not been exported.
}

