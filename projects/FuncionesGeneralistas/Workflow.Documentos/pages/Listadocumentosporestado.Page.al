page 50543 "Lista documentos por estado"
{
    PageType = List;
    SourceTable = "Seguimiento por grupo";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Tipo documento"; "Tipo documento")
                {
                }
                field("Estado documento"; "Estado documento")
                {
                }
                field("No. form"; "No. form")
                {
                    LookupPageID = Objects;
                }
                field(Cantidad; Cantidad)
                {
                }
                field("Enviar correo"; "Enviar correo")
                {
                }
            }
        }
    }

    actions
    {
    }
}

