page 50612 "Stock pesca treeview"
{
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = ListPart;
    ShowFilter = false;
    SourceTable = "Item Ledger Entry";
    SourceTableTemporary = true;
    SourceTableView = SORTING("Global Dimension 1 Code", "Global dimension 3 Code", "Item No.", "Global Dimension 2 Code", "Location Code", "Lot No.", "Entry/Exit Point", "Posting Date", Open);

    layout
    {
        area(content)
        {
            field(codFiltroLegajo; codFiltroLegajo)
            {
                Caption = 'Filtro producto';
                TableRelation = Item."No." WHERE("Item Category Code" = CONST('PESCA'),
                                                  Blocked = CONST(false),
                                                  Inventory = FILTER(<> 0));

                trigger OnValidate()
                begin
                    DeleteAll;
                    fntFiltrarLegajo(codFiltroLegajo);
                    codFiltroLegajo := GetFilter("Item No.");
                end;
            }
            repeater(Control1000000000)
            {
                IndentationColumn = IntentColumn;
                ShowAsTree = true;
                ShowCaption = false;
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    QuickEntry = false;
                    Style = StrongAccent;
                    StyleExpr = blnEnfatizar;
                }
                field("Global dimension 3 Code"; "Global dimension 3 Code")
                {
                    QuickEntry = false;
                }
                field(Quantity; Quantity)
                {
                    BlankZero = true;
                    DrillDown = true;
                    Editable = false;
                    QuickEntry = false;
                }
                field("Net kilos"; "Net kilos")
                {
                    BlankZero = true;
                    DecimalPlaces = 0 : 0;
                    QuickEntry = false;

                    trigger OnValidate()
                    var
                        l_rstMarcajes: Record "Markup entry";
                        l_rstConcept: Record "Meta4 concept";
                    begin
                    end;
                }
                field("Cantidad reservada"; "Quantity in shipments")
                {
                    BlankZero = true;
                    Caption = 'Quantity in shipments';
                    DecimalPlaces = 0 : 0;
                    DrillDown = true;

                    trigger OnValidate()
                    begin
                        fntInsertarLineaReparto;
                    end;
                }
                field("Cantidad disponible"; decQ)
                {
                    BlankZero = true;
                    DecimalPlaces = 0 : 0;
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
                action("Lista de productos")
                {
                    Caption = '';

                    trigger OnAction()
                    var
                        l_rstItem: Record Item;
                        l_pgeItem: Page "Item List";
                        l_rstIS: Record "Inventory Setup";
                    begin
                        Clear(l_rstIS);
                        l_rstIS.Get();

                        Clear(l_rstItem);
                        l_rstItem.SetRange("Item Category Code", l_rstIS."Categoria productos pesca");
                        l_rstItem.SetRange("Global Dimension 2 Code", codActividad);
                        l_rstItem.SetRange(Exportación, true);
                        l_rstItem.CalcFields(Inventory);
                        l_rstItem.SetFilter(Inventory, '>0');

                        Clear(l_pgeItem);
                        l_pgeItem.SetTableView(l_rstItem);

                        l_pgeItem.RunModal;
                        if l_pgeItem.LookupMode = true then;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if "Global dimension 3 Code" = '' then begin

            blnEnfatizar := false;
            IntentColumn := 1;

        end
        else begin

            blnEnfatizar := true;
            IntentColumn := 2;

        end;

        decQ := Quantity - "Quantity in shipments";
    end;

    trigger OnInit()
    begin
        Commit;
    end;

    trigger OnOpenPage()
    begin
        strActivate := 'ID1000000012;MD' + Format(Time, 0, 1);
    end;

    var
        codLegajo: Code[20];
        strActivate: Text;
        blnEnfatizar: Boolean;
        IntentColumn: Integer;
        codFiltroLegajo: Text;
        codBuque: Code[10];
        codMarea: Code[10];
        decQ: Decimal;
        decKN: Decimal;
        rstILE: Record "Item Ledger Entry";
        i: Integer;
        codLote: Code[10];
        codFiltroDocumento: Code[20];
        rstLR: Record "Lín. reparto";
        codActividad: Code[20];

    [Scope('OnPrem')]
    procedure fntFiltrarLegajo(l_codLegajo: Code[20])
    begin
        codLegajo := l_codLegajo;
        if codLegajo <> '' then
            SetFilter("Item No.", codLegajo);
        fntCompletarTabla;
    end;

    local procedure fntCompletarTabla()
    var
        codBuque: Code[10];
        rstLR: Record "Lín. reparto";
    begin
        Clear(rstILE);
        DeleteAll;
        if codFiltroLegajo = '' then
            Error('Complete el filtro de producto');
        rstILE.SetFilter("Item No.", codFiltroLegajo);
        rstILE.SetRange(Open, true);
        rstILE.SetCurrentKey("Global Dimension 1 Code", "Global dimension 3 Code");
        if rstILE.FindSet then
            repeat

                // i += 1;
                if codLote <> rstILE."Global Dimension 1 Code" + rstILE."Global dimension 3 Code" then begin

                    if codBuque <> rstILE."Global Dimension 1 Code" then begin

                        i += 1000;
                        codBuque := rstILE."Global Dimension 1 Code";
                        codLote := rstILE."Global Dimension 1 Code" + rstILE."Global dimension 3 Code";

                        Init;
                        "Entry No." := i;
                        "Item No." := rstILE."Item No.";
                        "Global Dimension 1 Code" := rstILE."Global Dimension 1 Code";
                        Insert;

                        i += 1;

                        Init;
                        "Entry No." := i;
                        "Item No." := rstILE."Item No.";
                        "Global Dimension 1 Code" := rstILE."Global Dimension 1 Code";
                        "Global dimension 3 Code" := rstILE."Global dimension 3 Code";
                        Quantity += rstILE."Remaining Quantity";
                        "Net kilos" += rstILE."Remaining net kilos";
                        Insert;

                    end
                    else begin

                        codLote := rstILE."Global Dimension 1 Code" + rstILE."Global dimension 3 Code";
                        codBuque := rstILE."Global Dimension 1 Code";

                        i += 1;
                        Init;
                        "Entry No." := i;
                        "Item No." := rstILE."Item No.";
                        "Global Dimension 1 Code" := rstILE."Global Dimension 1 Code";
                        "Global dimension 3 Code" := rstILE."Global dimension 3 Code";
                        Quantity += rstILE."Remaining Quantity";
                        "Net kilos" += rstILE."Remaining net kilos";
                        Insert;

                    end;

                end
                else begin

                    Quantity += rstILE."Remaining Quantity";
                    "Net kilos" += rstILE."Remaining net kilos";
                    Modify;

                end;

            until rstILE.Next = 0;

        codBuque := '';
        codLote := '';
        i := 0;

        Clear(rstLR);
        rstLR.SetFilter("No. Producto", codFiltroLegajo);
        rstLR.SetRange("No. Documento", codFiltroDocumento);
        rstLR.SetFilter(Buque, '<>%1', '');
        rstLR.SetFilter(Marea, '<>%1', '');
        rstLR.SetCurrentKey(Buque, Marea);
        if rstLR.FindSet then
            repeat

                Clear(Rec);
                SetRange("Item No.", rstLR."No. Producto");
                SetRange("Global Dimension 1 Code", rstLR.Buque);
                SetRange("Global dimension 3 Code", rstLR.Marea);
                if FindFirst then begin

                    "Quantity in shipments" := rstLR."Reservar - UMB";
                    Modify;

                end
                else begin

                    Clear(Rec);
                    SetRange("Item No.", rstLR."No. Producto");
                    SetRange("Global Dimension 1 Code", rstLR.Buque);
                    if FindLast then begin

                        i := "Entry No." + 1;
                        codLote := rstLR.Buque + rstLR.Marea;
                        codBuque := rstLR.Buque;

                        Init;
                        "Entry No." := i;
                        "Item No." := rstLR."No. Producto";
                        "Global Dimension 1 Code" := rstLR.Buque;
                        "Global dimension 3 Code" := rstLR.Marea;
                        "Quantity in shipments" := rstLR."Reservar - UMB";
                        Insert;

                    end
                    else begin

                        codBuque := rstLR.Buque;
                        codLote := rstLR.Buque + rstLR.Marea;

                        Init;
                        "Entry No." := i + 1000;
                        "Item No." := rstLR."No. Producto";
                        "Global Dimension 1 Code" := rstLR.Buque;
                        Insert;

                        i += 1;

                        Init;
                        "Entry No." := i;
                        "Item No." := rstLR."No. Producto";
                        "Global Dimension 1 Code" := rstLR.Buque;
                        "Global dimension 3 Code" := rstLR.Marea;
                        "Quantity in shipments" := rstLR."Reservar - UMB";
                        Insert;

                    end;

                end;

            until rstLR.Next = 0;

        Clear(Rec)
    end;

    procedure fntFiltroDocumento(l_codFiltroDocumento: Code[20]; l_codActividad: Code[20])
    begin
        codFiltroDocumento := l_codFiltroDocumento;
        codActividad := l_codActividad;
    end;

    local procedure fntInsertarLineaReparto()
    var
        intLinea: Integer;
        rstItem: Record Item;
        cduProductionFishing: Codeunit GestionExistencias;
    begin
        if ("Global Dimension 1 Code" <> '')
          and
            ("Global dimension 3 Code" <> '')
          and
            (Quantity <> 0)
          and
            (codFiltroDocumento <> '')
        then begin

            Clear(rstLR);
            rstLR.SetRange("No. Documento", codFiltroDocumento);
            if rstLR.FindLast then
                intLinea := rstLR."No. línea" + 10000;

            Clear(rstLR);
            rstLR.SetRange(Buque, "Global Dimension 1 Code");
            rstLR.SetRange(Marea, "Global dimension 3 Code");
            rstLR.SetRange("No. Documento", codFiltroDocumento);
            rstLR.SetRange("No. Producto", "Item No.");
            if rstLR.FindFirst then begin

                rstLR.Validate("Reservar - UMB", "Quantity in shipments");
                rstLR.Validate("Reservar - KN", cduProductionFishing.FunCalcPesoNeto(rstLR."Reservar - UMB", "Item No.", 1));
                rstLR.Modify;
                "Quantity in shipments" := rstLR."Reservar - UMB";

            end
            else begin

                Clear(rstLR);
                rstLR."No. línea" := intLinea;
                rstLR.Buque := "Global Dimension 1 Code";
                rstLR.Marea := "Global dimension 3 Code";
                rstLR."No. Documento" := codFiltroDocumento;
                rstLR.Validate("No. Producto", "Item No.");
                rstLR.Validate(Proyecto, 'PP-' + "Global Dimension 1 Code" + '-' + "Global dimension 3 Code");
                rstLR.Validate("Reservar - UMB", "Quantity in shipments");
                rstLR.Validate("Reservar - KN", cduProductionFishing.FunCalcPesoNeto(rstLR."Reservar - UMB", "Item No.", 1));
                rstLR.Insert;
                "Quantity in shipments" := rstLR."Reservar - UMB";

            end;

        end;

        if rstLR."Reservar - UMB" = 0 then
            rstLR.Delete;
        decQ := Quantity - "Quantity in shipments";
    end;

    local procedure fntBorrarLineaReparto()
    var
        intLinea: Integer;
        rstItem: Record Item;
    begin
        if ("Global Dimension 1 Code" <> '')
          and
            ("Global dimension 3 Code" <> '')
          and
            (codFiltroDocumento <> '')
        then begin

            Clear(rstLR);
            rstLR.SetRange(Buque, "Global Dimension 1 Code");
            rstLR.SetRange(Marea, "Global dimension 3 Code");
            rstLR.SetRange("No. Documento", codFiltroDocumento);
            rstLR.SetRange("No. Producto", "Item No.");
            if rstLR.FindFirst then begin

                rstLR.CalcFields("Existencias - UMB");
                "Quantity in shipments" := 0;
                //Quantity := rstLR."Existencias - UMB";
                //"Net kilos" := cduProductionFishing.FunCalcPesoNeto(Quantity,"Item No.",1);


            end;

            rstLR.DeleteAll;

        end;
        decQ := Quantity - "Quantity in shipments";
    end;
}

