page 50702 "Lista ejecutor validaciones"
{
    PageType = List;
    SourceTable = "Ejecutor validaciones";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Cód. validación"; "Cód. validación")
                {
                }
                field("No. línea"; "No. línea")
                {
                }
                field(Tabla; Tabla)
                {
                }
                field(Campo; Campo)
                {
                }
                field(Valor; Valor)
                {
                }
                field(Tipo; Tipo)
                {
                }
                field("Tipo condición"; "Tipo condición")
                {
                }
                field("Nombre tabla"; "Nombre tabla")
                {
                }
                field("Nombre campo"; "Nombre campo")
                {
                }
            }
        }
    }

    actions
    {
    }
}

