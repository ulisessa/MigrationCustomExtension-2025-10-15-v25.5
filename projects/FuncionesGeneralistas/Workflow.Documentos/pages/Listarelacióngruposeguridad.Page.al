page 50538 "Lista relación grupo seguridad"
{
    PageType = List;
    SourceTable = "Relación seguridad";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Grupo Origen"; "Grupo Origen")
                {
                    Editable = true;
                }
                field("Grupo Destino"; "Grupo Destino")
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

