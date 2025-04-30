tableextension 50423 tableextension50423 extends "Finance Charge Memo Line"
{
    Caption = 'Finance Charge Memo Line';
    fields
    {
        modify("Finance Charge Memo No.")
        {
            Caption = 'Finance Charge Memo No.';
        }
        modify("Line No.")
        {
            Caption = 'Line No.';
        }
        modify("Attached to Line No.")
        {
            Caption = 'Attached to Line No.';
        }
        modify("Entry No.")
        {
            Caption = 'Entry No.';
        }
        modify("Document Date")
        {
            Caption = 'Document Date';
        }
        modify("Document No.")
        {
            Caption = 'Document No.';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("No.")
        {
            Caption = 'No.';
        }
        modify("Interest Rate")
        {
            Caption = 'Interest Rate';
        }
        modify("VAT Calculation Type")
        {
            Caption = 'VAT Calculation Type';
        }
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
        }
        modify("Line Type")
        {
            Caption = 'Line Type';
            OptionCaption = 'Finance Charge Memo Line,Beginning Text,Ending Text,Rounding';
        }
        modify("VAT Clause Code")
        {
            Caption = 'VAT Clause Code';
        }
        modify("Detailed Interest Rates Entry")
        {
            Caption = 'Detailed Interest Rates Entry';
        }
        modify("System-Created Entry")
        {
            Caption = 'System-Created Entry';
        }

        //Unsupported feature: Code Modification on "Amount(Field 16).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if Type = Type::" " then begin
          FinChrgMemoLine.Type := Type::"G/L Account";
          FinChrgMemoLine2.Type := Type::"Customer Ledger Entry";
        #4..19
              "VAT Amount" :=
                SalesTaxCalculate.CalculateTax(
                  FinChrgMemoHeader."Tax Area Code","Tax Group Code",FinChrgMemoHeader."Tax Liable",
                  FinChrgMemoHeader."Posting Date",Amount,0,0);
              if Amount - "VAT Amount" <> 0 then
                "VAT %" := Round(100 * "VAT Amount" / Amount,0.00001)
              else
        #27..32
              "VAT %" := 0;
            end;
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..22
                  FinChrgMemoHeader."Posting Date",Amount,0,0,
                  //++Arbu
                  'X',"VAT Calculation Type",'',Amount
                  //--Arbu
                  );
        #24..35
        */
        //end;


        //Unsupported feature: Code Modification on ""VAT Prod. Posting Group"(Field 23).OnValidate".

        //trigger  Posting Group"(Field 23)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetFinChrgMemoHeader;
        VATPostingSetup.Get(FinChrgMemoHeader."VAT Bus. Posting Group","VAT Prod. Posting Group");
        OnValidateVATProdPostingGroupOnAfterVATPostingSetupGet(VATPostingSetup);
        #4..17
              "VAT Amount" :=
                SalesTaxCalculate.CalculateTax(
                  FinChrgMemoHeader."Tax Area Code","Tax Group Code",FinChrgMemoHeader."Tax Liable",
                  FinChrgMemoHeader."Posting Date",Amount,0,0);
              if Amount - "VAT Amount" <> 0 then
                "VAT %" := Round(100 * "VAT Amount" / Amount,0.00001)
              else
                "VAT %" := 0;
              "VAT Amount" := Round("VAT Amount",Currency."Amount Rounding Precision");
            end;
        end;
        Validate(Amount);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..20
                  FinChrgMemoHeader."Posting Date",Amount,0,0,
                  //++Arbu
                  'X',"VAT Calculation Type",'',Amount
                  //--Arbu
                  );
        #22..29
        */
        //end;
        field(50700; province; Code[10])
        {
        }
    }


    //Unsupported feature: Property Modification (TextConstString) on "NotEnoughSpaceToInsertErr(Variable 1020)".

    //var
    //>>>> ORIGINAL VALUE:
    //NotEnoughSpaceToInsertErr : ENU=There is not enough space to insert lines with additional interest rates.;ESP=No hay espacio suficiente para insertar líneas con tipos de interés adicionales.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //NotEnoughSpaceToInsertErr : ENU=There is not enough space to insert lines with additional interest rates.;ESP=No hay espacio suficiente para insertar líneas con tipos de interés adicionales.;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (TextConstString) on "InvalidInterestRateDateErr(Variable 1008)".

    //var
    //>>>> ORIGINAL VALUE:
    //InvalidInterestRateDateErr : @@@=%1 - date;ENU=Create interest rate with start date prior to %1.;ESP=Permite crear tipo interés con fecha de inicio anterior a %1.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InvalidInterestRateDateErr : @@@=%1 - date;ENU=Create interest rate with start date prior to %1.;ESP=Permite crear tipo interés con fecha de inicio anterior a %1.;
    //Variable type has not been exported.
}

