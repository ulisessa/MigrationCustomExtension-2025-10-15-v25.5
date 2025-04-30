page 50061 "Lista Carpetas Impo por OC"
{
    PageType = List;
    SourceTable = "Carpeta por OC";
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
                    Editable = false;
                }
                field("Carpeta de Importación"; "Carpeta de Importación")
                {
                }
                field("Fecha modificación"; "Fecha modificación")
                {
                    Editable = false;
                    Visible = false;
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

