report 50011 "Estadística producción calamar"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/PlantaProceso/reports/Estadísticaproduccióncalamar.rdlc';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Produccion Planta"; "Produccion Planta")
        {
            DataItemTableView = SORTING("Fecha registro", "No. documento") WHERE(Anulado = CONST(false));
            RequestFilterFields = "Fecha produccion";
            column(Logo; rstInfoEmpre."Logo path")
            {
            }
            column(strNombre; strNombre)
            {
            }
            column(CALEntradaMP_ProduccionPlanta; decMPKN)
            {
            }
            column(codSubflia; codSubflia)
            {
            }
            column(CALEntradaMPKB_ProduccionPlanta; "Produccion Planta"."CAL Entrada MP")
            {
            }
            column(Fecharegistro_ProduccionPlanta; "Produccion Planta"."Fecha registro")
            {
            }
            column(CALMermaPelado_ProduccionPlanta; "Produccion Planta"."CAL Merma Pelado (%)")
            {
            }
            column("CALProducciónRE_ProduccionPlanta"; "Produccion Planta"."CAL Produccion RE (%)")
            {
            }
            column(CALPeladoVainaRE_ProduccionPlanta; "Produccion Planta"."CAL Pelado Vaina RE (%)")
            {
            }
            column(CALPeladoAletasRE_ProduccionPlanta; "Produccion Planta"."CAL Pelado Aletas RE (%)")
            {
            }
            column(CALPeladoRejosRE_ProduccionPlanta; "Produccion Planta"."CAL Pelado Rejos RE (%)")
            {
            }
            column(CALEngordeRE_ProduccionPlanta; "Produccion Planta"."CAL Engorde RE (%)")
            {
            }
            column(CALEnvasadoSalidaKG_ProduccionPlanta; "Produccion Planta"."CAL Envasado Salida KG")
            {
            }
            column(CALResiduosKG_ProduccionPlanta; "Produccion Planta"."CAL Residuos KG")
            {
            }
            column(CALRejoSinEngordeKN_ProduccionPlanta; "Produccion Planta"."CAL Rejo Sin Engorde KN")
            {
            }
            column(CALVainaSinEngordeKN_ProduccionPlanta; "Produccion Planta"."CAL Vaina Sin Engorde KN")
            {
            }
            column(CALPeladoRejosKG_ProduccionPlanta; "Produccion Planta"."CAL Pelado Rejos KG")
            {
            }
            column(CALPeladoAletasKG_ProduccionPlanta; "Produccion Planta"."CAL Pelado Aletas KG")
            {
            }
            column(CALEngordeSalidaKG_ProduccionPlanta; "Produccion Planta"."CAL Engorde Salida KG")
            {
            }
            column(CALPeladoVainaKG_ProduccionPlanta; "Produccion Planta"."CAL Pelado Vaina KG")
            {
            }

            trigger OnAfterGetRecord()
            var
                rst27: Record Item;
            begin
                Clear(rstGLSetup);
                rstGLSetup.Get();
                Clear(rstDV);
                rstDV.SetRange("Dimension Code", rstGLSetup."Global Dimension 1 Code");
                rstDV.SetRange(Code, "Produccion Planta"."Global Dimension 1");
                if rstDV.FindFirst then;

                strNombre := '';

                strNombre := "Produccion Planta"."Puerto/Aeropuerto" + ' - ' +
                 rstDV.Name + ' - ' + CopyStr("Produccion Planta"."Global Dimension 3", 4, 3);

                codSubflia := '';

                Clear(rstLP);
                rstLP.SetRange("Document No.", "Produccion Planta"."No. documento");
                rstLP.SetRange(rstLP."Entry Type", rstLP."Entry Type"::"Negative Adjmt.");
                if rstLP.FindFirst then
                    codSubflia := rstLP.Subfamily;

                decMPKN := 0;
                Clear(rst32);
                rst32.SetCurrentKey("Document No.", "Posting Date", "Entry Type");
                rst32.SetRange("Document No.", "Produccion Planta"."No. documento");
                rst32.SetRange("Posting Date", "Produccion Planta"."Fecha registro");
                //rst32.SETRANGE("Entry Type",rst32."Entry Type"::"Negative Adjmt.");
                if rst32.FindSet then
                    repeat

                        Clear(rst27);
                        rst27.Get(rst32."Item No.");
                        if CopyStr(rst32.Family, 1, 2) = 'MP' then
                            decMPKN -= rst32."Net kilos";

                    until rst32.Next = 0;
            end;

            trigger OnPreDataItem()
            var
                TempFile: File;
            begin
                Clear(rstInfoEmpre);
                rstInfoEmpre.Get;
                if strDateFilter <> '' then
                    "Produccion Planta".SetFilter("Fecha registro", strDateFilter);

                if blnEmitir then begin

                    TempFile.CreateTempFile;
                    FileName := TempFile.Name + '.xls';
                    TempFile.Close;
                    Upload(Text001, '', Text002, '', FileName);

                end;
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
                field("Filtro fecha"; strDateFilter)
                {
                    Visible = false;
                }
                field("Emitir estadísticas"; blnEmitir)
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
        strNombre: Text[250];
        codSubflia: Code[10];
        rstGLSetup: Record "General Ledger Setup";
        rstDV: Record "Dimension Value";
        rstLP: Record "Item Ledger Entry";
        strDateFilter: Text;
        decMPKN: Decimal;
        decMPKB: Decimal;
        rst32: Record "Item Ledger Entry";
        rstInfoEmpre: Record "Company Information";
        blnEmitir: Boolean;
        decSldo: Decimal;
        codEmp: Code[10];
        FileName: Text[250];
        Text001: Label 'Import from XML File';
        Text002: Label 'XML Files (*.xml)|*.xml|All Files (*.*)|*.*';

}

