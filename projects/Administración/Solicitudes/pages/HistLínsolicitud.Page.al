page 50525 "Hist. Lín. solicitud"
{
    // IBdos Argentina - USS - 191202 - Modificación Arbumasa
    //  a) Adición de menú a ficha

    Editable = false;
    PageType = List;
    SaveValues = true;
    SourceTable = "Lín. solicitud";
    SourceTableView = SORTING("Nombre libro Solicitud", "No. Documento", "No. linea")
                      ORDER(Ascending);
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No. Documento"; "No. Documento")
                {
                }
                field("No. linea"; "No. linea")
                {
                }
                field(Tipo; Tipo)
                {
                }
                field("No."; "No.")
                {
                }
                field(Proveedor; Proveedor)
                {
                }
                field(Descripcion; Descripcion)
                {
                }
                field("Fecha recepcion esperada"; "Fecha recepcion esperada")
                {
                }
                field("Fecha registro"; "Fecha registro")
                {
                }
                field(Registrado; Registrado)
                {
                }
                field("Cod. unidad medida"; "Cod. unidad medida")
                {
                }
                field(Cantidad; Cantidad)
                {
                }
                field("Cantidad pendiente recibir"; "Cantidad pendiente recibir")
                {
                }
                field("Cantidad pendiente facturar"; "Cantidad pendiente facturar")
                {
                }
                field("Precio unitario neto"; "Precio unitario neto")
                {
                }
                field("Importe neto"; "Importe neto")
                {
                }
                field("Importe neto en OC"; "Importe neto en OC")
                {
                }
                field("Pendientes todas solicitudes"; "Pendientes todas solicitudes")
                {
                }
                field("Cantidad en pedido"; "Cantidad en pedido")
                {
                }
                field(Estado; Estado)
                {
                }
                field("Cod. Deposito"; "Cod. Deposito")
                {
                }
                field("Global Dimension 1"; "Global Dimension 1")
                {
                }
                field("Global Dimension 2"; "Global Dimension 2")
                {
                }
                field("Fecha pedido"; "Fecha pedido")
                {
                }
                field(codOferta; codOferta)
                {
                    Caption = 'Oferta recomendada';
                }
                field(strProvRec; strProvRec)
                {
                    Caption = 'Proveedor recomendado';
                }
                field(decPrecio; decPrecio)
                {
                    Caption = 'Precio recomendado ($)';

                    trigger OnDrillDown()
                    var
                        rstLC: Record "Purchase Line";
                        pgLC: Page "Purchase Lines";
                    begin
                        Clear(rstLC);
                        rstLC.SetCurrentKey(rstLC."Document Type", rstLC."No. Cab. Solicitud", rstLC."No. Linea Solicitud", "Outstanding Quantity", rstLC."Unit Cost (LCY)");
                        rstLC.SetRange("Document Type", rstLC."Document Type"::Quote);
                        rstLC.SetRange("No. Cab. Solicitud", "No. Documento");
                        rstLC.SetRange("No. Linea Solicitud", "No. linea");
                        //rstLC.SETFILTER("Unit Cost (LCY)",'<>%1',0);
                        rstLC.SetAscending("Outstanding Quantity", false);
                        if rstLC.FindFirst then begin

                            Clear(pgLC);
                            pgLC.SetTableView(rstLC);
                            pgLC.Editable(true);
                            pgLC.HacerEditable := true;
                            pgLC.RunModal;

                        end;
                    end;
                }
                field("No. documento compras"; "No. documento compras")
                {
                }
                field("No. linea documento compras"; "No. linea documento compras")
                {
                }
                field("Compra a No. proveedor"; "Compra a No. proveedor")
                {
                }
                field("Compra a Nombre proveedor"; "Compra a Nombre proveedor")
                {
                }
                field("Factura a No. proveedor"; "Factura a No. proveedor")
                {
                }
                field("Factura a Nombre proveedor"; "Factura a Nombre proveedor")
                {
                }
                field("Ultima Cotizacion"; "Ultima Cotizacion")
                {
                }
                field("Ultimo Pedido"; "Ultimo Pedido")
                {
                }
                field("Ultima Factura"; "Ultima Factura")
                {
                }
                field("Pedidos involucrados"; "Pedidos involucrados")
                {
                }
                field("Remitos involucrados"; "Remitos involucrados")
                {
                }
                field("Cant. Recibida"; "Cant. Recibida")
                {
                }
                field("Cant. Facturada"; "Cant. Facturada")
                {
                }
                field(Remitos; Remitos)
                {
                }
                field(Facturas; Facturas)
                {
                }
                field("Global Dimension 3"; "Global Dimension 3")
                {
                }
                field("Usuario Aprobacion"; "Usuario Aprobacion")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Ver)
            {
                Caption = 'Ver';
                action("&Abrir Solicitud")
                {
                    Caption = '&Abrir Solicitud';
                    Image = Card;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F5';

                    trigger OnAction()
                    begin
                        //IBdos Argentina - USS - 191202 - Inicio Modificación Arbumasa
                        //Adición de menú a ficha

                        PunOf.Reset;
                        PunOf.SetRange(PunOf."No. documento", "No. Documento");
                        if PunOf.Find('-') then
                            PAGE.Run(50512, PunOf);

                        //IBdos Argentina - USS - 191202 - Fin Modificación Arbumasa
                    end;
                }
            }
        }
        area(processing)
        {
            action(Desmarcar)
            {
                Caption = '&DesMarcar';
                Promoted = true;
                PromotedCategory = Process;
                Visible = DesmarcarVisible;

                trigger OnAction()
                begin
                    Mark := true;
                    CurrPage.SetSelectionFilter(Rec);
                    ModifyAll("No. documento compras", '');
                    ModifyAll("No. linea documento compras", 0);
                    Mark := false;
                end;
            }
            action(Confirmar)
            {
                Caption = '&Confirmar';
                Promoted = true;
                PromotedCategory = Process;
                Visible = ConfirmarVisible;

                trigger OnAction()
                begin
                    Mark := true;
                    CurrPage.SetSelectionFilter(Rec);
                    ModifyAll("No. documento compras", Nuro);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        l_cdu50001: Codeunit "Single Instance CU";
        PunHLin: Record "Lín. solicitud";
        rstLC: Record "Purchase Line";
        rstProv: Record Vendor;
        rstItem: Record Item;
        rstPIL: Record "Purch. Inv. Line";
        rstPCML: Record "Purch. Cr. Memo Line";
        rstPL: Record "Purchase Line";
    begin
        Clear(rstLC);
        rstLC.SetCurrentKey("Document Type", rstLC."No. Cab. Solicitud", rstLC."No. Linea Solicitud", "Outstanding Quantity", rstLC."Unit Cost (LCY)");
        rstLC.SetAscending("Outstanding Quantity", false);
        rstLC.SetRange("Document Type", rstLC."Document Type"::Quote);
        rstLC.SetRange("No. Cab. Solicitud", "No. Documento");
        rstLC.SetRange("No. Linea Solicitud", "No. linea");
        rstLC.SetFilter("Buy-from Vendor No.", '<>%1', '');
        rstLC.SetFilter("Unit Cost (LCY)", '<>%1', 0);
        if rstLC.FindFirst then begin

            Clear(rstProv);
            rstProv.Get(rstLC."Buy-from Vendor No.");
            strProvRec := rstProv.Name;
            codOferta := rstLC."Document No.";
            decPrecio := rstLC."Unit Cost (LCY)";

        end
        else begin

            strProvRec := '';
            codOferta := '';
            decPrecio := 0;

        end;

        decFact := 0;
        Clear(rstPL);
        rstPL.SetRange("Document Type", rstPL."Document Type"::Invoice);
        rstPL.SetRange("No. Cab. Solicitud", "No. Documento");
        rstPL.SetRange("No. Linea Solicitud", "No. linea");
        rstPL.SetFilter("Unit Cost (LCY)", '<>%1', 0);
        rstPL.CalcSums(Amount);
        decFact += rstPL.Amount;

        Clear(rstPL);
        rstPL.SetRange("Document Type", rstPL."Document Type"::"Credit Memo");
        rstPL.SetRange("No. Cab. Solicitud", "No. Documento");
        rstPL.SetRange("No. Linea Solicitud", "No. linea");
        rstPL.SetFilter("Unit Cost (LCY)", '<>%1', 0);
        rstPL.CalcSums(Amount);
        decFact -= rstPL.Amount;

        Clear(rstPIL);
        rstPIL.SetRange("No. Cab. Solicitud", "No. Documento");
        rstPIL.SetRange("No. Linea Solicitud", "No. linea");
        rstPIL.SetFilter("Unit Cost (LCY)", '<>%1', 0);
        rstPIL.CalcSums(Amount);
        decFact += rstPIL.Amount;

        Clear(rstPCML);
        rstPCML.SetRange("No. Cab. Solicitud", "No. Documento");
        rstPCML.SetRange("No. Linea Solicitud", "No. linea");
        rstPCML.SetFilter("Unit Cost (LCY)", '<>%1', 0);
        rstPCML.CalcSums(Amount);
        decFact -= rstPCML.Amount;
    end;

    trigger OnInit()
    begin
        ConfirmarVisible := true;
        DesmarcarVisible := true;
    end;

    trigger OnOpenPage()
    begin
        if CurrPage.LookupMode = false then begin

            DesmarcarVisible := false;
            ConfirmarVisible := false;

        end;
    end;

    var
        Nuro: Code[10];
        PunOf: Record Solicitud;

        DesmarcarVisible: Boolean;

        ConfirmarVisible: Boolean;
        strProvRec: Text;
        codOferta: Code[20];
        decPrecio: Decimal;
        decFact: Decimal;

    [Scope('OnPrem')]
    procedure Temp(Nro: Code[10])
    begin
        Nuro := Nro;
    end;
}

