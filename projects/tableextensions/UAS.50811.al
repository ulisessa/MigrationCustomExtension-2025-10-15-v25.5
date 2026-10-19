tableextension 50811 tableextension50811 extends "Insurance Journal Line"
{
    Caption = 'Insurance Journal Line';
    fields
    {
        modify("Journal Batch Name")
        {
            Caption = 'Journal Batch Name';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Insurance No.")
        {
            Caption = 'Insurance No.';
        }
        modify("FA No.")
        {
            Caption = 'FA No.';
        }
        modify("FA Description")
        {
            Caption = 'FA Description';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify("External Document No.")
        {
            Caption = 'External Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
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
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
                                           //++Arbumasa 2019
                                           "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
                                           "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
                                           "Shortcut Dimension 7 Code");
                                           //--Arbumasa 2019
        */
        //end;
        field(50505; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50506; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50507; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50508; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (6));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50509; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (7));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
            end;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    LockTable;
    InsuranceJnlTempl.Get("Journal Template Name");
    "Source Code" := InsuranceJnlTempl."Source Code";
    InsuranceJnlBatch.Get("Journal Template Name","Journal Batch Name");
    "Reason Code" := InsuranceJnlBatch."Reason Code";

    ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
    ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
    //++Arbu
    ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
    ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
    ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
    ValidateShortcutDimCode(6,"Shortcut Dimension 6 Code");
    ValidateShortcutDimCode(7,"Shortcut Dimension 7 Code");
    //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 13)".

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
        Rec,CurrFieldNo,TableID,No,"Source Code","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",0,0);
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
        Rec,CurrFieldNo,TableID,No,"Source Code","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
        //++Arbu
        "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
        "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
        "Shortcut Dimension 7 Code",
        //--Arbu
        0,0);
    */
    //end;


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 2)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet2(
        "Dimension Set ID",StrSubstNo('%1 %2 %3',"Journal Template Name","Journal Batch Name","Line No."),
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
}

