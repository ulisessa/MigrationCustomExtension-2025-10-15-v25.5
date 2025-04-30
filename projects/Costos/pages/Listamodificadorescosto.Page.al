page 50711 "Lista modificadores costo"
{
    Editable = false;
    PageType = List;
    SourceTable = "Modificadores Costos";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Tipo registro"; "Tipo registro")
                {
                }
                field(Proyecto; Proyecto)
                {
                }
                field(Buque; Buque)
                {
                }
                field(Marea; Marea)
                {
                }
                field("Forma de reparto"; "Forma de reparto")
                {
                }
                field("Criterio de reparto"; "Criterio de reparto")
                {
                }
                field("Starting date"; "Starting date")
                {
                }
                field("Ending date"; "Ending date")
                {
                }
                field("Kilos capturados"; "Kilos capturados")
                {
                }
                field("USD a proyecto"; "USD a proyecto")
                {
                }
                field("No. cuenta"; "No. cuenta")
                {
                }
                field("No. documento"; "No. documento")
                {
                }
                field("Nombre de cuenta"; "Nombre de cuenta")
                {
                }
                field("Grupo de cuenta"; "Grupo de cuenta")
                {
                }
                field("Denominación de costos"; "Denominación de costos")
                {
                }
                field("USD registrados"; "USD registrados")
                {
                }
                field("Días de marea proyecto"; "Días de marea proyecto")
                {
                }
                field("Días de marea anuales"; "Días de marea anuales")
                {
                }
                field("Fecha modificada"; "Fecha modificada")
                {
                }
                field("Año modificado"; "Año modificado")
                {
                }
            }
        }
    }

    actions
    {
    }
}

