page 50008 "Datos pago empleado"
{
    Editable = true;
    PageType = Worksheet;
    SourceTable = "Employee payment data";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Id. dato pago"; "Id. dato pago")
                {
                }
                field("Fecha inicial"; "Fecha inicial")
                {
                }
                field("Fecha final"; "Fecha final")
                {
                }
                field(Banco; Banco)
                {
                }
                field(Agencia; Agencia)
                {
                }
                field("No. cuenta"; "No. cuenta")
                {
                }
                field("Cód. forma pago"; "Cód. forma pago")
                {
                }
                field("Cód. centro pago"; "Cód. centro pago")
                {
                }
                field(Name; Name)
                {
                }
                field("First Family Name"; "First Family Name")
                {
                }
                field("Second Family Name"; "Second Family Name")
                {
                }
                field("Id. legal"; "Id. legal")
                {
                }
                field("Tipo cuenta"; "Tipo cuenta")
                {
                }
                field("No. sucursal"; "No. sucursal")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Navegar")
            {
                Caption = '&Navegar';
                Promoted = true;
                PromotedCategory = Process;
            }
        }
    }

    var
        SaldoAcumulado: Decimal;
        clave: Text[250];
        filtros: Text[250];
        decSaldoDL: Decimal;
        rstMovCont: Record "G/L Entry";
}

