page 50601 "Lín. reparto"
{
    PageType = ListPart;
    SourceTable = "Lín. reparto";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No. Producto"; "No. Producto")
                {
                }
                field(Descripcion; Descripcion)
                {
                }
                field("Unidad medida logística"; "Cod. unidad medida")
                {
                    Caption = 'Unidad medida logística';
                }
                field("Cod. deposito"; "Cod. deposito")
                {
                }
                field(Proyecto; Proyecto)
                {

                    trigger OnValidate()
                    begin
                        if Proyecto <> '' then
                            CurrPage.Update;
                    end;
                }
                field(Buque; Buque)
                {
                }
                field(Marea; Marea)
                {
                }
                field("Lote origen"; "Lote origen")
                {
                }
                field("Seguimiento para trazabilidad"; "Seguimiento para trazabilidad")
                {
                }
                field("DCL application date formula"; "DCL application date formula")
                {
                }
                field("Inventario en UM"; "Existencias - UMB")
                {
                    Editable = false;
                }
                field("Inventario en KN"; "Existencias - KN")
                {
                    Editable = false;
                }
                field("Comprometido - UMB"; "Comprometido - UMB")
                {
                    Editable = false;
                }
                field("Reservar - UMB"; "Reservar - UMB")
                {

                    trigger OnValidate()
                    var
                        rstProducto: Record Item;
                    begin
                        Clear(rstProducto);
                        rstProducto.Get("No. Producto");
                        if rstProducto."Utiliza Tarifario" then begin

                            Validate("Reservar - KB", "Reservar - UMB" * rstProducto."Gross Weight");
                            Validate("Reservar - KN", "Reservar - UMB" * rstProducto."Net Weight");
                            Modify;

                        end;
                    end;
                }
                field("Reservar - KN"; "Reservar - KN")
                {
                }
                field("Reservar - KB"; "Reservar - KB")
                {
                }
                field("Precio USD x KN"; "Precio USD x KN")
                {
                }
                field("Importe USD x KN"; "Importe USD x KN")
                {
                }
                field("Envío realizado - UMB"; "Envío realizado - UMB")
                {
                    Visible = blnregistrado;
                }
                field("Envío realizado - KN"; "Envío realizado - KN")
                {
                    Visible = blnregistrado;
                }
                field("Envío realizado - KB"; "Envío realizado - KB")
                {
                    Visible = blnregistrado;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Te&xtos adicionales")
            {
                Caption = 'E&xtended Texts';
                Image = Text;
                RunObject = Page "Extended Text List";
                RunPageLink = "Table Name" = CONST (Item),
                              "No." = FIELD ("No. Producto");
                RunPageView = SORTING ("Table Name", "No.", "Language Code", "All Language Codes", "Starting Date", "Ending Date");
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        blnregistrado := not Registrado;
    end;

    var
        blnregistrado: Boolean;
}

