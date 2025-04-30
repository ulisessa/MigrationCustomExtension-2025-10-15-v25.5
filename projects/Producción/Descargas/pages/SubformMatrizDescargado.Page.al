page 50643 "Subform. Matriz Descargado"
{
    Editable = false;
    PageType = ListPart;
    RefreshOnActivate = true;
    SourceTable = Item;
    SourceTableView = SORTING(Actividad, "Tipo producto")
                      WHERE(Inventory = FILTER(> 0),
                            Blocked = CONST(false),
                            "Tipo producto" = CONST(Pesca));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                Editable = false;
                ShowCaption = false;
                field("No."; "No.")
                {
                }
                field(Description; Description)
                {
                    Caption = 'Producto';
                }
                field(Inventory; Inventory)
                {
                    Caption = 'Cantidad';
                }
                field("Existencias Kilos netos"; "Existencias Kilos netos")
                {
                    Caption = 'Kilos netos';
                    TableRelation = "Item Ledger Entry"."Net kilos" WHERE("Item No." = FIELD("No."),
                                                                           "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                           "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                           "Global dimension 3 Code" = FIELD("Global Dimension 3 filter"),
                                                                           "Nombre libro diario" = CONST('DESCARGA'));
                }
                field("Existencias Kilos brutos"; "Existencias Kilos brutos")
                {
                    Caption = 'Kilos brutos';
                    TableRelation = "Item Ledger Entry"."Gross kilos" WHERE("Item No." = FIELD("No."),
                                                                             "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"),
                                                                             "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"),
                                                                             "Global dimension 3 Code" = FIELD("Global Dimension 3 filter"),
                                                                             "Nombre libro diario" = CONST('DESCARGA'));
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
        SetFilter("Filtro Nombre Libro Diario", rstConfEx."Diario Descarga");

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

