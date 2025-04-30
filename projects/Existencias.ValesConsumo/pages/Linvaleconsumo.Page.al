page 50046 "Lin. vale consumo"
{
    // Doversys - FMac - 091003 - Se agregó una llamada a TestLinValeCons (codeunit Prod-Test dispo.)
    //                            para validar las existencias en el almacén seleccionado del producto
    //                            que se quiere utilizar.
    // 
    // Doversys - FMac - 121103 - Se agregó el campo "No. OP"

    AutoSplitKey = true;
    DelayedInsert = true;
    PageType = ListPart;
    RefreshOnActivate = true;
    SourceTable = "Lín. vale consumo";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Tipo; Tipo)
                {
                }
                field("No."; "No.")
                {
                }
                field("Descripción"; Descripción)
                {
                }
                field("Descripción 2"; "Descripción 2")
                {
                }
                field("Cód. unidad medida"; "Cód. unidad medida")
                {
                }
                field(Cantidad; Cantidad)
                {
                }
                field("Cód. depósito"; "Cód. depósito")
                {
                }
                field("Remaining qty in location"; "Remaining qty in location")
                {
                    Editable = false;
                }
                field("No. proyecto"; "No. proyecto")
                {
                }
                field("Lot No."; "Lot No.")
                {
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                }
                field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                {
                }
                field("Shortcut Dimension 4 Code"; "Shortcut Dimension 4 Code")
                {
                }
                field("Shortcut Dimension 5 Code"; "Shortcut Dimension 5 Code")
                {
                }
                field("Shortcut Dimension 6 Code"; "Shortcut Dimension 6 Code")
                {
                }
                field("Shortcut Dimension 7 Code"; "Shortcut Dimension 7 Code")
                {
                }
                field("Concepto proyecto"; "Concepto proyecto")
                {
                }
                field("Precio unitario"; "Precio unitario")
                {
                }
                field(Revertido; Revertido)
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
            group("&Acciones")
            {
                Caption = '&Acciones';
                action("Deshacer consumo")
                {
                    Caption = 'Deshacer consumo';

                    trigger OnAction()
                    var
                        rstLVC: Record "Lín. vale consumo";
                        cduRevertir: Codeunit GestionConsumos;
                        cduRevertirILE: Codeunit GestionExistencias;
                        rstLinProd83: Record "Item Journal Line";
                        rstConfEx: Record "Inventory Setup";
                    begin
                        Clear(rstConfEx);
                        rstConfEx.Get();
                        rstConfEx.TestField("Nombre libro diario consumos");
                        rstConfEx.TestField("Sección libro diario consumos");

                        Clear(rstLinProd83);
                        rstLinProd83.SetRange("Journal Template Name", rstConfEx."Nombre libro diario consumos");
                        rstLinProd83.SetRange("Journal Batch Name", rstConfEx."Sección libro diario consumos");
                        rstLinProd83.DeleteAll;
                        rstLinProd83.LockTable;
                        rstLVC.Copy(Rec);
                        CurrPage.SetSelectionFilter(rstLVC);
                        if rstLVC.FindSet then
                            repeat
                                Clear(cduRevertir);
                                cduRevertir.fntAnularConsumo(rstLVC);
                            until rstLVC.Next = 0;

                        Clear(rstLinProd83);
                        rstLinProd83.SetRange("Journal Template Name", rstConfEx."Nombre libro diario consumos");
                        rstLinProd83.SetRange("Journal Batch Name", rstConfEx."Sección libro diario consumos");
                        rstLinProd83.SetRange("Document No.", rstLVC."No. documento");
                        if rstLinProd83.FindSet then
                            cduRevertirILE.fntRegistrarReversionILE(rstLinProd83);
                    end;
                }
            }
        }
    }

    var
        ValProducto: Record Item;

    [Scope('OnPrem')]
    procedure MostrarFicha()
    var
        Producto: Record Item;
    begin
        if Descripción = '' then
            exit;
        Producto."No." := "No.";
        PAGE.RunModal(PAGE::"Item Card", Producto);
    end;

    [Scope('OnPrem')]
    procedure MostrarMovs()
    var
        MovsProd: Record "Item Ledger Entry";
    begin
        MovsProd.SetCurrentKey("Item No.");
        MovsProd.SetRange("Item No.", "No.");
        PAGE.RunModal(0, MovsProd);
    end;

    [Scope('OnPrem')]
    procedure MostrarDisponibilidad(qTipo: Integer)
    begin
        Disponibilidad(qTipo);
    end;
}

