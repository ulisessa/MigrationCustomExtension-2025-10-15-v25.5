query 50010 "Saldos proveedores"
{

    elements
    {
        dataitem(Vendor_Ledger_Entry; "Vendor Ledger Entry")
        {
            filter(Posting_Date; "Posting Date")
            {
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
            column(Sum_Amount; Amount)
            {
                ColumnFilter = Sum_Amount = FILTER (<> 0);
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

