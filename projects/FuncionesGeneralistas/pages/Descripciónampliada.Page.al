page 50099 "Descripción ampliada"
{
    AutoSplitKey = true;
    PageType = List;
    SourceTable = "Extended Text Line";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Text; Text)
                {
                    Caption = 'Descripción';
                }
            }
        }
    }

    actions
    {
    }
}

