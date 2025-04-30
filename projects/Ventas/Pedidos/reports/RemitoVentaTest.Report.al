report 50591 "Remito Venta-Test"
{
    // IBdos Argentina - USS - 150503 - Inicio Modificación Arbumasa
    //  a) Agrupado por Nº producto, subtotal por producto
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Ventas/Pedidos/reports/RemitoVentaTest.rdlc';

    EnableExternalImages = true;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            column(Sales_Shipment_Header__Banco_Interviniente_; "Banco Interviniente")
            {
            }
            column("Sales_Shipment_Header__Carpeta_de_Exportación_"; "Carpeta de Exportación")
            {
            }
            column(Sales_Shipment_Header__External_Document_No__; "External Document No.")
            {
            }
            column(Sales_Shipment_Header__Permiso_de_embarque_; "Permiso de embarque")
            {
            }
            column(Sales_Shipment_Header__Puerto_embarque_; "Puerto carga")
            {
            }
            column(Sales_Shipment_Header__Puerto_destino_; "Puerto destino")
            {
            }
            column("Sales_Shipment_Header__Cód__Contenedor_"; "Container code")
            {
            }
            column(Sales_Shipment_Header__Precinto_DGA_; "Precinto DGA")
            {
            }
            column(Sales_Shipment_Header_Precinto; Precinto)
            {
            }
            column(Sales_Shipment_Header__Global_Dimension_6_Code_; "Shortcut Dimension 6 Code")
            {
            }
            column(Sales_Shipment_Header__Posting_Date_; "Posting Date")
            {
            }
            column(Sales_Shipment_Header__Ship_to_Name_; "Ship-to Name")
            {
            }
            column(Sales_Shipment_Header__Transport_Method_; "Transport Method")
            {
            }
            column(Sales_Shipment_Header__Exit_Point_; "Exit Point")
            {
            }
            column(Sales_Shipment_Header__Shipping_Agent_Code_; "Shipping Agent Code")
            {
            }
            column(Sales_Shipment_Header__Order_Date_; "Order Date")
            {
            }
            column(Sales_Shipment_Header__No__; "No.")
            {
            }
            column(rstReparto__N__Documento_; "Sales Header"."Quote No.")
            {
                AutoCalcField = true;
            }
            column(InfoEmpresa_Picture; InfoEmpresa.Picture)
            {
            }
            column(TODAY; Today)
            {
            }
            column("Sales_Shipment_Header__Carpeta_de_Exportación_Caption"; FieldCaption("Carpeta de Exportación"))
            {
            }
            column(Sales_Shipment_Header__Banco_Interviniente_Caption; FieldCaption("Banco Interviniente"))
            {
            }
            column(Sales_Shipment_Header__Producido_en_Caption; FieldCaption("Producido en"))
            {
            }
            column(Sales_Shipment_Header_MarcasCaption; FieldCaption(Marcas))
            {
            }
            column(Kilos_brutosCaption; Kilos_brutosCaptionLbl)
            {
            }
            column(Kilos_netosCaption; Kilos_netosCaptionLbl)
            {
            }
            column(Remito_Oficial_Caption; Remito_Oficial_CaptionLbl)
            {
            }
            column(CantidadCaption; CantidadCaptionLbl)
            {
            }
            column("CámaraCaption"; CámaraCaptionLbl)
            {
            }
            column(Sales_Shipment_Header__Permiso_de_embarque_Caption; FieldCaption("Permiso de embarque"))
            {
            }
            column("Sales_Shipment_Header__Cód__Contenedor_Caption"; FieldCaption("Container code"))
            {
            }
            column(Sales_Shipment_Header__Puerto_embarque_Caption; FieldCaption("Puerto carga"))
            {
            }
            column(Sales_Shipment_Header__Puerto_destino_Caption; FieldCaption("Puerto destino"))
            {
            }
            column(Sales_Shipment_Header__Precinto_DGA_Caption; FieldCaption("Precinto DGA"))
            {
            }
            column(Item_Presup_Caption; Item_Presup_CaptionLbl)
            {
            }
            column(Sales_Shipment_Header__Posting_Date_Caption; FieldCaption("Posting Date"))
            {
            }
            column(Sales_Shipment_Header_PrecintoCaption; FieldCaption(Precinto))
            {
            }
            column(LoteCaption; LoteCaptionLbl)
            {
            }
            column(ProductoCaption; ProductoCaptionLbl)
            {
            }
            column(Sales_Shipment_Header__Exit_Point_Caption; FieldCaption("Exit Point"))
            {
            }
            column(ClienteCaption; ClienteCaptionLbl)
            {
            }
            column(Sales_Shipment_Header__Shipping_Agent_Code_Caption; FieldCaption("Shipping Agent Code"))
            {
            }
            column(Sales_Shipment_Header__Transport_Method_Caption; FieldCaption("Transport Method"))
            {
            }
            column(Sales_Shipment_Header__Order_Date_Caption; FieldCaption("Order Date"))
            {
            }
            column(Remito_interno_Caption; Remito_interno_CaptionLbl)
            {
            }
            column(Reparto_n__Caption; Reparto_n__CaptionLbl)
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.") ORDER(Ascending) WHERE(Quantity = FILTER(<> 0));
                RequestFilterFields = Quantity, "Gross kilos", "Net kilos";
                column(KB; "Gross kilos")
                {
                    AutoFormatType = 2;
                    DecimalPlaces = 2 :;
                }
                column(KN; "Net kilos")
                {
                    AutoFormatType = 2;
                    DecimalPlaces = 2 :;
                }
                column(Sales_Shipment_Line__Sales_Shipment_Line__Quantity; Quantity)
                {
                }
                column(Sales_Shipment_Line__Sales_Shipment_Line___Location_Code_; "Location Code")
                {
                }
                column(rstEs__Lot_No__; strLote)
                {
                }
                column(Sales_Shipment_Line__Sales_Shipment_Line__Description; Description)
                {
                }
                column(Sales_Shipment_Line__Sales_Shipment_Line__Quantity_Control106; Quantity)
                {
                }
                column(Sales_Shipment_Line__Sales_Shipment_Line__Description_Control107; Description)
                {
                }
                column(FORMAT__Sales_Shipment_Line___Kilos_brutos___Control44; Format("Gross kilos"))
                {
                    AutoFormatType = 2;
                }
                column(FORMAT__Sales_Shipment_Line___Kilos_netos___Control51; Format("Net kilos"))
                {
                    AutoFormatType = 2;
                }
                column(Sales_Shipment_Line__Sales_Shipment_Line__Quantity_Control103; Quantity)
                {
                }
                column(SubTotal_Caption; SubTotal_CaptionLbl)
                {
                }
                column(TOTALES_Caption; TOTALES_CaptionLbl)
                {
                }
                column(Sales_Shipment_Line_Document_No_; "Document No.")
                {
                }
                column(Sales_Shipment_Line_Line_No_; "Line No.")
                {
                }
                column(LoteOrigen; "Lote origen")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    strLote := "Lote origen" + '-' + "No. Pallet";
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        ConfCG.Get;
    end;

    var
        ConfCG: Record "General Ledger Setup";
        CondEnv: Record "Shipment Method";
        TerminosPago: Record "Payment Terms";
        FormaPago: Record "Payment Method";
        RepreVtasComp: Record "Salesperson/Purchaser";
        InfoEmpresa: Record "Company Information";
        LinImporIVA: Record "VAT Amount Line" temporary;
        LinVenta2: Record "Sales Line" temporary;
        ConfRegistroIVA: Record "VAT Posting Setup";
        ImprimeContadVtas: Codeunit "Sales-Printed";
        FormatDire: Codeunit "Format Address";
        RegisVtas: Codeunit "Sales-Post";
        DirClie: array[8] of Text[50];
        EnvADir: array[8] of Text[50];
        DirEmpresa: array[8] of Text[50];
        DescriVendedor: Text[30];
        TextoCIF: Text[30];
        DescriRefer: Text[30];
        TotalTexto: Text[50];
        TextoTotIVAIncl: Text[50];
        MasLins: Boolean;
        NoCopias: Integer;
        NoBucles: Integer;
        TextoCopia: Text[30];
        MostrarDireEnvio: Boolean;
        i: Integer;
        rstReparto: Record "Recupero IVA";
        rstEs: Record "Tracking Specification";
        Kilos_brutosCaptionLbl: Label 'Kilos brutos';
        Kilos_netosCaptionLbl: Label 'Kilos netos';
        Remito_Oficial_CaptionLbl: Label 'Remito Oficial:';
        CantidadCaptionLbl: Label 'Cantidad';
        "CámaraCaptionLbl": Label 'Cámara';
        Item_Presup_CaptionLbl: Label 'Item Presup.';
        LoteCaptionLbl: Label 'Lote';
        ProductoCaptionLbl: Label 'Producto';
        ClienteCaptionLbl: Label 'Cliente';
        Remito_interno_CaptionLbl: Label 'Remito interno:';
        Reparto_n__CaptionLbl: Label 'Reparto n°:';
        SubTotal_CaptionLbl: Label 'SubTotal:';
        TOTALES_CaptionLbl: Label 'TOTALES:';
        strLote: Text[30];
}

