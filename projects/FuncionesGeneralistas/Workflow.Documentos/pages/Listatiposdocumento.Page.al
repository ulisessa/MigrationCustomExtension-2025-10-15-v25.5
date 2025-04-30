page 50539 "Lista tipos documento"
{
    PageType = List;
    SourceTable = "Tipos documento";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Tipos documento"; "Tipos documento")
                {
                }
                field("Documento interno"; "Documento interno")
                {
                }
                field("No. form"; "No. form")
                {
                    LookupPageID = Objects;
                }
                field("No. serie"; "No. serie")
                {
                }
                field("e-mail"; "e-mail")
                {
                }
                field(Dataport; Dataport)
                {
                }
                field("Tipo documento Navision"; "Tipo documento Navision")
                {
                }
                field("Origen externo"; "Origen externo")
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

