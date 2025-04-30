page 50066 "Lista vinculación documentos"
{
    DelayedInsert = false;
    MultipleNewLines = false;
    PageType = List;
    ShowFilter = true;
    SourceTable = "Vinculación documentos";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Vincular)
            {
                Caption = 'Vincular';
                field("Tipo documento vinculado"; "Tipo documento vinculado")
                {
                }
                field("No. documento vinculado"; "No. documento vinculado")
                {

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Clear(rstCabCompra);
                        Clear(rstPagosProv);
                        Clear(rstRemitoCompra);

                        Clear(frmOC);
                        Clear(frmPagosProv);
                        Clear(frmRemitos);

                        case "Tipo documento vinculado" of

                            "Tipo documento vinculado"::"Orden de compra":
                                begin

                                    rstCabCompra.SetCurrentKey(rstCabCompra."Buy-from Vendor No.");
                                    rstCabCompra.SetRange("Buy-from Vendor No.", codCodigoVinculado);
                                    rstCabCompra.SetRange("Document Type", rstCabCompra."Document Type"::Order);
                                    if "No. documento vinculado" <> '' then
                                        rstCabCompra.SetRange("No.", "No. documento vinculado");

                                    frmOC.SetTableView(rstCabCompra);
                                    frmOC.LookupMode(true);
                                    if frmOC.RunModal = ACTION::LookupOK then begin

                                        frmOC.GetRecord(rstCabCompra);
                                        "No. documento vinculado" := rstCabCompra."No.";

                                    end;

                                end;

                            "Tipo documento vinculado"::"Parte de entrada":
                                begin

                                    rstRemitoCompra.SetCurrentKey("Buy-from Vendor No.");
                                    rstRemitoCompra.SetRange("Buy-from Vendor No.", codCodigoVinculado);
                                    if "No. documento vinculado" <> '' then
                                        rstRemitoCompra.SetRange("No.", "No. documento vinculado");
                                    frmRemitos.SetTableView(rstRemitoCompra);
                                    frmRemitos.LookupMode(true);
                                    if frmRemitos.RunModal = ACTION::LookupOK then begin

                                        frmRemitos.GetRecord(rstRemitoCompra);
                                        "No. documento vinculado" := rstRemitoCompra."No.";

                                    end;

                                end;

                            "Tipo documento vinculado"::"Recibo de compras":
                                begin

                                    rstPagosProv.SetCurrentKey(rstPagosProv."Vendor No.");
                                    rstPagosProv.SetRange(rstPagosProv."Vendor No.", codCodigoVinculado);
                                    rstPagosProv.SetFilter("Document Type", '%1|%2', rstPagosProv."Document Type"::Payment, rstPagosProv."Document Type"::" ");
                                    frmPagosProv.SetTableView(rstPagosProv);
                                    frmPagosProv.LookupMode(true);
                                    if frmPagosProv.RunModal = ACTION::LookupOK then begin

                                        frmPagosProv.GetRecord(rstPagosProv);
                                        "No. documento vinculado" := rstPagosProv."Document No.";

                                    end;

                                end;

                            "Tipo documento vinculado"::"Nota de Crédito":
                                begin

                                    rstCabCompra.SetCurrentKey(rstCabCompra."Buy-from Vendor No.");
                                    rstCabCompra.SetRange("Buy-from Vendor No.", codCodigoVinculado);
                                    rstCabCompra.SetRange("Document Type", rstCabCompra."Document Type"::"Credit Memo");
                                    if "No. documento vinculado" <> '' then
                                        rstCabCompra.SetRange("No.", "No. documento vinculado");

                                    frmOC.SetTableView(rstCabCompra);
                                    frmOC.LookupMode(true);
                                    if frmOC.RunModal = ACTION::LookupOK then begin

                                        frmOC.GetRecord(rstCabCompra);
                                        "No. documento vinculado" := rstCabCompra."No.";

                                    end;

                                end;

                        end;
                    end;

                    trigger OnValidate()
                    var
                        rstMens: Record Mensajeria;
                    begin

                        if "Tipo documento vinculado" = "Tipo documento vinculado"::"Parte de entrada" then begin

                            Clear(rstRemitoCompra);
                            rstRemitoCompra.SetCurrentKey(rstRemitoCompra."Buy-from Vendor No.");
                            rstRemitoCompra.SetRange("Buy-from Vendor No.", codCodigoVinculado);
                            rstRemitoCompra.SetRange("No.", "No. documento vinculado");
                            rstRemitoCompra.Find('-');
                            Hipervinculo := rstRemitoCompra."Archivo vinculado";

                            Clear(rstMens);
                            rstMens.SetRange("No. documento", "No. documento vinculado");
                            rstMens.SetFilter(Hipervinculo, '<>%1', '');
                            if rstMens.FindFirst then
                                Hipervinculo := rstMens.Hipervinculo;

                        end;
                    end;
                }
                field(strHiperVin; strHiperVin)
                {
                    Editable = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin

                        Clear(rstInfoempresa);
                        rstInfoempresa.Get();
                        HyperLink(rstInfoempresa."Ruta Intranet" + (ConvertStr(CopyStr(strHiperVin, StrLen(rstInfoempresa."Ruta de digitalizacion"), 250), '\', '/')));
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin

        strHiperVin := '';
        if "Tipo documento vinculado" = "Tipo documento vinculado"::"Parte de entrada" then begin

            Clear(rstHRCompra);
            rstHRCompra.SetRange("No.", "No. documento vinculado");
            if rstHRCompra.Find('-') then begin

                Clear(rstDigitalizados);
                rstDigitalizados.SetCurrentKey(rstDigitalizados."Nivel 8");
                rstDigitalizados.SetRange(rstDigitalizados."Nivel 8", rstHRCompra."Order No.");
                rstDigitalizados.SetRange("Nivel 6", rstHRCompra."Vendor Shipment No.");
                if rstDigitalizados.Find('-') then
                    strHiperVin := rstDigitalizados.Archivo;

            end
        end;
    end;

    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
    end;

    var
        rstCabCompra: Record "Purchase Header";
        rstPagosProv: Record "Vendor Ledger Entry";
        rstRemitoCompra: Record "Purch. Rcpt. Header";
        codCodigoVinculado: Code[30];
        strHiperVin: Text[250];
        rstHRCompra: Record "Purch. Rcpt. Header";
        rstDigitalizados: Record "Documentos digitalizados";
        rstInfoempresa: Record "Company Information";
        frmOC: Page "Purchase List";
        frmPagosProv: Page "Vendor Ledger Entries";
        frmRemitos: Page "Posted Purchase Receipts";

    [Scope('OnPrem')]
    procedure funCodigoVinculado(codCodigo: Code[30])
    begin
        codCodigoVinculado := '';
        codCodigoVinculado := codCodigo;
    end;
}

