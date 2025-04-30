report 50037 "DCL subflia"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/DCL/reports/DCLsubflia.rdlc';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Cab. DCL"; "Cab. DCL")
        {
            column("Informe_del_Capitán_"; 'Informe del Capitán')
            {
            }
            column(rstInfoEmpresa_Picture; rstInfoEmpresa.Picture)
            {
            }
            column(Logo; rstInfoEmpresa."Logo path")
            {
            }
            column(empresa; rstInfoEmpresa.Name)
            {
            }
            column(Direccion; rstInfoEmpresa.Address)
            {
            }
            column(Ciudad; rstInfoEmpresa.City)
            {
            }
            column(DCL; "Cab. DCL"."No. DCL")
            {
            }
            column(FechDesc; datFD)
            {
            }
            column(Tel; rstInfoEmpresa."Phone No.")
            {
            }
            column(Mail; rstInfoEmpresa."E-Mail")
            {
            }
            column(rstBuque_Nombre; rstBuque.Name)
            {
            }
            column(Matricula; rstBuque."Establecimiento No. Oficial")
            {
            }
            column(PuertoZarpada; strPtoZarp)
            {
            }
            column(PuertoDescarga; strPtoDesc)
            {
            }
            column(rstProyecto__Global_Dimension_3_Code_; rstMarea.Name)
            {
            }
            column(FechayHoraZarpada; "Cab. DCL"."Fecha y hora zarpada")
            {
            }
            column(FechayHoraDesembarque; "Cab. DCL"."Fecha y hora desembarque")
            {
            }
            column(TODAY; Today)
            {
            }
            column("Página____FORMAT_CurrReport_PAGENO_"; 'Página #')
            {
            }
            column(USERID; UserId)
            {
            }
            column("Cab__informe_capitán_N__proyecto"; "No. proyecto")
            {
            }
            column(EmpleadoResponsable; rstEmpleado.Name + ' ' + rstEmpleado."First Family Name")
            {
            }
            column(EmpleadoDNI; rstEmpleado."CIF/NIF")
            {
            }
            dataitem("Lín. DCL"; "Lín. DCL")
            {
                DataItemLink = "No. proyecto" = FIELD("No. proyecto");
                DataItemTableView = SORTING("No. proyecto", "No. línea");
                column(Especie; rstDV.Name + ' - ' + rstSubfam.Description)
                {
                }
                column(CodFAO; rstDefDim."Dimension Value Code")
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
                column(KN; "Lín. DCL"."Kilos netos")
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
                    rstItem: Record Item;
                begin
                    Clear(rstInvSet);
                    rstInvSet.Get();

                    Clear(rstDefDim);
                    if rstDefDim.Get(27, "Lín. DCL".Clasificación, rstInvSet."Dimensión FAO") then;

                    Clear(rstItem);
                    if rstItem.Get("Lín. DCL".Clasificación) then;

                    Clear(rstSubfam);
                    rstSubfam.Get(rstItem.Familia, rstItem.Subfamilia);

                    Clear(rstDV);
                    if rstDV.Get(rstConfCont."Global Dimension 2 Code", rstItem."Global Dimension 2 Code") then;
                end;
            }

            trigger OnAfterGetRecord()
            var
                l_rstDV: Record "Dimension Value";
                l_rstPuerto: Record "Entry/Exit Point";
            begin
                Clear(rstProyecto);
                rstProyecto.Get("No. proyecto");

                Clear(rstInfoEmpresa);
                rstInfoEmpresa.Get();
                rstInfoEmpresa.CalcFields(Picture);

                Clear(rstConfCont);

                rstConfCont.Get();

                Clear(rstBuque);
                rstBuque.Get(rstConfCont."Global Dimension 1 Code", rstProyecto."Global Dimension 1 Code");

                Clear(rstCabDescarga);
                if rstCabDescarga.Get("Cab. DCL"."No. proyecto") then;

                if rstCabDescarga."Fecha de inicio de descarga" <> 0D then
                    datFD := rstCabDescarga."Fecha de inicio de descarga"
                else
                    datFD := rstProyecto."Ending Date";

                Clear(rstMarea);
                rstMarea.Get(rstConfCont."Global Dimension 3 Code", rstProyecto."Global Dimension 3 Code");

                strPtoZarp := '';
                strPtoDesc := '';

                Clear(l_rstPuerto);
                l_rstPuerto.SetRange(Code, rstProyecto."Puerto zarpada");
                if l_rstPuerto.FindFirst then
                    strPtoZarp := l_rstPuerto.Description;

                Clear(l_rstPuerto);
                l_rstPuerto.SetRange(Code, rstProyecto."Puerto zarpada");
                if l_rstPuerto.FindFirst then
                    strPtoDesc := l_rstPuerto.Description;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(codEmpleado; codEmpleado)
                {
                    ShowCaption = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Clear(rstEmpleado);
                        Clear(pgeEmpleado);
                        pgeEmpleado.LookupMode := true;
                        if pgeEmpleado.RunModal = ACTION::LookupOK then begin

                            pgeEmpleado.GetRecord(rstEmpleado);
                            codEmpleado := rstEmpleado."No.";
                            strEmpleado := rstEmpleado.Name;

                        end;
                    end;
                }
                field(strEmpleado; strEmpleado)
                {
                    ShowCaption = false;
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            if codEmpleado <> '' then
                rstEmpleado.Get(codEmpleado);
        end;
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
        codEmpleado: Code[10];
        strEmpleado: Text;
        rstEmpleado: Record Employee;
        pgeEmpleado: Page "Employee List";
        rstSubfam: Record "Subfamilia producto";
        datFD: Date;
        rstMarea: Record "Dimension Value";
        strPtoZarp: Text;
        strPtoDesc: Text;
}

