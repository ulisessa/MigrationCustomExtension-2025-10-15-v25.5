tableextension 50408 tableextension50408 extends "VAT Amount Line"
{
    Caption = 'VAT Amount Line';
    fields
    {
        modify("Line Amount")
        {
            Caption = 'Line Amount';
        }
        modify("VAT Calculation Type")
        {
            Caption = 'VAT Calculation Type';
        }
        modify("Tax Group Code")
        {
            Caption = 'Tax Group Code';
        }
        modify("Use Tax")
        {
            Caption = 'Use Tax';
        }
        modify("VAT Clause Code")
        {
            Caption = 'VAT Clause Code';
        }
        modify("Tax Category")
        {
            Caption = 'Tax Category';
        }
        modify("Line Discount Amount")
        {
            Caption = 'Line Discount Amount';
        }
    }

    //Unsupported feature: Code Modification on "UpdateLines(PROCEDURE 100)".

    //procedure UpdateLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if FindSet then
      repeat
        if (PrevVATAmountLine."VAT Identifier" <> "VAT Identifier") or
    #4..143
                else
                  "VAT Amount" :=
                    SalesTaxCalculate.CalculateTax(
                      TaxAreaCode,"Tax Group Code",TaxLiable,PostingDate,"VAT Base",Quantity,CurrencyFactor);
                OnAfterSalesTaxCalculateCalculateTax(Rec,Currency);
                if "VAT Base" = 0 then
                  "VAT %" := 0
    #151..161
        "Calculated EC Amount" := "EC Amount" - "EC Difference";
        Modify;
      until Next = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..146
                      TaxAreaCode,"Tax Group Code",TaxLiable,PostingDate,"VAT Base",Quantity,CurrencyFactor,
                      //++Arbu
                      '',0,'',"VAT Base");
                      //--Arbu
    #148..164
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "InvoiceDiscAmtIsGreaterThanBaseAmtErr(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //InvoiceDiscAmtIsGreaterThanBaseAmtErr : @@@=1 Invoice Discount Amount that should be set 2 Maximum Amount that you can assign;ENU=The maximum %1 that you can apply is %2.;ESP=El %1 máximo que puede aplicar es de %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //InvoiceDiscAmtIsGreaterThanBaseAmtErr : @@@=1 Invoice Discount Amount that should be set 2 Maximum Amount that you can assign;ENU=The maximum %1 that you can apply is %2.;ESP=El %1 máximo que puede aplicar es de %2.;
    //Variable type has not been exported.
}

