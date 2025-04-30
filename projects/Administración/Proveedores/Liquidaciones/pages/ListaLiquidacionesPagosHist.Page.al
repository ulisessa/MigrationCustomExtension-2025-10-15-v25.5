page 50675 "Lista Liquidaciones Pagos Hist"
{
    CardPageID = "Form Liquidación Pagos Hist.";
    Editable = false;
    PageType = List;
    SourceTable = "Hist. cab. liquidacion pagos";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("No. Liquidacion"; "No. Liquidacion")
                {
                }
                field("Fecha creación"; "Fecha creación")
                {
                }
                field(Usuario; Usuario)
                {
                }
                field(Estado; Estado)
                {
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
                field(Registrado; Registrado)
                {
                }
                field("Nombre Libro Diario"; "Nombre Libro Diario")
                {
                }
                field("Nombre Sección Diario"; "Nombre Sección Diario")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
    end;
}

