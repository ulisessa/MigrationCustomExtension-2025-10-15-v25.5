page 50596 "Matriz diario capturas"
{
    Caption = 'Budget Matrix';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = "Integer";
    SourceTableView = WHERE(Number = CONST(1));

    layout
    {
        area(content)
        {
            repeater(Control1000000026)
            {
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Columns;
                ShowCaption = false;
                field("'Buques'"; 'Buques')
                {
                }
                field("'Pesca'"; 'Pesca')
                {
                }
                field("'Apellidos y Nombres'"; 'Apellidos y Nombres')
                {
                }
                field("'Inicio de Marea'"; 'Inicio de Marea')
                {
                }
                field("'Marea No.'"; 'Marea No.')
                {
                }
                field("'L-1'"; 'L-1')
                {
                }
                field("'L-2'"; 'L-2')
                {
                }
                field("'L-3'"; 'L-3')
                {
                }
                field("'L-4'"; 'L-4')
                {
                }
                field("'L-5'"; 'L-5')
                {
                }
                field("'C-1'"; 'C-1')
                {
                }
                field("'C-2'"; 'C-2')
                {
                }
                field("'C-3'"; 'C-3')
                {
                }
                field("'C-R'"; 'C-R')
                {
                }
            }
            repeater(Control1000000001)
            {
                ShowCaption = false;
                field("'Arbumasa I'"; 'Arbumasa I')
                {
                }
                field("'Arbumasa X'"; 'Arbumasa X')
                {
                }
                field("'Arbumasa XIV'"; 'Arbumasa XIV')
                {
                }
                field("'Arbumasa XV'"; 'Arbumasa XV')
                {
                }
                field("'Arbumasa XVI'"; 'Arbumasa XVI')
                {
                }
                field("'Arbumasa XVII'"; 'Arbumasa XVII')
                {
                }
                field("'Arbumasa XVIII'"; 'Arbumasa XVIII')
                {
                }
                field("'Arbumasa XIX'"; 'Arbumasa XIX')
                {
                }
            }
            repeater(Control1000000017)
            {
                ShowCaption = false;
                field(Control1000000016; 'Arbumasa I')
                {
                }
                field(Control1000000015; 'Arbumasa X')
                {
                }
                field(Control1000000014; 'Arbumasa XIV')
                {
                }
                field(Control1000000013; 'Arbumasa XV')
                {
                }
                field(Control1000000012; 'Arbumasa XVI')
                {
                }
                field(Control1000000011; 'Arbumasa XVII')
                {
                }
                field(Control1000000010; 'Arbumasa XVIII')
                {
                }
                field(Control1000000009; 'Arbumasa XIX')
                {
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
        for i := 1 to Matrix_ColumnCount do begin

            MATRIX_OnAfterGetRecord(i);
            /*
IF MATRIX_Caption[i] <> '' THEN
BEGIN
MATRIX_CaptionSet[i] := GetTitle(MATRIX_Caption[i],Matrix_Record[i]);
END
ELSE
BEGIN
MATRIX_CaptionSet[i] := '';
END;
             */
        end;

    end;

    trigger OnOpenPage()
    var
        GLAcc: Record "G/L Account";
    begin
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
        rstGLS: Record "General Ledger Setup";
        rstDV: Record "Dimension Value";
    begin
        //MESSAGE('%1',MATRIX_CaptionSet[ColumnID]);
        //MESSAGE('%1',MATRIX_CaptionSetTitle[ColumnID]);

        //message('%1',ColumnID);

        //MATRIX_CellData[ColumnID+20] := 0;
        MATRIX_CellData[ColumnID] := 0;

        if (MATRIX_Caption[ColumnID] <> '') then begin

            case ColumnID of
                1:
                    begin

                        Clear(rstGLS);
                        rstGLS.Get();
                        Clear(rstDV);
                        rstDV.SetRange("Dimension Code", rstGLS."Global Dimension 1 Code");
                        if rstDV.FindSet then
                            repeat

                                i += 1;
                            //MATRIX_CellData[ColumnID] := rstDV.Name;

                            until i = ColumnID;

                        MATRIX_CaptionSet[ColumnID] := rstDV.Name;//GetTitle(MATRIX_Caption[ColumnID],Matrix_Record[ColumnID]);

                    end;
                2:
                    begin

                        Clear(rstGLS);
                        rstGLS.Get();
                        Clear(rstDV);
                        rstDV.SetRange("Dimension Code", rstGLS."Global Dimension 1 Code");
                        if rstDV.FindSet then
                            repeat

                                i += 1;
                            //MATRIX_CellData[ColumnID] := rstDV.Name;

                            until i = ColumnID;

                        MATRIX_CaptionSet[ColumnID] := rstDV.Name;//GetTitle(MATRIX_Caption[ColumnID],Matrix_Record[ColumnID]);

                    end;
                3:
                    begin

                        Clear(rstGLS);
                        rstGLS.Get();
                        Clear(rstDV);
                        rstDV.SetRange("Dimension Code", rstGLS."Global Dimension 1 Code");
                        if rstDV.FindSet then
                            repeat

                                i += 1;
                            //MATRIX_CellData[ColumnID] := rstDV.Name;

                            until i = ColumnID;

                        MATRIX_CaptionSet[ColumnID] := rstDV.Name;//GetTitle(MATRIX_Caption[ColumnID],Matrix_Record[ColumnID]);

                    end;
                4:
                    begin

                        Clear(rstGLS);
                        rstGLS.Get();
                        Clear(rstDV);
                        rstDV.SetRange("Dimension Code", rstGLS."Global Dimension 1 Code");
                        if rstDV.FindSet then
                            repeat

                                i += 1;
                            //MATRIX_CellData[ColumnID] := rstDV.Name;

                            until i = ColumnID;

                        MATRIX_CaptionSet[ColumnID] := rstDV.Name;//GetTitle(MATRIX_Caption[ColumnID],Matrix_Record[ColumnID]);

                    end;
                5:
                    begin

                        Clear(rstGLS);
                        rstGLS.Get();
                        Clear(rstDV);
                        rstDV.SetRange("Dimension Code", rstGLS."Global Dimension 1 Code");
                        if rstDV.FindSet then
                            repeat

                                i += 1;
                            //MATRIX_CellData[ColumnID] := rstDV.Name;

                            until i = ColumnID;

                        MATRIX_CaptionSet[ColumnID] := rstDV.Name;//GetTitle(MATRIX_Caption[ColumnID],Matrix_Record[ColumnID]);

                    end;
                6:
                    begin

                        Clear(rstGLS);
                        rstGLS.Get();
                        Clear(rstDV);
                        rstDV.SetRange("Dimension Code", rstGLS."Global Dimension 1 Code");
                        if rstDV.FindSet then
                            repeat

                                i += 1;
                            //MATRIX_CellData[ColumnID] := rstDV.Name;

                            until i = ColumnID;

                        MATRIX_CaptionSet[ColumnID] := rstDV.Name;//GetTitle(MATRIX_Caption[ColumnID],Matrix_Record[ColumnID]);

                    end;
                7:
                    begin

                        Clear(rstGLS);
                        rstGLS.Get();
                        Clear(rstDV);
                        rstDV.SetRange("Dimension Code", rstGLS."Global Dimension 1 Code");
                        if rstDV.FindSet then
                            repeat

                                i += 1;
                            //MATRIX_CellData[ColumnID] := rstDV.Name;

                            until i = ColumnID;

                        MATRIX_CaptionSet[ColumnID] := rstDV.Name;//GetTitle(MATRIX_Caption[ColumnID],Matrix_Record[ColumnID]);

                    end;
                8:
                    begin

                        Clear(rstGLS);
                        rstGLS.Get();
                        Clear(rstDV);
                        rstDV.SetRange("Dimension Code", rstGLS."Global Dimension 1 Code");
                        if rstDV.FindSet then
                            repeat

                                i += 1;
                            //MATRIX_CellData[ColumnID] := rstDV.Name;

                            until i = ColumnID;

                        MATRIX_CaptionSet[ColumnID] := rstDV.Name;//GetTitle(MATRIX_Caption[ColumnID],Matrix_Record[ColumnID]);

                    end;
                9:
                    begin

                        Clear(rstGLS);
                        rstGLS.Get();
                        Clear(rstDV);
                        rstDV.SetRange("Dimension Code", rstGLS."Global Dimension 1 Code");
                        if rstDV.FindSet then
                            repeat

                                i += 1;
                            //MATRIX_CellData[ColumnID] := rstDV.Name;

                            until i = ColumnID;

                        MATRIX_CaptionSet[ColumnID] := rstDV.Name;//GetTitle(MATRIX_Caption[ColumnID],Matrix_Record[ColumnID]);

                    end;
                10:
                    begin

                        Clear(rstGLS);
                        rstGLS.Get();
                        Clear(rstDV);
                        rstDV.SetRange("Dimension Code", rstGLS."Global Dimension 1 Code");
                        if rstDV.FindSet then
                            repeat

                                i += 1;
                            //MATRIX_CellData[ColumnID] := rstDV.Name;

                            until i = ColumnID;

                        MATRIX_CaptionSet[ColumnID] := rstDV.Name;//GetTitle(MATRIX_Caption[ColumnID],Matrix_Record[ColumnID]);

                    end;
            end;

            if MATRIX_CellData[ColumnID] < 0 then
                MATRIX_CellData[ColumnID] := 0;

        end;
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

    end;
}

