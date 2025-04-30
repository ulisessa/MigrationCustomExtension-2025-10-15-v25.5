page 50541 "Lista documentos por grupo"
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
                field(Grupo; Grupo)
                {
                }
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

