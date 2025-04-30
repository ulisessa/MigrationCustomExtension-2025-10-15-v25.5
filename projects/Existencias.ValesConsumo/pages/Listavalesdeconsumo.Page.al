page 50048 "Lista vales de consumo"
{
    Editable = false;
    PageType = List;
    SourceTable = "Cab. Vale consumo";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No. documento"; "No. documento")
                {
                }
                field("Fecha registro"; "Fecha registro")
                {
                }
                field("Descripción"; Descripción)
                {
                }
            }
        }
    }

    actions
    {
    }
}

