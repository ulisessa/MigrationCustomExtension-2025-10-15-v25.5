tableextension 51246 tableextension51246 extends "SB Owner Cue"
{

    //Unsupported feature: Code Modification on "CountSalesOrdersShippedNotInvoiced(PROCEDURE 1)".

    //procedure CountSalesOrdersShippedNotInvoiced();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CountSalesOrders.SetRange(Completely_Shipped,true);
    CountSalesOrders.SetRange(Shipped_Not_Invoiced,true);
    CountSalesOrders.Open;
    CountSalesOrders.Read;
    exit(CountSalesOrders.Count_Orders);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CountSalesOrders.SetRange(Completely_Shipped,true);
    CountSalesOrders.SetRange(Invoice,true);
    #3..5
    */
    //end;
}

