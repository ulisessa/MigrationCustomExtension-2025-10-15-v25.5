report 50025 "Vale de consumo VALORADO"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'projects/Existencias.ValesConsumo/reports/ValedeconsumoVALORADO.rdlc';
    EnableExternalImages = true;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic, Suite;

    dataset
    {
        dataitem("Cab. Vale consumo"; "Cab. Vale consumo")
        {
            RequestFilterFields = "Nombre Libro Consumo", "No. documento", "Fecha registro";
            column(Logo; rstInfoEmpresa."Logo path")
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(USERID; UserId)
            {
            }
            column(TODAY; Today)
            {
            }
            column(NombreLibroSolicitud_CabValeconsumo; "Cab. Vale consumo"."Nombre Libro Consumo")
            {
            }
            column(Nodocumento_CabValeconsumo; "Cab. Vale consumo"."No. documento")
            {
            }
            column(Fecharegistro_CabValeconsumo; "Cab. Vale consumo"."Fecha registro")
            {
            }
            column("Descripción_CabValeconsumo"; "Cab. Vale consumo".Descripción)
            {
            }
            column(Usuario_CabValeconsumo; "Cab. Vale consumo".Usuario)
            {
            }
            column(NoSerie_CabValeconsumo; "Cab. Vale consumo"."No. Serie")
            {
            }
            column(Estado_CabValeconsumo; "Cab. Vale consumo".Estado)
            {
            }
            dataitem("Lín. vale consumo"; "Lín. vale consumo")
            {
                DataItemLink = "No. documento" = FIELD("No. documento");
                DataItemTableView = SORTING("No. documento", "No. línea", "No.") WHERE(Cantidad = FILTER(<> 0), Revertido = CONST(false));
                column("Ndocumento_Línvaleconsumo"; "Lín. vale consumo"."No. documento")
                {
                }
                column("Nlínea_Línvaleconsumo"; "Lín. vale consumo"."No. línea")
                {
                }
                column("N_Línvaleconsumo"; "Lín. vale consumo"."No.")
                {
                }
                column("Descripción_Línvaleconsumo"; "Lín. vale consumo".Descripción)
                {
                }
                column("Cantidad_Línvaleconsumo"; "Lín. vale consumo".Cantidad)
                {
                }
                column("Descripción2_Línvaleconsumo"; "Lín. vale consumo"."Descripción 2")
                {
                }
                column("Tipo_Línvaleconsumo"; "Lín. vale consumo".Tipo)
                {
                }
                column("ShortcutDimension1Code_Línvaleconsumo"; "Lín. vale consumo"."Shortcut Dimension 1 Code")
                {
                }
                column("ShortcutDimension2Code_Línvaleconsumo"; "Lín. vale consumo"."Shortcut Dimension 2 Code")
                {
                }
                column("ShortcutDimension3Code_Línvaleconsumo"; "Lín. vale consumo"."Shortcut Dimension 3 Code")
                {
                }
                column("ShortcutDimension4Code_Línvaleconsumo"; "Lín. vale consumo"."Shortcut Dimension 4 Code")
                {
                }
                column("ShortcutDimension5Code_Línvaleconsumo"; "Lín. vale consumo"."Shortcut Dimension 5 Code")
                {
                }
                column("ShortcutDimension6Code_Línvaleconsumo"; "Lín. vale consumo"."Shortcut Dimension 6 Code")
                {
                }
                column("ShortcutDimension7Code_Línvaleconsumo"; "Lín. vale consumo"."Shortcut Dimension 7 Code")
                {
                }
                column("Conceptoproyecto_Línvaleconsumo"; "Lín. vale consumo"."Concepto proyecto")
                {
                }
                column("Códunidadmedida_Línvaleconsumo"; "Lín. vale consumo"."Cód. unidad medida")
                {
                }
                column("Códdepósito_Línvaleconsumo"; "Lín. vale consumo"."Cód. depósito")
                {
                }
                column("Usuario_Línvaleconsumo"; "Lín. vale consumo".Usuario)
                {
                }
                column("Noproyecto_Línvaleconsumo"; "Lín. vale consumo"."No. proyecto")
                {
                }
                column(Precio; qCoste)
                {
                }
                column(Importe; qTcoste)
                {
                }
                column(PesoUnitario; qPeso)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Clear(Producto);
                    if Producto.Get("Lín. vale consumo"."No.") then begin

                        if Producto."Unit Cost" <> 0 then
                            qCoste := Producto."Unit Cost"
                        else
                            qCoste := Producto."Last Direct Cost";
                        qTcoste := qCoste * Cantidad;
                        qPeso := Producto."Net Weight";
                    end;
                end;
            }

            trigger OnAfterGetRecord()
            var
                rstLV: Record "Lín. vale consumo";
            begin
                if Primero then
                    Primero := false;
                Clear(rstLV);
                rstLV.SetRange("No. documento", "Cab. Vale consumo"."No. documento");
                rstLV.SetFilter(Cantidad, '>%1', 0);
                rstLV.SetRange(Revertido, false);
                if not rstLV.FindFirst then
                    CurrReport.Skip;
            end;

            trigger OnPreDataItem()
            begin
                Primero := true;
                //CurrReport.CreateTotals(qCoste);

                Clear(rstInfoEmpresa);
                rstInfoEmpresa.Get();
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
        Primero: Boolean;
        Producto: Record Item;
        qCoste: Decimal;
        qTcoste: Decimal;
        Vale_de_consumoCaptionLbl: Label 'Vale de consumo';
        Impreso_CaptionLbl: Label 'Impreso:';
        Usuario_CaptionLbl: Label 'Usuario:';
        "Página_CaptionLbl": Label 'Página:';
        Fecha_registroCaptionLbl: Label 'Fecha registro';
        Fecha_registroCaption_Control6Lbl: Label 'Fecha registro';
        rstInfoEmpresa: Record "Company Information";
        qPeso: Decimal;
}

