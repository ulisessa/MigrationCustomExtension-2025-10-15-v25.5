report 50649 "Descarga temp. x Informe Cap."
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/Descargas/reports/DescargatempxInformeCap.rdlc';
    EnableExternalAssemblies = true;
    EnableExternalImages = true;
    EnableHyperlinks = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Integer"; "Integer")
        {
            column(Logo; rstCI."Logo path")
            {
            }
            column(Proyecto; qryDesc.Proyecto)
            {
            }
            column("Clasificación"; qryDesc.Item_no)
            {
            }
            column(UM; qryDesc.Unidad_medida)
            {
            }
            column(Cantidad; qryDesc.Sum_Cantidad)
            {
            }
            column(KN; qryDesc.Sum_Net_weight)
            {
            }
            column(KB; qryDesc.Sum_Gross_weight)
            {
            }
            column(Buque; rstBuque.Name)
            {
            }
            column(Marea; rstProyecto."Global Dimension 3 Code")
            {
            }
            column(Salida; rstProyecto."Starting Date")
            {
            }
            column(Llegada; rstProyecto."Ending Date")
            {
            }
            column(Patron; rstProyecto.Patron)
            {
            }
            column(Subfamilia; rstItem.Subfamilia)
            {
            }
            column(ClasDesc; rstItem.Description)
            {
            }
            column(SubfDesc; rstSubfamilia.Description)
            {
            }
            column(CantidadCapitan; rstLinInfoCap.Cantidad)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if not qryDesc.Read then
                    CurrReport.Break;

                Clear(rstProyecto);
                rstProyecto.Get(qryDesc.Proyecto);

                Clear(rstGLS);
                rstGLS.Get();

                Clear(rstBuque);
                rstBuque.Get(rstGLS."Global Dimension 1 Code", rstProyecto."Global Dimension 1 Code");

                Clear(rstInfoEmpresa);
                rstInfoEmpresa.Get();
                rstInfoEmpresa.CalcFields(Picture);

                Clear(rstInfoCapi);
                if rstInfoCapi.Get(qryDesc.Proyecto) then;

                Clear(rstItem);
                if rstItem.Get(qryDesc.Item_no) then;

                Clear(rstSubfamilia);
                if rstSubfamilia.Get(rstItem.Familia, rstItem.Subfamilia) then;

                Clear(rstLinInfoCap);
                rstLinInfoCap.SetRange("No. proyecto", rstProyecto."No.");
                rstLinInfoCap.SetRange(Clasificación, rstItem."No.");
                if rstLinInfoCap.FindFirst then;
            end;

            trigger OnPostDataItem()
            begin
                qryDesc.Close;
            end;

            trigger OnPreDataItem()
            begin
                Clear(rstCI);
                rstCI.Get;

                if FiltrProy <> '' then
                    qryDesc.SetRange(qryDesc.FiltroProyecto, FiltrProy)
                else
                    qryDesc.SetRange(qryDesc.FiltroProyecto, g_codProy);
                qryDesc.Open;
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
                field("Filtro proyecto"; FiltrProy)
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

    var
        rstInfoEmpresa: Record "Company Information";
        rstInfoCapi: Record "Cab. informe capitán";
        rstProyecto: Record Job;
        rstBuque: Record "Dimension Value";
        rstLinInfoCap: Record "Lín. informe capitán";
        decCantidadCap: Decimal;
        decPorc: Decimal;
        rstConfEx: Record "Inventory Setup";
        decCantidadTot: Decimal;
        rstSubfamilia: Record "Subfamilia producto";
        rstUnidadMedidad: Record "Unit of Measure";
        DESCARGACaptionLbl: Label 'DESCARGA';
        Fecha_de_entradaCaptionLbl: Label 'Fecha de entrada';
        Fecha_de_salidaCaptionLbl: Label 'Fecha de salida';
        CantidadCaptionLbl: Label 'Cantidad';
        CAPITANCaptionLbl: Label 'CAPITAN';
        CantidadCaption_Control1000000051Lbl: Label 'Cantidad';
        DIFERENCIACaptionLbl: Label 'DIFERENCIA';
        CantidadCaption_Control1000000057Lbl: Label 'Cantidad';
        Kilos_brutosCaptionLbl: Label 'Kilos brutos';
        Kilos_netosCaptionLbl: Label 'Kilos netos';
        Unidad_de_MedidaCaptionLbl: Label 'Unidad de Medida';
        DifCaptionLbl: Label '% Dif';
        "ClasificaciónCaptionLbl": Label 'Clasificación';
        BuqueCaptionLbl: Label 'Buque';
        MareaCaptionLbl: Label 'Marea';
        "CapitánCaptionLbl": Label 'Capitán';
        Prom__KNCaptionLbl: Label 'Prom. KN';
        Prom__KBCaptionLbl: Label 'Prom. KB';
        TOTAL_DESCARGA_POR_UNIDAD_DE_MEDIDACaptionLbl: Label 'TOTAL DESCARGA POR UNIDAD DE MEDIDA';
        TOTAL_DESCARGA_POR_SUBFAMILIACaptionLbl: Label 'TOTAL DESCARGA POR SUBFAMILIA';
        Firma_del_Responsable_de_ArbumasaCaptionLbl: Label 'Firma del Responsable de Arbumasa';
        qryDesc: Query Descarga;
        g_codProy: Code[20];
        rstItem: Record Item;
        FiltrProy: Code[20];
        rstGLS: Record "General Ledger Setup";
        rstCI: Record "Company Information";

    [Scope('OnPrem')]
    procedure fntProyecto(l_codProy: Code[20])
    begin
        g_codProy := l_codProy;
        FiltrProy := g_codProy;
    end;
}

