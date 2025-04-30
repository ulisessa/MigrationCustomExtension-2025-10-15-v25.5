report 50597 Reparto
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Ventas/Repartos/reports/Reparto.rdlc';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Cab. Reparto"; "Cab. Reparto")
        {
            RequestFilterFields = "No. Documento";
            column(Logo; rstCI."Logo path")
            {
            }
            column(Nro; "Cab. Reparto"."No. Documento")
            {
            }
            column(Cliente; "Cab. Reparto".Cliente)
            {
            }
            column(Nombrecliente_CabReparto; "Cab. Reparto"."Nombre cliente")
            {
            }
            column(Contenedor; "Cab. Reparto"."Container type")
            {
            }
            column(Puerto; "Cab. Reparto"."Loading port")
            {
            }
            column(CantContenedor; "Cab. Reparto"."Quantity of containers")
            {
            }
            column(Transportista_CabReparto; rstTransport.Name)
            {
            }
            column(NombrePuerto; rstPuerto.Description)
            {
            }
            dataitem("Lín. reparto"; "Lín. reparto")
            {
                DataItemLink = "No. Documento" = FIELD ("No. Documento");
                DataItemTableView = WHERE ("Reservar - UMB" = FILTER (<> 0));
                column(Producto; "Lín. reparto".Descripcion)
                {
                }
                column(Buque; "Lín. reparto".Buque)
                {
                }
                column(Marea; "Lín. reparto".Marea)
                {
                }
                column(Cantidad; "Lín. reparto"."Reservar - UMB")
                {
                }
                column(Carton; rstDescarga."Origen del cartón")
                {
                }
                column(FechaDescarga; rstDescarga."Fecha de inicio de descarga")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Clear(rstDescarga);
                    if rstDescarga.Get("Lín. reparto".Proyecto) then;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                Clear(rstPuerto);
                rstPuerto.SetRange(Code, "Cab. Reparto"."Destination port");
                if rstPuerto.FindFirst then;

                Clear(rstTransport);
                rstTransport.SetRange(Code, "Cab. Reparto".Transportista);
                if rstTransport.FindFirst then;
            end;

            trigger OnPreDataItem()
            begin
                rstCI.Get;
            end;
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

    var
        rstPuerto: Record "Entry/Exit Point";
        rstDescarga: Record "Cab. descarga";
        rstTransport: Record "Shipping Agent";
        rstCI: Record "Company Information";
}

