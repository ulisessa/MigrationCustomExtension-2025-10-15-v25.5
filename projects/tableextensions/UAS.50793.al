tableextension 50793 tableextension50793 extends "FA Allocation"
{
    Caption = 'FA Allocation';
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Account No.")
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Account No.';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Allocation %")
        {
            Caption = 'Allocation %';
        }
        modify("Allocation Type")
        {
            Caption = 'Allocation Type';
        }

        //Unsupported feature: Code Modification on ""Dimension Set ID"(Field 480).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Global Dimension 1 Code","Global Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Global Dimension 1 Code","Global Dimension 2 Code"
                                           //++Arbumasa 2019
                                           ,"Global dimension 3 Code","Global Dimension 4 Code"
                                           ,"Global Dimension 5 Code","Global dimension 6 Code"
                                           ,"Global Dimension 7 Code"
                                           //--Arbumasa 2019
                                           );
        */
        //end;
        field(50000; "Global dimension 3 Code"; Code[10])
        {
            Caption = 'Global dimension 3 Code';
            ToolTip = 'Specifies the value of the Global dimension 3 Code field.';
            CaptionClass = '1,2,3';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Global dimension 3 Code");
            end;
        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            CaptionClass = '1,2,4';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Global Dimension 4 Code");
            end;
        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
            CaptionClass = '1,2,5';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Global Dimension 5 Code");
            end;
        }
        field(50003; "Global dimension 6 Code"; Code[10])
        {
            Caption = 'Global dimension 6 Code';
            ToolTip = 'Specifies the value of the Global dimension 6 Code field.';
            CaptionClass = '1,2,6';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Global dimension 6 Code");
            end;
        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Global Dimension 7 Code");
            end;
        }
    }


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 1)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2 %3',Code,"Allocation Type","Line No."),
        "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
        "Global Dimension 1 Code","Global Dimension 2 Code",
        //++Arbu
        "Global dimension 3 Code","Global Dimension 4 Code",
        "Global Dimension 5 Code","Global dimension 6 Code",
        "Global Dimension 7 Code"
        //--Arbu
        );
    */
    //end;
}

