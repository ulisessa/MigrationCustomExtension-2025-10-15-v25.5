report 50040 "DCL detail"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/DCL/reports/DCLdetail.rdlc';
    Caption = 'Detalle DCL';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Lín. DCL"; "Lín. DCL")
        {
            DataItemTableView = SORTING("No. proyecto", "No. línea") WHERE(Registrado = CONST(true));
            RequestFilterFields = Cliente, Actividad;
            column(Logo; rstInfoEmpresa."Logo path")
            {
            }
            column(Especie; rstDV.Name)
            {
            }
            column(CodFAO; rstDefDim."Dimension Value Code")
            {
            }
            column(Clasificacion; "Lín. DCL".Clasificación)
            {
            }
            column(NombreProducto; rstItem.Description)
            {
            }
            column("Lín__informe_capitán_Descripción"; Descripción)
            {
            }
            column("Lín__informe_capitán__Unidad_medida_"; "Unidad medida")
            {
            }
            column("Lín__informe_capitán_Cantidad"; Cantidad)
            {
            }
            column(Kilos_netos; "Lín. DCL"."Kilos netos")
            {
            }
            column(Aplicados; decAplicados)
            {
            }
            column(KN; "Lín. DCL"."Kilos netos" - decAplicados)
            {
            }
            column(Prom; "Lín. DCL".Promedio)
            {
            }
            column(Nombre; "Lín. DCL"."Nombre cliente")
            {
            }
            column(Total_Buque___rstBuque_Nombre____Marea___rstProyecto__Global_Dimension_3_Code_____; 'Total Buque ' + rstBuque.Name + ', Marea ' + rstProyecto."Global Dimension 3 Code" + ':')
            {
            }
            column("Lín__informe_capitán_N__proyecto"; "No. proyecto")
            {
            }
            column("Lín__informe_capitán_N__línea"; "No. línea")
            {
            }

            trigger OnAfterGetRecord()
            var
                rstInvSet: Record "Inventory Setup";
                l_rst27: Record Item;
                l_rstDCLAplicados: Record "DCL Application Lines";
            begin
                Clear(rstInvSet);
                rstInvSet.Get();

                Clear(rstInfoEmpresa);
                rstInfoEmpresa.Get();

                Clear(rstDefDim);
                if rstDefDim.Get(27, "Lín. DCL".Clasificación, rstInvSet."Dimensión FAO") then;

                Clear(rstItem);
                if rstItem.Get("Lín. DCL".Clasificación) then;

                Clear(rstConfCont);
                rstConfCont.Get;

                Clear(rstDV);
                if rstDV.Get(rstConfCont."Global Dimension 2 Code", rstItem."Global Dimension 2 Code") then;

                Clear(l_rst27);
                l_rst27.Get("Lín. DCL".Clasificación);

                decAplicados := 0;

                if "Lín. DCL"."Kilos netos" > 0 then begin

                    Clear(l_rstDCLAplicados);
                    l_rstDCLAplicados.SetRange("DCL Job no.", "Lín. DCL"."No. proyecto");
                    l_rstDCLAplicados.SetRange(Activity, "Lín. DCL".Actividad);
                    //l_rstDCLLine.CALCSUMS("Origin kilos");
                    if l_rst27."Seguimiento para trazabilidad" = l_rst27."Seguimiento para trazabilidad"::"Forzar uso de L.M." then
                        l_rstDCLAplicados.SetRange("Original Item no.", "Lín. DCL".Clasificación);
                    if l_rstDCLAplicados.FindSet then begin
                        l_rstDCLAplicados.CalcSums("Origin kilos");
                        decAplicados := l_rstDCLAplicados."Origin kilos";
                    end;

                    if ("Lín. DCL"."Kilos netos" - decAplicados) < 0 then
                        CurrReport.Skip;
                end;
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
        rstProyecto: Record Job;
        rstInfoEmpresa: Record "Company Information";
        rstBuque: Record "Dimension Value";
        BuqueCaptionLbl: Label 'Buque';
        MareaCaptionLbl: Label 'Marea';
        Fecha_de_salidaCaptionLbl: Label 'Fecha de salida';
        Fecha_de_entradaCaptionLbl: Label 'Fecha de entrada';
        "CapitánCaptionLbl": Label 'Capitán';
        "ClasificaciónCaptionLbl": Label 'Clasificación';
        rstConfCont: Record "General Ledger Setup";
        rstDefDim: Record "Default Dimension";
        rstDV: Record "Dimension Value";
        rstCabDescarga: Record "Cab. descarga";
        rstItem: Record Item;
        decAplicados: Decimal;
}

