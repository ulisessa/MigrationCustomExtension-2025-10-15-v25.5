page 50668 "Insertar línea reparto"
{
    PageType = Card;

    layout
    {
        area(content)
        {
            group("Ingrese nuevos datos")
            {
                Caption = 'Ingrese nuevos datos';
                field(l_codBuque; l_codBuque)
                {
                    Caption = 'Buque';
                }
                field(l_codMarea; l_codMarea)
                {
                    Caption = 'Marea';
                }
                field(l_codDeposito; l_codDeposito)
                {
                    Caption = 'Depósito';
                    TableRelation = Location;
                }
                field(l_codPuerto; l_codPuerto)
                {
                    Caption = 'Puerto';
                    TableRelation = "Entry/Exit Point";
                }
                field(l_codProducto; l_codProducto)
                {
                    Caption = 'No. Producto';
                    TableRelation = Item;
                }
                field(l_decCant; l_decCant)
                {
                    Caption = 'Cantidad';
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

    var
        l_codDocumento: Code[20];
        l_codProducto: Code[30];
        l_codBuque: Code[3];
        l_codMarea: Code[6];
        l_codDeposito: Code[20];
        l_codPuerto: Code[20];
        l_decCant: Decimal;
        l_decKN: Decimal;
        l_decKB: Decimal;

    [Scope('OnPrem')]
    procedure fntCrearLinea(var codDocumento: Code[20]; var codProducto: Code[30]; var codBuque: Code[3]; var codMarea: Code[6]; var codDeposito: Code[20]; var codPuerto: Code[20]; var decCant: Decimal; var decKN: Decimal; var decKB: Decimal)
    begin
        codProducto := l_codProducto;
        codBuque := l_codBuque;
        codMarea := l_codMarea;
        codPuerto := l_codPuerto;
        codDeposito := l_codDeposito;
        decCant := l_decCant;
        decKN := l_decKN;
        decKB := l_decKB;
    end;
}

