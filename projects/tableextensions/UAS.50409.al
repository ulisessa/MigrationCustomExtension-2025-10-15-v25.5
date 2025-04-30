tableextension 50409 tableextension50409 extends "Shipping Agent"
{
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Internet Address")
        {
            Caption = 'Internet Address';
        }
        modify("Account No.")
        {
            Caption = 'Account No.';
        }
    }

    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ShippingAgentServices.SetRange("Shipping Agent Code",Code);
    ShippingAgentServices.DeleteAll;

    CalendarManagement.DeleteCustomizedBaseCalendarData(CustomizedCalendarChange."Source Type"::"Shipping Agent",Code);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    //CalendarManagement.DeleteCustomizedBaseCalendarData(CustomizedCalendarChange."Source Type"::"Shipping Agent",Code);
    */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CalendarManagement.RenameCustomizedBaseCalendarData(CustomizedCalendarChange."Source Type"::"Shipping Agent",Code,xRec.Code);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //CalendarManagement.RenameCustomizedBaseCalendarData(CustomizedCalendarChange."Source Type"::"Shipping Agent",Code,xRec.Code);
    */
    //end;
}

