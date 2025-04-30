page 50638 "Subform. Informe Capitán"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    SourceTable = "Lín. informe capitán";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
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
            }
        }
    }

    actions
    {
    }
}

