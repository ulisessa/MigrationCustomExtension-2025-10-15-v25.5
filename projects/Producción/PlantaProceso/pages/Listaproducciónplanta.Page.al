page 50555 "Lista producción planta"
{
    CardPageID = "Producción Planta";
    DeleteAllowed = true;
    Editable = false;
    PageType = List;
    SourceTable = "Produccion Planta";
    SourceTableView = SORTING("Fecha registro", "No. documento")
                      ORDER(Descending);
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Registrado; Registrado)
                {
                }
                field("Nombre libro diario"; "Nombre libro diario")
                {
                }
                field("Nombre seccion diario"; "Nombre seccion diario")
                {
                }
                field("Lote origen"; "Lote origen")
                {
                }
                field("No. documento"; "No. documento")
                {
                }
                field("Fecha produccion"; "Fecha produccion")
                {
                }
                field("Puerto/Aeropuerto"; "Puerto/Aeropuerto")
                {
                }
                field("Global Dimension 1"; "Global Dimension 1")
                {
                }
                field("Global Dimension 2"; "Global Dimension 2")
                {
                }
                field("Global Dimension 3"; "Global Dimension 3")
                {
                }
                field("Proyecto Origen"; "Proyecto Origen")
                {
                }
                field("Proyecto Destino"; "Proyecto Destino")
                {
                }
                field("CAL Pelado Rejos KG"; "CAL Pelado Rejos KG")
                {
                }
                field("CAL Pelado Aletas KG"; "CAL Pelado Aletas KG")
                {
                }
                field("CAL Pelado Vaina RE (%)"; "CAL Pelado Vaina RE (%)")
                {
                }
                field("CAL Pelado Rejos RE (%)"; "CAL Pelado Rejos RE (%)")
                {
                }
                field("CAL Pelado Aletas RE (%)"; "CAL Pelado Aletas RE (%)")
                {
                }
                field("CAL Engorde Entrada KG"; "CAL Engorde Entrada KG")
                {
                }
                field("CAL Engorde Salida KG"; "CAL Engorde Salida KG")
                {
                }
                field("CAL Engorde RE (%)"; "CAL Engorde RE (%)")
                {
                }
                field("CAL Envasado Entrada KG"; "CAL Envasado Entrada KG")
                {
                }
                field("CAL Envasado Salida KG"; "CAL Envasado Salida KG")
                {
                }
                field("CAL Vaina Sin Engorde KN"; "CAL Vaina Sin Engorde KN")
                {
                }
                field("CAL Rejo Sin Engorde KN"; "CAL Rejo Sin Engorde KN")
                {
                }
                field("CAL Entero Sin Clasificar KN"; "CAL Entero Sin Clasificar KN")
                {
                }
                field("CAL Entrada SE Reproceso"; "CAL Entrada SE Reproceso")
                {
                }
                field("CAL Entrada MP"; "CAL Entrada MP")
                {
                }
                field("CAL Salida KG Semielaborado"; "CAL Salida KG Semielaborado")
                {
                }
                field("CAL Vaina MP"; "CAL Vaina MP")
                {
                }
                field("CAL Entero MP"; "CAL Entero MP")
                {
                }
                field("CAL Produccion RE (%)"; "CAL Produccion RE (%)")
                {
                }
                field("CAL Merma Pelado (%)"; "CAL Merma Pelado (%)")
                {
                }
                field("CAL Vaina Sin Pelar KG"; "CAL Vaina Sin Pelar KG")
                {
                }
                field("CAL Vaina Sin Pelar (%)"; "CAL Vaina Sin Pelar (%)")
                {
                }
                field("FRE Entrada KG"; "FRE Entrada KG")
                {
                }
                field("FRE Clasificacion Entrada KG"; "FRE Clasificacion Entrada KG")
                {
                }
                field("FRE Clasificacion Salida KG"; "FRE Clasificacion Salida KG")
                {
                }
                field("FRE Clasificacion Pelado KG"; "FRE Clasificacion Pelado KG")
                {
                }
                field("FRE Clasificacion Cola KG"; "FRE Clasificacion Cola KG")
                {
                }
                field("FRE Clasificacion Entero KG"; "FRE Clasificacion Entero KG")
                {
                }
                field("FRE Clas. Pelado RE (%)"; "FRE Clas. Pelado RE (%)")
                {
                }
                field("FRE Clas. Cola RE (%)"; "FRE Clas. Cola RE (%)")
                {
                }
                field("FRE Clas. Entero RE (%)"; "FRE Clas. Entero RE (%)")
                {
                }
                field("FRE Pelado Entrada KG"; "FRE Pelado Entrada KG")
                {
                }
                field("FRE Pelado Salida KG"; "FRE Pelado Salida KG")
                {
                }
                field("FRE Pelado RE (%)"; "FRE Pelado RE (%)")
                {
                }
                field("FRE Envasado Entrada KG"; "FRE Envasado Entrada KG")
                {
                }
                field("FRE Envasado Salida KG"; "FRE Envasado Salida KG")
                {
                }
                field("FRE Produccion RE (%)"; "FRE Produccion RE (%)")
                {
                }
                field("FRE Merma Clasificacion (%)"; "FRE Merma Clasificacion (%)")
                {
                }
                field("PES Entera Entrada KG"; "PES Entera Entrada KG")
                {
                }
                field("PES Entera Salida KG"; "PES Entera Salida KG")
                {
                }
                field("PES Entera Clasif. RE (%)"; "PES Entera Clasif. RE (%)")
                {
                }
                field("PES Entera Clasif. Merma KG"; "PES Entera Clasif. Merma KG")
                {
                }
                field("PES Entera Clasif. Descarte KG"; "PES Entera Clasif. Descarte KG")
                {
                }
                field("PES Clasificacion Descarte"; "PES Clasificacion Descarte")
                {
                }
                field("PES Clasificacion RE (%)"; "PES Clasificacion RE (%)")
                {
                }
                field("PES Envasado Entrada KG"; "PES Envasado Entrada KG")
                {
                }
                field("PES Envasado Salida KG"; "PES Envasado Salida KG")
                {
                }
                field("PES Produccion RE (%)"; "PES Produccion RE (%)")
                {
                }
                field("PES Produccion Merma"; "PES Produccion Merma")
                {
                }
                field("PES MP Entrada KG"; "PES MP Entrada KG")
                {
                }
                field("PES Carioca Entrada KG"; "PES Carioca Entrada KG")
                {
                }
                field("PES Carioca Entrada RE (%)"; "PES Carioca Entrada RE (%)")
                {
                }
                field("PES Entera Entrada RE (%)"; "PES Entera Entrada RE (%)")
                {
                }
                field("PES Carioca Proceso-Out KG"; "PES Carioca Proceso-Out KG")
                {
                }
                field("PES Carioca Proceso RE (%)"; "PES Carioca Proceso RE (%)")
                {
                }
                field("PES Carioca RE (%)"; "PES Carioca RE (%)")
                {
                }
                field("PES Filete S/E RE (%)"; "PES Filete S/E RE (%)")
                {
                }
                field("Fecha anulacion"; "Fecha anulacion")
                {
                }
                field("Usuario anulacion"; "Usuario anulacion")
                {
                }
                field(Anulado; Anulado)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Documento)
            {
                Caption = 'Documento';
                action("&Ficha")
                {
                    Caption = '&Ficha';
                    RunPageMode = Edit;
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    var
                        rstProduccion: Record "Produccion Planta";
                    begin
                        //IBdos Argentina - USS - 231202 - Inicio Modificación Arbumasa
                        //Adición de menú a ficha

                        Clear(rstProduccion);
                        rstProduccion.SetRange(rstProduccion."No. documento", "No. documento");
                        if rstProduccion.Find('-') then begin

                            if (rstProduccion."Global Dimension 2" = 'CAL') and (rstProduccion.Registrado) then
                                PAGE.Run(50560, rstProduccion);
                            if ((rstProduccion."Global Dimension 2" = 'FRE') or (rstProduccion."Global Dimension 2" = 'LAN'))
                              and (rstProduccion.Registrado) then
                                PAGE.Run(50560, rstProduccion);
                            if not (rstProduccion."Global Dimension 2" in ['FRE', 'CAL']) and (rstProduccion.Registrado) then
                                PAGE.Run(50560, rstProduccion);
                            if (rstProduccion."Global Dimension 2" = 'CAL') and not (rstProduccion.Registrado) then
                                PAGE.Run(50560, rstProduccion);
                            if ((rstProduccion."Global Dimension 2" = 'FRE') or (rstProduccion."Global Dimension 2" = 'LAN'))
                              and not (rstProduccion.Registrado) then
                                PAGE.Run(50560, rstProduccion);
                            if not (rstProduccion."Global Dimension 2" in ['FRE', 'CAL']) and not (rstProduccion.Registrado) then
                                PAGE.Run(50560, rstProduccion);

                        end;

                        //IBdos Argentina - USS - 1231202 - Fin Modificación Arbumasa
                    end;
                }
                action("Eliminar producción")
                {
                    Caption = 'Eliminar producción';
                    Image = Delete;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        TestField(Registrado, false);
                        Delete(true);
                    end;
                }
            }
        }
    }

    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
    end;

    var

        intCardFormID: Integer;
        Text000: Label '&Calamar,&Langostino,&Pescado';
}

