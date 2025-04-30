page 50079 "Acciones presupuesto costos"
{
    SourceTable = "Modificadores Costos";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                label(Control1000000003)
                {
                    CaptionClass = Text19067457;
                    ShowCaption = false;
                }
                field(codProyecto; codProyecto)
                {
                }
                label(Control1000000001)
                {
                    CaptionClass = Text19040154;
                    ShowCaption = false;
                }
                field(datFecha; datFecha)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Ac&ciones")
            {
                Caption = 'Ac&ciones';
                action("Copiar íntegramente")
                {
                    Caption = 'Copiar íntegramente';

                    trigger OnAction()
                    begin
                        Clear(rstMovCont);
                        rstMovCont.SetRange(rstMovCont."Job No.", codProyecto);
                        rstMovCont.SetFilter("G/L Account No.", '<>%1&<>%2&<>%3', '3110004', '3110005', '3110006');
                        if rstMovCont.FindSet then
                            repeat

                                Clear(rstPresup);
                                rstPresup."Tipo registro" := rstPresup."Tipo registro"::"Registro presupuestado";
                                rstPresup.Proyecto := rstProyPres.Proyecto;
                                rstPresup.Buque := rstProyPres.Buque;
                                rstPresup.Marea := rstProyPres.Marea;
                                rstPresup."No. cuenta" := rstMovCont."G/L Account No.";
                                rstPresup."No. documento" := StrSubstNo(Text1, codProyecto);
                                rstPresup."Starting date" := rstProyPres."Starting date";
                                rstPresup."Ending date" := rstProyPres."Ending date";
                                rstPresup."Kilos capturados" := rstProyPres."Kilos capturados";
                                rstPresup."USD a proyecto" := rstProyPres."USD a proyecto";
                                rstPresup."Días de marea proyecto" := rstProyPres."Días de marea proyecto";
                                rstPresup."Días de marea anuales" := rstProyPres."Días de marea anuales";

                                if not rstPresup.Insert then begin

                                    rstPresup.FindFirst;
                                    rstPresup."USD registrados" += rstMovCont."Additional-Currency Amount";
                                    rstPresup.Modify;

                                end
                                else begin

                                    rstPresup.Validate("No. cuenta", rstMovCont."G/L Account No.");
                                    rstPresup.Validate(Proyecto, rstProyPres.Proyecto);
                                    rstPresup.Validate("Fecha modificada", datFecha);
                                    rstPresup."Días de marea proyecto" := rstProyPres."Días de marea proyecto";
                                    rstPresup."USD registrados" += rstMovCont."Additional-Currency Amount";
                                    rstPresup.Modify;

                                end;

                            until rstMovCont.Next = 0;

                        fntGenerarStock;
                    end;
                }
            }
        }
    }

    var
        rstProyecto: Record Job;
        codProyecto: Code[30];
        rstProyPres: Record "Modificadores Costos";
        rstMovCont: Record "G/L Entry";
        rstPresup: Record "Modificadores Costos";
        datFecha: Date;
        rstCuenta: Record "G/L Account";
        decImporteStock: Decimal;
        l_blnTipoValoracion: Option Factura,Tarifario;
        decImporteSinFactura: Decimal;
        Text1: Label 'Presupuestado desde %1';
        Text19067457: Label 'Proyecto original';
        Text19040154: Label 'Fecha modificación';

    procedure fntProyPres(l_rstProyPres: Record "Modificadores Costos")
    begin
        rstProyPres.Get(l_rstProyPres."Tipo registro", l_rstProyPres.Proyecto, l_rstProyPres.Buque, l_rstProyPres.Marea,
                        l_rstProyPres."No. cuenta", l_rstProyPres."No. documento");
    end;

    procedure fntGenerarStock()
    begin
        Clear(rstProyecto);
        rstProyecto.Get(codProyecto);

        rstCuenta.Get('3110004');
        if rstCuenta."Denominación común costos" = '' then begin

            //decImporteStock := rptGenerarInfoCostos.StockxActividad('LAN',rstProyecto,l_blnTipoValoracion::Factura,FALSE);
            if decImporteStock <> 0 then begin

                Clear(rstPresup);
                rstPresup."Tipo registro" := rstPresup."Tipo registro"::"Registro presupuestado";
                rstPresup.Proyecto := rstProyPres.Proyecto;
                rstPresup.Buque := rstProyPres.Buque;
                rstPresup.Marea := rstProyPres.Marea;
                rstPresup."No. cuenta" := rstCuenta."No.";
                rstPresup."No. documento" := StrSubstNo(Text1, codProyecto);
                rstPresup."Starting date" := rstProyPres."Starting date";
                rstPresup."Ending date" := rstProyPres."Ending date";
                rstPresup."Kilos capturados" := rstProyPres."Kilos capturados";
                rstPresup."USD a proyecto" := rstProyPres."USD a proyecto";
                rstPresup."Días de marea proyecto" := rstProyPres."Días de marea proyecto";
                rstPresup."Días de marea anuales" := rstProyPres."Días de marea anuales";

                if not rstPresup.Insert then begin

                    rstPresup.FindFirst;
                    rstPresup."USD registrados" := decImporteStock;
                    rstPresup.Modify;

                end
                else begin

                    rstPresup.Validate("No. cuenta", rstCuenta."No.");
                    rstPresup.Validate(Proyecto, rstProyPres.Proyecto);
                    rstPresup.Validate("Fecha modificada", datFecha);
                    rstPresup."Días de marea proyecto" := rstProyPres."Días de marea proyecto";
                    rstPresup."USD registrados" := decImporteStock;
                    rstPresup.Modify;

                end;

            end;

            //decImporteSinFactura := rptGenerarInfoCostos.StockxActividadAFacturar('LAN',rstProyecto,l_blnTipoValoracion::Factura);
            if decImporteSinFactura <> 0 then begin

                Clear(rstPresup);
                rstPresup."Tipo registro" := rstPresup."Tipo registro"::"Registro presupuestado";
                rstPresup.Proyecto := rstProyPres.Proyecto;
                rstPresup.Buque := rstProyPres.Buque;
                rstPresup.Marea := rstProyPres.Marea;
                rstPresup."No. cuenta" := rstCuenta."No.";
                rstPresup."No. documento" := StrSubstNo(Text1, codProyecto);
                rstPresup."Starting date" := rstProyPres."Starting date";
                rstPresup."Ending date" := rstProyPres."Ending date";
                rstPresup."Kilos capturados" := rstProyPres."Kilos capturados";
                rstPresup."USD a proyecto" := rstProyPres."USD a proyecto";
                rstPresup."Días de marea proyecto" := rstProyPres."Días de marea proyecto";
                rstPresup."Días de marea anuales" := rstProyPres."Días de marea anuales";

                if not rstPresup.Insert then begin

                    rstPresup.FindFirst;
                    rstPresup."USD registrados" += decImporteSinFactura;
                    rstPresup.Modify;

                end
                else begin

                    rstPresup.Validate("No. cuenta", rstCuenta."No.");
                    rstPresup.Validate(Proyecto, rstProyPres.Proyecto);
                    rstPresup.Validate("Fecha modificada", datFecha);
                    rstPresup."Días de marea proyecto" := rstProyPres."Días de marea proyecto";
                    rstPresup."USD registrados" += decImporteSinFactura;
                    rstPresup.Modify;

                end;

            end;

        end;

        rstCuenta.Get('3110005');
        if rstCuenta."Denominación común costos" = '' then begin

            //decImporteStock := rptGenerarInfoCostos.StockxActividad('CAL',rstProyecto,l_blnTipoValoracion::Factura,FALSE);
            if decImporteStock <> 0 then begin

                Clear(rstPresup);
                rstPresup."Tipo registro" := rstPresup."Tipo registro"::"Registro presupuestado";
                rstPresup.Proyecto := rstProyPres.Proyecto;
                rstPresup.Buque := rstProyPres.Buque;
                rstPresup.Marea := rstProyPres.Marea;
                rstPresup."No. cuenta" := rstCuenta."No.";
                rstPresup."No. documento" := StrSubstNo(Text1, codProyecto);
                rstPresup."Starting date" := rstProyPres."Starting date";
                rstPresup."Ending date" := rstProyPres."Ending date";
                rstPresup."Kilos capturados" := rstProyPres."Kilos capturados";
                rstPresup."USD a proyecto" := rstProyPres."USD a proyecto";
                rstPresup."Días de marea proyecto" := rstProyPres."Días de marea proyecto";
                rstPresup."Días de marea anuales" := rstProyPres."Días de marea anuales";

                if not rstPresup.Insert then begin

                    rstPresup.FindFirst;
                    rstPresup."USD registrados" := decImporteStock;
                    rstPresup.Modify;

                end
                else begin

                    rstPresup.Validate("No. cuenta", rstCuenta."No.");
                    rstPresup.Validate(Proyecto, rstProyPres.Proyecto);
                    rstPresup.Validate("Fecha modificada", datFecha);
                    rstPresup."Días de marea proyecto" := rstProyPres."Días de marea proyecto";
                    rstPresup."USD registrados" := decImporteStock;
                    rstPresup.Modify;

                end;

            end;

            //decImporteSinFactura := rptGenerarInfoCostos.StockxActividadAFacturar('CAL',rstProyecto,l_blnTipoValoracion::Factura);
            if decImporteSinFactura <> 0 then begin

                Clear(rstPresup);
                rstPresup."Tipo registro" := rstPresup."Tipo registro"::"Registro presupuestado";
                rstPresup.Proyecto := rstProyPres.Proyecto;
                rstPresup.Buque := rstProyPres.Buque;
                rstPresup.Marea := rstProyPres.Marea;
                rstPresup."No. cuenta" := rstCuenta."No.";
                rstPresup."No. documento" := StrSubstNo(Text1, codProyecto);
                rstPresup."Starting date" := rstProyPres."Starting date";
                rstPresup."Ending date" := rstProyPres."Ending date";
                rstPresup."Kilos capturados" := rstProyPres."Kilos capturados";
                rstPresup."USD a proyecto" := rstProyPres."USD a proyecto";
                rstPresup."Días de marea proyecto" := rstProyPres."Días de marea proyecto";
                rstPresup."Días de marea anuales" := rstProyPres."Días de marea anuales";

                if not rstPresup.Insert then begin

                    rstPresup.FindFirst;
                    rstPresup."USD registrados" += decImporteSinFactura;
                    rstPresup.Modify;

                end
                else begin

                    rstPresup.Validate("No. cuenta", rstCuenta."No.");
                    rstPresup.Validate(Proyecto, rstProyPres.Proyecto);
                    rstPresup.Validate("Fecha modificada", datFecha);
                    rstPresup."Días de marea proyecto" := rstProyPres."Días de marea proyecto";
                    rstPresup."USD registrados" += decImporteSinFactura;
                    rstPresup.Modify;

                end;

            end;

        end;

        rstCuenta.Get('3110006');
        if rstCuenta."Denominación común costos" = '' then begin

            //decImporteStock := rptGenerarInfoCostos.StockxActividad('MER',rstProyecto,l_blnTipoValoracion::Factura,FALSE);
            if decImporteStock <> 0 then begin

                Clear(rstPresup);
                rstPresup."Tipo registro" := rstPresup."Tipo registro"::"Registro presupuestado";
                rstPresup.Proyecto := rstProyPres.Proyecto;
                rstPresup.Buque := rstProyPres.Buque;
                rstPresup.Marea := rstProyPres.Marea;
                rstPresup."No. cuenta" := rstCuenta."No.";
                rstPresup."No. documento" := StrSubstNo(Text1, codProyecto);
                rstPresup."Starting date" := rstProyPres."Starting date";
                rstPresup."Ending date" := rstProyPres."Ending date";
                rstPresup."Kilos capturados" := rstProyPres."Kilos capturados";
                rstPresup."USD a proyecto" := rstProyPres."USD a proyecto";
                rstPresup."Días de marea proyecto" := rstProyPres."Días de marea proyecto";
                rstPresup."Días de marea anuales" := rstProyPres."Días de marea anuales";

                if not rstPresup.Insert then begin

                    rstPresup.FindFirst;
                    rstPresup."USD registrados" := decImporteStock;
                    rstPresup.Modify;

                end
                else begin

                    rstPresup.Validate("No. cuenta", rstCuenta."No.");
                    rstPresup.Validate(Proyecto, rstProyPres.Proyecto);
                    rstPresup.Validate("Fecha modificada", datFecha);
                    rstPresup."Días de marea proyecto" := rstProyPres."Días de marea proyecto";
                    rstPresup."USD registrados" := decImporteStock;
                    rstPresup.Modify;

                end;

            end;

            //decImporteSinFactura := rptGenerarInfoCostos.StockxActividadAFacturar('MER',rstProyecto,l_blnTipoValoracion::Factura);
            if decImporteSinFactura <> 0 then begin

                Clear(rstPresup);
                rstPresup."Tipo registro" := rstPresup."Tipo registro"::"Registro presupuestado";
                rstPresup.Proyecto := rstProyPres.Proyecto;
                rstPresup.Buque := rstProyPres.Buque;
                rstPresup.Marea := rstProyPres.Marea;
                rstPresup."No. cuenta" := rstCuenta."No.";
                rstPresup."No. documento" := StrSubstNo(Text1, codProyecto);
                rstPresup."Starting date" := rstProyPres."Starting date";
                rstPresup."Ending date" := rstProyPres."Ending date";
                rstPresup."Kilos capturados" := rstProyPres."Kilos capturados";
                rstPresup."USD a proyecto" := rstProyPres."USD a proyecto";
                rstPresup."Días de marea proyecto" := rstProyPres."Días de marea proyecto";
                rstPresup."Días de marea anuales" := rstProyPres."Días de marea anuales";

                if not rstPresup.Insert then begin

                    rstPresup.FindFirst;
                    rstPresup."USD registrados" += decImporteSinFactura;
                    rstPresup.Modify;

                end
                else begin

                    rstPresup.Validate("No. cuenta", rstCuenta."No.");
                    rstPresup.Validate(Proyecto, rstProyPres.Proyecto);
                    rstPresup.Validate("Fecha modificada", datFecha);
                    rstPresup."Días de marea proyecto" := rstProyPres."Días de marea proyecto";
                    rstPresup."USD registrados" += decImporteSinFactura;
                    rstPresup.Modify;

                end;

            end;

        end;
    end;
}

