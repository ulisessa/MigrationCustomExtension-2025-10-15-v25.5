page 50504 "Lista Concepto Días Pesca"
{
    Editable = true;
    PageType = List;
    SourceTable = "Concepto Días Pesca";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Concepto; Concepto)
                {
                }
                field("Día"; Día)
                {
                }
                field("Dias Pesca"; "Dias Pesca")
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
        if CurrPage.LookupMode() then
            CurrPage.Editable(false);
    end;
}

