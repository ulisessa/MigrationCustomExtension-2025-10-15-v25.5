page 50513 "Subform solicitud"
{
    // IBdos Argentina - USS - 090503 - Modificación Arbumasa
    //  a) Adición código para ejecutar el archivo adjunto a la línea de solicitud

    AutoSplitKey = true;
    DataCaptionFields = "Nombre libro Solicitud", "No. linea";
    DelayedInsert = true;
    Editable = true;
    PageType = ListPart;
    SourceTable = "Lín. solicitud";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No. linea"; "No. linea")
                {
                }
                field(Tipo; Tipo)
                {
                    Visible = true;
                }
                field("No."; "No.")
                {
                }
                field(Descripcion; Descripcion)
                {
                }
                field("Descripcion 2"; "Descripcion 2")
                {
                    Visible = false;
                }
                field("Global Dimension 1"; "Global Dimension 1")
                {
                    Visible = true;
                }
                field("Global Dimension 2"; "Global Dimension 2")
                {
                    Visible = true;
                }
                field("Global Dimension 3"; "Global Dimension 3")
                {
                }
                field("Concepto proyecto"; "Concepto proyecto")
                {
                }
                field("Cod. Deposito"; "Cod. Deposito")
                {
                    Visible = true;
                }
                field("Cod. unidad medida"; "Cod. unidad medida")
                {
                }
                field(Estado; Estado)
                {
                }
                field(Cantidad; Cantidad)
                {
                }
                field("Compra a Nombre proveedor"; "Compra a Nombre proveedor")
                {
                }
                field("Compra a No. proveedor"; "Compra a No. proveedor")
                {
                }
                field("Precio unitario neto"; "Precio unitario neto")
                {
                }
                field("Importe neto"; "Importe neto")
                {
                    Editable = false;
                }
                field("Importe neto en OC"; "Importe neto en OC")
                {
                }
                field("Importe neto en factura"; decFact)
                {

                    trigger OnDrillDown()
                    begin
                        Clear(Navigate);
                        Navigate.fntSolicitud("No. Documento", "No. linea");
                        Navigate.Run;
                    end;
                }
                field("Fecha pedido"; "Fecha pedido")
                {
                    Visible = false;
                }
                field("Fecha recepcion esperada"; "Fecha recepcion esperada")
                {
                }
                field("Id. solicitante"; "Id. solicitante")
                {
                    Visible = false;
                }
                field("Objeto adjunto"; "Objeto adjunto")
                {
                    AssistEdit = true;

                    trigger OnAssistEdit()
                    begin
                        //IBdos Argentina - USS - 090503 - Inicio Modificación Arbumasa
                        //Adición código para ejecutar el archivo adjunto a la línea de solicitud

                        HyperLink("Objeto adjunto");

                        //IBdos Argentina - USS - 090503 - Fin Modificación Arbumasa
                    end;
                }
                field("Global Dimension 4"; "Global Dimension 4")
                {
                }
                field("Global Dimension 5"; "Global Dimension 5")
                {
                }
                field("Global Dimension 6"; "Global Dimension 6")
                {
                }
                field("Global Dimension 7"; "Global Dimension 7")
                {
                }
                field("Cant. Recibida"; "Cant. Recibida")
                {
                }
                field("Cant. Facturada"; "Cant. Facturada")
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
                field("Ultimo precio compra ($)"; "Ultimo precio compra ($)")
                {
                    Caption = 'Ultimo precio factura ($)';
                }
                field("Ultima fecha compra ($)"; "Ultima fecha compra ($)")
                {
                }
                field(Registrado; Registrado)
                {
                }
                field(Revertido; Revertido)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Acciones")
            {
                Caption = '&Acciones';
                action("Deshacer solicitud")
                {
                    Caption = 'Deshacer solicitud';

                    trigger OnAction()
                    var
                        rstLVC: Record "Lín. solicitud";
                        cduRevertir: Codeunit GestionSolicitudes;
                    begin
                        rstLVC.Copy(Rec);
                        CurrPage.SetSelectionFilter(rstLVC);
                        Clear(cduRevertir);
                        cduRevertir.fntAnularSolicitud(rstLVC);
                    end;
                }
                action("Nueva línea")
                {
                    Caption = 'Nueva línea';

                    trigger OnAction()
                    var
                        l_rstRSB: Record "Req. Wksh. Template";
                        l_rstLS: Record "Lín. solicitud";
                        l_rstLC: Record Solicitud;
                        l_rstConfUsuario: Record "User Setup";
                        cduMensajeria: Codeunit "Mensajería";
                        rstMensajeria: Record Mensajeria;
                    begin
                        Clear(l_rstRSB);

                        l_rstRSB.Get(Rec."Nombre libro Solicitud");
                        l_rstRSB.TestField("Habilitar líneas nuevas", true);

                        Clear(l_rstLS);
                        l_rstLS.SetRange("Nombre libro Solicitud", "Nombre libro Solicitud");
                        //l_rstLS.SETRANGE("Tipo documento","Tipo documento");
                        l_rstLS.SetRange("No. Documento", "No. Documento");
                        if l_rstLS.FindLast then begin

                            Init;
                            "No. linea" += 10000;

                            Clear(l_rstLC);
                            l_rstLC.SetRange("Nombre Libro Solicitud", "Nombre libro Solicitud");
                            l_rstLC.SetRange("No. documento", "No. Documento");
                            l_rstLC.FindFirst;
                            "Tipo documento" := l_rstLC."Tipo documento";
                            Insert;

                            if l_rstConfUsuario.Get(UserId) then
                                cduMensajeria.RegistrarMensaje('Alta de Solicitud', '', l_rstLS."No. Documento", l_rstLS."Tipo documento", 'Abierto', WorkDate,
                                rstMensajeria."Tipo movimiento"::Seguimiento, l_rstConfUsuario.Grupo, '', '', '', '', '', '', '');

                        end;
                    end;
                }
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
        //++Arbu 2019

        Clear(rstLC);
        rstLC.SetCurrentKey(rstLC."Document Type", rstLC."No. Cab. Solicitud", rstLC."No. Linea Solicitud", "Outstanding Quantity", rstLC."Unit Cost (LCY)");
        rstLC.SetAscending("Outstanding Quantity", false);
        rstLC.SetRange("Document Type", rstLC."Document Type"::Quote);
        rstLC.SetRange("No. Cab. Solicitud", "No. Documento");
        rstLC.SetRange("No. Linea Solicitud", "No. linea");
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

        Clear(rstPIL);
        rstPIL.SetRange("No. Cab. Solicitud", "No. Documento");
        rstPIL.SetRange("No. Linea Solicitud", "No. linea");
        rstPIL.SetFilter("Unit Cost (LCY)", '<>%1', 0);
        rstPIL.CalcSums(Amount);
        decFact += rstPIL.Amount;

        Clear(rstPL);
        rstPL.SetRange("Document Type", rstPL."Document Type"::"Credit Memo");
        rstPL.SetRange("No. Cab. Solicitud", "No. Documento");
        rstPL.SetRange("No. Linea Solicitud", "No. linea");
        rstPL.SetFilter("Unit Cost (LCY)", '<>%1', 0);
        rstPL.CalcSums(Amount);
        decFact -= rstPL.Amount;

        Clear(rstPCML);
        rstPCML.SetRange("No. Cab. Solicitud", "No. Documento");
        rstPCML.SetRange("No. Linea Solicitud", "No. linea");
        rstPCML.SetFilter("Unit Cost (LCY)", '<>%1', 0);
        rstPCML.CalcSums(Amount);
        decFact -= rstPCML.Amount;

        //--Arbu 2019
    end;

    trigger OnOpenPage()
    begin
        Rec.SetRange(Revertido, false);

        if not fntOcultarAprobados then
            SetRange(Aprobado, false);
    end;

    var
        Nuro: Code[10];
        PunOf: Record Solicitud;

        DesmarcarVisible: Boolean;

        ConfirmarVisible: Boolean;
        strProvRec: Text;
        codOferta: Code[20];
        decPrecio: Decimal;
        decUPC: Decimal;
        blnVerRegistrado: Boolean;
        codSol: Code[20];
        codLibro: Code[20];
        decFact: Decimal;
        Navigate: Page Navigate;

    [Scope('OnPrem')]
    procedure Temp(Nro: Code[10])
    begin
        Nuro := Nro;
    end;

    local procedure fntVerificarEstado()
    begin
    end;

    local procedure fntOcultarAprobados(): Boolean
    var
        PunCabSol: Record Solicitud;
        l_rstEstado: Record Estados;
    begin
        PunCabSol.Reset;
        if PunCabSol.Get(codLibro, codSol) then begin

            PunCabSol.CalcFields(Estado);
            Clear(l_rstEstado);
            l_rstEstado.Get(PunCabSol.Estado);
            if l_rstEstado."No editable" then
                exit(true)
            else
                exit(false);

        end
        else
            exit(true);
    end;

    [Scope('OnPrem')]
    procedure fntCabecera(l_codSol: Code[20]; l_codLibro: Code[20])
    begin
        codLibro := l_codLibro;
        codSol := l_codSol;
    end;
}

