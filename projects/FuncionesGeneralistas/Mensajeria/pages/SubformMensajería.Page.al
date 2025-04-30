page 50550 "Subform Mensajería"
{
    AutoSplitKey = true;
    MultipleNewLines = true;
    PageType = List;
    SourceTable = "Detalle mensajería";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Mensaje; Mensaje)
                {
                }
                field(Usuario; Usuario)
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LookupMode := false;
    end;

    var
        PunMens: Record Mensajeria;
}

