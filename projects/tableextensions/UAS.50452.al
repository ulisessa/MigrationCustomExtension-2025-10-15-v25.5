tableextension 50452 tableextension50452 extends "Currency Exchange Rate"
{
    fields
    {
        modify("Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        modify("Relational Currency Code")
        {
            TableRelation = Currency.Code;
            Caption = 'Relational Currency Code';
        }
    }

    //Unsupported feature: Code Modification on "ExchangeAmtFCYToLCY(PROCEDURE 6)".

    //procedure ExchangeAmtFCYToLCY();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if CurrencyCode = '' then
      exit(Amount);
    FindCurrency(Date,CurrencyCode,1);
    #4..10
      "Relational Exch. Rate Amount" := "Relational Adjmt Exch Rate Amt";
    end;
    if "Relational Currency Code" = '' then
      if "Fix Exchange Rate Amount" = "Fix Exchange Rate Amount"::Both then
        Amount := (Amount / "Exchange Rate Amount") * "Relational Exch. Rate Amount"
      else
        Amount := Amount / Factor
    else begin
      RelExchangeRateAmt := "Relational Exch. Rate Amount";
      ExchangeRateAmt := "Exchange Rate Amount";
    #21..60
      Amount := (Amount / "Relational Exch. Rate Amount") * "Exchange Rate Amount";
    end;
    exit(Amount);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..13
    begin
    #14..16
      //++Arbu
      begin
        if Factor = 0 then
          Amount := 0
        else
          Amount := Amount / Factor;
      end;
    end
    #18..63
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "Text000(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //Text000 : ENU=The currency code in the %1 field and the %2 field cannot be the same.;ESP=El código de divisa no puede ser el mismo en los campos %1 y %2.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //Text000 : ENU=The currency code in the %1 field and the %2 field cannot be the same.;ESP=El código de divisa no puede ser el mismo en los campos %1 y %2.;
    //Variable type has not been exported.
}

