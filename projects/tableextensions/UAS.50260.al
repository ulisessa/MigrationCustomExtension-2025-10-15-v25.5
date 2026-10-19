tableextension 50260 "Standard Purchase Line Ext." extends "Standard Purchase Line"
{
    Caption = 'Standard Purchase Line';
    fields
    {
        modify("Standard Purchase Code")
        {
            Caption = 'Standard Purchase Code';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("No.")
        {
            TableRelation = IF (Type = CONST(" ")) "Standard Text"
            ELSE
            IF (Type = CONST("G/L Account")) "G/L Account"
            ELSE
            IF (Type = CONST(Item)) Item WHERE(Blocked = CONST(false))
            ELSE
            IF (Type = CONST(Resource)) Resource
            ELSE
            IF (Type = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF (Type = CONST("Charge (Item)")) "Item Charge";
            Caption = 'No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Unit of Measure Code")
        {
            Caption = 'Unit of Measure Code';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Variant Code")
        {
            Caption = 'Variant Code';
        }

        //Unsupported feature: Code Modification on ""No."(Field 4).OnValidate".

        //trigger "(Field 4)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        Quantity := 0;
        "Amount Excl. VAT" := 0;
        "Unit of Measure Code" := '';
        #4..29
              Description := Item.Description;
              "Variant Code" := '';
            end;
          3:
            Error(Text001);
          Type::"Fixed Asset":
            begin
        #37..44
              Description := ItemCharge.Description;
            end;
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..32
          Type::Resource:
        #34..47
        */
        //end;


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
        field(50501; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            ToolTip = 'Specifies the value of the Job No field.';
            DataClassification = ToBeClassified;
            TableRelation = Job;

            trigger OnValidate()
            var
                Job: Record Job;
                rstJobTask: Record "Job Task";
                rstJob: Record Job;
            begin
                Job.Get("Job No.");
                Job.TestBlocked;

                //++Arbu
                Clear(rstJob);
                if rstJob.Get("Job No.") then begin

                    if rstJob."Global Dimension 1 Code" <> '' then
                        Validate("Shortcut Dimension 1 Code", rstJob."Global Dimension 1 Code");
                    if rstJob."Global Dimension 2 Code" <> '' then
                        Validate("Shortcut Dimension 2 Code", rstJob."Global Dimension 2 Code");
                    if rstJob."Global Dimension 3 Code" <> '' then
                        Validate("Shortcut Dimension 3 Code", rstJob."Global Dimension 3 Code");
                    if rstJob."Global Dimension 4 Code" <> '' then
                        Validate("Shortcut Dimension 4 Code", rstJob."Global Dimension 4 Code");
                    if rstJob."Global Dimension 5 Code" <> '' then
                        Validate("Shortcut Dimension 5 Code", rstJob."Global Dimension 5 Code");
                    if rstJob."Global Dimension 6 Code" <> '' then
                        Validate("Shortcut Dimension 6 Code", rstJob."Global Dimension 6 Code");
                    if rstJob."Global Dimension 7 Code" <> '' then
                        Validate("Shortcut Dimension 7 Code", rstJob."Global Dimension 7 Code");
                    Clear(rstJobTask);
                    rstJobTask.SetRange(rstJobTask."Job No.", "Job No.");
                    rstJobTask.SetRange("Job Task Type", rstJobTask."Job Task Type"::Posting);
                end
                //--Arbu
            end;
        }
        field(50503; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(50504; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(50505; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(50506; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(50507; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
    }


    //Unsupported feature: Code Modification on "ShowDimensions(PROCEDURE 3)".

    //procedure ShowDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet("Dimension Set ID",StrSubstNo('%1 %2',"Standard Purchase Code","Line No."));
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    "Dimension Set ID" :=
      DimMgt.EditDimensionSet("Dimension Set ID",StrSubstNo('%1 %2',"Standard Purchase Code","Line No."));
    DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",
                                       //++Arbu
                                       "Shortcut Dimension 3 Code","Shortcut Dimension 4 Code",
                                       "Shortcut Dimension 5 Code","Shortcut Dimension 6 Code",
                                       "Shortcut Dimension 7 Code"
                                       //--Arbu
                                       );
    */
    //end;
}

