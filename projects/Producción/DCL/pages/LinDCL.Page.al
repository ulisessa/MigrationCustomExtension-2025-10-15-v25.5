page 50663 "Lin. DCL"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Lín. DCL";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("No. línea"; "No. línea")
                {
                }
                field("Fecha DCL"; "Fecha DCL")
                {
                }
                field("Clasificación"; Clasificación)
                {
                }
                field("Descripción"; Descripción)
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
                field(Promedio; Promedio)
                {
                    Editable = false;
                }
                field(Cliente; Cliente)
                {
                }
                field("Nombre cliente"; "Nombre cliente")
                {
                    Editable = false;
                }
                field(Referencia; Referencia)
                {
                }
                field("Applied kilos"; "Applied kilos")
                {
                    Editable = false;
                }
                field("Promedio acordado"; "Promedio acordado")
                {
                }
                field("Valor por kilo acordado"; "Valor por kilo acordado")
                {
                }
                field("Importe acordado esperado"; "Importe acordado esperado")
                {
                }
            }
        }
    }

    actions
    {
    }
}

