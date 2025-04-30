page 60034 "Lista categorización productos"
{
    PageType = List;
    SourceTable = "Categorizacion productos";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Cód. categorización"; "Cód. categorización")
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

    trigger OnInit()
    begin
        CurrPage.LookupMode := false;
    end;

    trigger OnOpenPage()
    begin
        if CurrPage.LookupMode = true then
            CurrPage.Editable(false);
    end;
}

