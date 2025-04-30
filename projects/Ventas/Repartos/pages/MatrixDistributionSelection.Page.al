page 50607 "Matrix Distribution Selection"
{
    Caption = 'Budget Matrix';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "Lín. reparto";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                FreezeColumn = TotalAvailable;
                IndentationControls = Descripcion;
                ShowCaption = false;
                field(Descripcion; Descripcion)
                {
                    Caption = 'Description';
                    Editable = false;
                }
                field(TotalInventory; decInventory)
                {
                    BlankZero = true;
                    Caption = 'Budgeted Amount';
                    Editable = false;
                }
                field(TotalAEnviar; decToSend)
                {
                    Caption = 'A enviar';
                }
                field(TotalAvailable; decAvailable)
                {
                    Caption = 'Disponible';
                }
                field(Field1; MATRIX_CellData[1])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[1];
                    DecimalPlaces = 0 : 2;
                    MultiLine = true;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend(Text, 1);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend(Format(MATRIX_CellData[1]), 1);
                    end;
                }
                field(Field2; MATRIX_CellData[2])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[2];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend(Text, 2);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend(Format(MATRIX_CellData[2]), 2);
                    end;
                }
                field(Field3; MATRIX_CellData[3])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[3];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend(Text, 3);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend(Format(MATRIX_CellData[3]), 3);
                    end;
                }
                field(Field4; MATRIX_CellData[4])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[4];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend(Text, 4);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend(Format(MATRIX_CellData[4]), 4);
                    end;
                }
                field(Field5; MATRIX_CellData[5])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[5];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend(Text, 5);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend(Format(MATRIX_CellData[5]), 5);
                    end;
                }
                field(Field6; MATRIX_CellData[6])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[6];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend(Text, 6);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend(Format(MATRIX_CellData[6]), 6);
                    end;
                }
                field(Field7; MATRIX_CellData[7])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[7];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend(Text, 7);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend(Format(MATRIX_CellData[7]), 7);
                    end;
                }
                field(Field8; MATRIX_CellData[8])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[8];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend(Text, 8);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend(Format(MATRIX_CellData[8]), 8);
                    end;
                }
                field(Field9; MATRIX_CellData[9])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[9];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend(Text, 9);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend(Format(MATRIX_CellData[9]), 9);
                    end;
                }
                field(Field10; MATRIX_CellData[10])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[10];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend(Text, 10);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend(Format(MATRIX_CellData[10]), 10);
                    end;
                }
                field(Field11; MATRIX_CellData[11])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[11];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend(Text, 11);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend(Format(MATRIX_CellData[11]), 11);
                    end;
                }
                field(Field12; MATRIX_CellData[12])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[12];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend(Text, 12);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend(Format(MATRIX_CellData[12]), 12);
                    end;
                }
            }
            repeater(Control1000000019)
            {
                FreezeColumn = TotalAvailable2;
                ShowCaption = false;
                field("Descripción2"; Descripcion)
                {
                    Caption = 'Selected Description';
                    Editable = false;
                }
                field(TotalInventory2; decInventory)
                {
                    BlankZero = true;
                    Caption = 'Budgeted Amount';
                    Editable = false;
                }
                field(TotalAEnviar2; decToSend)
                {
                    Caption = 'A enviar';
                }
                field(TotalAvailable2; decAvailable)
                {
                    Caption = 'Disponible';
                }
                field(Field36; MATRIX_CellData[21])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[21];
                    DecimalPlaces = 0 : 2;
                    MultiLine = true;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend('0', 1);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend('0', 1);
                    end;
                }
                field(Field37; MATRIX_CellData[22])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[22];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend('0', 2);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend('0', 2);
                    end;
                }
                field(Field38; MATRIX_CellData[23])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[23];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend('0', 3);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend('0', 3);
                    end;
                }
                field(Field39; MATRIX_CellData[24])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[24];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend('0', 4);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend('0', 4);
                    end;
                }
                field(Field40; MATRIX_CellData[25])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[25];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend('0', 5);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend('0', 5);
                    end;
                }
                field(Field41; MATRIX_CellData[26])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[26];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend('0', 6);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend('0', 6);
                    end;
                }
                field(Field42; MATRIX_CellData[27])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[27];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend('0', 7);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend('0', 7);
                    end;
                }
                field(Field43; MATRIX_CellData[28])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[28];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend('0', 8);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend('0', 8);
                    end;
                }
                field(Field44; MATRIX_CellData[29])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[29];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend('0', 9);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend('0', 9);
                    end;
                }
                field(Field45; MATRIX_CellData[30])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[30];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend('0', 10);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend('0', 10);
                    end;
                }
                field(Field46; MATRIX_CellData[31])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[31];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend('0', 11);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend('0', 11);
                    end;
                }
                field(Field47; MATRIX_CellData[32])
                {
                    BlankZero = true;
                    CaptionClass = '3,' + MATRIX_CaptionSet[32];
                    DecimalPlaces = 0 : 2;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        QtyToSend('0', 12);
                    end;

                    trigger OnValidate()
                    begin
                        QtyToSend('0', 12);
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Saldo")
            {
                Caption = '&Balance';
                action("Saldo cuenta/&Presupuesto")
                {
                    Caption = 'G/L Account Balance/Bud&get';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        l_MATRIX_CurrentColumnOrdinal: Integer;
        i: Integer;
        rstCabRep: Record "Cab. Reparto";
    begin
        decAvailable := 0;
        decToSend := 0;
        decInventory := 0;
        for i := 1 to Matrix_ColumnCount + 20 do begin

            MATRIX_OnAfterGetRecord(i);

            if i <= 20 then begin

                if MATRIX_Caption[i] <> '' then begin
                    MATRIX_CaptionSet[i] := GetTitle(MATRIX_Caption[i], Matrix_Record[i]);
                end
                else begin
                    MATRIX_CaptionSet[i] := '';
                end;

            end
            else begin

                if MATRIX_Caption[i - 20] <> '' then begin
                    MATRIX_CaptionSet[i] := GetTitle(MATRIX_Caption[i - 20], Matrix_Record[i - 20]);
                end
                else begin
                    MATRIX_CaptionSet[i] := '';
                end;

            end;

        end;
    end;

    trigger OnOpenPage()
    var
        GLAcc: Record "G/L Account";
    begin
        SetRange("No. Documento", codLotFilter);
        SetRange("Tipo movimiento", "Tipo movimiento"::Stock);
    end;

    var
        Text001: Label 'Period';
        Text002: Label 'You may only edit column 1 to %1.';
        Matrix_Record: array[32] of Record "Productos por lote";
        Matrix_ColumnCount: Integer;
        MATRIX_CellData: array[32] of Decimal;
        MATRIX_Caption: array[32] of Text[1024];
        MATRIX_CaptionSet: array[32] of Text[1024];
        decInventory: Decimal;
        decToSend: Decimal;
        decAvailable: Decimal;
        codLotFilter: Code[20];
        Field1Visible: Boolean;
        Field2Visible: Boolean;
        Field3Visible: Boolean;
        Field4Visible: Boolean;
        Field5Visible: Boolean;
        Field6Visible: Boolean;
        Field7Visible: Boolean;
        Field8Visible: Boolean;
        Field9Visible: Boolean;
        Field10Visible: Boolean;
        Field11Visible: Boolean;
        Field12Visible: Boolean;

    [Scope('OnPrem')]
    procedure SetMatrixData(ColumnCaptions: array[32] of Text[1024]; var MatrixRec: array[32] of Record "Productos por lote"; LotFilter: Code[20]; ColumnSetLength: Integer)
    var
        i: Integer;
    begin
        for i := 1 to /*ColumnSetLength*/ 10 do begin

            MATRIX_Caption[i] := ' ';
            MATRIX_Caption[i + 20] := ' ';

        end;

        for i := 1 to /*ARRAYLEN(MatrixRec)*/ ColumnSetLength do begin
            if ColumnCaptions[i] = '' then begin
                MATRIX_Caption[i] := ' ';
                MATRIX_Caption[i + 20] := ' ';
            end
            else begin
                MATRIX_Caption[i] := ColumnCaptions[i];
                MATRIX_Caption[i + 20] := ColumnCaptions[i];
            end;
            Matrix_Record[i] := MatrixRec[i];
        end;

        for i := 1 to ArrayLen(MatrixRec) do begin

            Matrix_Record[i] := MatrixRec[i];

        end;

        Matrix_ColumnCount := ColumnSetLength;
        codLotFilter := LotFilter;

        ShowHideColumns;

    end;

    [Scope('OnPrem')]
    procedure ShowHideColumns()
    begin
        Field1Visible := Matrix_ColumnCount >= 1;
        Field2Visible := Matrix_ColumnCount >= 2;
        Field3Visible := Matrix_ColumnCount >= 3;
        Field4Visible := Matrix_ColumnCount >= 4;
        Field5Visible := Matrix_ColumnCount >= 5;
        Field6Visible := Matrix_ColumnCount >= 6;
        Field7Visible := Matrix_ColumnCount >= 7;
        Field8Visible := Matrix_ColumnCount >= 8;
        Field9Visible := Matrix_ColumnCount >= 9;
        Field10Visible := Matrix_ColumnCount >= 10;
        Field11Visible := Matrix_ColumnCount >= 11;
        Field12Visible := Matrix_ColumnCount >= 12;
    end;

    local procedure MATRIX_OnAfterGetRecord(ColumnID: Integer)
    var
        Item: Record Item;
        i: Integer;
        rstLinRepartoSale: Record "Lín. reparto";
        rstLinReparto: Record "Lín. reparto";
    begin
        //MESSAGE('%1',MATRIX_CaptionSet[ColumnID]);
        //MESSAGE('%1',MATRIX_CaptionSetTitle[ColumnID]);

        //message('%1',ColumnID);

        //MATRIX_CellData[ColumnID+20] := 0;
        MATRIX_CellData[ColumnID] := 0;

        if (MATRIX_Caption[ColumnID] <> '') then begin

            if ColumnID >= 20 then begin

                Clear(rstLinRepartoSale);
                rstLinRepartoSale.SetRange("No. Documento", "No. Documento");
                rstLinRepartoSale.SetRange("Tipo movimiento", "Tipo movimiento"::Venta);
                rstLinRepartoSale.SetRange("No. Producto", "No. Producto");
                rstLinRepartoSale.SetRange("Lote origen", MATRIX_Caption[ColumnID - 20]);//MatrixRecordIxL."No. Lote");
                rstLinRepartoSale.SetRange(Puerto, Matrix_Record[ColumnID - 20].Puerto);
                if rstLinRepartoSale.FindFirst then
                    MATRIX_CellData[ColumnID] := rstLinRepartoSale."Cantidad para Venta"
                else
                    MATRIX_CellData[ColumnID] := 0;

                decToSend += rstLinRepartoSale."Cantidad para Venta";

            end
            else begin

                Clear(rstLinRepartoSale);
                rstLinRepartoSale.SetRange("No. Documento", "No. Documento");
                rstLinRepartoSale.SetRange("Tipo movimiento", "Tipo movimiento"::Venta);
                rstLinRepartoSale.SetRange("No. Producto", "No. Producto");
                rstLinRepartoSale.SetRange("Lote origen", Matrix_Record[ColumnID]."No. Lote");
                rstLinRepartoSale.SetRange(Puerto, Matrix_Record[ColumnID].Puerto);
                if rstLinRepartoSale.FindFirst then;

                rstLinReparto.Copy(Rec);
                rstLinReparto.SetRange("Tipo movimiento", "Tipo movimiento"::Stock);
                //++Arbu 2020rstLinReparto.SETFILTER(,"No. Producto");
                //rstLinReparto.SETFILTER(rstLinReparto."Filtro No. lote",MatrixRecordIxL."No. Lote");
                //rstLinReparto.SETFILTER(rstLinReparto."Filtro departamento",MatrixRecordIxL."Global Dimension 1");
                //rstLinReparto.SETFILTER(rstLinReparto."Global dimension 3 filter",MatrixRecordIxL."Global Dimension 3");
                //++Arbu 2020rstLinReparto.SETFILTER(rstLinReparto."Filtro departamento",COPYSTR(MATRIX_Caption[ColumnID],1,3));
                //++Arbu 2020rstLinReparto.SETFILTER(rstLinReparto."Global dimension 3 filter",COPYSTR(MATRIX_Caption[ColumnID],4,9));
                rstLinReparto.SetFilter(Puerto, Matrix_Record[ColumnID].Puerto);
                //++Arbu 2020rstLinReparto.SETFILTER(rstLinReparto."Filtro deposito",Matrix_Record[ColumnID]."Cod. deposito");
                rstLinReparto.CalcFields("Location code");
                //++Arbu 2020MATRIX_CellData[ColumnID] := rstLinReparto."Location code"-rstLinRepartoSale."Cantidad para Venta";
                if MATRIX_CellData[ColumnID] < 0 then
                    MATRIX_CellData[ColumnID] := 0;

                if StrLen(MATRIX_Caption[ColumnID]) > 3 then begin

                    //++Arbu 2020decAvailable += rstLinReparto."Location code"-rstLinRepartoSale."Cantidad para Venta";
                    //++Arbu 2020decInventory += rstLinReparto."Location code";

                end;

            end;

        end;
    end;

    [Scope('OnPrem')]
    procedure QtyToSend(l_QtyToSend: Code[20]; l_Lot: Integer)
    var
        intLin: Integer;
        intCaption: Integer;
        rstLinReparto: Record "Lín. reparto";
    begin
        Clear(rstLinReparto);
        rstLinReparto.SetRange(rstLinReparto."No. Documento", "No. Documento");
        rstLinReparto.FindLast;
        intLin := rstLinReparto."No. línea";

        /*MATRIX_MatrixRecordIxL := MatrixRecords[l_Lot];*/

        rstLinReparto.Copy(Rec);
        rstLinReparto.SetRange("Tipo movimiento", "Tipo movimiento"::Venta);
        rstLinReparto.SetRange("No. Producto", "No. Producto");
        //++Arbu 2020rstLinReparto.SETRANGE("No. Lote",Matrix_Record[l_Lot]."No. Lote");
        rstLinReparto.SetRange(Puerto, Matrix_Record[l_Lot].Puerto);
        if rstLinReparto.FindSet then begin

            //++Arbu 2020rstLinReparto.SETFILTER("Filtro Lote origen",rstLinReparto."No. Lote");
            rstLinReparto.CalcFields("Location code");
            Evaluate(rstLinReparto."Cantidad para Venta", l_QtyToSend);
            //++Arbu 2020IF rstLinReparto."Cantidad para Venta" > rstLinReparto."Location code" THEN
            Error('No puede enviar más de lo disponible en el stock.');
            Evaluate(rstLinReparto."Cantidad a enviar", l_QtyToSend);
            rstLinReparto.Modify;

        end
        else begin

            Clear(rstLinReparto);
            rstLinReparto := Rec;
            rstLinReparto."No. línea" := intLin + 10000;
            //++Arbu 2020rstLinReparto."No. Lote" := Matrix_Record[l_Lot]."No. Lote";
            rstLinReparto.Buque := Matrix_Record[l_Lot]."Global Dimension 1";
            rstLinReparto.Marea := Matrix_Record[l_Lot]."Global Dimension 3";
            rstLinReparto."Tipo movimiento" := rstLinReparto."Tipo movimiento"::Venta;
            Evaluate(rstLinReparto."Cantidad para Venta", l_QtyToSend);
            Evaluate(rstLinReparto."Cantidad a enviar", l_QtyToSend);
            //rstLinReparto.SETFILTER("Filtro Lote origen",rstLinReparto."No. Lote");
            //++Arbu 2020rstLinReparto.SETFILTER("Filtro departamento",Matrix_Record[l_Lot]."Global Dimension 1");
            //++Arbu 2020rstLinReparto.SETFILTER("Global dimension 3 filter",Matrix_Record[l_Lot]."Global Dimension 3");
            rstLinReparto.CalcFields("Location code");
            //++Arbu 2020
            //++Arbu 2020IF rstLinReparto."Cantidad para Venta" > rstLinReparto."Location code" THEN
            //++Arbu 2020  ERROR('No puede enviar más de lo disponible en el stock.');

            rstLinReparto.Puerto := Matrix_Record[l_Lot].Puerto;
            rstLinReparto."Cod. deposito" := Matrix_Record[l_Lot]."Cod. deposito";
            rstLinReparto.Buque := Matrix_Record[l_Lot]."Global Dimension 1";
            rstLinReparto.Marea := Matrix_Record[l_Lot]."Global Dimension 3";
            rstLinReparto.Actividad := Matrix_Record[l_Lot]."Global Dimension 1";
            rstLinReparto."Fecha ingreso" := Matrix_Record[l_Lot]."Fecha descarga";
            rstLinReparto.Insert;

        end;

        if rstLinReparto."Cantidad para Venta" = 0 then
            rstLinReparto.Delete;

        CurrPage.Update;

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

        if codLot <> '' then begin

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
                       (rstBuque."Use code" = rstBuque."Use code"::" ") or
                       (rstBuque."Use code" = rstBuque."Use code"::Cliente) then
                        strCabecera := rstPuerto.Code + ': ' + MatrixRecordIxL."Cod. deposito" + '     ' +
                                         Format(rstProy."Ending Date") + '         ' +
                                         DelChr(rstBuque.Name, '=', 'Buque Arbumasa ') + '-' + codMarea;

                    if /*(rstBuque."Use code" = rstBuque."Use code"::Cliente) OR*/
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

            end
            else begin

                Clear(rstMovProd2);
                Clear(rstBuque);
                rstMovProd2.SetCurrentKey("Item No.", "Lote origen", "Entry/Exit Point", "Entry Type", "Posting Date");
                rstMovProd2.SetFilter(rstMovProd2."Item No.", '<>%1', '');
                // rstMovProd2.SETRANGE("Entry/Exit Point",MatrixRecordIxL.Puerto);
                //rstMovProd2.SETRANGE("Lote origen",codLot);
                rstMovProd2.SetRange("Global Dimension 1 Code", codBuque);
                rstMovProd2.SetRange("Global dimension 3 Code", codMarea);
                rstMovProd2.SetRange("Location Code", MatrixRecordIxL."Cod. deposito");

                Clear(rstProy);
                rstProy.SetRange(rstProy."Global Dimension 1 Code", codBuque);
                rstProy.SetRange("Global Dimension 3 Code", codMarea);
                rstProy.SetRange(Tipo, rstProy.Tipo::Productivo);
                if rstProy.FindFirst then;

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
                           (rstBuque."Use code" = rstBuque."Use code"::" ") or
                           (rstBuque."Use code" = rstBuque."Use code"::Cliente)
                                      then
                            strCabecera := rstPuerto.Code + ': ' + MatrixRecordIxL."Cod. deposito" + '     ' +
                                             Format(rstProy."Ending Date") + '         ' +
                                             DelChr(rstBuque.Name, '=', 'Buque Arbumasa ') + '-' + codMarea;

                        if/* (rstBuque."Use code" = rstBuque."Use code"::Cliente) OR*/
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

        end;

    end;
}

