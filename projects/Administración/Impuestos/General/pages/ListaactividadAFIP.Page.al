page 50503 "Lista actividad AFIP"
{
    PageType = List;
    SourceTable = "Actividad AFIP";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. actividad"; "No. actividad")
                {
                }
                field(Nombre; Nombre)
                {
                }
                field("Actividad registrada en RG3594"; "Actividad registrada en RG3594")
                {
                }
                field("Tipo actividad"; "Tipo actividad")
                {
                }
            }
        }
    }

    actions
    {
    }
}

