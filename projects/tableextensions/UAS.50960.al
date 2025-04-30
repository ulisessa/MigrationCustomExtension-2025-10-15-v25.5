tableextension 50960 tableextension50960 extends "Standard Service Item Gr. Code"
{
    Caption = 'Standard Service Item Gr. Code';
    fields
    {
        modify("Service Item Group Code")
        {
            Caption = 'Service Item Group Code';
        }
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {

            //Unsupported feature: Property Modification (Data type) on "Description(Field 3)".

            Caption = 'Description';
        }
    }

    //Unsupported feature: Variable Insertion (Variable: strBlnk) (VariableCollection) on "CombineDimensions(PROCEDURE 5)".


    //Unsupported feature: Code Modification on "CombineDimensions(PROCEDURE 5)".

    //procedure CombineDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimensionSetIDArr[1] := ServLine."Dimension Set ID";
    DimensionSetIDArr[2] := StdServLine."Dimension Set ID";

    ServLine."Dimension Set ID" :=
      DimensionManagement.GetCombinedDimensionSetID(
        DimensionSetIDArr,ServLine."Shortcut Dimension 1 Code",ServLine."Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
        DimensionSetIDArr,ServLine."Shortcut Dimension 1 Code",ServLine."Shortcut Dimension 2 Code",
            //++ARbu
        strBlnk,strBlnk,strBlnk,strBlnk,strBlnk
        //--Arbu
        );
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=%1 of the standard service code must be equal to %2 on the %3.;ESP=%1 del código servicio estándar debe ser igual a %2 en %3.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=%1 of the standard service code must be equal to %2 on the %3.;ESP=%1 del código servicio estándar debe ser igual a %2 en %3.;
    //Variable type has not been exported.
}

