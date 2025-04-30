page 50614 "Item Sales List"
{
    Caption = 'Item List';
    CardPageID = "Item Card";
    DataCaptionFields = "No.", Description;
    PageType = ListPart;
    SourceTable = Item;
    SourceTableView = WHERE("Exportación" = CONST(true),
                            Blocked = CONST(false),
                            Inventory = FILTER(<> 0));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                Editable = false;
                ShowCaption = false;
                field("No."; "No.")
                {
                }
                field(Description; Description)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Acci&ones")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("&Crear ud. de almacenam.")
                {
                    Caption = '&Create Stockkeeping Unit';
                    Image = CreateSKU;

                    trigger OnAction()
                    var
                        Item: Record Item;
                    begin
                        Item.SetRange("No.", "No.");
                        REPORT.RunModal(REPORT::"Create Stockkeeping Unit", true, false, Item);
                    end;
                }
                action("Ca&lcular periodo recuento")
                {
                    Caption = 'C&alculate Counting Period';
                    Image = CalculateCalendar;

                    trigger OnAction()
                    var
                        PhysInvtCountMgt: Codeunit "Phys. Invt. Count.-Management";
                    begin
                        PhysInvtCountMgt.UpdateItemPhysInvtCount(Rec);
                    end;
                }
            }
            action("Precios de venta")
            {
                Caption = 'Sales Prices';
                Image = SalesPrices;
                RunObject = Page "Sales Prices";
                RunPageLink = "Item No." = FIELD("No.");
                RunPageView = SORTING("Item No.");
            }
            action("Descuentos línea de ventas")
            {
                Caption = 'Sales Line Discounts';
                Image = SalesLineDisc;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Sales Line Discounts";
                RunPageLink = Type = CONST(Item),
                              Code = FIELD("No.");
                RunPageView = SORTING(Type, Code);
            }
            action("Hoja de demanda")
            {
                Caption = 'Requisition Worksheet';
                Image = Worksheet;
                RunObject = Page "Req. Worksheet";
            }
            action("Diario productos")
            {
                Caption = 'Item Journal';
                Image = Journals;
                RunObject = Page "Item Journal";
            }
            action("Diario reclasificación producto")
            {
                Caption = 'Item Reclassification Journal';
                Image = Journals;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Item Reclass. Journal";
            }
            action("Seguim. prod.")
            {
                Caption = 'Item Tracing';
                Image = ItemTracing;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Item Tracing";
            }
            action("Modificar precios/costes de productos")
            {
                Caption = 'Adjust Item Cost/Price';
                Image = AdjustItemCost;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Report "Adjust Item Costs/Prices";
            }
            action("Valorar stock - movs. producto")
            {
                Caption = 'Adjust Cost - Item Entries';
                Image = AdjustEntries;
                RunObject = Report "Adjust Cost - Item Entries";
            }
        }

    }

    trigger OnAfterGetCurrRecord()
    begin
        /*CurrPage.Treeview.PAGE.fntFiltrarLegajo("No.");
        CurrPage.Treeview.PAGE.fntFiltroDocumento(codFiltroDocumento,codActividad);*/

    end;

    trigger OnAfterGetRecord()
    var
        rstIS: Record "Inventory Setup";
        rstUS: Record "User Setup";
    begin
    end;

    trigger OnOpenPage()
    begin
        if codActividad <> '' then
            SetRange("Global Dimension 2 Code", codActividad);
    end;

    var
        SkilledResourceList: Page "Skilled Resource List";
        CalculateStdCost: Codeunit "Calculate Standard Cost";
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
        decUPC: Decimal;
        rstVE: Record "Value Entry";
        codFactura: Code[30];
        codFacInterna: Code[30];
        datFechaFactura: Date;
        decFIFO: Decimal;
        rstILE: Record "Item Ledger Entry";
        decFIFOContabilidad: Decimal;
        strProveedor: Text;
        blnCalcularValores: Boolean;
        codFiltroDocumento: Code[20];
        codActividad: Code[20];

    [Scope('OnPrem')]
    procedure GetSelectionFilter(): Text
    var
        Item: Record Item;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(Item);
        exit(SelectionFilterManagement.GetSelectionFilterForItem(Item));
    end;

    [Scope('OnPrem')]
    procedure SetSelection(var Item: Record Item)
    begin
        CurrPage.SetSelectionFilter(Item);
    end;

    procedure fntFiltroDocumento(l_codFiltroDocumento: Code[20]; l_codActividad: Code[20])
    begin
        codFiltroDocumento := l_codFiltroDocumento;
        codActividad := l_codActividad;

        //SETRANGE("Global Dimension 2 Code",codActividad);
    end;
}

