page 60031 "Familia de productos"
{
    Editable = true;
    PageType = List;
    SourceTable = "Familia producto";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Code"; Code)
                {
                }
                field(Description; Description)
                {
                }
                field("Rubric code"; "Rubric code")
                {
                }
                field("Rubric name"; "Rubric name")
                {
                    Editable = false;
                }
                field("Tipo producto"; "Tipo producto")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Familia")
            {
                Caption = '&Familia';
                action(Subfamilia)
                {
                    Caption = 'Subfamilia';
                    RunObject = Page "Subfamilia producto";
                    RunPageLink = "Family code" = FIELD (Code);
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if CurrPage.LookupMode = true then
            CurrPage.Editable(false);
    end;
}

