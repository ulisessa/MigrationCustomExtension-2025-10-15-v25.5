page 50674 "Form Liquidación Pagos Hist."
{
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    Permissions = TableData "Cab. Liquidacion Pagos" = rimd,
                  TableData "Lín. Liquidacion Pagos" = rimd;
    SourceTable = "Hist. cab. liquidacion pagos";
    ApplicationArea = All;
    UsageCategory = Administration;    

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No. Liquidacion"; "No. Liquidacion")
                {
                }
                field(Estado; Estado)
                {
                    Editable = false;
                }
                field("Nombre Libro Diario"; "Nombre Libro Diario")
                {
                    Caption = 'Libro Diario Pagos';
                }
                field("Nombre Sección Diario"; "Nombre Sección Diario")
                {
                    Caption = 'Sección Diario Pagos';
                }
                field(Importe; Importe)
                {

                    trigger OnDrillDown()
                    var
                        rstMovLiq: Record "Lín. Liquidacion Pagos";
                        frmMovLiq: Page "Movs. liquidación pagos";
                    begin
                        Clear(rstMovLiq);
                        Clear(frmMovLiq);

                        rstMovLiq.SetRange("No. Liquidacion", "No. Liquidacion");
                        frmMovLiq.SetTableView(rstMovLiq);
                        frmMovLiq.RunModal;
                    end;
                }
                field(Usuario; Usuario)
                {
                    Editable = false;
                }
                field("Pago mediante"; "Pago mediante")
                {
                }
                field("Cód. medio de pago"; "Cód. medio de pago")
                {
                }
                field("Fecha pago"; "Fecha pago")
                {
                }
                field("Primer No. cheque"; "Primer No. cheque")
                {
                }
            }
            part(SubFormMatrix; "Movs. liquidación pagos")
            {
                SubPageLink = "No. Liquidacion" = FIELD("No. Liquidacion");
                SubPageView = SORTING("No. Liquidacion", "No. proveedor");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Acciones)
            {
                Caption = 'Acci&ones';
                action("&Cambiar estado")
                {
                    Caption = '&Cambiar estado';

                    trigger OnAction()
                    begin
                        Clear(rstSeguridad);
                        Clear(rstSeguridadUsuario);
                        Clear(frmCambiarEstado);
                        Clear(rstSeguridadCambioEstado);

                        rstSeguridadCambioEstado.SetRange(rstSeguridadCambioEstado.Usuario, UserId);
                        rstSeguridadCambioEstado.SetRange("Tipo documento", Text001);
                        rstSeguridadCambioEstado.SetRange("Estado original", Estado);
                        if rstSeguridadCambioEstado.Find('-') then;

                        Clear(rstMensajeria);
                        rstMensajeria.SetRange(rstMensajeria."No. documento", "No. Liquidacion");
                        if rstMensajeria.Find('-') then begin

                            //rstMensajeria.MARKEDONLY(TRUE);
                            PAGE.RunModal(PAGE::"Cambiar estado documento", rstMensajeria);

                        end;
                    end;
                }
            }
        }
        area(processing)
        {
            action("&Imprimir")
            {
                Caption = '&Imprimir';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Clear(rptLiq);
                    Clear(rstCabLiq);
                    rstCabLiq.SetRange("No. Liquidacion", "No. Liquidacion");
                    rptLiq.SetTableView(rstCabLiq);
                    rptLiq.RunModal;
                end;
            }
        }
    }

    var
        datFecha: Date;
        rstSeccion: Record "Gen. Journal Batch";
        rptLiq: Report "H.Liquidación pago proveedores";
        rstCabLiq: Record "Hist. cab. liquidacion pagos";
        cduRegistrarLiq: Codeunit "Liquidación proveedores";
        rstSeguridad: Record Seguridad;
        rstConfUsu: Record "User Setup";
        rstMovProv: Record "Vendor Ledger Entry";
        Text001: Label 'Liquidación Pagos';
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstSeguridadCambioEstado: Record "Seguridad cambio estados";
        rstMensajeria: Record Mensajeria;
        frmSeccion: Page "General Journal Batches";
        frmCambiarEstado: Page "Cambiar estado documento";
}

