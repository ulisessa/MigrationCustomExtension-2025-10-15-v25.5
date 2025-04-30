page 50553 "Subform Planta"
{
    // IBdos Argentina - USS - 111102 - Modificación Arbumasa
    //  a) Validación de Lote y Pallet
    // 
    // IBdos Argentina - USS - 080103 - Inicio Modificación Arbumasa
    //  a) Agrego la comprobación de lote y pallet para los campos de destino
    // 
    // IBdos Argentina - USS - 160103 - Inicio Modificación Arbumasa
    //  a) Si el diario es de descarga, validar el ingreso de kilos brutos
    // 
    // IBdos Argentina - USS - 210203 - Inicio Modificación Arbumasa
    //  a) Si el diario es de descarga, validar el ingreso precio de costo

    AutoSplitKey = true;
    Caption = 'ProdLines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SaveValues = false;
    SourceTable = "Lin. produccion planta";
    SourceTableView = SORTING("Nombre libro diario", "Nombre seccion diario", "No. documento");

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Nombre libro diario"; "Nombre libro diario")
                {
                    Visible = false;
                }
                field("Nombre seccion diario"; "Nombre seccion diario")
                {
                    Visible = false;
                }
                field("No. documento"; "No. documento")
                {
                    Visible = false;
                }
                field(Tipo; Tipo)
                {
                }
                field(Clasificacion; Clasificacion)
                {
                }
                field(Descripcion; Descripcion)
                {
                }
                field("No. Pallet"; "No. Pallet")
                {
                    Style = StrongAccent;
                    StyleExpr = StrongAccent;
                }
                field("Cod. deposito"; "Cod. deposito")
                {
                }
                field("Bin code"; "Bin code")
                {
                }
                field("Unidad medida"; "Unidad medida")
                {
                }
                field(Cantidad; Cantidad)
                {
                }
                field("Kilos netos"; "Kilos netos")
                {
                }
                field("Kilos brutos"; "Kilos brutos")
                {
                }
                field("No. proyecto"; "No. proyecto")
                {
                    Editable = false;
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
                field("No. lote"; "No. lote")
                {
                    Editable = false;
                }
                field("Ultimo pallet"; "Ultimo pallet")
                {
                }
                field("Cantidad en pallet"; "Cantidad en pallet")
                {
                }
                field(Familia; Familia)
                {
                }
                field(Subfamilia; Subfamilia)
                {
                }
                field(Actividad; Actividad)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Producto")
            {
                Caption = '&Producto';
                action(Ficha)
                {
                    Caption = 'Ficha';
                    ShortCutKey = 'Shift+F5';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #50045. Unsupported part was commented. Please check it.
                        /*CurrPage.SubForm.FORM.*/
                        MostrarFicha;

                    end;
                }
                action(Movimientos)
                {
                    Caption = 'Movimientos';
                    ShortCutKey = 'Ctrl+F5';

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #50045. Unsupported part was commented. Please check it.
                        /*CurrPage.SubForm.FORM.*/
                        MostrarMovs;

                    end;
                }
            }
            action("Imprimir etiquetas seleccionadas")
            {
                Image = Print;

                trigger OnAction()
                var
                    cduFish: Codeunit Descargas;
                    rst27: Record Item;
                    rstIS: Record "Inventory Setup";
                    rstSP: Record "Subfamilia producto";
                    rstIJL: Record "Lin. produccion planta";
                    rstPP: Record "Produccion Planta";
                begin
                    Clear(rst27);
                    Clear(cduFish);
                    Clear(rstIS);
                    Clear(rstSP);
                    Clear(rstIJL);

                    CurrPage.SetSelectionFilter(rstIJL);

                    Clear(rstPP);
                    rstPP.SetRange("No. documento", "No. documento");
                    if rstPP.FindFirst then;

                    if rstIJL.FindSet then
                        repeat

                            TestField("No. Pallet");

                            if Tipo <> Tipo::Entrada then
                                Error('El movimiento debe ser de entrada de mercadería.');
                            if Cantidad = 0 then
                                Error('El pallet debe tener cantidad');

                            rst27.Get(rstIJL.Clasificacion);
                            rstIS.Get;
                            rstSP.Get(rst27.Familia, rst27.Subfamilia);

                            if (rst27."Lleva No. Pallet") and (rst27."Item Category Code" = rstIS."Categoria productos pesca") then begin

                                cduFish.fntPrintLabel(rstIJL."No. Pallet", rstIJL.Marea, rstIJL.Buque, rstPP."Fecha produccion", rst27."No.", rstIJL.Cantidad, rstSP."Descripción mínima", false);

                            end;

                        until rstIJL.Next = 0;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        rstGLS: Record "General Ledger Setup";
        rstDV: Record "Dimension Value";
    begin
        Clear(rstGLS);
        rstGLS.Get;

        Clear(rstDV);
        if Actividad <> '' then
            rstDV.Get(rstGLS."Global Dimension 2 Code", Actividad);
        /*
    IF "Cantidad en pallet" <> 0 THEN
    BEGIN

      IF rstDV."Cantidad en pallet" < "Cantidad en pallet" THEN
      BEGIN

        CurrForm."Cantidad en pallet".UPDATEFORECOLOR(255);
        CurrForm."Cantidad en pallet".UPDATEFONTBOLD(TRUE);
        CurrForm."Cantidad en pallet".UPDATESELECTED(TRUE);

      END;

      IF rstDV."Cantidad por pallet" = "Cantidad en pallet" THEN
      BEGIN

        CurrForm."Cantidad en pallet".UPDATEFORECOLOR(8388736);
        CurrForm."Cantidad en pallet".UPDATEFONTBOLD(TRUE);
        CurrForm."Cantidad en pallet".UPDATESELECTED(FALSE);

      END;


    END;
         */

    end;

    trigger OnModifyRecord(): Boolean
    var
        rstProyecto: Record Job;
        rstDepartamento: Record "Country/Region Translation";
    begin
    end;

    var
        GestionDiarioProd: Codeunit ItemJnlManagement;
        ImprInfor: Codeunit "Test Report-Print";
        NomSecDiarActual: Code[10];
        DescriProd: Text[50];
        PunProd: Record Item;
        PunConf: Record "Inventory Setup";
        PunCabProd: Record "Produccion Planta";
        rstProyectoOrigen: Record Job;
        rstProyectoDestino: Record Job;
        rstDepartamento: Record "Country/Region Translation";
        ReserveItemJnlLine: Codeunit "Item Jnl. Line-Reserve";
        StrongAccent: Boolean;

    [Scope('OnPrem')]
    procedure OnUpdate()
    begin
    end;

    local procedure N186PalletOnFormat()
    begin
    end;

    [Scope('OnPrem')]
    procedure MostrarFicha()
    var
        Producto: Record Item;
    begin
        if Descripcion = '' then
            exit;
        Producto."No." := Clasificacion;
        PAGE.RunModal(PAGE::"Item Card", Producto);
    end;

    [Scope('OnPrem')]
    procedure MostrarMovs()
    var
        MovsProd: Record "Item Ledger Entry";
    begin
        MovsProd.SetCurrentKey("Item No.");
        MovsProd.SetRange("Item No.", Clasificacion);
        PAGE.RunModal(0, MovsProd);
    end;
}

