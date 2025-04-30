page 50545 "Lista detalle recupero IVA"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Detalle Recupero IVA";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. mov."; "No. mov.")
                {
                }
                field("Tipo de comprobante"; "Tipo de comprobante")
                {
                }
                field("Fecha de comprobante"; "Fecha de comprobante")
                {
                }
                field("Punto de venta"; "Punto de venta")
                {
                }
                field("No computable"; "No computable")
                {
                }
                field("Número de comprobante"; "Número de comprobante")
                {
                }
                field("CUIT Emisor"; "CUIT Emisor")
                {
                }
                field("Denominación emisor"; "Denominación emisor")
                {
                }
                field("CUIT Vendedor"; "CUIT Vendedor")
                {
                }
                field("Denominación vendedor"; "Denominación vendedor")
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
                field(Descripcion; Descripcion)
                {
                }
                field("Descripción contable"; "Descripción contable")
                {
                }
                field(Cantidad; Cantidad)
                {
                }
                field("Cantidad recuperada"; "Cantidad recuperada")
                {
                }
                field("Tipo afectación"; "Tipo afectación")
                {
                }
                field("No. proyecto"; "No. proyecto")
                {
                }
                field("Lote origen"; "Lote origen")
                {
                }
                field("No. mov. relacionado"; "No. mov. relacionado")
                {
                }
                field("Importe Neto en $"; "Importe Neto en $")
                {
                }
                field("Importe IVA Facturado en $"; "Importe IVA Facturado en $")
                {
                }
                field("Importe IVA Computable"; "Importe IVA Computable")
                {
                }
                field("IVA para recupero"; "IVA para recupero")
                {
                }
                field("IVA recuperado"; "IVA recuperado")
                {
                }
                field("Monto IVA Retenido"; "Monto IVA Retenido")
                {
                }
                field("Período de Pago"; "Período de Pago")
                {
                }
                field("Período DDJJ"; "Período DDJJ")
                {
                }
                field("Código de Régimen"; "Código de Régimen")
                {
                }
                field("Número de Certificado"; "Número de Certificado")
                {
                }
                field("Motivo de no retención"; "Motivo de no retención")
                {
                }
                field("R.G. Certificado de exclusión"; "R.G. Certificado de exclusión")
                {
                }
                field("Medios de Pago"; "Medios de Pago")
                {
                }
                field("Tipo de Rubro 7"; "Tipo de Rubro 7")
                {
                }
                field("Ident. tipo de CF"; "Ident. tipo de CF")
                {
                }
                field("Fecha pago IVA"; "Fecha pago IVA")
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                }
                field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                {
                }
                field("Shortcut Dimension 4 Code"; "Shortcut Dimension 4 Code")
                {
                }
                field("Shortcut Dimension 5 Code"; "Shortcut Dimension 5 Code")
                {
                }
                field("Shortcut Dimension 6 Code"; "Shortcut Dimension 6 Code")
                {
                }
                field("Shortcut Dimension 7 Code"; "Shortcut Dimension 7 Code")
                {
                }
                field("Forma de reparto"; "Forma de reparto")
                {
                }
                field("Criterio de reparto"; "Criterio de reparto")
                {
                }
                field("No. documento interno"; "No. documento interno")
                {
                }
                field("Orden pago"; "Orden pago")
                {
                }
                field("Cod. ret. IVA"; "Cod. ret. IVA")
                {
                }
                field("Fecha ingreso stock"; "Fecha ingreso stock")
                {
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
                }
                field("No. registro recupero IVA"; "No. registro recupero IVA")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("&Navegar")
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
            action("&Computable/No Computable")
            {
                Caption = '&Navigate';
                Image = ApplyEntries;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    l_rst25: Record "Vendor Ledger Entry";
                    l_rstSeguridadUsuario: Record "Seguridad por usuario";
                    l_rstSeguridad: Record Seguridad;
                    l_rstDR: Record "Detalle Recupero IVA";
                    l_codDoc: Code[20];
                    l_intModif: Integer;
                    l_rst50545: Record "Recupero IVA Rubro 7";
                    l_rst50544: Record "Recupero IVA";
                begin
                    Clear(l_rstSeguridad);
                    Clear(l_rstSeguridad);
                    Clear(l_rst50545);
                    l_rst50545.SetRange("No. documento interno", "No. documento interno");
                    l_rst50545.SetRange("No. linea", "No. linea");
                    if l_rst50545.FindSet then begin
                        Clear(l_rst50544);
                        l_rst50544.Get(l_rst50545."No. registro recupero IVA");
                        if not Confirm('El documento ' + "No. documento interno" + ' ya ha sido utilizado en la solicitud de recupero de ' + Format(Date2DMY(l_rst50544."Initial Accounting Period", 2)) + '/' + Format(Date2DMY(l_rst50544."Initial Accounting Period", 3)) + ', desea continuar?', true) then
                            Error('Se ha detenido el proceso')
                    end;
                    l_intModif := 0;
                    if l_rstSeguridadUsuario.fntSeguridadPermiso(UserId, l_rstSeguridad.FieldNo("Alterar Recupero IVA")) then begin
                        Clear(l_rstDR);
                        CurrPage.SetSelectionFilter(l_rstDR);
                        l_rstDR.SetCurrentKey("No. documento interno");
                        if l_rstDR.FindSet then
                            repeat
                                if l_codDoc <> l_rstDR."No. documento interno" then begin
                                    l_codDoc := l_rstDR."No. documento interno";
                                    l_intModif += 1;
                                    Clear(l_rst25);
                                    l_rst25.SetFilter("Document Type", '%1|%2', l_rst25."Document Type"::Invoice, l_rst25."Document Type"::"Credit Memo");
                                    l_rst25.SetRange("Document No.", l_rstDR."No. documento interno");
                                    if l_rst25.FindSet then begin
                                        if l_rst25."No computable" = true then
                                            l_rst25."No computable" := false
                                        else
                                            l_rst25."No computable" := true;
                                        l_rst25.Modify;
                                    end;
                                end;
                            until l_rstDR.Next = 0;
                    end
                    else
                        Error('No tiene permiso para ejecutar esta acción.');

                    if l_intModif <> 0 then
                        Message('Se han modificado %1 documentos', Format(l_intModif));
                end;
            }
        }
    }

    var
        Navigate: Page Navigate;
}

