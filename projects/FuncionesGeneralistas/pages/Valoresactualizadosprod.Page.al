page 50039 "Valores actualizados prod."
{
    Caption = 'Item List';
    CardPageID = "Item Card";
    Editable = false;
    PageType = List;
    SourceTable = Item;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                }
                field(Description; Description)
                {
                }
                field("Texto Exportaciones"; "Texto Exportaciones")
                {
                }
                field(Inventory; Inventory)
                {
                }
                field("Inventory Net Kilos"; "Inventory Net Kilos")
                {
                }
                field("Cantidad facturada"; "Cantidad facturada")
                {
                }
                field("Kilos netos facturados"; "Kilos netos facturados")
                {
                }
                field("Qty. on Purch. Order"; "Qty. on Purch. Order")
                {
                }
                field("Created From Nonstock Item"; "Created From Nonstock Item")
                {
                    Visible = false;
                }
                field("Substitutes Exist"; "Substitutes Exist")
                {
                }
                field("Stockkeeping Unit Exists"; "Stockkeeping Unit Exists")
                {
                    Visible = false;
                }
                field("Assembly BOM"; "Assembly BOM")
                {
                }
                field("Production BOM No."; "Production BOM No.")
                {
                }
                field("Routing No."; "Routing No.")
                {
                }
                field("Base Unit of Measure"; "Base Unit of Measure")
                {
                }
                field("Shelf No."; "Shelf No.")
                {
                    Visible = false;
                }
                field("Costing Method"; "Costing Method")
                {
                    Visible = false;
                }
                field("Cost is Adjusted"; "Cost is Adjusted")
                {
                }
                field("Standard Cost"; "Standard Cost")
                {
                    Visible = false;
                }
                field("Unit Cost"; "Unit Cost")
                {
                }
                field("Last Direct Cost"; "Last Direct Cost")
                {
                    Visible = false;
                }
                field("Unidad medida Diario Abordo"; "Unidad medida Diario Abordo")
                {
                }
                field(Familia; Familia)
                {
                }
                field(Subfamilia; Subfamilia)
                {
                }
                field("Price/Profit Calculation"; "Price/Profit Calculation")
                {
                    Visible = false;
                }
                field("Profit %"; "Profit %")
                {
                    Visible = false;
                }
                field("Unit Price"; "Unit Price")
                {
                }
                field("Inventory Posting Group"; "Inventory Posting Group")
                {
                    Visible = false;
                }
                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {
                    Visible = false;
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {
                    Visible = false;
                }
                field("Item Disc. Group"; "Item Disc. Group")
                {
                    Visible = false;
                }
                field("Vendor No."; "Vendor No.")
                {
                }
                field("Vendor Item No."; "Vendor Item No.")
                {
                    Visible = false;
                }
                field("Tariff No."; "Tariff No.")
                {
                    Visible = false;
                }
                field("Overhead Rate"; "Overhead Rate")
                {
                    Visible = false;
                }
                field("Indirect Cost %"; "Indirect Cost %")
                {
                    Visible = false;
                }
                field("Item Category Code"; "Item Category Code")
                {
                    Visible = false;
                }
                field(Blocked; Blocked)
                {
                    Visible = false;
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    Visible = false;
                }
                field("Sales Unit of Measure"; "Sales Unit of Measure")
                {
                    Visible = false;
                }
                field("Replenishment System"; "Replenishment System")
                {
                    Visible = false;
                }
                field("Purch. Unit of Measure"; "Purch. Unit of Measure")
                {
                    Visible = false;
                }
                field("Lead Time Calculation"; "Lead Time Calculation")
                {
                    Visible = false;
                }
                field("Manufacturing Policy"; "Manufacturing Policy")
                {
                    Visible = false;
                }
                field("Flushing Method"; "Flushing Method")
                {
                    Visible = false;
                }
                field("Assembly Policy"; "Assembly Policy")
                {
                    Visible = false;
                }
                field("Item Tracking Code"; "Item Tracking Code")
                {
                    Visible = false;
                }
                field("Cantidad línea factura venta"; "Cantidad línea factura venta")
                {
                }
                field("Filtro factura"; "Filtro factura")
                {
                }
                field("Importe factura"; "Importe factura")
                {
                }
                field("FIFO Contabilidad"; "FIFO Contabilidad")
                {
                    AssistEdit = false;
                    DrillDown = true;
                    Lookup = false;

                    trigger OnDrillDown()
                    var
                        pgeILE: Page "Item Ledger Entries";
                    begin
                        Clear(pgeILE);
                        Clear(rstILE);
                        rstILE.SetRange("Item No.", "No.");
                        rstILE.SetFilter("Valor FIFO", '<>%1', 0);
                        pgeILE.SetTableView(rstILE);
                        pgeILE.Run;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        pge32: Page "Item Ledger Entries";
                    begin
                    end;
                }
                field("Pendiente FIFO"; "Pendiente FIFO")
                {
                }
                field("Precio FIFO"; decFIFO)
                {

                    trigger OnDrillDown()
                    var
                        rstILE: Record "Item Ledger Entry";
                        pgeILE: Page "Item Ledger Entries";
                        rstUS: Record "User Setup";
                    begin
                        Clear(rstUS);
                        rstUS.Get(UserId);
                        if rstUS."Calcular campos Item" then begin

                            Clear(rstILE);
                            rstILE.SetRange("Item No.", "No.");
                            if Rec.GetFilter("Date Filter") <> '' then
                                rstILE.SetFilter("Posting Date", Rec.GetFilter("Date Filter"));
                            rstILE.SetCurrentKey("Posting Date");
                            if rstILE.FindSet then;
                            Clear(pgeILE);
                            pgeILE.SetTableView(rstILE);
                            pgeILE.Run;

                        end;
                    end;
                }
                field("Ultimo PC"; decUPC)
                {
                }
                field("Exportación"; Exportación)
                {
                }
                field(Captura; Captura)
                {
                }
                field("No. factura proveedor"; codFactura)
                {
                    Caption = 'No. factura proveedor';
                }
                field("Factura interna"; codFacInterna)
                {
                }
                field("Fecha factura"; datFechaFactura)
                {
                }
                field(Proveedor; strProveedor)
                {
                }
                field("Ultimo PV (USD)"; decUPV)
                {
                }
                field("Ultimo PC (USD)"; decLCPDA)
                {

                    trigger OnDrillDown()
                    var
                        rstVE: Record "Value Entry";
                        pgeVE: Page "Value Entries";
                    begin
                        Clear(rstVE);
                        rstVE.SetCurrentKey("Posting Date");
                        rstVE.SetAscending("Posting Date", false);
                        rstVE.SetRange("Item No.", "No.");
                        rstVE.SetRange("Item Ledger Entry Type", rstVE."Item Ledger Entry Type"::Purchase);
                        rstVE.SetRange("Source Type", rstVE."Source Type"::Vendor);
                        rstVE.SetRange("Document Type", rstVE."Document Type"::"Purchase Invoice");
                        rstVE.SetRange("Entry Type", rstVE."Entry Type"::"Direct Cost");
                        if Rec.GetFilter("Date Filter") <> '' then
                            rstVE.SetFilter("Document Date", Rec.GetFilter("Date Filter"));

                        if Rec.GetFilter("Date Filter") <> '' then
                            rstILE.SetFilter("Posting Date", Rec.GetFilter("Date Filter"));
                        if rstVE.FindLast then;
                        Clear(pgeVE);
                        pgeVE.SetTableView(rstVE);
                        pgeVE.Run;
                    end;
                }
                field("Importe venta (USD)"; decImporteV)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = true;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Disponibilidad)
            {
                Caption = 'Availability';
                Image = Item;
                action("Prods. por &almacén")
                {
                    Caption = 'Items b&y Location';
                    Image = ItemAvailbyLoc;

                    trigger OnAction()
                    var
                        ItemsByLocation: Page "Items by Location";
                    begin
                        ItemsByLocation.SetRecord(Rec);
                        ItemsByLocation.Run;
                    end;
                }
                group("&Disponibilidad prod. por")
                {
                    Caption = '&Item Availability by';
                    Image = ItemAvailability;
                    action("<Action5>")
                    {
                        Caption = 'Event';
                        Image = "Event";
                    }
                    action(Periodo)
                    {
                        Caption = 'Period';
                        Image = Period;
                        RunObject = Page "Item Availability by Periods";
                        RunPageLink = "No." = FIELD("No."),
                                      "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                      "Location Filter" = FIELD("Location Filter"),
                                      "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                                      "Variant Filter" = FIELD("Variant Filter");
                    }
                    action(Variante)
                    {
                        Caption = 'Variant';
                        Image = ItemVariant;
                        RunObject = Page "Item Availability by Variant";
                        RunPageLink = "No." = FIELD("No."),
                                      "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                      "Location Filter" = FIELD("Location Filter"),
                                      "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                                      "Variant Filter" = FIELD("Variant Filter");
                    }
                    action("Almacén")
                    {
                        Caption = 'Location';
                        Image = Warehouse;
                        RunObject = Page "Item Availability by Location";
                        RunPageLink = "No." = FIELD("No."),
                                      "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                      "Location Filter" = FIELD("Location Filter"),
                                      "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                                      "Variant Filter" = FIELD("Variant Filter");
                    }
                }
            }
            group("Datos maestros")
            {
                Caption = 'Master Data';
                Image = DataEntry;
                action("&Unidades medida")
                {
                    Caption = '&Units of Measure';
                    Image = UnitOfMeasure;
                    RunObject = Page "Item Units of Measure";
                    RunPageLink = "Item No." = FIELD("No.");
                }
                action("Va&riantes")
                {
                    Caption = 'Va&riants';
                    Image = ItemVariant;
                    RunObject = Page "Item Variants";
                    RunPageLink = "Item No." = FIELD("No.");
                }
                group(Dimensiones)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action("Dimensiones-Individual")
                    {
                        Caption = 'Dimensions-Single';
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = CONST(27),
                                      "No." = FIELD("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                }
                action("Sustitu&ciones")
                {
                    Caption = 'Substituti&ons';
                    Image = ItemSubstitution;
                    RunObject = Page "Item Substitution Entry";
                    RunPageLink = Type = CONST(Item),
                                  "No." = FIELD("No.");
                }
                action("Referencias cru&zadas")
                {
                    Caption = 'Cross Re&ferences';
                    Image = Change;
                    RunObject = Page "Item Reference Entries";
                    RunPageLink = "Item No." = FIELD("No.");
                }
                action("Te&xtos adicionales")
                {
                    Caption = 'E&xtended Texts';
                    Image = Text;
                    RunObject = Page "Extended Text List";
                    RunPageLink = "Table Name" = CONST(Item),
                                  "No." = FIELD("No.");
                    RunPageView = SORTING("Table Name", "No.", "Language Code", "All Language Codes", "Starting Date", "Ending Date");
                }
                action("Ima&gen")
                {
                    Caption = '&Picture';
                    Image = Picture;
                    RunObject = Page "Item Picture";
                    RunPageLink = "No." = FIELD("No."),
                                  "Date Filter" = FIELD("Date Filter"),
                                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                  "Location Filter" = FIELD("Location Filter"),
                                  "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                                  "Variant Filter" = FIELD("Variant Filter");
                }
                action(Identificadores)
                {
                    Caption = 'Identifiers';
                    Image = BarCode;
                    RunObject = Page "Item Identifiers";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.", "Variant Code", "Unit of Measure Code");
                }
            }
            group("Assembly/Production")
            {
                Caption = 'Assembly/Production';
                Image = Production;
                action(Estructura)
                {
                    Caption = 'Structure';
                    Image = Hierarchy;

                    trigger OnAction()
                    var
                        BOMStructure: Page "BOM Structure";
                    begin
                        BOMStructure.InitItem(Rec);
                        BOMStructure.Run;
                    end;
                }
                action("Partes costes")
                {
                    Caption = 'Cost Shares';
                    Image = CostBudget;

                    trigger OnAction()
                    var
                        BOMCostShares: Page "BOM Cost Shares";
                    begin
                        BOMCostShares.InitItem(Rec);
                        BOMCostShares.Run;
                    end;
                }
                group("Ensam&blado")
                {
                    Caption = 'Assemb&ly';
                    Image = AssemblyBOM;
                    action("<Action32>")
                    {
                        Caption = 'Assembly BOM';
                        Image = BOM;
                        RunObject = Page "Assembly BOM";
                        RunPageLink = "Parent Item No." = FIELD("No.");
                    }
                    action("Puntos-de-uso")
                    {
                        Caption = 'Where-Used';
                        Image = Track;
                        RunObject = Page "Where-Used List";
                        RunPageLink = Type = CONST(Item),
                                      "No." = FIELD("No.");
                        RunPageView = SORTING(Type, "No.");
                    }
                    action("Calcular coste están&dar")
                    {
                        Caption = 'Calc. Stan&dard Cost';
                        Image = CalculateCost;

                        trigger OnAction()
                        begin
                            CalculateStdCost.CalcItem("No.", true);
                        end;
                    }
                    action("Calc. precio venta")
                    {
                        Caption = 'Calc. Unit Price';
                        Image = SuggestItemPrice;

                        trigger OnAction()
                        begin
                            CalculateStdCost.CalcAssemblyItemPrice("No.");
                        end;
                    }
                }
                group("Producción")
                {
                    Caption = 'Production';
                    Image = Production;
                    action("L.M. producción")
                    {
                        Caption = 'Production BOM';
                        Image = BOM;
                        RunObject = Page "Production BOM";
                        RunPageLink = "No." = FIELD("No.");
                    }
                    action(Action29)
                    {
                        Caption = 'Where-Used';
                        Image = "Where-Used";

                        trigger OnAction()
                        var
                            ProdBOMWhereUsed: Page "Prod. BOM Where-Used";
                        begin
                            ProdBOMWhereUsed.SetItem(Rec, WorkDate);
                            ProdBOMWhereUsed.RunModal;
                        end;
                    }
                    action(Action24)
                    {
                        Caption = 'Calc. Stan&dard Cost';
                        Image = CalculateCost;

                        trigger OnAction()
                        begin
                            CalculateStdCost.CalcItem("No.", false);
                        end;
                    }
                }
            }
            group(Historial)
            {
                Caption = 'History';
                Image = History;
                group("&Movimientos")
                {
                    Caption = 'E&ntries';
                    Image = Entries;
                    action(Action14)
                    {
                        Caption = 'Ledger E&ntries';
                        Image = ItemLedger;
                        Promoted = false;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page "Item Ledger Entries";
                        RunPageLink = "Item No." = FIELD("No.");
                        RunPageView = SORTING("Item No.");
                        ShortCutKey = 'Ctrl+F7';
                    }
                    action("Movs. &reserva")
                    {
                        Caption = '&Reservation Entries';
                        Image = ReservationLedger;
                        RunObject = Page "Reservation Entries";
                        RunPageLink = "Reservation Status" = CONST(Reservation),
                                      "Item No." = FIELD("No.");
                        RunPageView = SORTING("Item No.", "Variant Code", "Location Code", "Reservation Status");
                    }
                    action("Movs. inventario fí&sico")
                    {
                        Caption = '&Phys. Inventory Ledger Entries';
                        Image = PhysicalInventoryLedger;
                        RunObject = Page "Phys. Inventory Ledger Entries";
                        RunPageLink = "Item No." = FIELD("No.");
                        RunPageView = SORTING("Item No.");
                    }
                    action("Movs. &valor")
                    {
                        Caption = '&Value Entries';
                        Image = ValueLedger;
                        RunObject = Page "Value Entries";
                        RunPageLink = "Item No." = FIELD("No.");
                        RunPageView = SORTING("Item No.");
                    }
                    action("Movs. &almacén")
                    {
                        Caption = '&Warehouse Entries';
                        Image = BinLedger;
                        RunObject = Page "Warehouse Entries";
                        RunPageLink = "Item No." = FIELD("No.");
                        RunPageView = SORTING("Item No.", "Bin Code", "Location Code", "Variant Code", "Unit of Measure Code", "Lot No.", "Serial No.", "Entry Type", Dedicated);
                    }
                }
                group("Estadísticas")
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    action(Action16)
                    {
                        Caption = 'Statistics';
                        Image = Statistics;
                        Promoted = true;
                        PromotedCategory = Process;
                        ShortCutKey = 'F7';

                        trigger OnAction()
                        var
                            ItemStatistics: Page "Item Statistics";
                        begin
                            ItemStatistics.SetItem(Rec);
                            ItemStatistics.RunModal;
                        end;
                    }
                    action("Estadísticas documentos")
                    {
                        Caption = 'Entry Statistics';
                        Image = EntryStatistics;
                        RunObject = Page "Item Entry Statistics";
                        RunPageLink = "No." = FIELD("No."),
                                      "Date Filter" = FIELD("Date Filter"),
                                      "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                      "Location Filter" = FIELD("Location Filter"),
                                      "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                                      "Variant Filter" = FIELD("Variant Filter");
                    }
                    action("Aná&lisis")
                    {
                        Caption = 'T&urnover';
                        Image = Turnover;
                        RunObject = Page "Item Turnover";
                        RunPageLink = "No." = FIELD("No."),
                                      "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                      "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                      "Location Filter" = FIELD("Location Filter"),
                                      "Drop Shipment Filter" = FIELD("Drop Shipment Filter"),
                                      "Variant Filter" = FIELD("Variant Filter");
                    }
                }
                action("C&omentarios")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = CONST(Item),
                                  "No." = FIELD("No.");
                }
            }
            group("Ve&ntas")
            {
                Caption = 'S&ales';
                Image = Sales;
                action("Porcentajes &prepago")
                {
                    Caption = 'Prepa&yment Percentages';
                    Image = PrepaymentPercentages;
                    RunObject = Page "Sales Prepayment Percentages";
                    RunPageLink = "Item No." = FIELD("No.");
                }
                action(Pedidos)
                {
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = Page "Sales Orders";
                    RunPageLink = Type = CONST(Item),
                                  "No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", Type, "No.");
                }
                action(Devoluciones)
                {
                    Caption = 'Returns Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Sales Return Orders";
                    RunPageLink = Type = CONST(Item),
                                  "No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", Type, "No.");
                }
            }
            group("&Compras")
            {
                Caption = '&Purchases';
                Image = Purchasing;
                action("Provee&dores")
                {
                    Caption = 'Ven&dors';
                    Image = Vendor;
                    RunObject = Page "Item Vendor Catalog";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.");
                }
                action(Action125)
                {
                    Caption = 'Prepa&yment Percentages';
                    Image = PrepaymentPercentages;
                    RunObject = Page "Purchase Prepmt. Percentages";
                    RunPageLink = "Item No." = FIELD("No.");
                }
                action(Action40)
                {
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = Page "Purchase Orders";
                    RunPageLink = Type = CONST(Item),
                                  "No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", Type, "No.");
                }
                action(Action115)
                {
                    Caption = 'Return Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Purchase Return Orders";
                    RunPageLink = Type = CONST(Item),
                                  "No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", Type, "No.");
                }
            }
            group(Action58)
            {
                Caption = 'Warehouse';
                Image = Warehouse;
                action("Contenidos u&bicación")
                {
                    Caption = '&Bin Contents';
                    Image = BinContent;
                    RunObject = Page "Bin Contents";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.");
                }
                action("&Uds. de almacenam.")
                {
                    Caption = 'Stockkeepin&g Units';
                    Image = SKU;
                    RunObject = Page "Stockkeeping Unit List";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.");
                }
            }
            group(Servicio)
            {
                Caption = 'Service';
                Image = ServiceItem;
                action("Prods. &servicio")
                {
                    Caption = 'Ser&vice Items';
                    Image = ServiceItem;
                    RunObject = Page "Service Items";
                    RunPageLink = "Item No." = FIELD("No.");
                    RunPageView = SORTING("Item No.");
                }
                action("Solución de problemas")
                {
                    Caption = 'Troubleshooting';
                    Image = Troubleshoot;

                    trigger OnAction()
                    var
                        TroubleshootingHeader: Record "Troubleshooting Header";
                    begin
                        TroubleshootingHeader.ShowForItem(Rec);
                    end;
                }
                action("Config. detección errores")
                {
                    Caption = 'Troubleshooting Setup';
                    Image = Troubleshoot;
                    RunObject = Page "Troubleshooting Setup";
                    RunPageLink = Type = CONST(Item),
                                  "No." = FIELD("No.");
                }
            }
            group(Recursos)
            {
                Caption = 'Resources';
                Image = Resource;
                group("&Recurso")
                {
                    Caption = 'R&esource';
                    Image = Resource;
                    action("&Cualificaciones")
                    {
                        Caption = 'Resource &Skills';
                        Image = ResourceSkills;
                        RunObject = Page "Resource Skills";
                        RunPageLink = Type = CONST(Item),
                                      "No." = FIELD("No.");
                    }
                    action("&Recursos")
                    {
                        Caption = 'Skilled R&esources';
                        Image = ResourceSkills;

                        trigger OnAction()
                        var
                            ResourceSkill: Record "Resource Skill";
                        begin
                            Clear(SkilledResourceList);
                            SkilledResourceList.Initialize(ResourceSkill.Type::Item, "No.", Description);
                            SkilledResourceList.RunModal;
                        end;
                    }
                }
            }
        }
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
                action("Copiar producto")
                {
                    Caption = 'Copiar producto';
                    Image = Copy;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Copy Item";
                    RunPageLink = "Source Item No." = FIELD("No.");
                    RunPageOnRec = true;
                }
            }
            action("Hoja de demanda")
            {
                Caption = 'Requisition Worksheet';
                Image = Worksheet;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Req. Worksheet";
            }
            action("Diario productos")
            {
                Caption = 'Item Journal';
                Image = Journals;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Item Journal";
            }
            action("Diario reclasificación producto")
            {
                Caption = 'Item Reclassification Journal';
                Image = Journals;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Item Reclass. Journal";
            }
            action("Seguim. prod.")
            {
                Caption = 'Item Tracing';
                Image = ItemTracing;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Item Tracing";
            }
            action("Modificar precios/costes de productos")
            {
                Caption = 'Adjust Item Cost/Price';
                Image = AdjustItemCost;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Report "Adjust Item Costs/Prices";
            }
            action("Valorar stock - movs. producto")
            {
                Caption = 'Adjust Cost - Item Entries';
                Image = AdjustEntries;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "Adjust Cost - Item Entries";
            }
        }
        area(reporting)
        {
            action("Stock - Listado")
            {
                Caption = 'Inventory - List';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - List";
            }
            action("Registro prod. - cdad.")
            {
                Caption = 'Item Register - Quantity';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Register - Quantity";
            }
            action("Stock - Movimientos")
            {
                Caption = 'Inventory - Transaction Detail';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Transaction Detail";
            }
            action("Disponibilidad stock")
            {
                Caption = 'Inventory Availability';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory Availability";
            }
            action(Estado)
            {
                Caption = 'Status';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report Status;
            }
            action("Stock - Proyección existencias")
            {
                Caption = 'Inventory - Availability Plan';
                Image = ItemAvailability;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Availability Plan";
            }
            action("Stock - Desglose pedidos")
            {
                Caption = 'Inventory Order Details';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory Order Details";
            }
            action("Producto - Pedidos compra")
            {
                Caption = 'Inventory Purchase Orders';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory Purchase Orders";
            }
            action("Stock - Listado 10 mejores")
            {
                Caption = 'Inventory - Top 10 List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory - Top 10 List";
            }
            action("Stock - Estadísticas ventas")
            {
                Caption = 'Inventory - Sales Statistics';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Sales Statistics";
            }
            action("Ensamblar para pedido - Ventas")
            {
                Caption = 'Assemble to Order - Sales';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Assemble to Order - Sales";
            }
            action("Producto - Ventas clientes")
            {
                Caption = 'Inventory - Customer Sales';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Customer Sales";
            }
            action("Producto - Compras proveedores")
            {
                Caption = 'Inventory - Vendor Purchases';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Vendor Purchases";
            }
            action("Lista de precios y costes")
            {
                Caption = 'Inventory Cost and Price List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory Cost and Price List";
            }
            action("Producto - Reaprovisionamiento")
            {
                Caption = 'Inventory - Reorders';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory - Reorders";
            }
            action("Productos - Pedidos por servir")
            {
                Caption = 'Inventory - Sales Back Orders';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory - Sales Back Orders";
            }
            action("Producto - Lista proveedores")
            {
                Caption = 'Item/Vendor Catalog';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item/Vendor Catalog";
            }
            action("Stock - Evolución coste")
            {
                Caption = 'Inventory - Cost Variance';
                Image = ItemCosts;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory - Cost Variance";
            }
            action("Lista inventario físico")
            {
                Caption = 'Phys. Inventory List';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Phys. Inventory List";
            }
            action("Valoración inventario")
            {
                Caption = 'Inventory Valuation';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Inventory Valuation";
            }
            action("Sustituciones prod.")
            {
                Caption = 'Item Substitutions';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Substitutions";
            }
            action("Valorac. exist.-especif. coste")
            {
                Caption = 'Invt. Valuation - Cost Spec.';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Invt. Valuation - Cost Spec.";
            }
            action("Valoración inventario - WIP")
            {
                Caption = 'Inventory Valuation - WIP';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Inventory Valuation - WIP";
            }
            action("Registro movs. prods. - valor")
            {
                Caption = 'Item Register - Value';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Register - Value";
            }
            action("Cargos prod. - especificación")
            {
                Caption = 'Item Charges - Specification';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Charges - Specification";
            }
            action("Composición antig. prod.-cdad")
            {
                Caption = 'Item Age Composition - Qty.';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Age Composition - Qty.";
            }
            action("Composición antig. prod.-valor")
            {
                Caption = 'Item Age Composition - Value';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Age Composition - Value";
            }
            action("Caducidad producto - Cantidad")
            {
                Caption = 'Item Expiration - Quantity';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Item Expiration - Quantity";
            }
            action("Análisis partes costes")
            {
                Caption = 'Cost Shares Breakdown';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Cost Shares Breakdown";
            }
            action("Cálculo detallado")
            {
                Caption = 'Detailed Calculation';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Detailed Calculation";
            }
            action("Parte costes distrib.")
            {
                Caption = 'Rolled-up Cost Shares';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Rolled-up Cost Shares";
            }
            action("Parte costes a un nivel")
            {
                Caption = 'Single-Level Cost Shares';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Single-level Cost Shares";
            }
            action("Puntos de uso (nivel superior)")
            {
                Caption = 'Where Used (Top Level)';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Where-Used (Top Level)";
            }
            action("Despliegue cantidad en L.M.")
            {
                Caption = 'Quantity Explosion of BOM';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Quantity Explosion of BOM";
            }
            action("Lista comparación")
            {
                Caption = 'Compare List';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Compare List";
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        rstIS: Record "Inventory Setup";
        rstUS: Record "User Setup";
    begin
        Clear(rstIS);
        rstIS.Get();
        Clear(rstUS);
        rstUS.Get(UserId);
        fntCalculate;
        fntCalculateLCPDA
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
        strProveedor: Text;
        blnCalcularValores: Boolean;
        decUPV: Decimal;
        decImporteV: Decimal;
        decLCPDA: Decimal;

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

    [Scope('OnPrem')]
    procedure fntCalculate()
    var
        decIReal: Decimal;
        decIQ: Decimal;
        decIEsperado: Decimal;
        rstProv: Record Vendor;
        rstIS: Record "Inventory Setup";
        rstUS: Record "User Setup";
        rstGLE: Record "G/L Entry";
    begin
        CalcFields("FIFO Contabilidad");
        decUPC := 0;
        strProveedor := '';
        Clear(rstVE);
        rstVE.SetRange("Item No.", "No.");
        rstVE.SetRange("Item Ledger Entry Type", rstVE."Item Ledger Entry Type"::Purchase);
        rstVE.SetRange("Source Type", rstVE."Source Type"::Vendor);
        rstVE.SetRange("Document Type", rstVE."Document Type"::"Purchase Invoice");
        rstVE.SetRange("Entry Type", rstVE."Entry Type"::"Direct Cost");
        if Rec.GetFilter("Date Filter") <> '' then
            rstVE.SetFilter("Document Date", Rec.GetFilter("Date Filter"));
        if rstVE.FindLast then begin

            decUPC := rstVE."Cost per Unit";
            codFactura := rstVE."External Document No.";
            codFacInterna := rstVE."Document No.";
            datFechaFactura := rstVE."Document Date";
            Clear(rstProv);
            if rstProv.Get(rstVE."Source No.") then;
            strProveedor := rstProv.Name;

        end
        else begin

            Clear(rstVE);
            rstVE.SetRange("Item No.", "No.");
            rstVE.SetRange("Entry Type", rstVE."Entry Type"::"Direct Cost");
            if Rec.GetFilter("Date Filter") <> '' then
                rstVE.SetFilter("Document Date", Rec.GetFilter("Date Filter"));
            if rstVE.FindLast then begin

                decUPC := rstVE."Cost per Unit";
                codFactura := rstVE."External Document No.";
                codFacInterna := rstVE."Document No.";
                datFechaFactura := rstVE."Document Date";

            end;

        end;

        if "Pendiente FIFO" <> 0 then
            decFIFO := "FIFO Contabilidad" / "Pendiente FIFO"
        else
            decFIFO := 0;

        decUPV := 0;
        decImporteV := 0;

        Clear(rstVE);
        rstVE.SetRange("Item No.", "No.");
        rstVE.SetRange("Item Ledger Entry Type", rstVE."Item Ledger Entry Type"::Sale);
        rstVE.SetRange("Source Type", rstVE."Source Type"::Customer);
        rstVE.SetRange("Document Type", rstVE."Document Type"::"Sales Invoice");
        rstVE.SetRange("Entry Type", rstVE."Entry Type"::"Direct Cost");
        rstVE.SetFilter("Sales Amount (Actual)", '<>%1', 0);
        if Rec.GetFilter("Date Filter") <> '' then
            rstVE.SetFilter("Document Date", Rec.GetFilter("Date Filter"));
        if rstVE.FindLast then begin

            Clear(rstGLE);
            rstGLE.SetRange(rstGLE."Document No.", rstVE."Document No.");
            rstGLE.SetRange("Posting Date", rstVE."Posting Date");
            if rstGLE.FindFirst then begin

                decUPV := 0;
                decImporteV := 0;
                if (rstVE."Valued Quantity" <> 0) and (-rstGLE.Amount <> 0) and (rstGLE."Additional-Currency Amount" <> 0) then
                    decUPV := rstVE."Sales Amount (Actual)" / rstVE."Valued Quantity" / (-rstGLE.Amount / rstGLE."Additional-Currency Amount")
                else
                    decUPV := 0;
                decImporteV := Round(decUPV * Inventory, 1);

            end;

        end
        else begin

            Clear(rstVE);
            rstVE.SetRange("Item No.", "No.");
            rstVE.SetRange("Entry Type", rstVE."Entry Type"::"Direct Cost");
            if Rec.GetFilter("Date Filter") <> '' then
                rstVE.SetFilter("Document Date", Rec.GetFilter("Date Filter"));
            if rstVE.FindLast then begin

                decUPV := rstVE."Cost per Unit";
                //codFactura := rstVE."External Document No.";
                //codFacInterna := rstVE."Document No.";
                //datFechaFactura := rstVE."Document Date";

            end;

        end;
    end;

    [Scope('OnPrem')]
    procedure fntCalculateLCPDA()
    var
        decIReal: Decimal;
        decIQ: Decimal;
        decIEsperado: Decimal;
        rstProv: Record Vendor;
        rstIS: Record "Inventory Setup";
        rstUS: Record "User Setup";
        rstGLE: Record "G/L Entry";
    begin
        decLCPDA := 0;
        Clear(rstVE);
        rstVE.SetRange("Item No.", "No.");
        rstVE.SetRange("Item Ledger Entry Type", rstVE."Item Ledger Entry Type"::Purchase);
        rstVE.SetRange("Source Type", rstVE."Source Type"::Vendor);
        rstVE.SetRange("Document Type", rstVE."Document Type"::"Purchase Invoice");
        rstVE.SetRange("Entry Type", rstVE."Entry Type"::"Direct Cost");
        if Rec.GetFilter("Date Filter") <> '' then
            rstVE.SetFilter("Document Date", Rec.GetFilter("Date Filter"));
        if rstVE.FindLast then
            decLCPDA := rstVE."Cost per Unit (ACY)";
    end;
}

