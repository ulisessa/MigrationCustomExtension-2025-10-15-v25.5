page 50527 "Lista Lín. Diario Abordo"
{
    Editable = false;
    PageType = Card;
    SourceTable = "On board capture lines";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Fecha registro"; "Fecha registro")
                {
                }
                field("No."; "No.")
                {
                }
                field("Descripción"; Descripción)
                {
                }
                field("Ud. Medida"; "Ud. Medida")
                {
                }
                field(Cantidad; Cantidad)
                {
                }
                field(Kilos; Kilos)
                {
                }
                field("No. Línea"; "No. Línea")
                {
                }
            }
        }
    }

    actions
    {
    }
}

