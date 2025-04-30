page 50397 "Lista grupo nota balance"
{
    PageType = List;
    SourceTable = "Grupos Nota Balance";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field(Orden; Orden)
                {
                }
                field(Nivel; Nivel)
                {
                }
                field("Descripción"; Descripción)
                {
                }
                field("Saldo 1er Nivel"; "Saldo 1er Nivel")
                {
                }
            }
        }
    }

    actions
    {
    }
}

