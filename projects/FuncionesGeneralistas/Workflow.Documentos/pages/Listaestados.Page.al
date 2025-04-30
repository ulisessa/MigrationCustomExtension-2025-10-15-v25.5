page 50540 "Lista estados"
{
    PageType = List;
    SourceTable = Estados;
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Estados; Estados)
                {
                }
                field(Nivel; Nivel)
                {
                }
                field("Fórmula de fecha"; "Fórmula de fecha")
                {
                }
                field("No editable"; "No editable")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        if CurrPage.LookupMode = true then
            CurrPage.Editable(false);
    end;
}

