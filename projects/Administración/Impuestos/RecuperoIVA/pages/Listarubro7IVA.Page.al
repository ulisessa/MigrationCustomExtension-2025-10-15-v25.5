page 50546 "Lista rubro 7 IVA"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Recupero IVA Rubro 7";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Enabled = blnEditable;
                field("No. mov."; "No. mov.")
                {
                    Editable = false;
                }
                field("Tipo de comprobante"; "Tipo de comprobante")
                {
                    Editable = false;
                }
                field("Fecha de comprobante"; "Fecha de comprobante")
                {
                    Editable = false;
                }
                field("Punto de venta"; "Punto de venta")
                {
                    Editable = false;
                }
                field("Número de comprobante"; "Número de comprobante")
                {
                    Editable = false;
                }
                field("CUIT Emisor"; "CUIT Emisor")
                {
                    Editable = false;
                }
                field("Denominación emisor"; "Denominación emisor")
                {
                    Editable = false;
                }
                field("CUIT Vendedor"; "CUIT Vendedor")
                {
                    Editable = false;
                }
                field("Denominación vendedor"; "Denominación vendedor")
                {
                    Editable = false;
                }
                field(Tipo; Tipo)
                {
                    Editable = false;
                }
                field("No."; "No.")
                {
                    Editable = false;
                }
                field("Fecha mov. relacionado"; datFechaMovRelacionado)
                {
                }
                field("No. mov. relacionado"; "No. mov. relacionado")
                {
                    Editable = false;

                    trigger OnDrillDown()
                    var
                        l_pgeILE: Page "Item Ledger Entries";
                        l_rstILE: Record "Item Ledger Entry";
                    begin
                        case Tipo of
                            Tipo::Item:
                                begin
                                    Clear(l_rstILE);
                                    l_rstILE.SetRange("Entry No.", "No. mov. relacionado");
                                    Clear(l_pgeILE);
                                    l_pgeILE.SetTableView(l_rstILE);
                                    l_pgeILE.LookupMode(true);
                                    l_pgeILE.Run;
                                end;
                            Tipo::Resource:
                                begin
                                end;
                        end;
                    end;
                }
                field("Cantidad mov. relacionado"; "Cantidad mov. relacionado")
                {
                    Editable = false;
                }
                field("Cantidad mov. compra"; "Cantidad mov. compra")
                {
                    Editable = false;
                }
                field("Importe Neto en $"; "Importe Neto en $")
                {
                    Editable = false;
                }
                field("Importe IVA Facturado en $"; "Importe IVA Facturado en $")
                {
                    Editable = false;
                }
                field("Importe IVA Computable vinc. a"; "Importe IVA Computable vinc. a")
                {
                    Editable = false;
                }
                field("Importe IVA Computable"; "Importe IVA Computable")
                {
                    Editable = false;
                }
                field("Monto IVA Retenido"; "Monto IVA Retenido")
                {
                    Editable = false;
                }
                field("IVA para recupero"; "IVA para recupero")
                {
                    Editable = false;
                }
                field("IVA recuperado"; "IVA recuperado")
                {
                    Editable = blnEditable;

                    trigger OnValidate()
                    begin
                        fntVerificarImporte
                    end;
                }
                field("Coeficiente aplicado"; "Coeficiente aplicado")
                {
                    Editable = false;
                }
                field("Porcentaje aplicado"; "Porcentaje aplicado")
                {
                    Editable = false;
                }
                field("Período de Pago"; "Período de Pago")
                {
                    Editable = false;
                }
                field("Período DDJJ"; "Período DDJJ")
                {
                    Editable = false;
                }
                field("Descripción del Bien"; "Descripción del Bien")
                {
                    Editable = false;
                }
                field("Descripción contable"; "Descripción contable")
                {
                }
                field("IVA Depositado en CBU"; "IVA Depositado en CBU")
                {
                    Editable = false;
                }
                field("Código de Régimen"; "Código de Régimen")
                {
                    Editable = false;
                }
                field("Número de Certificado"; "Número de Certificado")
                {
                    Editable = false;
                }
                field("Motivo de no retención"; "Motivo de no retención")
                {
                    Editable = false;
                }
                field("R.G. Certificado de exclusión"; "R.G. Certificado de exclusión")
                {
                    Editable = false;
                }
                field("Medios de Pago"; "Medios de Pago")
                {
                    Editable = false;
                }
                field("Tipo de Rubro 7"; "Tipo de Rubro 7")
                {
                    Editable = false;
                }
                field("Tipo de afectacion"; "Tipo de afectacion")
                {
                    Editable = false;
                }
                field("No. documento interno"; "No. documento interno")
                {
                    Editable = false;
                }
                field("Orden pago"; "Orden pago")
                {
                    Editable = false;
                }
                field("Documento expo relacionado"; "Documento expo relacionado")
                {
                    Editable = false;
                }
                field("TOTAL Facturado en $"; "TOTAL Facturado en $")
                {
                }
                field("TOTAL IVA Facturado en $"; "TOTAL IVA Facturado en $")
                {
                }
                field("TOTAL neto Facturado en $"; "TOTAL neto Facturado en $")
                {
                }
                field("Posicion Arancelaria"; "Posicion Arancelaria")
                {
                    Editable = false;
                }
                field(Proyecto; Proyecto)
                {
                    Editable = false;
                }
                field("Lote origen"; "Lote origen")
                {
                }
                field("No. linea"; "No. linea")
                {
                    Editable = false;
                }
                field("No. registro recupero IVA"; "No. registro recupero IVA")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            group(Detalle)
            {
                action("Agregar línea")
                {
                    Image = AddAction;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        l_rstSeguridad: Record Seguridad;
                        l_rstSeguridadUsuario: Record "Seguridad por usuario";
                        l_rstDRI: Record "Detalle Recupero IVA";
                        l_rstRecupero: Record "Recupero IVA";
                        pge_DRI: Page "Lista detalle recupero IVA";
                        l_rstR7: Record "Recupero IVA Rubro 7";
                        i: Integer;
                    begin
                        Clear(l_rstSeguridad);
                        Clear(l_rstSeguridadUsuario);
                        if l_rstSeguridadUsuario.fntSeguridadPermiso(UserId, l_rstSeguridad.FieldNo("Alterar Recupero IVA")) then begin
                            Clear(l_rstRecupero);
                            l_rstRecupero.Get("No. registro recupero IVA");
                            Clear(l_rstDRI);
                            Clear(pge_DRI);
                            l_rstDRI.SetFilter("Fecha de comprobante", '<=%1', l_rstRecupero."Final Accounting Period");
                            pge_DRI.SetTableView(l_rstDRI);
                            pge_DRI.LookupMode(true);
                            if pge_DRI.RunModal = ACTION::LookupOK then begin
                                Clear(l_rstR7);
                                if l_rstR7.FindLast then
                                    i := l_rstR7."No. mov.";
                                pge_DRI.GetRecord(l_rstDRI);
                                with l_rstDRI do begin
                                    //Primero verifico que no exista ya
                                    Clear(l_rstR7);
                                    l_rstR7.SetRange("No. documento interno", l_rstDRI."No. documento interno");
                                    l_rstR7.SetRange("No. linea", l_rstDRI."No. linea");
                                    l_rstR7.SetRange("No. registro recupero IVA", l_rstRecupero."No.");
                                    l_rstR7.SetRange("No. mov. relacionado", l_rstDRI."No. mov. relacionado");
                                    if l_rstR7.FindFirst then
                                        Error('Ya existe este registro en el Rubro 7 del Recupero %1', l_rstDRI."No. registro recupero IVA");
                                    l_rst50546."No. mov." := i + 1;
                                    l_rst50546."Tipo de comprobante" := "Tipo de comprobante";
                                    l_rst50546."Fecha de comprobante" := "Fecha de comprobante";
                                    l_rst50546."Punto de venta" := "Punto de venta";
                                    l_rst50546."Número de comprobante" := "Número de comprobante";
                                    l_rst50546."CUIT Emisor" := "CUIT Emisor";
                                    l_rst50546."Denominación emisor" := "Denominación emisor";
                                    l_rst50546."CUIT Vendedor" := "CUIT Vendedor";
                                    l_rst50546."Denominación vendedor" := "Denominación vendedor";
                                    l_rst50546."Importe Neto en $" := "Importe Neto en $";
                                    l_rst50546."Importe IVA Facturado en $" := "Importe IVA Facturado en $";
                                    l_rst50546."Importe IVA Computable vinc. a" := "Importe IVA Computable vinc. a";
                                    l_rst50546."Importe IVA Computable" := "Importe IVA Computable";
                                    l_rst50546."Monto IVA Retenido" := "Monto IVA Retenido";
                                    l_rst50546."Período de Pago" := "Período de Pago";
                                    l_rst50546."Período DDJJ" := "Período DDJJ";
                                    l_rst50546."Descripción del Bien" := "Descripción del Bien";
                                    l_rst50546."IVA Depositado en CBU" := "IVA Depositado en CBU";
                                    l_rst50546."Código de Régimen" := "Código de Régimen";
                                    l_rst50546."Número de Certificado" := "Número de Certificado";
                                    l_rst50546."Motivo de no retención" := "Motivo de no retención";
                                    l_rst50546."R.G. Certificado de exclusión" := "R.G. Certificado de exclusión";
                                    l_rst50546."Medios de Pago" := "Medios de Pago";
                                    l_rst50546."Tipo de Rubro 7" := "Tipo de Rubro 7";
                                    l_rst50546."Tipo de afectacion" := "Tipo de afectacion";
                                    l_rst50546."IVA para recupero" := "IVA para recupero";
                                    l_rst50546."IVA recuperado" := "IVA recuperado";
                                    l_rst50546."Coeficiente aplicado" := "Coeficiente aplicado";
                                    l_rst50546."No. documento interno" := "No. documento interno";
                                    l_rst50546."Orden pago" := "Orden pago";
                                    l_rst50546."Documento expo relacionado" := "Documento expo relacionado";
                                    l_rst50546."Posicion Arancelaria" := "Posicion Arancelaria";
                                    l_rst50546.Proyecto := Proyecto;
                                    l_rst50546."No. linea" := "No. linea";
                                    l_rst50546.Tipo := Tipo;
                                    l_rst50546."No." := "No.";
                                    l_rst50546."No. mov. relacionado" := "No. mov. relacionado";
                                    l_rst50546."Cantidad mov. relacionado" := Cantidad;
                                    l_rst50546."Cantidad mov. compra" := Cantidad;
                                    l_rst50546."Porcentaje aplicado" := "Porcentaje aplicado";
                                    l_rst50546."Fecha mov. relacionado" := "Fecha mov. relacionado";
                                    l_rst50546."No. registro recupero IVA" := l_rstRecupero."No.";
                                    l_rst50546.Insert;
                                end;
                            end;
                        end
                        else
                            Error('No posee autorización para realizar modificaciones.');
                    end;
                }
                action("Modificar línea")
                {
                    Caption = '&Modificar línea';
                    Image = EditList;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        l_rstSeguridad: Record Seguridad;
                        l_rstSeguridadUsuario: Record "Seguridad por usuario";
                    begin
                        Clear(l_rstSeguridad);
                        Clear(l_rstSeguridadUsuario);
                        if l_rstSeguridadUsuario.fntSeguridadPermiso(UserId, l_rstSeguridad.FieldNo("Alterar Recupero IVA")) then begin

                            CurrPage.SetSelectionFilter(Rec);
                            CurrPage.Editable(true);
                            blnEditable := true;
                            intEditar := "No. mov.";

                        end
                        else
                            Error('No posee autorización para realizar modificaciones.');
                    end;
                }
                action("Eliminar líneas")
                {
                    Caption = 'Eli&minar línea';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        l_rstSeguridad: Record Seguridad;
                        l_rstSeguridadUsuario: Record "Seguridad por usuario";
                    begin
                        Clear(l_rstSeguridad);
                        Clear(l_rstSeguridadUsuario);
                        if l_rstSeguridadUsuario.fntSeguridadPermiso(UserId, l_rstSeguridad.FieldNo("Alterar Recupero IVA")) then begin

                            Clear(l_rst50546);
                            CurrPage.SetSelectionFilter(l_rst50546);
                            if l_rst50546.Count > 1 then begin
                                if not Confirm('¿Desea eliminar las ' + Format(l_rst50546.Count) + ' líneas seleccionadas?') then
                                    Error('Eliminación detenida.')
                                else begin
                                    l_rst50546.DeleteAll;
                                end;
                            end
                            else begin
                                if not Confirm('¿Desea eliminar la línea seleccionada?') then
                                    Error('Eliminación detenida.')
                                else begin
                                    l_rst50546.DeleteAll;
                                end;
                            end;

                        end
                        else
                            Error('No posee autorización para realizar modificaciones.');
                    end;
                }
            }
            group(Documento)
            {
                action(Navegar)
                {
                    Caption = '&Navigate';
                    Image = Navigate;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Navigate.SetDoc(0D, "No. documento interno");
                        Navigate.Run;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        l_rst203: Record "Res. Ledger Entry";
        l_rst32: Record "Item Ledger Entry";
        l_rst17: Record "G/L Entry";
        l_rst5601: Record "FA Ledger Entry";
    begin
        datFechaMovRelacionado := fntTraerFecha;
    end;

    var
        Navigate: Page Navigate;
        l_rst50546: Record "Recupero IVA Rubro 7";
        blnEditable: Boolean;
        intEditar: Integer;
        datFechaMovRelacionado: Date;

    local procedure fntVerificarImporte()
    var
        l_rst50544: Record "Recupero IVA";
    begin
        TestField("IVA recuperado");
        TestField("No. mov.", intEditar);
        if "IVA recuperado" > "Importe IVA Computable" then
            Error('El importe de IVA recuperado no puede superar el Importe de IVA computable');
        Clear(l_rst50544);
        l_rst50544.Get("No. registro recupero IVA");
        l_rst50544.CalcFields("IVA recuperado en esta DDJJ");

        if l_rst50544."Saldo IVA máximo a recuperar" - xRec."IVA recuperado" + "IVA recuperado" - l_rst50544."IVA recuperado en esta DDJJ" < 0 then
            Error('El importe de IVA recuperado en esta DDJJ no puede exceder el Saldo de IVA máximo a recuperar en esta DDJJ.');

        "Porcentaje aplicado" := "IVA recuperado" / "IVA para recupero";
    end;

    local procedure fntTraerFecha(): Date
    var
        l_rstILE: Record "Item Ledger Entry";
        l_rstRLE: Record "Res. Ledger Entry";
        l_rstFALE: Record "FA Ledger Entry";
    begin
        case Tipo of
            Tipo::Item, Tipo::"Charge (Item)":
                begin
                    Clear(l_rstILE);
                    if l_rstILE.Get("No. mov. relacionado") then
                        exit(l_rstILE."Posting Date");
                end;
            Tipo::Resource:
                begin
                    Clear(l_rstRLE);
                    if l_rstRLE.Get("No. mov. relacionado") then
                        exit(l_rstRLE."Posting Date");
                end;
            Tipo::"Fixed Asset":
                begin
                    Clear(l_rstFALE);
                    if l_rstFALE.Get("No. mov. relacionado") then
                        exit(l_rstFALE."Posting Date");
                end;
        end;
    end;
}

