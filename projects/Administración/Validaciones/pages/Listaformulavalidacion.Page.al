page 50705 "Lista formula validacion"
{
    PageType = List;
    SourceTable = "Formulas por Validación";
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
                field("Validación"; Validación)
                {
                }
            }
        }
    }

    actions
    {
    }
}

