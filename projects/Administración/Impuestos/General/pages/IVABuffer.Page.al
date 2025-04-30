page 50015 "IVA Buffer"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Mov. IVA Buffer";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Fecha documento"; "Fecha documento")
                {
                }
                field("Tipo comprobante"; "Tipo comprobante")
                {
                }
                field("Número comprobante"; "Número comprobante")
                {
                }
                field("Nombre proveedor"; "Nombre proveedor")
                {
                }
                field(CUIT; CUIT)
                {
                }
                field("Importe total operación"; "Importe total operación")
                {
                }
                field(Gravado; Gravado)
                {
                }
                field("Exentos y no gravados"; "Exentos y no gravados")
                {
                }
                field("Importaciones/Exportaciones"; "Importaciones/Exportaciones")
                {
                }
                field("Crédito fiscal 2,5%"; "Crédito fiscal 2,5%")
                {
                }
                field("Crédito fiscal 21%"; "Crédito fiscal 21%")
                {
                }
                field("Crédito fiscal 27%"; "Crédito fiscal 27%")
                {
                }
                field("Crédito fiscal 10,5%"; "Crédito fiscal 10,5%")
                {
                }
                field("No computable 10,5"; "No computable 10,5")
                {
                }
                field("No computable 21"; "No computable 21")
                {
                }
                field(Otros; Otros)
                {
                }
                field(Cerrado; Cerrado)
                {
                }
                field("Mes DDJJ"; "Mes DDJJ")
                {
                }
                field("No. despacho"; "No. despacho")
                {
                }
                field(Computable; Computable)
                {
                }
                field("Saldo a favor IVA"; "Saldo a favor IVA")
                {
                }
                field("Per IIBB"; "Per IIBB")
                {
                }
                field("Tasa GasOil"; "Tasa GasOil")
                {
                }
                field("Documento original"; "Documento original")
                {
                }
                field(Divisa; Divisa)
                {
                }
                field("Tipo cambio"; "Tipo cambio")
                {
                }
                field("IVA Pagado"; "IVA Pagado")
                {
                }
                field("Fecha contable"; "Fecha contable")
                {
                }
                field("Fecha pago"; "Fecha pago")
                {
                }
                field("Importe retención"; "Importe retención")
                {
                }
                field("Motivo no retención"; "Motivo no retención")
                {
                }
                field(Actividad; Actividad)
                {
                }
                field("Importe pendiente Pesos"; "Importe pendiente Pesos")
                {
                }
                field("IVA Recuperado"; "IVA Recuperado")
                {
                }
                field("Código documento"; "Código documento")
                {
                }
                field("Tipo retención"; "Tipo retención")
                {
                }
                field("CAE/CAI"; "CAE/CAI")
                {
                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
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
                    Navigate;
                end;
            }
        }
    }
}

