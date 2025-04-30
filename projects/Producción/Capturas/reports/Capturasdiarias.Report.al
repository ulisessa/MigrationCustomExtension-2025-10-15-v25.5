report 50659 "Capturas diarias"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/Capturas/reports/Capturasdiarias.rdlc';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("On board capture"; "On board capture")
        {
            DataItemTableView = SORTING("Cód. Proyecto");
            column("CódProyecto_Onboardcapture"; "On board capture"."Cód. Proyecto")
            {
            }
            column(Buque_Onboardcapture; "On board capture".Buque)
            {
            }
            column(Marea_Onboardcapture; "On board capture".Marea)
            {
            }
            column("Patrón_Onboardcapture"; "On board capture".Patrón)
            {
            }
            column(Nombre; rstDV.Name)
            {
            }
            dataitem("On board capture lines"; "On board capture lines")
            {
                DataItemLink = "Cód. proyecto" = FIELD("Cód. Proyecto");
                DataItemTableView = SORTING("Cód. proyecto", "No. línea") WHERE(Kilos = FILTER(<> 0));
                column("Descripción_Onboardcapturelines"; "On board capture lines".Descripción)
                {
                }
                column(Fecharegistro_Onboardcapturelines; "On board capture lines"."Fecha registro")
                {
                }
                column(Concepto_Onboardcapturelines; "On board capture lines".Concepto)
                {
                }
                column(Kilos_Onboardcapturelines; "On board capture lines".Kilos)
                {
                }
                column(Cantidad_Onboardcapturelines; "On board capture lines".Cantidad)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                Clear(rstGLS);
                rstGLS.Get();

                Clear(rstDV);
                rstDV.Get(rstGLS."Global Dimension 1 Code", "On board capture".Buque);
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
        rstDV: Record "Dimension Value";
        rstGLS: Record "General Ledger Setup";
}

