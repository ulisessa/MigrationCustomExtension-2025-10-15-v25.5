tableextension 51240 tableextension51240 extends "Purchase Cue"
{
    fields
    {
        modify("Upcoming Orders")
        {
            Caption = 'Upcoming Orders';
        }
        modify("Days Since Last SII Check")
        {
            Caption = 'Days Since Last SII Check';
        }
    }

    //Unsupported feature: Code Modification on "CountOrders(PROCEDURE 5)".

    //procedure CountOrders();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    case FieldNumber of
      FieldNo("Outstanding Purchase Orders"):
        begin
    #4..6
      FieldNo("Not Invoiced"):
        begin
          CountPurchOrders.SetRange(Completely_Received,true);
          CountPurchOrders.SetRange(Partially_Invoiced,false);
        end;
      FieldNo("Partially Invoiced"):
        begin
          CountPurchOrders.SetRange(Completely_Received,true);
          CountPurchOrders.SetRange(Partially_Invoiced,true);
        end;
    end;
    FilterGroup(2);
    #19..23
    Result := CountPurchOrders.Count_Orders;

    exit(Result);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9
          CountPurchOrders.SetRange(Invoice,false);
    #11..14
          CountPurchOrders.SetRange(Invoice,true);
    #16..26
    */
    //end;
}

