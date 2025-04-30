page 50038 "Lista concepto proyecto"
{
    PageType = List;
    SourceTable = "Concepto proyecto";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Código"; Código)
                {
                }
                field(Nombre; Nombre)
                {
                }
                field("Cód. consolidación"; "Cód. consolidación")
                {
                    Visible = false;
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

