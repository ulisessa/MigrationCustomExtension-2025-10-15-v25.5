report 50023 "Producción calamar diaria"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Producción/PlantaProceso/reports/Produccióncalamardiaria.rdlc';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Produccion Planta"; "Produccion Planta")
        {
            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = "Document No." = FIELD ("No. documento");
                DataItemTableView = WHERE ("Entry Type" = CONST ("Positive Adjmt."));
                column(Logo; rstInfoEmpre."Logo path")
                {
                }
                column(Fecharegistro_ProduccionPlanta; "Produccion Planta"."Fecha registro")
                {
                }
                column(Buque; "Produccion Planta"."Global Dimension 1")
                {
                }
                column(Marea; "Produccion Planta"."Global Dimension 3")
                {
                }
                column(codSubflia; rstSubflia.Description)
                {
                }
                column(CALEntradaMP_ProduccionPlanta; "Produccion Planta"."CAL Entrada MP")
                {
                }
                column(CALEnvasadoSalidaKG_ProduccionPlanta; "Produccion Planta"."CAL Envasado Salida KG")
                {
                }
                column(decCajones; decCajones)
                {
                }
                column("Descripción_Linproduccionplanta"; Description)
                {
                }
                column(Cantidad_Linproduccionplanta; Quantity)
                {
                }
                column(Kilosnetos_Linproduccionplanta; "Net kilos")
                {
                }
                column(blnCambio; blnCambio)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if (codDoc <> "Document No.") then
                        blnCambio := true
                    else
                        blnCambio := false;

                    codDoc := "Document No.";
                end;
            }

            trigger OnAfterGetRecord()
            begin
                Clear(rstCabProd);
                rstCabProd.Get("Produccion Planta"."Nombre libro diario", "Produccion Planta"."Nombre seccion diario", "Produccion Planta"."No. documento");

                Clear(rstInfoEmpre);
                rstInfoEmpre.Get;

                decCajones := 0;
                Clear(rst32);
                rst32.SetRange("Document No.", "No. documento");
                rst32.SetRange("Entry Type", rst32."Entry Type"::"Negative Adjmt.");
                if rst32.FindFirst then begin

                    codSubflia := rst32.Subfamily;
                    repeat

                        decCajones += rst32.Quantity;

                    until rst32.Next = 0;

                    decCajones := decCajones * -1;

                end;

                Clear(rstSubflia);
                rstSubflia.SetRange(Code, codSubflia);
                if rstSubflia.FindFirst then;
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
        codSubflia: Code[10];
        rstGLSetup: Record "General Ledger Setup";
        rstDV: Record "Dimension Value";
        rstLP: Record "Item Ledger Entry";
        strDateFilter: Text;
        rst32: Record "Item Ledger Entry";
        rstInfoEmpre: Record "Company Information";
        blnEmitir: Boolean;
        decSldo: Decimal;
        codEmp: Code[10];
        Text001: Label 'Import from XML File';
        Text002: Label 'XML Files (*.xml)|*.xml|All Files (*.*)|*.*';
        strTipoEntero: Text;
        decCajones: Decimal;
        rstCabProd: Record "Produccion Planta";
        rstSubflia: Record "Subfamilia producto";
        blnCambio: Boolean;
        codDoc: Code[20];
}

