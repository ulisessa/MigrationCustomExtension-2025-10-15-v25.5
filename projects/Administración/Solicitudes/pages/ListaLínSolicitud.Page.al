page 50528 "Lista Lín. Solicitud"
{
    Editable = false;
    PageType = List;
    SourceTable = "Lín. solicitud";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Nombre libro Solicitud"; Rec."Nombre libro Solicitud")
                {
                }
                field("No. linea"; Rec."No. linea")
                {
                }
                field(Tipo; Rec.Tipo)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Descripcion; Rec.Descripcion)
                {
                }
                field("Descripcion 2"; Rec."Descripcion 2")
                {
                }
                field(Cantidad; Rec.Cantidad)
                {
                }
                field("Fecha recepcion esperada"; Rec."Fecha recepcion esperada")
                {
                }
                field("Id. solicitante"; Rec."Id. solicitante")
                {
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                }
                field("Cod. Deposito"; Rec."Cod. Deposito")
                {
                }
                field("Fecha pedido"; Rec."Fecha pedido")
                {
                }
                field("No. documento compras"; Rec."No. documento compras")
                {
                }
                field("No. linea documento compras"; Rec."No. linea documento compras")
                {
                }
                field("Cdad. por unidad medida"; Rec."Cdad. por unidad medida")
                {
                }
                field("Cod. unidad medida"; Rec."Cod. unidad medida")
                {
                }
                field("Global Dimension 3"; Rec."Global Dimension 3")
                {
                }
                field("Global Dimension 4"; Rec."Global Dimension 4")
                {
                }
                field("Global Dimension 5"; Rec."Global Dimension 5")
                {
                }
                field("Global Dimension 6"; Rec."Global Dimension 6")
                {
                }
                field("Global Dimension 7"; Rec."Global Dimension 7")
                {
                }
                field("No. Documento"; Rec."No. Documento")
                {
                }
            }
        }
    }

    actions
    {
    }
}

