pageextension 48 "Item Ledger Entries with mods" extends "Item Ledger Entries"
{
    layout
    {
        addafter(Quantity)
        {
            field("Kilos netos"; "Net kilos")
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Net kilos', ESP = 'Kilos netos';
            }
            field("Kilos brutos"; "Gross kilos")
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Gross kilos', ESP = 'Kilos brutos';
            }
        }
    }

    actions
    {
        addafter("F&unctions")
        {
            group(WorkWithILE)
            {
                action(TraerSeleccionados)
                {
                    Caption = 'Llevar a diario';
                    Image = ChangeToLines;
                    Visible = false;

                    trigger OnAction()
                    var
                        l_rstLinDiaGen: Record "Gen. Journal Line";
                        l_txtConfirmar: Label 'Se eliminarán todas las líneas preexistentes en el diario y sección especificados. ¿Desea continuar?';
                        l_i: Integer;
                        dlgDialogo: Dialog;
                        GenJnlTemplate: Record "Gen. Journal Template";
                        GenJnlBatch: Record "Gen. Journal Batch";
                        GenJnlAlloc: Record "Gen. Jnl. Allocation";
                        NoSeriesMgt: Codeunit "No. Series";
                    begin
                        //++Migración Arbumasa 2009
                        if (codLibro <> '') and (codSeccion <> '') then begin
                            /*
                            CLEAR(dlgDialogo);
                            dlgDialogo.OPEN('Generando lónea #1############# de #2#############\'+
                                            '                              @3@@@@@@@@@@@@@@@@@@@@@');
                            dlgDialogo.UPDATE(2,Rec.COUNT);

                            CLEAR(l_rstLinDiaGen);
                            IF CONFIRM(l_txtConfirmar) THEN
                            BEGIN

                                l_rstLinDiaGen.SETRANGE("Journal Template Name",codLibro);
                                l_rstLinDiaGen.SETRANGE("Journal Batch Name",codSeccion);
                                l_rstLinDiaGen.DELETEALL;

                                CLEAR(l_rstLinDiaGen);

                                //CurrPage.SETSELECTIONFILTER(Rec);
                                SETRANGE("Applies-to ID",GenJnlLine."Document No.");

                                IF Rec.FINDSET THEN
                                REPEAT

                                l_i += 10000;
                                dlgDialogo.UPDATE(1,l_i/10000);
                                dlgDialogo.UPDATE(3,ROUND(l_i/Rec.COUNT,1));
                                l_rstLinDiaGen."Journal Template Name" := codLibro;
                                l_rstLinDiaGen."Journal Batch Name" := codSeccion;
                                l_rstLinDiaGen."Line No." := l_i;
                                {GenJnlBatch.GET(l_rstLinDiaGen."Journal Template Name",l_rstLinDiaGen."Journal Batch Name");
                                IF GenJnlBatch."No. Series" = '' THEN
                                    EXIT;
                                CLEAR(NoSeriesMgt);
                                l_rstLinDiaGen."Document No." := NoSeriesMgt.TryGetNextNo(GenJnlBatch."No. Series",workdate);}
                                l_rstLinDiaGen.INSERT(TRUE);
                                l_rstLinDiaGen.VALIDATE("Account Type",l_rstLinDiaGen."Account Type"::Vendor);
                                l_rstLinDiaGen.VALIDATE("Account No.","Vendor No.");
                                l_rstLinDiaGen.VALIDATE("Posting Date",ApplyingVendLedgEntry."Posting Date");
                                l_rstLinDiaGen.VALIDATE("Document Type",l_rstLinDiaGen."Document Type"::Payment);
                                l_rstLinDiaGen.VALIDATE("Applies-to Doc. Type","Document Type");
                                l_rstLinDiaGen.VALIDATE("Applies-to Doc. No.","Document No.");
                                l_rstLinDiaGen.VALIDATE("Currency Code","Currency Code");
                                IF l_rstLinDiaGen."Currency Code" = ''THEN
                                    l_rstLinDiaGen."Currency Code":=l_rstLinDiaGen."Currency Code"
                                ELSE
                                l_rstLinDiaGen.VALIDATE("Currency Factor","Original Currency Factor");
                                l_rstLinDiaGen.VALIDATE(Amount,-"Remaining Amount");
                                l_rstLinDiaGen.VALIDATE("Shortcut Dimension 1 Code","Global Dimension 1 Code");
                                l_rstLinDiaGen.VALIDATE("Shortcut Dimension 2 Code","Global Dimension 2 Code");
                                l_rstLinDiaGen.VALIDATE("Shortcut Dimension 3 Code","Global dimension 3 Code");
                                l_rstLinDiaGen.VALIDATE("Shortcut Dimension 4 Code","Global Dimension 4 Code");
                                l_rstLinDiaGen.VALIDATE("Shortcut Dimension 5 Code","Global Dimension 5 Code");
                                l_rstLinDiaGen.VALIDATE("Shortcut Dimension 6 Code","Global dimension 6 Code");
                                l_rstLinDiaGen.VALIDATE("Shortcut Dimension 7 Code","Global Dimension 7 Code");

                                l_rstLinDiaGen.MODIFY(TRUE);

                                UNTIL Rec.NEXT = 0;

                            END;
                            */
                        end;

                        CurrPage.Close;
                        //--Migración Arbumasa 2009

                    end;
                }
                action("Enviar al diario para reversión")
                {
                    Image = ReverseLines;

                    trigger OnAction()
                    var
                        cduRD: Codeunit GestionExistencias;
                        rst32: Record "Item Ledger Entry";
                        rst32Rep: Record "Item Ledger Entry" temporary;
                    begin
                        CurrPage.SetSelectionFilter(rst32);

                        Clear(cduRD);
                        cduRD.fntRevertirDiarioProducto(rst32);
                    end;
                }
                action("Imprimir etiqueta")
                {

                    trigger OnAction()
                    var
                        cduFish: Codeunit Descargas;
                        rst27: Record Item;
                        rstIS: Record "Inventory Setup";
                        rstSP: Record "Subfamilia producto";
                        rst32: Record "Item Ledger Entry";
                    begin
                        Clear(rst27);
                        Clear(cduFish);
                        Clear(rstIS);
                        Clear(rstSP);

                        TestField(Positive);
                        if "Remaining Quantity" = 0 then
                            Error('El pallet debe estar pendiente');

                        Clear(rst32);
                        CurrPage.SetSelectionFilter(rst32);

                        if rst32.FindSet then
                            repeat

                                rst27.Get(rst32."Item No.");
                                rstIS.Get;
                                rstSP.Get(rst27.Familia, rst27.Subfamilia);

                                if (rst27."Lleva No. Pallet") and (rst27."Item Category Code" = rstIS."Categoria productos pesca") then begin

                                    cduFish.fntPrintLabel(rst32."Pallet no.", rst32."Global dimension 3 Code", rst32."Global Dimension 1 Code", rst32."Posting Date", rst27."No.", rst32."Remaining Quantity", rstSP."Descripción mínima", false);

                                end;

                            until rst32.Next = 0;
                    end;
                }
            }
        }
        addfirst(Category_Category13)
        {
            actionref(EnviarParaReversionPromoted; "Enviar al diario para reversión")
            {

            }
            actionref(TraerSeleccionadosPromoted; TraerSeleccionados)
            {

            }
        }
        modify(Category_Category13)
        {
            CaptionML = ENU = 'ILE management', ESP = 'Gestión movimientos';
        }
    }

    var
        Navigate: Page Navigate;
        codLibro: Code[10];
        codSeccion: Code[10];

    [Scope('OnPrem')]
    procedure SetLibro(l_codLibro: Code[10]; l_codSeccion: Code[10])
    begin
        codLibro := l_codLibro;
        codSeccion := l_codSeccion;
    end;

    procedure SetSelection(var rstILE: Record "Item Ledger Entry")
    begin
        if codLibro <> '' then
            CurrPage.SetSelectionFilter(rstILE);
    end;

}