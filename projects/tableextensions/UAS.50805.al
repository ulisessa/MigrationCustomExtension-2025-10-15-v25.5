tableextension 50805 tableextension50805 extends Insurance
{
    fields
    {
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Policy No.")
        {
            Caption = 'Policy No.';
        }
        modify("Policy Coverage")
        {
            Caption = 'Policy Coverage';
        }
        modify("Last Date Modified")
        {
            Caption = 'Last Date Modified';
        }
        modify("Insurance Vendor No.")
        {
            Caption = 'Insurance Vendor No.';
        }
        modify("FA Class Code")
        {
            Caption = 'FA Class Code';
        }
        modify("FA Subclass Code")
        {
            Caption = 'FA Subclass Code';
        }
        modify("FA Location Code")
        {
            Caption = 'FA Location Code';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Location Code")
        {
            Caption = 'Location Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Search Description")
        {
            Caption = 'Search Description';
        }
        field(50000; "Global Dimension 3 Code"; Code[10])
        {
            Caption = 'Global Dimension 3 Code';
            ToolTip = 'Specifies the value of the Global Dimension 3 Code field.';
            CaptionClass = '1,2,3';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Global Dimension 3 Code");
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
        field(50003; "Global Dimension 6 Code"; Code[10])
        {
            Caption = 'Global Dimension 6 Code';
            ToolTip = 'Specifies the value of the Global Dimension 6 Code field.';
            CaptionClass = '1,2,6';


            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Global Dimension 6 Code");
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


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "No." = '' then begin
      FASetup.Get;
      FASetup.TestField("Insurance Nos.");
      NoSeriesMgt.InitSeries(FASetup."Insurance Nos.",xRec."No. Series",0D,"No.","No. Series");
    end;

    DimMgt.UpdateDefaultDim(
      DATABASE::Insurance,"No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
      "Global Dimension 1 Code","Global Dimension 2 Code",
      //++Arbu
      "Global Dimension 3 Code","Global Dimension 4 Code",
      "Global Dimension 5 Code","Global Dimension 6 Code",
      "Global Dimension 7 Code");
      //--Arbu
    */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.RenameDefaultDim(DATABASE::Insurance,xRec."No.","No.");
    "Last Date Modified" := Today;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //DimMgt.RenameDefaultDim(DATABASE::Insurance,xRec."No.","No.");
    "Last Date Modified" := Today;
    */
    //end;
}

