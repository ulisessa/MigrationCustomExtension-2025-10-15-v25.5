report 50647 "Informe Capitán"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/Capturas/reports/InformeCapitán.rdlc';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Cab. informe capitán"; "Cab. informe capitán")
        {
            column("Informe_del_Capitán_"; 'Informe del Capitán')
            {
            }
            column(Logo; rstInfoEmpresa."Logo path")
            {
            }
            column(rstBuque_Nombre; rstBuque.Name)
            {
            }
            column(rstProyecto__Global_Dimension_3_Code_; rstProyecto."Global Dimension 3 Code")
            {
            }
            column(rstProyecto__Starting_Date_; rstProyecto."Starting Date")
            {
            }
            column(rstProyecto__Ending_Date_; rstProyecto."Ending Date")
            {
            }
            column("Cab__informe_capitán_Capitán"; Capitán)
            {
            }
            column(TODAY; Today)
            {
            }
            column(USERID; UserId)
            {
            }
            column(BuqueCaption; BuqueCaptionLbl)
            {
            }
            column(MareaCaption; MareaCaptionLbl)
            {
            }
            column(Fecha_de_salidaCaption; Fecha_de_salidaCaptionLbl)
            {
            }
            column(Fecha_de_entradaCaption; Fecha_de_entradaCaptionLbl)
            {
            }
            column("CapitánCaption"; CapitánCaptionLbl)
            {
            }
            column("ClasificaciónCaption"; ClasificaciónCaptionLbl)
            {
            }
            column("Lín__informe_capitán__Unidad_medida_Caption"; "Lín. informe capitán".FieldCaption("Unidad medida"))
            {
            }
            column("Lín__informe_capitán_CantidadCaption"; "Lín. informe capitán".FieldCaption(Cantidad))
            {
            }
            column("Cab__informe_capitán_N__proyecto"; "No. proyecto")
            {
            }
            dataitem("Lín. informe capitán"; "Lín. informe capitán")
            {
                DataItemLink = "No. proyecto" = FIELD ("No. proyecto");
                DataItemTableView = SORTING ("No. proyecto", "No. línea");
                column("Lín__informe_capitán_Descripción"; Descripción)
                {
                }
                column("Lín__informe_capitán__Unidad_medida_"; "Unidad medida")
                {
                }
                column("Lín__informe_capitán_Cantidad"; Cantidad)
                {
                }
                column("Lín__informe_capitán_Cantidad_Control1000000026"; Cantidad)
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
            }

            trigger OnAfterGetRecord()
            begin
                Clear(rstProyecto);
                rstProyecto.Get("Cab. informe capitán"."No. proyecto");

                Clear(rstInfoEmpresa);
                rstInfoEmpresa.Get();
                Clear(rstBuque);
                Clear(rstGLS);
                rstGLS.Get();

                rstBuque.Get(rstGLS."Global Dimension 1 Code", rstProyecto."Global Dimension 1 Code");
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
        rstGLS: Record "General Ledger Setup";
}

