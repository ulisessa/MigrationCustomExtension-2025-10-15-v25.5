page 50644 "Subform. Matriz Abordo"
{
    Editable = false;
    PageType = CardPart;
    RefreshOnActivate = true;
    ShowFilter = true;
    SourceTable = Item;
    SourceTableView = WHERE(Blocked = CONST(false),
                            "Tipo producto" = CONST(Pesca),
                            "Cantidad captura abordo" = FILTER(> 0));

    layout
    {
        area(content)
        {
            repeater(Total)
            {
                Caption = 'Total';
                Editable = false;
                field(Description; Description)
                {
                    Caption = 'Clasificación';
                }
                field("Cantidad captura abordo"; "Cantidad captura abordo")
                {
                    Caption = 'Captura';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Clear(rstDepto);
        //rstDepto.GET("Buque/Departamento");
    end;

    trigger OnOpenPage()
    begin
        Clear(rstConfEx);
        rstConfEx.Get();

        blnDescarga := true;
        blnDiario := false;
    end;

    var
        TipoPeriodo: Option "Día",Semana,Mes,Trimestre,"Año","Periodo contable";
        TipImporte: Option "Saldo periodo","Acumulado hasta fecha";
        FactorRedondeo: Option No,"1","1000","1000000";
        decCantidad: Decimal;
        rstDepto: Record "Country/Region Translation";
        blnDescarga: Boolean;
        blnDiario: Boolean;
        rstProyecto: Record Job;
        rstLinDiario: Record "On board capture lines";
        rstMovProd: Record "Item Ledger Entry";
        rstConfEx: Record "Inventory Setup";

    [Scope('OnPrem')]
    procedure F(): Decimal
    begin
        if blnDescarga then
            exit(FCantidadDescarga);
    end;

    [Scope('OnPrem')]
    procedure FCantidadDescarga(): Decimal
    var
        decCantidad: Decimal;
        rstProyecto: Record Job;
        rstMovProd: Record "Item Ledger Entry";
        rstConfEx: Record "Inventory Setup";
    begin
        Clear(rstMovProd);
        Clear(rstProyecto);
        Clear(rstConfEx);
        rstConfEx.Get();
        decCantidad := 0;
        rstMovProd.SetCurrentKey(rstMovProd."Nombre libro diario",
        rstMovProd."Global Dimension 1 Code", rstMovProd."Global dimension 3 Code", rstMovProd."Item No.");
        exit(decCantidad);
    end;

    [Scope('OnPrem')]
    procedure UnidadMedida(): Decimal
    begin
    end;
}

