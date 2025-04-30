page 50034 "Lista lín. ventas"
{
    PageType = List;
    SourceTable = "Sales Line";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Document Type"; "Document Type")
                {
                }
                field("Sell-to Customer No."; "Sell-to Customer No.")
                {
                }
                field("Document No."; "Document No.")
                {
                }
                field("Line No."; "Line No.")
                {
                }
                field(Type; Type)
                {
                }
                field("No."; "No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                }
                field(Familia; Familia)
                {
                }
                field(Subfamilia; Subfamilia)
                {
                }
                field("Gross kilos"; "Gross kilos")
                {
                }
                field("Net kilos"; "Net kilos")
                {
                }
                field("KN sin ajuste"; "KN sin ajuste")
                {
                }
                field("KB sin ajuste"; "KB sin ajuste")
                {
                }
                field("Ajuste KN"; "Ajuste KN")
                {
                }
                field("Ajuste KB"; "Ajuste KB")
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

