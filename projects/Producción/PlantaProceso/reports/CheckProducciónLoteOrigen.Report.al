report 50641 "Check Producción LoteOrigen"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/PlantaProceso/reports/CheckProducciónLoteOrigen.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Produccion Planta"; "Produccion Planta")
        {
            DataItemTableView = WHERE(Anulado = CONST(false), Registrado = CONST(true));
            column(Produccion_Planta__N__documento_; "No. documento")
            {
            }
            column(Produccion_Planta__N__documento_Caption; FieldCaption("No. documento"))
            {
            }
            column(Produccion_Planta_Nombre_libro_diario; "Nombre libro diario")
            {
            }
            column("Produccion_Planta_Nombre_sección_diario"; "Nombre seccion diario")
            {
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

    var
        rstMovProd: Record "Item Ledger Entry";

    [Scope('OnPrem')]
    procedure fntVariasLineasLote(): Boolean
    begin
        Clear(rstMovProd);
        rstMovProd.SetCurrentKey(rstMovProd."Document No.");
        rstMovProd.SetRange("Document No.", "Produccion Planta"."No. documento");
        if rstMovProd.Find('-') then
            repeat

                if "Produccion Planta"."Lote origen" <> rstMovProd."Lote origen" then
                    exit(true);

            until rstMovProd.Next = 0;
    end;
}

