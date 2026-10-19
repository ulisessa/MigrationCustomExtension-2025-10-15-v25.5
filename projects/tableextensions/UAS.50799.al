tableextension 50799 tableextension50799 extends "FA Journal Line"
{
    Caption = 'FA Journal Line';
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
        modify("Depreciation Book Code")
        {
            Caption = 'Depreciation Book Code';
        }
        modify("FA No.")
        {
            Caption = 'FA No.';
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
        modify(Correction)
        {
            Caption = 'Correction';
        }
        modify("No. of Depreciation Days")
        {
            Caption = 'No. of Depreciation Days';
        }
        modify("Maintenance Code")
        {
            Caption = 'Maintenance Code';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Insurance No.")
        {
            Caption = 'Insurance No.';
        }
        modify("Budgeted FA No.")
        {
            Caption = 'Budgeted FA No.';
        }
        modify("FA Reclassification Entry")
        {
            Caption = 'FA Reclassification Entry';
        }
        modify("FA Error Entry No.")
        {
            Caption = 'FA Error Entry No.';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Recurring Frequency")
        {
            Caption = 'Recurring Frequency';
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
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            Caption = 'Global Dimension 3 Code';
            ToolTip = 'Specifies the value of the Global Dimension 3 Code field.';
            CaptionClass = '1,2,3';

        }
        field(50001; "Global Dimension 4 Code"; Code[10])
        {
            Caption = 'Global Dimension 4 Code';
            ToolTip = 'Specifies the value of the Global Dimension 4 Code field.';
            CaptionClass = '1,2,4';

        }
        field(50002; "Global Dimension 5 Code"; Code[10])
        {
            Caption = 'Global Dimension 5 Code';
            ToolTip = 'Specifies the value of the Global Dimension 5 Code field.';
            CaptionClass = '1,2,5';

        }
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            Caption = 'Global Dimension 6 Code';
            ToolTip = 'Specifies the value of the Global Dimension 6 Code field.';
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';

        }
        field(50505; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


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
    FAJnlTemplate.Get("Journal Template Name");
    "Source Code" := FAJnlTemplate."Source Code";
    FAJnlBatch.Get("Journal Template Name","Journal Batch Name");
    "Reason Code" := FAJnlBatch."Reason Code";

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

