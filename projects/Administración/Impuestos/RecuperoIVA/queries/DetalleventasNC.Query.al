query 50037 "Detalle ventas NC"
{

    elements
    {
        dataitem(Sales_Cr_Memo_Line; "Sales Cr.Memo Line")
        {
            DataItemTableFilter = "No." = FILTER (<> '');
            filter(Document_No; "Document No.")
            {
            }
            column(Cod_Document_No; "Document No.")
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
            column(Sum_Kilos_netos; "Kilos netos")
            {
                Method = Sum;
            }
            dataitem(Tax_Group; "Tax Group")
            {
                DataItemLink = Code = Sales_Cr_Memo_Line."Tax Group Code";
                column(Computable; Computable)
                {
                }
                column("Code"; "Code")
                {
                }
                dataitem(Resource; Resource)
                {
                    DataItemLink = "No." = Sales_Cr_Memo_Line."No.";
                    SqlJoinType = LeftOuterJoin;
                    column(Gross_winnings_perception_code; "Gross winnings perception code")
                    {
                    }
                    dataitem(Sales_Cr_Memo_Header; "Sales Cr.Memo Header")
                    {
                        DataItemLink = "No." = Sales_Cr_Memo_Line."Document No.";
                        column(Permiso_de_embarque; "Permiso de embarque")
                        {
                        }
                    }
                }
            }
        }
    }
}

