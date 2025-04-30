page 50704 "Lista formulas"
{
    PageType = List;
    SourceTable = Formulas;
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Cód. fórmula"; "Cód. fórmula")
                {
                }
                field("Expresión"; Expresión)
                {
                }
            }
        }
    }

    actions
    {
    }
}

