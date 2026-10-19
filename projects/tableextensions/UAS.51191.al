tableextension 51191 tableextension51191 extends "Cash Flow Manual Expense"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Cash Flow Account No.")
        {
            Caption = 'Cash Flow Account No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Recurring Frequency")
        {
            Caption = 'Recurring Frequency';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
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
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.UpdateDefaultDim(
      DATABASE::"Cash Flow Manual Expense",Code,
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    DimMgt.UpdateDefaultDim(
      DATABASE::"Cash Flow Manual Expense",Code,
      "Global Dimension 1 Code","Global Dimension 2 Code",
      //++Arbu
      "Global Dimension 3 Code","Global Dimension 4 Code",
      "Global Dimension 5 Code","Global Dimension 6 Code",
      "Global Dimension 7 Code"
      //--Arbu
      );
    */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimMgt.RenameDefaultDim(DATABASE::"Cash Flow Manual Expense",xRec.Code,Code);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //DimMgt.RenameDefaultDim(DATABASE::"Cash Flow Manual Expense",xRec.Code,Code);
    */
    //end;
}

