page 50597 "Específico ruta digitalizacion"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "Específicos por ruta";
    SourceTableView = SORTING("No.", "No. línea");
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Nivel; Nivel)
                {
                }
                field("Descripción nivel"; "Descripción nivel")
                {
                    Editable = true;
                }
                field("Automático"; Automático)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
    end;
}

