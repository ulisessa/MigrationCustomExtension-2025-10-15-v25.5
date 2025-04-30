query 50032 "Detalle proveedores"
{

    elements
    {
        dataitem(Vendor_Ledger_Entry; "Vendor Ledger Entry")
        {
            DataItemTableFilter = "Document Type" = CONST (Invoice), Open = FILTER (false);
            filter(Filtro_Document_No; "Document No.")
            {
            }
            column(Factura; "Document No.")
            {
            }
            column(Fecha_registro; "Posting Date")
            {
            }
            dataitem(Detailed_Vendor_Ledg_Entry; "Detailed Vendor Ledg. Entry")
            {
                DataItemLink = "Vendor Ledger Entry No." = Vendor_Ledger_Entry."Entry No.";
                SqlJoinType = InnerJoin;
                DataItemTableFilter = "Document Type" = FILTER (Payment), Unapplied = FILTER (false), Amount = FILTER (<> 0);
                filter(Filtro_Posting_Date; "Posting Date")
                {
                }
                column(Document_No; "Document No.")
                {
                }
                column(Posting_Date; "Posting Date")
                {
                }
                column(Sum_Amount_LCY_Pago; "Amount (LCY)")
                {
                    Method = Sum;
                }
                dataitem(Vendor; Vendor)
                {
                    DataItemLink = "No." = Detailed_Vendor_Ledg_Entry."Vendor No.";
                    column(VAT_Registration_No; "VAT Registration No.")
                    {
                    }
                    column(Name; Name)
                    {
                    }
                }
            }
        }
    }
}

