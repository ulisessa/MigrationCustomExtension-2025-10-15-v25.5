page 50018 "Familia recursos"
{
    PageType = List;
    SourceTable = "Resource family";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; "No")
                {
                }
                field(Nombre; Nombre)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Fam. rec.")
            {
                Caption = '&Fam. rec.';
                action("Estadísticas")
                {
                    Caption = 'Estadísticas';
                    RunObject = Page "Res. Gr. Statistics";
                    RunPageLink = "No." = FIELD("No"),
                                  "Date Filter" = FIELD("Filtro fecha"),
                                  "Unit of Measure Filter" = FIELD("Filtro unidad medida"),
                                  "Chargeable Filter" = FIELD("Filtro facturable");
                    ShortCutKey = 'F9';
                }
                action("C&omentarios")
                {
                    Caption = 'C&omentarios';
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = CONST("Resource Group"),
                                  "No." = FIELD("No");
                }
                action("Relación con proveedores")
                {
                    Caption = 'Relación con proveedores';
                    RunObject = Page "Lista flia. rec. por proveedor";
                    RunPageLink = "No. familia recurso" = FIELD("No");
                }
                action("Subfamilia recurso")
                {
                    Caption = 'Subfamilia recurso';
                    RunObject = Page "Lista subfamilia recurso";
                    RunPageLink = "Familia recurso" = FIELD("No");
                }
                action(Subfamilia)
                {
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Lista subfamilia recurso";
                    RunPageLink = "Familia recurso" = FIELD("No");
                }
            }
            group("&Precios")
            {
                Caption = '&Precios';
                action(Costes)
                {
                    Caption = 'Costes';
                    RunObject = Page Jornada;
                    RunPageLink = "Workday code" = CONST('1');
                }
                action("Tarifa&s")
                {
                    Caption = 'Tarifa&s';
                    RunObject = Page "Customer Price Groups";
                    RunPageLink = "Price Includes VAT" = CONST(true),
                                  Code = FIELD("No");
                }
            }
            group("Pla&nific.")
            {
                Caption = 'Pla&nific.';
                action("Capacidad fam. recurso")
                {
                    Caption = 'Capacidad fam. recurso';
                    RunObject = Page "Res. Group Capacity";
                }
                action("A&signación fams. recursos")
                {
                    Caption = 'A&signación fams. recursos';
                    RunObject = Page "Res. Gr. Allocated per Job";
                    RunPageLink = "Resource Gr. Filter" = FIELD("No");
                }
                action("D&isponibilidad fam. recurso")
                {
                    Caption = 'D&isponibilidad fam. recurso';
                    RunObject = Page "Res. Group Availability";
                    RunPageLink = "No." = FIELD("No"),
                                  "Unit of Measure Filter" = FIELD("Filtro unidad medida"),
                                  "Chargeable Filter" = FIELD("Filtro facturable");
                }
                separator(Action9)
                {
                }
                action("Presupuesto proyecto")
                {
                    Caption = 'Presupuesto proyecto';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if CurrPage.LookupMode then
            CurrPage.Editable(false);
    end;
}

