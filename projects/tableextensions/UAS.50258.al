tableextension 50258 "Standard Cust. Sales Code Ext." extends "Standard Customer Sales Code"
{
    Caption = 'Standard Customer Sales Code';
    fields
    {
        modify("Customer No.")
        {
            Caption = 'Customer No.';
        }
        modify("Code")
        {
            Caption = 'Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Valid From Date")
        {
            Caption = 'Valid From Date';
        }
        modify("Valid To date")
        {
            Caption = 'Valid To date';
        }
        modify("Payment Method Code")
        {
            Caption = 'Payment Method Code';
        }
        modify("Payment Terms Code")
        {
            Caption = 'Payment Terms Code';
        }
        modify("Direct Debit Mandate ID")
        {
            Caption = 'Direct Debit Mandate ID';
        }
        modify("Insert Rec. Lines On Quotes")
        {
            Caption = 'Insert Rec. Lines On Quotes';
            OptionCaption = 'Manual,Automatic,Always Ask';
        }
        modify("Insert Rec. Lines On Orders")
        {
            Caption = 'Insert Rec. Lines On Orders';
            OptionCaption = 'Manual,Automatic,Always Ask';
        }
        modify("Insert Rec. Lines On Invoices")
        {
            Caption = 'Insert Rec. Lines On Invoices';
            OptionCaption = 'Manual,Automatic,Always Ask';
        }
        modify("Insert Rec. Lines On Cr. Memos")
        {
            Caption = 'Insert Rec. Lines On Cr. Memos';
            OptionCaption = 'Manual,Automatic,Always Ask';
        }
    }

    //Unsupported feature: Code Modification on "InsertSalesLines(PROCEDURE 1)".

    //procedure InsertSalesLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesHeader.TestField("No.");
    SalesHeader.TestField("Sell-to Customer No.");

    #4..8
    StdCustSalesCodes.SetTableView(StdCustSalesCode);
    StdCustSalesCodes.LookupMode(true);
    if StdCustSalesCodes.RunModal = ACTION::LookupOK then begin
      StdCustSalesCodes.GetSelected(StdCustSalesCode);
      if StdCustSalesCode.FindSet then
        repeat
          ApplyStdCodesToSalesLines(SalesHeader,StdCustSalesCode);
        until StdCustSalesCode.Next = 0;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
    //  StdCustSalesCodes.GetSelected(StdCustSalesCode);
    #13..17
    */
    //end;


    //Unsupported feature: Code Modification on "CombineDimensions(PROCEDURE 5)".

    //procedure CombineDimensions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DimensionSetIDArr[1] := SalesLine."Dimension Set ID";
    DimensionSetIDArr[2] := StdSalesLine."Dimension Set ID";

    SalesLine."Dimension Set ID" :=
      DimensionManagement.GetCombinedDimensionSetID(
        DimensionSetIDArr,SalesLine."Shortcut Dimension 1 Code",SalesLine."Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
        DimensionSetIDArr,SalesLine."Shortcut Dimension 1 Code",SalesLine."Shortcut Dimension 2 Code",
                          //++Arbu
                          SalesLine."Shortcut Dimension 3 Code",SalesLine."Shortcut Dimension 4 Code",
                          SalesLine."Shortcut Dimension 5 Code",SalesLine."Shortcut Dimension 6 Code",
                          SalesLine."Shortcut Dimension 7 Code"
                          //--Arbu
                          );
    */
    //end;


    //Unsupported feature: Property Modification (TextConstString) on "RenameErr(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //RenameErr : ENU=You cannot rename the line.;ESP=No puede cambiar de nombre la línea.;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RenameErr : ENU=You cannot rename the line.;ESP=No puede cambiar de nombre la línea.;
    //Variable type has not been exported.
}

