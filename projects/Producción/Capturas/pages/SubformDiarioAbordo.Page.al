page 50501 "Subform Diario Abordo"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "On board capture lines";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Concepto; Concepto)
                {
                }
                field("Fecha registro"; "Fecha registro")
                {
                }
                field("Zona de pesca"; "Zona de pesca")
                {

                    trigger OnAssistEdit()
                    begin
                        HyperLink('http://maps.google.es/maps?q= ' +
                                                                  Format(-1 * (Round(("Latitud - Grados") +
                                                                  ("Latitud - Minutos" / 60) +
                                                                  ("Latitud - Segundos" / 3600), 0.000001))) +
                                                                  ', ' +
                                                                  Format(-1 * (Round("Longitud - Grados" +
                                                                  ("Longitud - Minutos" / 60) +
                                                                  ("Longitud - Segundos" / 3600), 0.000001))) +
                                                                  ' (' + "Cód. proyecto" + ' - ' + Marea + Format("Fecha registro") + ')' +
                                                                  '&t=h&z=8&iwloc=addr>');
                        /*
'&iwloc=A&hl=en');                                               */

                    end;
                }
                field("No."; "No.")
                {
                }
                field("Descripción"; Descripción)
                {
                }
                field(Cantidad; Cantidad)
                {
                }
                field("Descripción Unidad Medida"; "Descripción Unidad Medida")
                {
                    Editable = false;
                }
                field(Kilos; Kilos)
                {
                    Editable = false;
                }
                field("Latitud - Grados"; "Latitud - Grados")
                {
                    Visible = false;
                }
                field("Latitud - Minutos"; "Latitud - Minutos")
                {
                    Visible = false;
                }
                field("Latitud - Segundos"; "Latitud - Segundos")
                {
                    Visible = false;
                }
                field("Longitud - Grados"; "Longitud - Grados")
                {
                    Visible = false;
                }
                field("Longitud - Minutos"; "Longitud - Minutos")
                {
                    Visible = false;
                }
                field("Longitud - Segundos"; "Longitud - Segundos")
                {
                    Visible = false;
                }
                field(Enviado; Enviado)
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    var
        rstLinDiario: Record "On board capture lines";
}

