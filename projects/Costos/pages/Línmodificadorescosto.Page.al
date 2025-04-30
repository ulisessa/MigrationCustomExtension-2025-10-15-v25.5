page 50088 "Lín. modificadores costo"
{
    DelayedInsert = true;
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
            }
        }
    }

    actions
    {
    }
}

