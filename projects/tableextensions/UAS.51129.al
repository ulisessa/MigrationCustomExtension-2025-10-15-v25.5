tableextension 51129 tableextension51129 extends "Standard General Journal Line"
{
    Caption = 'Standard General Journal Line';
    fields
    {
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Account No.")
        {
            Caption = 'Account No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Profit (LCY)")
        {
            Caption = 'Profit (LCY)';
        }
        modify("Bill-to/Pay-to No.")
        {
            Caption = 'Bill-to/Pay-to No.';
        }
        modify("Shortcut Dimension 1 Code")
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        modify("Shortcut Dimension 2 Code")
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        modify("Salespers./Purch. Code")
        {
            Caption = 'Salespers./Purch. Code';
        }
        modify("Source Code")
        {
            Caption = 'Source Code';
        }
        modify("Job No.")
        {
            Caption = 'Job No.';
        }
        modify("Payment Terms Code")
        {
            Caption = 'Payment Terms Code';
        }
        modify("Business Unit Code")
        {
            Caption = 'Business Unit Code';
        }
        modify("Standard Journal Code")
        {
            Caption = 'Standard Journal Code';
        }
        modify("Reason Code")
        {
            Caption = 'Reason Code';
        }
        modify("VAT Calculation Type")
        {
            Caption = 'VAT Calculation Type';
        }
        modify("Bal. VAT Calculation Type")
        {
            Caption = 'Bal. VAT Calculation Type';
        }
        modify(Correction)
        {
            Caption = 'Correction';
        }
        modify("Source No.")
        {
            Caption = 'Source No.';
        }
        modify("Posting No. Series")
        {
            Caption = 'Posting No. Series';
        }
        modify("Tax Area Code")
        {
            Caption = 'Tax Area Code';
        }
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
        }
        modify("Use Tax")
        {
            Caption = 'Use Tax';
        }
        modify("Bal. Tax Area Code")
        {
            Caption = 'Bal. Tax Area Code';
        }
        modify("Bal. Tax Group Code")
        {
            Caption = 'Bal. Tax Group Code';
        }
        modify("Bal. Use Tax")
        {
            Caption = 'Bal. Use Tax';
        }
        modify("Ship-to/Order Address Code")
        {
            Caption = 'Ship-to/Order Address Code';
        }
        modify("IC Partner Code")
        {
            Caption = 'IC Partner Code';
        }
        modify("Sell-to/Buy-from No.")
        {
            Caption = 'Sell-to/Buy-from No.';
        }
        modify("Campaign No.")
        {
            Caption = 'Campaign No.';
        }
        modify("Payment Method Code")
        {
            Caption = 'Payment Method Code';
        }

        //Unsupported feature: Code Modification on ""VAT Base Amount"(Field 71).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetCurrency;
        "VAT Base Amount" := Round("VAT Base Amount",Currency."Amount Rounding Precision");
        case "VAT Calculation Type" of
        #4..24
              "VAT Amount" :=
                SalesTaxCalculate.CalculateTax(
                  "Tax Area Code","Tax Group Code","Tax Liable",WorkDate,
                  "VAT Base Amount",Quantity,"Currency Factor");
              if "VAT Base Amount" <> 0 then
                "VAT %" := Round(100 * "VAT Amount" / "VAT Base Amount",0.00001)
              else
        #32..35
            end;
        end;
        Validate(Amount);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..27
                  "VAT Base Amount",Quantity,"Currency Factor",
                  //++Arbu
                  "Account No.","Document Type",'',Amount
                  //--Arbu
                  );
        #29..38
        */
        //end;


        //Unsupported feature: Code Modification on ""Bal. VAT Base Amount"(Field 72).OnValidate".

        //trigger  VAT Base Amount"(Field 72)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetCurrency;
        "Bal. VAT Base Amount" := Round("Bal. VAT Base Amount",Currency."Amount Rounding Precision");
        case "Bal. VAT Calculation Type" of
        #4..24
              "Bal. VAT Amount" :=
                SalesTaxCalculate.CalculateTax(
                  "Bal. Tax Area Code","Bal. Tax Group Code","Bal. Tax Liable",
                  WorkDate,"Bal. VAT Base Amount",Quantity,"Currency Factor");
              if "Bal. VAT Base Amount" <> 0 then
                "Bal. VAT %" := Round(100 * "Bal. VAT Amount" / "Bal. VAT Base Amount",0.00001)
              else
        #32..35
            end;
        end;
        Validate(Amount);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..27
                  WorkDate,"Bal. VAT Base Amount",Quantity,"Currency Factor",
                  //++Arbu
                  "Bal. Account No.","Document Type",'',Amount
                  //--Arbu
                  );
        #29..38
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
        field(50525; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50526; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(50527; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(50528; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(50529; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
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
        "Dimension Set ID",StrSubstNo('%1 %2 %3',"Journal Template Name","Standard Journal Code","Line No."),
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


    //Unsupported feature: Code Modification on "CreateDim(PROCEDURE 13)".

    //procedure CreateDim();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TableID[1] := Type1;
    No[1] := No1;
    TableID[2] := Type2;
    #4..11

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
    #1..14
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


    //Unsupported feature: Property Modification (TextConstString) on "Text006(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text006 : ENU=The %1 option can only be used internally in the system.;ESP=La opción %1 es de uso interno del sistema.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text006 : ENU=The %1 option can only be used internally in the system.;ESP=La opción %1 es de uso interno del sistema.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text013(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text013 : ENU=The %1 must not be more than %2.;ESP=%1 no debe ser más que %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text013 : ENU=The %1 must not be more than %2.;ESP=%1 no debe ser más que %2.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "Text014(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text014 : ENU=The %1 %2 has a %3 %4.\Do you still want to use %1 %2 in this journal line?;ESP=El %1 %2 tiene un %3 %4.\¿Todavía quiere utilizar %1 %2 en esta línea del diario?;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text014 : ENU=The %1 %2 has a %3 %4.\Do you still want to use %1 %2 in this journal line?;ESP=El %1 %2 tiene un %3 %4.\?Todavía quiere utilizar %1 %2 en esta línea del diario?;
    //Variable type has not been exported.
}

