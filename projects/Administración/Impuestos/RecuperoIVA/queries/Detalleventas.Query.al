query 50030 "Detalle ventas"
{

    elements
    {
        dataitem(Sales_Invoice_Line; "Sales Invoice Line")
        {
            DataItemTableFilter = Type = FILTER (Item | Resource), "No." = FILTER (<> ''), "Job No." = FILTER (<> '');
            filter(Document_No; "Document No.")
            {
            }
            filter(Filt_Cod_Arance; "Cód. arancelario")
            {
            }
            column(Cod_Document_No; "Document No.")
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            column(Gen_Prod_Posting_Group; "Gen. Prod. Posting Group")
            {
            }
            column(VAT_Bus_Posting_Group; "VAT Bus. Posting Group")
            {
            }
            column(VAT_Prod_Posting_Group; "VAT Prod. Posting Group")
            {
            }
            column(Job_No; "Job No.")
            {
            }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            {
            }
            column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code")
            {
            }
            column(Shortcut_Dimension_3_Code; "Shortcut Dimension 3 Code")
            {
            }
            column(Shortcut_Dimension_4_Code; "Shortcut Dimension 4 Code")
            {
            }
            column(Shortcut_Dimension_5_Code; "Shortcut Dimension 5 Code")
            {
            }
            column(Shortcut_Dimension_6_Code; "Shortcut Dimension 6 Code")
            {
            }
            column(Shortcut_Dimension_7_Code; "Shortcut Dimension 7 Code")
            {
            }
            column("Cód_arancelario"; "Cód. arancelario")
            {
            }
            column(Unit_of_Measure; "Unit of Measure")
            {
            }
            column(Sum_Amount; Amount)
            {
                Method = Sum;
            }
            column(Sum_Amount_Including_VAT; "Amount Including VAT")
            {
                Method = Sum;
            }
            column(Sum_Net_kilos; "Net kilos")
            {
                Method = Sum;
            }
            dataitem(Tax_Group; "Tax Group")
            {
                DataItemLink = Code = Sales_Invoice_Line."Tax Group Code";
                column(Computable; Computable)
                {
                }
                column("Code"; "Code")
                {
                }
                dataitem(Resource; Resource)
                {
                    DataItemLink = "No." = Sales_Invoice_Line."No.";
                    SqlJoinType = LeftOuterJoin;
                    filter(Gross_winnings_perception_code; "Gross winnings perception code")
                    {
                    }
                    dataitem(Sales_Invoice_Header; "Sales Invoice Header")
                    {
                        DataItemLink = "No." = Sales_Invoice_Line."Document No.";
                        SqlJoinType = LeftOuterJoin;
                        column(Permiso_de_embarque; "Permiso de embarque")
                        {
                        }
                    }
                }
            }
        }
    }
}

