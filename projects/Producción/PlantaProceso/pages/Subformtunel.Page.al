page 50562 "Subform tunel"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SaveValues = false;
    SourceTable = "Lin. tunel";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Tunel"; "No. Tunel")
                {
                }
                field(Clasificacion; Clasificacion)
                {
                }
                field(Descripcion; Descripcion)
                {
                }
                field("Unidad medida"; "Unidad medida")
                {
                }
                field(Cantidad; Cantidad)
                {
                }
                field("Kilos netos"; "Kilos netos")
                {
                }
                field("Kilos brutos"; "Kilos brutos")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Sugerir líneas de PT")
            {

                trigger OnAction()
                var
                    cduDescarga: Codeunit Descargas;
                    rstPP: Record "Produccion Planta";
                begin
                    Clear(cduDescarga);
                    Clear(rstPP);
                    rstPP.SetRange("No. documento", "No. documento");
                    if rstPP.FindFirst then
                        cduDescarga.fntSugerirPallets(rstPP);
                end;
            }
        }
    }
}

