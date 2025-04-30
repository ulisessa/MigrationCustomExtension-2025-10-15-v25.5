page 50633 "Subform lín. remito"
{
    DelayedInsert = true;
    Editable = true;
    PageType = ListPart;
    RefreshOnActivate = true;
    SourceTable = "Lín. ajuste ventas";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("No. producto"; "No. producto")
                {
                    Editable = true;
                }
                field("Descripción"; Descripción)
                {
                    Editable = false;
                }
                field("Location code"; "Location code")
                {
                }
                field(Buque; Buque)
                {
                }
                field(Marea; Marea)
                {
                }
                field("Seguimiento para trazabilidad"; "Seguimiento para trazabilidad")
                {
                }
                field("DCL application date formula"; "DCL application date formula")
                {
                }
                field("Lote origen"; "Lote origen")
                {
                    AssistEdit = true;
                    Editable = true;
                }
                field("Cód. unidad medida"; "Cód. unidad medida")
                {
                    Editable = false;
                }
                field("Cantidad a reservar"; "Cantidad a reservar")
                {
                    Editable = false;
                }
                field("Kilos brutos a reservar"; "Kilos brutos a reservar")
                {
                    Editable = false;
                }
                field("Kilos netos a reservar"; "Kilos netos a reservar")
                {
                    Editable = false;
                }
                field("Cantidad en pedido"; "Cantidad en pedido")
                {
                }
                field("Kilos Netos en pedido"; "Kilos Netos en pedido")
                {
                }
                field("Kilos Brutos en pedido"; "Kilos Brutos en pedido")
                {
                }
                field("Cantidad en remito"; "Cantidad en remito")
                {

                    trigger OnDrillDown()
                    begin
                        fntAjustarPicking;
                    end;
                }
                field("Kilos Netos en remito"; "Kilos Netos en remito")
                {

                    trigger OnDrillDown()
                    begin
                        fntAjustarPicking;
                    end;
                }
                field("Kilos Brutos en remito"; "Kilos Brutos en remito")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Línea")
            {
                Caption = '&Line';
                Image = Line;
                action("<Action3>")
                {
                    CaptionML = ENU = 'Create Picking', ESP = 'Crear Picking';
                    Image = PickLines;

                    trigger OnAction()
                    begin
                        fntCrearPicking;
                    end;
                }
                action("Ajustar Picking")
                {
                    CaptionML = ENU = 'Adjust Picking', ESP = 'Ajustar Picking';
                    Image = PickWorksheet;

                    trigger OnAction()
                    begin
                        fntAjustarPicking;
                    end;
                }
                action(GetTicket)
                {
                    Caption = 'Completar con ticket balanza';
                    Image = GetEntries;

                    trigger OnAction()
                    var
                        l_rstLRV: Record "Lín. ajuste ventas";
                    begin
                        Clear(l_rstLRV);
                        CurrPage.SetSelectionFilter(l_rstLRV);
                        if l_rstLRV.FindSet then
                            fntGetTicket(l_rstLRV);
                    end;
                }
            }
        }
    }

    procedure fntVerificarCantidades()
    begin
        CalcFields("Cantidad en remito");
        if "Cantidad en remito" > "Cantidad a reservar" then
            Error('Está seleccionando una cantidad superior a la habilitada en el Reparto.');
    end;

    local procedure fntCrearPicking()
    var
        rstMovProd: Record "Item Ledger Entry";
        frmPickingPallet: Page "Picking por pallet";
    begin
        Clear(frmPickingPallet);
        Clear(rstMovProd);
        //rstMovProd.SETCURRENTKEY("Global Dimension 1 Code","Global dimension 3 Code","Item No.","Location Code",
        //"Lot No.","Entry/Exit Point","Posting Date","Lote origen",Open);
        rstMovProd.SetCurrentKey("Lot No.");
        //rstMovProd.SETRANGE(rstMovProd."Lot No.","Lote origen");
        if Buque <> '' then
            rstMovProd.SetRange("Global Dimension 1 Code", Buque);
        if Marea <> '' then
            rstMovProd.SetRange("Global dimension 3 Code", Marea);
        rstMovProd.SetRange("Item No.", "No. producto");
        rstMovProd.SetRange(Open, true);
        if "Location code" <> '' then
            rstMovProd.SetRange("Location Code", "Location code");
        frmPickingPallet.fntRemito("No. documento", Buque, Marea, "Lote origen", "No. producto", "No. reparto", "Linea reparto", "Location code", "Seguimiento para trazabilidad", "DCL application date formula");
        frmPickingPallet.SetTableView(rstMovProd);
        frmPickingPallet.Run;

        CalcFields("Kilos Netos en remito", "Cantidad en remito", "Kilos Brutos en remito");

        CurrPage.Update();
    end;

    local procedure fntAjustarPicking()
    var
        rstMovProd: Record "Item Ledger Entry";
        frmPickingPallet: Page "Picking por pallet";
    begin
        Clear(frmPickingPallet);
        Clear(rstMovProd);
        //rstMovProd.SETCURRENTKEY("Global Dimension 1 Code","Global dimension 3 Code","Item No.","Location Code",
        //"Lot No.","Entry/Exit Point","Posting Date","Lote origen",Open);
        rstMovProd.SetCurrentKey("Lot No.");
        //rstMovProd.SETRANGE(rstMovProd."Lot No.","Lote origen");
        if Buque <> '' then
            rstMovProd.SetRange("Global Dimension 1 Code", Buque);
        if Marea <> '' then
            rstMovProd.SetRange("Global dimension 3 Code", Marea);
        rstMovProd.SetRange("Item No.", "No. producto");
        //rstMovProd.SETRANGE(Open,TRUE);
        if "Location code" <> '' then
            rstMovProd.SetRange("Location Code", "Location code");
        //frmPickingPallet.fntShowMarkedOnly;
        frmPickingPallet.fntRemito("No. documento", Buque, Marea, "Lote origen", "No. producto", "No. reparto", "Linea reparto", "Location code", "Seguimiento para trazabilidad", "DCL application date formula");
        frmPickingPallet.SetTableView(rstMovProd);
        frmPickingPallet.Run;

        CalcFields("Kilos Netos en remito", "Cantidad en remito", "Kilos Brutos en remito");

        CurrPage.Update();
    end;

    local procedure fntGetTicket(p_rstLRV: Record "Lín. ajuste ventas")
    var
        l_rstMovRemito: Record "Mov. remitos";
        l_rstWR: Record "Weighing Records";
        l_rstIJL: Record "Item Journal Line";
        l_rstILE: Record "Item Ledger Entry";
    begin
        Clear(l_rstMovRemito);
        l_rstMovRemito.SetRange("No. documento", "No. documento");
        if l_rstMovRemito.Count <> 0 then
            if not Confirm('Este proceso complementará la selección existente con los marcajes para este producto. ¿Desea continuar?') then
                exit;

        Clear(l_rstWR);
        l_rstWR.SetRange(l_rstWR."Shipment No.", p_rstLRV."No. documento");
        l_rstWR.SetRange("Item no.", p_rstLRV."No. producto");
        if p_rstLRV."Location code" <> '' then
            l_rstWR.SetRange("Location code", p_rstLRV."Location code");
        if p_rstLRV."Lote origen" <> '' then
            l_rstWR.SetRange("Lote origen", p_rstLRV."Lote origen");
        l_rstWR.SetFilter("Pallet no.", '<>%1', '');
        l_rstWR.SetFilter("Item ledger entry no.", '<>%1', 0);

        if l_rstWR.FindSet then
            repeat
                Clear(l_rstMovRemito);
                l_rstMovRemito.SetRange("No. documento", p_rstLRV."No. documento");
                l_rstMovRemito.SetRange("No. producto", p_rstLRV."No. producto");
                l_rstMovRemito.SetRange("Cód. depósito", l_rstWR."Location code");
                l_rstMovRemito.SetRange("Lote origen", l_rstWR."Lote origen");
                l_rstMovRemito.SetRange("No. pallet", l_rstWR."Pallet no.");
                if not l_rstMovRemito.FindFirst then begin
                    Clear(l_rstMovRemito);
                    l_rstMovRemito."No. documento" := p_rstLRV."No. documento";
                    l_rstMovRemito."No. línea" := l_rstWR."Item ledger entry no.";//intLinea;
                    l_rstMovRemito."No. producto" := l_rstWR."Item no.";
                    l_rstMovRemito.Lote := l_rstWR."Lot no.";
                    l_rstMovRemito.Cantidad := l_rstWR."Qty. per Bulk";
                    l_rstMovRemito."Kilos brutos" := l_rstWR.Gross;
                    l_rstMovRemito."Kilos netos" := l_rstIJL.FunCalcPesoNeto(l_rstWR."Qty. per Bulk", l_rstWR."Item no.", 1);
                    l_rstMovRemito."Lote origen" := l_rstWR."Lote origen";
                    l_rstMovRemito."Cód. depósito" := l_rstWR."Location code";
                    l_rstMovRemito."No. pallet" := l_rstWR."Pallet no.";
                    l_rstMovRemito."No. reparto" := p_rstLRV."No. reparto";
                    l_rstMovRemito."Linea reparto" := p_rstLRV."Linea reparto";
                    l_rstMovRemito."Seguimiento para trazabilidad" := p_rstLRV."Seguimiento para trazabilidad";
                    l_rstMovRemito."DCL application date formula" := p_rstLRV."DCL application date formula";
                    Clear(l_rstILE);
                    l_rstILE.SetRange("Item No.", p_rstLRV."No. producto");
                    l_rstILE.SetRange("Location Code", l_rstWR."Location code");
                    l_rstILE.SetRange("Lote origen", l_rstWR."Lote origen");
                    l_rstILE.SetRange("Lot No.", l_rstWR."Lot no.");
                    l_rstILE.SetRange("Pallet no.", l_rstWR."Pallet no.");
                    l_rstILE.SetRange(Open, true);
                    if l_rstILE.FindFirst then begin
                        l_rstMovRemito.Buque := l_rstILE."Global Dimension 1 Code";
                        l_rstMovRemito.Marea := l_rstILE."Global dimension 3 Code";
                        l_rstMovRemito."Puerto/Aeropuerto" := l_rstILE."Entry/Exit Point";
                        l_rstMovRemito."Cód. caja" := l_rstILE."Bin code";
                        l_rstMovRemito."Kilos netos" := l_rstILE."Remaining net kilos";
                    end;
                    l_rstMovRemito.Insert;
                end
                else begin
                    l_rstMovRemito.Cantidad := l_rstWR."Qty. per Bulk";
                    l_rstMovRemito."Kilos brutos" := l_rstWR.Gross;
                    Clear(l_rstIJL);
                    l_rstMovRemito."Kilos netos" := l_rstIJL.FunCalcPesoNeto(l_rstWR."Qty. per Bulk", l_rstWR."Item no.", 1);
                    l_rstMovRemito.Modify;
                end;
            until l_rstWR.Next = 0;

        Message('Ha finalizado el proceso');
    end;
}

