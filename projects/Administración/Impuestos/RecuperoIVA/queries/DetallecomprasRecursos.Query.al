query 50031 "Detalle compras Recursos"
{

    elements
    {
        dataitem(Purch_Inv_Line; "Purch. Inv. Line")
        {
            DataItemTableFilter = "Job No." = FILTER(<> ''), Type = FILTER(Resource), "VAT %" = FILTER(<> 0);
            filter(Filt_Document_No; "Document No.")
            {
            }
            filter(Gen_Bus_Posting_Group; "Gen. Bus. Posting Group")
            {
            }
            column(Document_No; "Document No.")
            {
            }
            column(Line_No; "Line No.")
            {
            }
            column(No; "No.")
            {
            }
            column(Job_No; "Job No.")
            {
            }
            column(Tax_Group_Code; "Tax Group Code")
            {
            }
            column("Cód_arancelario"; "Cód. arancelario")
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
            column(Posting_Date; "Posting Date")
            {
            }
            column("Cód_retención_IVA"; "Cód. retención IVA")
            {
            }
            column(Unit_of_Measure; "Unit of Measure")
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
            column(Sum_Quantity; Quantity)
            {
                Method = Sum;
            }
            column(Sum_Amount; Amount)
            {
                Method = Sum;
            }
            column(Sum_Amount_Including_VAT; "Amount Including VAT")
            {
                Method = Sum;
            }
            dataitem(Resource; Resource)
            {
                DataItemLink = "No." = Purch_Inv_Line."No.";
                column(Name; Name)
                {
                }
                dataitem(Invoice_Withholding_Buffer; "Invoice Withholding Buffer")
                {
                    DataItemLink = "No. Factura" = Purch_Inv_Line."Document No.", "Cliente/Proveedor" = Purch_Inv_Line."Pay-to Vendor No.", "Cod. retencion" = Purch_Inv_Line."Cód. retención IVA";
                    SqlJoinType = LeftOuterJoin;
                    filter(Filtro_Orden_Pago; "No. documento")
                    {
                    }
                    column(Importe_total_comprobante; "Importe total comprobante")
                    {
                    }
                    column(Base_pago_retencion; "Base pago retencion")
                    {
                    }
                    column(No_documento; "No. documento")
                    {
                    }
                    column(Fecha_factura; "Fecha factura")
                    {
                    }
                    column(Excluido; Excluido)
                    {
                    }
                    column(Fecha_pago; "Fecha pago")
                    {
                    }
                    column(Exclusion; "% Exclusion")
                    {
                    }
                    column(Fecha_documento_exclusion; "Fecha documento exclusion")
                    {
                    }
                    column(Tipo_factura; "Tipo factura")
                    {
                    }
                    column(Factura_Prov; "Factura Prov")
                    {
                    }
                    column(retencion; "% retencion")
                    {
                    }
                    column("Serie_retención"; "Serie retención")
                    {
                    }
                    column(Sum_Importe_retencion; "Importe retencion")
                    {
                        Method = Sum;
                    }
                    dataitem(Withholding_codes; "Withholding codes")
                    {
                        DataItemLink = "Tipo impuesto retencion" = Invoice_Withholding_Buffer."Tipo retencion", "Cod. retencion" = Invoice_Withholding_Buffer."Cod. retencion";
                        SqlJoinType = LeftOuterJoin;
                        column(Cod_sicore; "Codigo SICORE")
                        {
                        }
                    }
                }
            }
        }
    }
}

