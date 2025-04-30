page 50604 "Reparto nuevo"
{
    Caption = 'Sales distribution';
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Cab. Reparto";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No. Documento"; "No. Documento")
                {
                    Caption = 'Budget Name';

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        frmCabReparto: Page "Lista Repartos";
                    begin
                    end;
                }
                field(ColumnSet; ColumnSet)
                {
                    Caption = 'Show Column Name';

                    trigger OnValidate()
                    begin

                        SetColumns(SetWanted::Inicial);
                    end;
                }
                field(Cliente; Cliente)
                {
                    Caption = 'Cliente';
                }
                field("Container type"; "Container type")
                {
                    Caption = 'Tipo de Contenedor';
                }
                field("Loading port"; "Loading port")
                {
                }
                field(Transportista; Transportista)
                {
                }
                field("Destination port"; "Destination port")
                {
                }
                field(Observaciones; Observaciones)
                {
                }
                field(GlblDimFl1; GlblDimFl1)
                {
                    Caption = 'Filtro buque';

                    trigger OnValidate()
                    begin
                        SetColumns(SetWanted::Inicial);
                    end;
                }
                field("Filtro depósito"; GlblDimFlDep)
                {
                    Caption = 'Location filter';
                    TableRelation = Location;
                }
            }
            part(MatrixForm; "Matrix Distribution Selection")
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Acci&ones")
            {
                Caption = 'F&unctions';
                separator(Action1102601004)
                {
                    Caption = '';
                }
                action("Imprimir reparto")
                {
                    Caption = 'Imprimir reparto';

                    trigger OnAction()
                    var
                        rstCabReparto: Record "Cab. Reparto";
                    begin
                        CurrPage.SetSelectionFilter(rstCabReparto);
                        REPORT.Run(50597, true, true, rstCabReparto);
                    end;
                }
                separator(Action1102601007)
                {
                }
            }
            group("<Action1000000007>")
            {
                Caption = '&Registrar';
                Image = Post;
                separator(Action1000000009)
                {
                }
                action("<Action1000000010>")
                {
                    Caption = '&Registrar e imprimir';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = false;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction()
                    var
                        cduRegistroDiario: Codeunit "Registro diarios";
                        pgePedido: Page "Sales Order";
                        rstPedido: Record "Sales Header";
                        strReparto: array[100, 100, 3] of Text[200];
                        strPedido: Code[20];
                        "rstLínReparto": Record "Lín. reparto";
                    begin
                        Clear(cduRegistroDiario);
                        Clear(pgePedido);
                        Clear(rstPedido);
                        strPedido := '';
                        /*
                        Arbu 2019
                        strPedido := cduRegistroDiario.fntRevertirRegistroProducto(Rec,TRUE);
                        */
                        if strPedido <> '' then begin

                            Rec.Delete;
                            Clear(rstLínReparto);
                            rstLínReparto.SetRange(rstLínReparto."No. Documento", "No. Documento");
                            rstLínReparto.DeleteAll;

                        end;

                    end;
                }
                action("<Action1000000011>")
                {
                    Caption = '&Registrar';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    var
                        cduRegistroDiario: Codeunit "Registro diarios";
                        pgePedido: Page "Sales Order";
                        rstPedido: Record "Sales Header";
                        strReparto: array[100, 100, 3] of Text[200];
                        strPedido: Code[20];
                        "rstLínReparto": Record "Lín. reparto";
                    begin
                        Clear(cduRegistroDiario);
                        Clear(pgePedido);
                        Clear(rstPedido);
                        strPedido := '';
                        /*Arbu 2019
                        strPedido := cduRegistroDiario.fntRevertirRegistroProducto(Rec,FALSE);
                        */
                        if strPedido <> '' then begin

                            Rec.Delete;
                            Clear(rstLínReparto);
                            rstLínReparto.SetRange(rstLínReparto."No. Documento", "No. Documento");
                            rstLínReparto.DeleteAll;

                        end;

                    end;
                }
                separator(Action1000000013)
                {
                }
            }
            action("<Action12>")
            {
                Caption = 'Previous Set';
                Image = PreviousSet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Previous Set';

                trigger OnAction()
                begin
                    SetColumns(SetWanted::Anterior);
                    CurrPage.Update(false);
                end;
            }
            action("Columna anterior")
            {
                Caption = 'Previous Column';
                Image = PreviousRecord;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SetColumns(SetWanted::ColumnaAnterior);
                    CurrPage.Update(false);
                end;
            }
            action("Columna siguiente")
            {
                Caption = 'Next Column';
                Image = NextRecord;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SetColumns(SetWanted::ColumnaSiguiente);
                    CurrPage.Update(false);
                end;
            }
            action("Conjunto siguiente")
            {
                Caption = 'Next Set';
                Image = NextSet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Next Set';

                trigger OnAction()
                begin
                    SetColumns(SetWanted::Siguiente);
                    CurrPage.Update(false);
                end;
            }
        }
    }

    trigger OnInit()
    begin
        NumberOfColumns := 10;
    end;

    trigger OnOpenPage()
    var
        GLAcc: Record "G/L Account";
        MATRIX_Step: Option First,Previous,Same,Next;
    begin
        SetColumns(SetWanted::Inicial);
    end;

    var
        Text001: Label 'Debe generar un reparto.';
        MatrixMgt: Codeunit "Matrix Management";
        Matrix_ColumnCaptions: array[32] of Text[1024];
        Matrix_CaptionRange: Text[1024];
        LotCodeBuffer: array[32] of Record "Productos por lote";
        ColumnSet: Text[1024];
        GlblDimFl1: Code[10];
        GlblDimFlDep: Code[10];
        NumberOfColumns: Integer;
        codNoDocumento: Code[20];
        SetWanted: Option Inicial,Anterior,Igual,Siguiente,ColumnaAnterior,ColumnaSiguiente;
        MaxColumnNumber: Integer;

    [Scope('OnPrem')]
    procedure SetColumns(l_SetWanted: Option Inicial,Anterior,Igual,Siguiente,ColumnaAnterior,ColumnaSiguiente)
    var
        FirstColumn: Text[1024];
        LastColumn: Text[1024];
        PKFirstRecInCurrSet: Text[1024];
    begin
        MaxColumnNumber := 10;
        if PKFirstRecInCurrSet = '' then
            PKFirstRecInCurrSet := LotCodeBuffer[1].GetPosition;
        //++Arbu 2020MatrixMgt.GenerateFieldColumnCaption(codNoDocumento,GlblDimFl1,l_SetWanted,PKFirstRecInCurrSet,FirstColumn,LastColumn,Matrix_ColumnCaptions,LotCodeBuffer,MaxColumnNumber,FALSE,ColumnSet);

        CurrPage.MatrixForm.PAGE.SetMatrixData(Matrix_ColumnCaptions, LotCodeBuffer, codNoDocumento, NumberOfColumns);
        CurrPage.Update(false);
    end;

    [Scope('OnPrem')]
    procedure fntPasarDoc(l_codNoDocumento: Code[20])
    begin
        codNoDocumento := l_codNoDocumento;
    end;

    [Scope('OnPrem')]
    procedure GetTitle(codLot: Code[20]; MatrixRecordIxL: Record "Productos por lote"): Text[250]
    var
        strCabecera: Text[250];
        rstMovProd2: Record "Item Ledger Entry";
        rstBuque: Record "Dimension Value";
        rstPuerto: Record "Entry/Exit Point";
        strMarea: Text[30];
        CR: Char;
        codBuque: Code[10];
        codMarea: Code[10];
        rstProy: Record Job;
    begin
        // En esta función se determina qué se presentará en la cabecera de la matriz

        codBuque := CopyStr(codLot, 1, 3);
        codMarea := CopyStr(codLot, 4, 6);

        strCabecera := '';
        Clear(rstMovProd2);
        Clear(rstBuque);
        rstMovProd2.SetCurrentKey("Item No.", "Lote origen", "Entry/Exit Point", "Entry Type", "Posting Date");
        rstMovProd2.SetFilter(rstMovProd2."Item No.", '<>%1', '');
        rstMovProd2.SetRange("Entry/Exit Point", MatrixRecordIxL.Puerto);
        rstMovProd2.SetRange("Lote origen", codLot);
        rstMovProd2.SetRange("Global Dimension 1 Code", codBuque);
        rstMovProd2.SetRange("Global dimension 3 Code", codMarea);
        rstMovProd2.SetRange("Location Code", MatrixRecordIxL."Cod. deposito");

        Clear(rstProy);
        rstProy.SetRange(rstProy."Global Dimension 1 Code", codBuque);
        rstProy.SetRange("Global Dimension 3 Code", codMarea);
        rstProy.SetRange(Tipo, rstProy.Tipo::Productivo);
        if not rstProy.FindFirst then
            Error('No se ha encontrado el proyecto ' + codBuque + codMarea);

        if rstMovProd2.FindFirst then begin

            Clear(rstPuerto);
            rstBuque.SetRange(rstBuque.Code, codBuque);
            rstBuque.SetRange("Global Dimension No.", 1);
            rstBuque.FindFirst;
            rstPuerto.SetRange(rstPuerto.Code, rstMovProd2."Entry/Exit Point");
            if rstPuerto.Find('-') then begin

                strMarea := '';
                Evaluate(strMarea, MatrixRecordIxL."Global Dimension 3");

                if (rstBuque."Use code" = rstBuque."Use code"::Buque) or
                   (rstBuque."Use code" = rstBuque."Use code"::" ") then
                    strCabecera := rstPuerto.Code + ': ' + MatrixRecordIxL."Cod. deposito" + '     ' +
                                   Format(rstProy."Ending Date") + '         ' +
                                   DelChr(rstBuque.Name, '=', 'Buque Arbumasa ') + '-' + codMarea;

                if (rstBuque."Use code" = rstBuque."Use code"::Cliente) or
                   (rstBuque."Use code" = rstBuque."Use code"::Tercero) then begin

                    Error('El sistema no está preparado para esta clase de producto');
                    /*
                    CLEAR(rstBuqueTercero);
                    IF rstBuqueTercero.GET("Global Dimension 1",rstMovProd2."Buque Tercero") THEN;

                    strCabecera := rstPuerto."Descripción 2" +'\'+ MatrixRecordIxL."Cód. depósito"+ '\'
                                   +FORMAT(MatrixRecordIxL."Fecha descarga")+'\'+
                                   FORMAT(strMarea)+'    '+rstBuqueTercero.Descripción;
                     */

                end;

                if rstBuque."Use code" = rstBuque."Use code"::Planta then begin

                    strCabecera := rstPuerto."Descripción 2" + '     ' + MatrixRecordIxL."Cod. deposito" + '     ' +
                                   Format(rstProy."Ending Date") + '     ' +
                                   codMarea + '     ' + MatrixRecordIxL."Global Dimension 1";

                end;

            end;

            //message('%1',"Arrival date");
            exit(strCabecera);
            //+'\'+CurrForm.MatrixBox.MatrixRec."No. Lote");

        end;

    end;
}

