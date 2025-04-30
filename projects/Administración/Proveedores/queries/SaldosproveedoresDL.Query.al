query 50013 "Saldos proveedores DL"
{

    elements
    {
        dataitem(Vendor_Ledger_Entry; "Vendor Ledger Entry")
        {
            filter(Posting_Date; "Posting Date")
            {
            }
            column(Month_Posting_Date; "Posting Date")
            {
                Method = Month;
            }
            column(Vendor_Posting_Group; "Vendor Posting Group")
            {
            }
            column(Vendor_No; "Vendor No.")
            {
            }
            column(Currency_Code; "Currency Code")
            {
            }
            column(Document_Type; "Document Type")
            {
            }
            column(Sum_Amount_LCY; "Amount (LCY)")
            {
                ColumnFilter = Sum_Amount_LCY = FILTER (<> 0);
                Method = Sum;
                ReverseSign = true;
            }
            dataitem(Vendor; Vendor)
            {
                DataItemLink = "No." = Vendor_Ledger_Entry."Vendor No.";
                column(Name; Name)
                {
                }
                column(Country_Region_Code; "Country/Region Code")
                {
                }
            }
        }
    }
}

