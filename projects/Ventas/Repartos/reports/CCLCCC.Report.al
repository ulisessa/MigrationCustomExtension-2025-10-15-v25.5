report 50038 "CCL/CCC"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Ventas/Repartos/reports/CCLCCC.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("DCL Application Lines"; "DCL Application Lines")
        {
            RequestFilterFields = "Applied document no.", "Permiso de embarque", "Container no.";
            column(Cab_NombreEmpresa; rstCI.Name)
            {
            }
            column(Cab_Direccion; rstCI.Address)
            {
            }
            column(Cab_Tel; rstCI."Phone No.")
            {
            }
            column(Cab_Fax; rstCI."Fax No.")
            {
            }
            column(Cab_PtoCarga; rstOrigen.Description)
            {
            }
            column(Cab_PtoDestino; rstDestino.Description)
            {
            }
            column(Cab_CantContenedores; strContainers)
            {
            }
            column(Cab_FechaEmbarque; datFPAB)
            {
            }
            column(Cab_PermisoEmbarque; "DCL Application Lines"."Permiso de embarque")
            {
            }
            column(Cab_NroCOM; rstSS."No. COM")
            {
            }
            column(Ins_CodBuque; rstJob."Global Dimension 1 Code")
            {
            }
            column(Ins_NomBuque; rstDVBuque.Name)
            {
            }
            column(Ins_EstNoOficial; rstDVBuque."Patent code")
            {
            }
            column(Ins_Marea; intMarea)
            {
            }
            column(Ins_Fechas; strFechasMarea)
            {
            }
            column(Ins_FAO; rstDVFao.Code)
            {
            }
            column(Ins_Especie; rstDVFao.Name)
            {
            }
            column(Ins_Producto; rstSubfamiliaOrig.Description)
            {
            }
            column(Ins_KNOrigen; decKO)
            {
            }
            column(Prod_EstNoOficial; rstDVEstProd."Establecimiento No. Oficial")
            {
            }
            column(Prod_NomPlanta; strNomPta)
            {
            }
            column(Prod_Rend; decRendimiento)
            {
            }
            column(Vta_Producto; rstSubfamiliaVta.Description)
            {
            }
            column(Vta_KN; "DCL Application Lines"."Net kilos")
            {
            }
            column(Vta_UM; rstUM.Description)
            {
            }
            column(Vta_Unidades; decUM)
            {
            }
            column(Vta_Arancelario; rstItemVent."Tariff No.")
            {
            }
            column(Vta_UnidadesTotales; Round(decUM, 2))
            {
            }

            trigger OnAfterGetRecord()
            begin
                Clear(rstCI);
                rstCI.Get();

                Clear(rstSS);
                rstSS.Get();

                Clear(rstGLS);
                rstGLS.Get();

                Clear(rstJob);
                rstJob.Get("DCL Application Lines"."DCL Job no.");

                strFechasMarea := Format(rstJob."Starting Date") + ' a ' + Format(rstJob."Ending Date");

                intMarea := 0;
                Evaluate(intMarea, CopyStr(rstJob."Global Dimension 3 Code", 4, 3));

                Clear(rstDVBuque);
                rstDVBuque.Get(rstGLS."Global Dimension 1 Code", rstJob."Global Dimension 1 Code");

                Clear(rstItemOrig);
                rstItemOrig.Get("DCL Application Lines"."Original Item no.");

                Clear(rstIS);
                rstIS.Get();

                Clear(rstSSH);
                if rstSSH.Get("DCL Application Lines"."Applied document no.") then begin

                    Clear(rstDestino);
                    rstDestino.SetRange(Code, rstSSH."Puerto destino");
                    if rstDestino.FindSet then;

                    Clear(rstOrigen);
                    rstOrigen.SetRange(Code, rstSSH."Puerto carga");
                    if rstOrigen.FindSet then;

                end
                else begin

                    Clear(rstSIH);
                    if rstSIH.Get("DCL Application Lines"."Applied document no.") then begin

                        Clear(rstDestino);
                        rstDestino.SetRange(Code, rstSIH."Puerto destino");
                        if rstDestino.FindSet then;

                        Clear(rstOrigen);
                        rstOrigen.SetRange(Code, rstSIH."Puerto carga");
                        if rstOrigen.FindSet then;

                    end
                    else begin

                        Clear(rstCR);
                        rstCR.Get("DCL Application Lines"."Applied document no.");

                        Clear(rstDestino);
                        rstDestino.SetRange(Code, rstCR."Destination port");
                        if rstDestino.FindSet then;

                        Clear(rstOrigen);
                        rstOrigen.SetRange(Code, rstCR."Loading port");
                        if rstOrigen.FindSet then;

                    end;

                end;

                Clear(rstDDV);
                rstDDV.SetRange("Table ID", 27);
                rstDDV.SetRange("No.", "DCL Application Lines"."Original Item no.");
                rstDDV.SetRange("Dimension Code", rstIS."Dimensión FAO");
                if rstDDV.FindSet then begin

                    Clear(rstDVFao);
                    rstDVFao.Get(rstIS."Dimensión FAO", rstDDV."Dimension Value Code");

                end;

                Clear(rstSubfamiliaOrig);
                rstSubfamiliaOrig.Get(rstItemOrig.Familia, rstItemOrig.Subfamilia);

                Clear(rstItemVent);
                rstItemVent.Get("DCL Application Lines"."Item no.");

                if rstItemVent."Subfamilia origen" <> '' then begin

                    rstSubfamiliaOrig.Get(rstItemVent."Familia origen", rstItemVent."Subfamilia origen");
                    rstItemVent.TestField(Rendimiento);
                    decKO := "DCL Application Lines"."Origin kilos" / rstItemVent.Rendimiento;
                    decRendimiento := rstItemVent.Rendimiento;

                end
                else begin

                    decKO := "DCL Application Lines"."Origin kilos";
                    decRendimiento := "DCL Application Lines".Average;

                end;

                Clear(rstSubfamiliaVta);
                rstSubfamiliaVta.Get(rstItemVent.Familia, rstItemVent.Subfamilia);

                Clear(rstPO);
                if "DCL Application Lines"."Production no." <> '' then begin

                    rstPO.SetRange(rstPO."No. documento", "DCL Application Lines"."Production no.");
                    if rstPO.FindSet then;

                end;

                Clear(rstJobPlanta);
                if rstPO."Proyecto Destino" <> '' then
                    rstJobPlanta.Get(rstPO."Proyecto Destino")
                else
                    rstJobPlanta.Get("DCL Application Lines"."DCL Job no.");

                if "DCL Application Lines"."Application type" = "DCL Application Lines"."Application type"::Reparto then begin
                    Clear(rstJobPlanta);
                    //rstJobPlanta.GET("DCL Application Lines"."Applied job no.");
                    rstJobPlanta.Get("DCL Application Lines"."DCL Job no.");
                end;

                Clear(rstDVEstProd);
                rstDVEstProd.Get(rstGLS."Global Dimension 1 Code", rstJobPlanta."Global Dimension 1 Code");

                if rstDVEstProd.Code <> '' then begin

                    codEstOf := rstDVEstProd."Establecimiento No. Oficial";
                    strNomPta := rstDVEstProd.Name;

                end
                else begin

                    codEstOf := rstDVBuque.Code;
                    strNomPta := rstDVBuque.Name;

                end;

                decUM := 0;
                Clear(rst32);
                if rst32.Get("DCL Application Lines"."Item entry no.") then begin

                    if (rst32."Net kilos" <> 0) and (rst32.Quantity <> 0) then
                        decUM := "DCL Application Lines"."Net kilos" / (rst32."Net kilos" / rst32.Quantity);
                    //decUM := rst32.Quantity;

                    Clear(rstUM);
                    rstUM.Get(rst32."Unit of Measure Code");

                end
                else begin

                    Clear(rstLR);
                    rstLR.Get("DCL Application Lines"."Applied document no.", "DCL Application Lines"."Line no.");

                    decUM := 0;
                    decUM := "DCL Application Lines".Average;

                    Clear(rstUM);
                    rstUM.Get(rstItemVent."Base Unit of Measure");

                end;

                decUMTot += decUM;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                field("Fecha puesta a bordo"; datFPAB)
                {
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        /*IF "DCL Application Lines".GETFILTER("DCL Application Lines"."Container no.") = '' THEN
          ERROR('Debe filtrar por contenedor');
          */
        Clear(rstDCLApp);
        rstDCLApp.CopyFilters("DCL Application Lines");
        rstDCLApp.SetCurrentKey("Container no.");
        if rstDCLApp.FindSet then
            repeat

                if strContainer <> rstDCLApp."Container no." then begin

                    if strContainer = '' then begin

                        strContainer := rstDCLApp."Container no.";
                        strContainers := rstDCLApp."Container no.";

                    end
                    else begin

                        strContainer := rstDCLApp."Container no.";
                        strContainers := strContainers + ';' + rstDCLApp."Container no.";

                    end;

                end;

            until rstDCLApp.Next = 0;

    end;

    var
        rstCI: Record "Company Information";
        rstSSH: Record "Sales Shipment Header";
        rstSIH: Record "Sales Invoice Header";
        rstCR: Record "Cab. Reparto";
        rstLR: Record "Lín. reparto";
        rstJob: Record Job;
        rstJobPlanta: Record Job;
        rstDVBuque: Record "Dimension Value";
        rstDVFao: Record "Dimension Value";
        rstDVEstProd: Record "Dimension Value";
        rstGLS: Record "General Ledger Setup";
        intMarea: Integer;
        rstItemOrig: Record Item;
        rstItemVent: Record Item;
        rstIS: Record "Inventory Setup";
        rstDDV: Record "Default Dimension";
        rstSubfamiliaOrig: Record "Subfamilia producto";
        rstSubfamiliaVta: Record "Subfamilia producto";
        rstPO: Record "Produccion Planta";
        codEstOf: Code[10];
        strNomPta: Text[50];
        rst32: Record "Item Ledger Entry";
        rstUM: Record "Unit of Measure";
        rstDestino: Record "Entry/Exit Point";
        rstOrigen: Record "Entry/Exit Point";
        rstSS: Record "Sales & Receivables Setup";
        strFechasMarea: Text;
        decKO: Decimal;
        decRendimiento: Decimal;
        rstDCLApp: Record "DCL Application Lines";
        strContainer: Text;
        strContainers: Text;
        decUM: Decimal;
        datFPAB: Date;
        decUMTot: Decimal;
}

