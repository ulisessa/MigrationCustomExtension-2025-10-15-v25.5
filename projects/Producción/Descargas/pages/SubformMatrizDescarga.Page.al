page 50641 "Subform. Matriz Descarga"
{
    Editable = false;
    PageType = ListPart;
    RefreshOnActivate = true;
    SourceTable = Item;
    SourceTableView = SORTING(Actividad, "Tipo producto")
                      WHERE(Blocked = CONST(false),
                            "Tipo producto" = CONST(Pesca),
                            "Cantidad descarga" = FILTER(> 0));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                Editable = false;
                ShowCaption = false;
                field(Description; Description)
                {
                    Caption = 'Clasificación';
                }
                field("Base Unit of Measure"; "Base Unit of Measure")
                {
                    Caption = 'Unidad Medida';
                }
                field("Cantidad descarga"; "Cantidad descarga")
                {
                }
                field("Kilos netos descarga"; "Kilos netos descarga")
                {
                }
                field("Kilos brutos descarga"; "Kilos brutos descarga")
                {
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
        //CurrForm.Matriz.MatrixRec.SETCURRENTKEY(Actividad,"Tipo producto");
        //CurrForm.Matriz.MatrixRec.SETRANGE(Actividad,'LAN');
        //CurrForm.Matriz.MatrixRec.SETRANGE(Actividad,1);
        //CLEAR(Rec);
        /*SETRANGE(Tipo,Tipo::Productivo);
        SETFILTER(Estado,'%1|%2|%3',Estado::Terminado,Estado::Cerrado,Estado::Pedido);
        SETFILTER("Fecha llegada",'<>%1',0D);
        SETRANGE("Cód. Buque 3ro/Concepto Dique",'101');
         */

        Clear(rstConfEx);
        rstConfEx.Get();

        blnDescarga := true;
        blnDiario := false;

    end;

    var
        GestionFormPeriodo: Codeunit PeriodPageManagement;
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
        rstMovProd.SetRange("Nombre libro diario", rstConfEx."Diario Descarga");
        /*rstMovProd.SETRANGE(rstMovProd."Buque/Departamento","Buque/Departamento");
        rstMovProd.SETRANGE(rstMovProd."Marea/Mes/Ciudad","Marea/Mes/Ciudad");
        rstMovProd.SETRANGE(rstMovProd."No. producto",CurrForm.Matriz.MatrixRec."No.");
        IF rstMovProd.FIND('-') THEN
        REPEAT
        
          decCantidad += rstMovProd.Cantidad;
        
        UNTIL rstMovProd.NEXT = 0;
         */
        exit(decCantidad);

    end;

    [Scope('OnPrem')]
    procedure UnidadMedida(): Decimal
    begin
    end;
}

