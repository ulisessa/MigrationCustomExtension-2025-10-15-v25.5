report 50039 "Weighing Ticket"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/Pesadas/reports/WeighingTicket.rdlc';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Cab. remito ventas"; "Cab. remito ventas")
        {
            RequestFilterFields = "No. documento", "Permiso de embarque";
            column(Logo; rstCI."Logo path")
            {
            }
            column(Nodocumento_Cabremitoventas; "Cab. remito ventas"."No. documento")
            {
            }
            column(Aduana; rstEE."No. aduana")
            {
            }
            column(Shippingagent_Cabremitoventas; "Cab. remito ventas"."Shipping agent")
            {
            }
            column(Exportador; rstCI.Name)
            {
            }
            column(CUIT; rstCI."VAT Registration No.")
            {
            }
            column(Lot; rstWS."No. Lot")
            {
            }
            column(Precinto_balanza; rstWS."Scale seals")
            {
            }
            column(Precinto_cabecera; rstWS."Header seals")
            {
            }
            column(Cert_period; rstWS."Periodic certification")
            {
            }
            column(Cert_fecha; rstWS."Periodic cert. expiration date")
            {
            }
            column(ShippingAgentName; rstV.Name)
            {
            }
            column(ShippingAgentCUIT; rstV."VAT Registration No.")
            {
            }
            column(Operativo; rstT.Name)
            {
            }
            column(ContainerTare; "Cab. remito ventas"."Container tare")
            {
            }
            column(Chofer; "Cab. remito ventas".Conductor)
            {
            }
            column(Transportregistrationchassis_Cabremitoventas; "Cab. remito ventas"."Transport registration-chassis")
            {
            }
            column(Entrydate_Cabremitoventas; "Cab. remito ventas"."Entry date")
            {
            }
            column(Exitdate_Cabremitoventas; "Cab. remito ventas"."Exit date")
            {
            }
            column(Transportregistrationsemi_Cabremitoventas; "Cab. remito ventas"."Transport registration - semi")
            {
            }
            column(DriverID_Cabremitoventas; "Cab. remito ventas"."Driver ID")
            {
            }
            column(Fechaderemito_Cabremitoventas; "Cab. remito ventas"."Fecha de remito")
            {
            }
            column(TipodeContenedor_Cabremitoventas; "Cab. remito ventas"."Tipo de Contenedor")
            {
            }
            column("CódContenedor_Cabremitoventas"; "Cab. remito ventas"."Cód. Contenedor")
            {
            }
            column(TaraContenedor; "Cab. remito ventas"."Container tare")
            {
            }
            column(Permisodeembarque_Cabremitoventas; "Cab. remito ventas"."Permiso de embarque")
            {
            }
            column(TicketBalanzaNo; "Cab. remito ventas"."Weighing Ticket No.")
            {
            }
            dataitem("Weighing Records"; "Weighing Records")
            {
                DataItemLink = "Shipment No." = FIELD ("No. documento");
                DataItemTableView = WHERE (Confirmed = CONST (Confirmada));
                column(Detail_WeighingRecords; "Weighing Records".Detail)
                {
                }
                column(Gross_WeighingRecords; "Weighing Records".Gross)
                {
                }
                column(GrossTare_WeighingRecords; "Weighing Records"."Gross + Tare")
                {
                }
                column(Tare_WeighingRecords; "Weighing Records".Tare)
                {
                }
                column(WeighingDateandTime_WeighingRecords; "Weighing Records"."Weighing Date and Time")
                {
                }
                column(QtyperBulk_WeighingRecords; "Weighing Records"."Qty. per Bulk")
                {
                }
                column(Producto; "Weighing Records"."Item no.")
                {
                }
                column("Descripción"; "Weighing Records"."Item description")
                {
                }
                column(LoteOrigen; "Weighing Records"."Lote origen")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                Clear(rstEE);
                "Cab. remito ventas".TestField("Cab. remito ventas"."Customs code");
                rstEE.SetRange(rstEE.Code, "Cab. remito ventas"."Customs code");
                rstEE.FindFirst;
                Clear(rstWS);
                "Cab. remito ventas".TestField("Scale code");
                rstWS.Get("Cab. remito ventas"."Scale code");
                Clear(rstV);
                rstV.Get("Cab. remito ventas"."Shipping agent");
                Clear(rstT);
                rstT.Get("Cab. remito ventas"."Cód. transportista");
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

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
        Clear(rstCI);
        rstCI.Get();
    end;

    var
        rstEE: Record "Entry/Exit Point";
        rstCI: Record "Company Information";
        rstWS: Record "Weighing Scale Parameters";
        decTare: Decimal;
        decGross: Decimal;
        decGT: Decimal;
        rstV: Record Vendor;
        rstT: Record "Shipping Agent";
}

