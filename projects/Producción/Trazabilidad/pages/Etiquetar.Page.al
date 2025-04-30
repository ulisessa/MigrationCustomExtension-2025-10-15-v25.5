page 50042 Etiquetar
{
    SaveValues = true;
    SourceTable = "Integer";

    layout
    {
        area(content)
        {
            group(Generales)
            {
                field("Generar DataMatrix"; blnImprimirDataMatrix)
                {
                }
                field("Cantidad a generar"; intCantidadEtiquetas)
                {
                }
                field("Cantidad de copias por etiqueta"; intCantidadCopias)
                {
                }
            }
            group(Item)
            {
                field("Cód. pallet"; codPallet)
                {
                }
                field(Departamento; codDepto)
                {
                    TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));
                }
                field("Marea/Actividad"; codMarea)
                {
                    TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (3));
                }
                field(Fecha; datFecha)
                {
                }
                field("Clasificación"; codClasificacion)
                {
                    TableRelation = Item."No." WHERE ("Item Category Code" = CONST ('PESCA'),
                                                      Blocked = CONST (false));
                }
                field(Cantidad; decQ)
                {
                    BlankZero = true;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Imprimir)
            {
                Image = PrintVoucher;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    fntImprimir
                end;
            }
            action("Traer siguiente código de pallet")
            {
                Image = GetBinContent;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    fntTraerPallet
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        intCantidadEtiquetas := 2;
        intCantidadCopias := 1;
    end;

    var
        codPallet: Code[10];
        codMarea: Code[10];
        codDepto: Code[20];
        datFecha: Date;
        codClasificacion: Code[30];
        decQ: Decimal;
        codFamilia: Code[30];
        rst27: Record Item;
        rstIUM: Record "Item Unit of Measure";
        blnImprimirDataMatrix: Boolean;
        intCantidadEtiquetas: Integer;
        intCantidadCopias: Integer;
        cduPFishing: Codeunit "Descargas";

    local procedure fntTraerPallet()
    begin
        if codDepto = '' then
            Error('Debe completar el Departamento');


        Clear(cduPFishing);
        codPallet := cduPFishing.fntGetNextPalletNo(codDepto, datFecha, '');
    end;

    local procedure fntImprimir()
    var
        i: Integer;
        j: Integer;
    begin
        if codPallet = '' then
            Error('Debe completar el Pallet');

        if codMarea = '' then
            Error('Debe completar la Marea');

        if datFecha = 0D then
            Error('Debe completar la fecha');

        if codClasificacion = '' then
            Error('Debe completar la clasificación');

        if decQ = 0 then
            Error('Debe completar la cantidad');

        Clear(rst27);
        rst27.Get(codClasificacion);

        Clear(cduPFishing);

        for i := 1 to intCantidadEtiquetas do begin

            for j := 1 to intCantidadCopias do begin

                cduPFishing.fntPrintLabel(codPallet, codMarea, codDepto, datFecha, codClasificacion, decQ, rst27.Familia, blnImprimirDataMatrix);

            end;

            codPallet := cduPFishing.fntGetNextPalletNo(codDepto, datFecha, codPallet);

        end;
    end;
}

