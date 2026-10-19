tableextension 51012 tableextension51012 extends "Cartera Doc."
{
    fields
    {
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Payment Method Code")
        {
            Caption = 'Payment Method Code';
        }
        modify(Accepted)
        {
            OptionCaption = 'Not Required,Yes,No';
        }
        modify("Bill Gr./Pmt. Order No.")
        {
            Caption = 'Bill Gr./Pmt. Order No.';
        }
        modify("Category Code")
        {
            Caption = 'Category Code';
        }
        modify("Account No.")
        {
            Caption = 'Account No.';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Cust./Vendor Bank Acc. Code")
        {
            Caption = 'Cust./Vendor Bank Acc. Code';
        }
        modify("Global Dimension 1 Code")
        {
            Caption = 'Global Dimension 1 Code';
        }
        modify("Global Dimension 2 Code")
        {
            Caption = 'Global Dimension 2 Code';
        }
        modify("Direct Debit Mandate ID")
        {
            Caption = 'Direct Debit Mandate ID';
        }
        modify("Original Document No.")
        {
            Caption = 'Original Document No.';
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
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Global Dimension 1 Code","Global Dimension 2 Code",
            //++Arbu
            "Global dimension 3 Code","Global Dimension 4 Code",
            "Global Dimension 5 Code","Global dimension 6 Code",
            "Global Dimension 7 Code"
            //--Arbu
        );
        */
        //end;
        field(50000; "Global dimension 3 Code"; Code[10])
        {
            Caption = 'Global dimension 3 Code';
            ToolTip = 'Specifies the value of the Global dimension 3 Code field.';
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
        field(50003; "Global dimension 6 Code"; Code[10])
        {
            Caption = 'Global dimension 6 Code';
            ToolTip = 'Specifies the value of the Global dimension 6 Code field.';
            CaptionClass = '1,2,6';

        }
        field(50004; "Global Dimension 7 Code"; Code[20])
        {
            Caption = 'Global Dimension 7 Code';
            ToolTip = 'Specifies the value of the Global Dimension 7 Code field.';
            CaptionClass = '1,2,7';

        }
    }


    //Unsupported feature: Property Modification (TextConstString) on "Text001(Variable 1100001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text001 : ENU=%1 is more than the legal limit of %2 days after the document date %3 for the original document;ESP=%1 es superior al límite legal de %2 días después de la fecha de documento %3 del documento original;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text001 : ENU=%1 is more than the legal limit of %2 days after the document date %3 for the original document;ESP=%1 es superior al límite legal de %2 días después de la fecha de documento %3 del documento original;
    //Variable type has not been exported.
}

