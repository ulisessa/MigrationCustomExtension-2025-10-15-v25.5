tableextension 51187 tableextension51187 extends "Cash Flow Worksheet Line"
{
    Caption = 'Cash Flow Worksheet Line';
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Cash Flow Forecast No.")
        {
            Caption = 'Cash Flow Forecast No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("Cash Flow Account No.")
        {
            Caption = 'Cash Flow Account No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("Payment Terms Code")
        {
            Caption = 'Payment Terms Code';
        }
        modify("Associated Entry No.")
        {
            Caption = 'Associated Entry No.';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Source No.")
        {
            Caption = 'Source No.';
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
            "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
            "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
            "Shortcut Dimension 7 Code"
            //--Arbu
        );
        */
        //end;
        field(50000; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50001; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50002; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50003; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (6));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50004; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (7));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
    }


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 1007)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1',"Line No."),
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
        "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code"
        //--Arbu
    );
    */
    //end;


    //Unsupported feature: Code Modification on "MoveDefualtDimToJnlLineDim(PROCEDURE 2)".

    //procedure MoveDefualtDimToJnlLineDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TableID2[1] := TableID;
    No2[1] := No;
    Dimension := '';
    DimensionSetID :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID2,No2,'',Dimension,Dimension,0,0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    {DimensionSetID :=
      DimMgt.GetRecDefaultDimID(
        Rec,CurrFieldNo,TableID2,No2,'',Dimension,Dimension,0,0);
        }
    */
    //end;
}

