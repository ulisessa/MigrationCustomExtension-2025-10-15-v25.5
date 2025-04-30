report 50653 "Descarga definitiva"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/Descargas/reports/Descargadefinitiva.rdlc';
    EnableExternalAssemblies = true;
    EnableExternalImages = true;
    EnableHyperlinks = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", "Date Filter", "Global Dimension 2 Filter", "Lot No. Filter";
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
            column(Buque; rstBuque."Language Code")
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

            trigger OnAfterGetRecord()
            begin
                Clear(rstCI);
                rstCI.Get;
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
        rstBuque: Record "Country/Region Translation";
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
        rstCI: Record "Company Information";

    [Scope('OnPrem')]
    procedure fntProyecto(l_codProy: Code[20])
    begin
        g_codProy := l_codProy;
    end;
}

