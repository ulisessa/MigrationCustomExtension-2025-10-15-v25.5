page 50671 "Form Liquidación Pagos"
{
    DelayedInsert = false;
    PageType = Card;
    Permissions = TableData "Cab. Liquidacion Pagos" = rimd,
                  TableData "Lín. Liquidacion Pagos" = rimd;
    PromotedActionCategories = 'New,Process,Reports,Actions';
    RefreshOnActivate = true;
    SourceTable = "Cab. Liquidacion Pagos";
    ApplicationArea = All;
    UsageCategory = Administration;    

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No. Liquidacion"; "No. Liquidacion")
                {
                }
                field(Estado; Estado)
                {
                    Editable = false;
                }
                field("Nombre Libro Diario"; "Nombre Libro Diario")
                {
                    Caption = 'Libro Diario Pagos';
                }
                field("Nombre Sección Diario"; "Nombre Sección Diario")
                {
                    Caption = 'Sección Diario Pagos';
                }
                field(Importe; Importe)
                {

                    trigger OnDrillDown()
                    var
                        frmMovLiq: Page "Movs. liquidación pagos";
                        rstMovLiq: Record "Lín. Liquidacion Pagos";
                    begin
                    end;
                }
                field(Usuario; Usuario)
                {
                    Editable = false;
                }
                field("Pago mediante"; "Pago mediante")
                {
                }
                field("Cód. medio de pago"; "Cód. medio de pago")
                {
                }
                field("Fecha pago"; "Fecha pago")
                {
                }
                field("Primer No. cheque"; "Primer No. cheque")
                {
                }
                field(PeriodType; PeriodType)
                {
                    Caption = 'Tipo período';
                    
                    trigger OnValidate()
                    begin
                        DateFilter := EstablecerFiltros;
                        SetColumns(SetWanted::Inicial);
                    end;
                }
                field(ColumnSet; ColumnSet)
                {
                    Caption = 'Column Set';
                }
            }
            part(SubFormMatrix; "Subpage liq. pagos")
            {
                SubPageView = SORTING("Vendor No.", "Posting Date", "Currency Code");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Registro)
            {
                Caption = 'Registro';
                Visible = RegistroVisible;
                action("&Registrar")
                {
                    Caption = '&Registrar';
                    Image = Post;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    begin
                        TestField("Nombre Libro Diario");
                        TestField("Nombre Sección Diario");

                        Clear(cduRegistrarLiq);
                        cduRegistrarLiq.fntInsertarPago("No. Liquidacion", "Nombre Libro Diario", "Nombre Sección Diario");

                        Clear(rstCabLiq);
                        rstCabLiq.SetRange("No. Liquidacion", "No. Liquidacion");
                        rstCabLiq.FindSet;

                        rstCabLiq.Delete;
                    end;
                }
                action("Registrar e &Imprimir")
                {
                    Caption = 'Registrar e &Imprimir';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction()
                    begin
                        TestField("Nombre Libro Diario");
                        TestField("Nombre Sección Diario");

                        Clear(cduRegistrarLiq);
                        cduRegistrarLiq.fntInsertarPago("No. Liquidacion", "Nombre Libro Diario", "Nombre Sección Diario");

                        Clear(rptLiq);
                        Clear(rstCabLiq);
                        rstCabLiq.SetRange("No. Liquidacion", "No. Liquidacion");
                        rptLiq.SetTableView(rstCabLiq);
                        rptLiq.UseRequestPage(false);
                        rptLiq.Run;

                        rstCabLiq.FindSet;

                        rstCabLiq.Delete;
                    end;
                }
            }
        }
        area(processing)
        {
            action("&Cambiar estado")
            {
                Caption = '&Cambiar estado';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Clear(rstSeguridad);
                    Clear(rstSeguridadUsuario);
                    Clear(frmCambiarEstado);
                    Clear(rstSeguridadCambioEstado);

                    rstSeguridadCambioEstado.SetRange(rstSeguridadCambioEstado.Usuario, UserId);
                    rstSeguridadCambioEstado.SetRange("Tipo documento", Text001);
                    rstSeguridadCambioEstado.SetRange("Estado original", Estado);
                    if rstSeguridadCambioEstado.Find('-') then;

                    Clear(rstMensajeria);
                    rstMensajeria.SetRange(rstMensajeria."No. documento", "No. Liquidacion");
                    if rstMensajeria.Find('-') then begin

                        //rstMensajeria.MARKEDONLY(TRUE);
                        PAGE.RunModal(PAGE::"Cambiar estado documento", rstMensajeria);

                    end;
                end;
            }
            action("&Imprimir")
            {
                Caption = '&Imprimir';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Clear(rptLiq);
                    Clear(rstCabLiq);
                    rstCabLiq.SetRange("No. Liquidacion", "No. Liquidacion");
                    rptLiq.SetTableView(rstCabLiq);
                    rptLiq.RunModal;
                end;
            }
            action("&Imprimir c/saldo")
            {
                Caption = '&Imprimir c/saldo';
                Image = Print;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Clear(rptSLiq);
                    Clear(rstCabLiq);
                    rstCabLiq.SetRange("No. Liquidacion", "No. Liquidacion");
                    rptSLiq.SetTableView(rstCabLiq);
                    rptSLiq.RunModal;
                end;
            }
            separator(Action1000000013)
            {
            }
            action("Período anterior")
            {
                Image = PreviousSet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SetColumns(SetWanted::Anterior);
                end;
            }
            action("Período siguiente")
            {
                Image = NextSet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SetColumns(SetWanted::Siguiente);
                end;
            }
            separator(Action1000000009)
            {
            }
            action(Actualizar)
            {

                trigger OnAction()
                begin
                    SetColumns(SetWanted::Inicial);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.SubFormMatrix.PAGE.LiquidacionPago("No. Liquidacion", PeriodType, datInicial, datFinal);
    end;

    trigger OnAfterGetRecord()
    begin
        CurrPage.SubFormMatrix.PAGE.LiquidacionPago("No. Liquidacion", PeriodType, datInicial, datFinal);
    end;

    trigger OnInit()
    begin
        AccionesRegistroVisible := true;
        AccionesVisible := true;
        RegistroVisible := true;
    end;

    trigger OnOpenPage()
    begin
        PeriodType := PeriodType::Week;
        SetColumns(SetWanted::Inicial);

        if CurrPage.Editable then begin

            RegistroVisible := true;
            AccionesVisible := false;
            AccionesRegistroVisible := true;

        end
        else begin

            RegistroVisible := false;
            AccionesVisible := true;
            AccionesRegistroVisible := false;

        end;
    end;

    var
        MatrixRecord: array[12] of Record Date;
        datFecha: Date;
        rstSeccion: Record "Gen. Journal Batch";
        rptLiq: Report "Liquidación pago proveedores";
        rstCabLiq: Record "Cab. Liquidacion Pagos";
        cduRegistrarLiq: Codeunit "Liquidación proveedores";
        rstSeguridad: Record Seguridad;
        rstConfUsu: Record "User Setup";
        rstMovProv: Record "Vendor Ledger Entry";
        Text001: Label 'Liquidación Pagos';
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstSeguridadCambioEstado: Record "Seguridad cambio estados";
        rstMensajeria: Record Mensajeria;

        RegistroVisible: Boolean;

        AccionesVisible: Boolean;

        AccionesRegistroVisible: Boolean;
        frmSeccion: Page "General Journal Batches";
        frmCambiarEstado: Page "Cambiar estado documento";
        MATRIX_MatrixRecords: array[32] of Record "Dimension Code Buffer";
        MATRIX_CaptionSet: array[32] of Text[80];
        MATRIX_CaptionRange: Text[80];
        FirstColumn: Text;
        LastColumn: Text;
        MATRIX_PrimKeyFirstCaptionInCu: Text[80];
        MATRIX_CurrentNoOfColumns: Integer;
        MATRIX_Step: Option Initial,Previous,Same,Next,PreviousColumn,NextColumn;
        PeriodType: Enum "Analysis Period Type";
        DateFilter: Text[30];

        PeriodTypeEnable: Boolean;
        ColumnSet: Text[1024];
        SetWanted: Option Inicial,Anterior,Siguiente,Igual,ColumnaAnterior,SiguienteColumna;
        MATRIX_ColumnCaptionSet: array[12] of Text[1024];
        MATRIX_ColumnCaptions: array[12] of Text[1024];
        PKFirstRecSet: Text[1024];
        ColumnSetLength: Integer;
        datInicial: Date;
        datFinal: Date;
        codFiltroLugarPago: Option " ",BUE,CRV,PD;
        rptSLiq: Report "Saldos vs liquidacion";

    [Scope('OnPrem')]
    procedure SetColumns(SetWanted: Option Inicial,Anterior,Siguiente,Igual,ColumnaAnterior,SiguienteColumna)
    var
        MatrixMgt: Codeunit "Matrix Management";
    begin
        DateFilter := EstablecerFiltros;
        //PeriodType := PeriodType::Semana;
        MatrixMgt.GeneratePeriodMatrixData(SetWanted, ArrayLen(MATRIX_ColumnCaptionSet), true, PeriodType, DateFilter, PKFirstRecSet, MATRIX_ColumnCaptions, ColumnSet, ColumnSetLength, MatrixRecord);
        //CurrPage.SubFormMatrix.PAGE.LiquidacionPago("No. Liquidacion",PeriodType,datInicial,datFinal);
        CurrPage.SubFormMatrix.PAGE.SetMatrixData(MATRIX_ColumnCaptions, MatrixRecord, DateFilter, ColumnSetLength);
        CurrPage.Update(false);
    end;

    [Scope('OnPrem')]
    procedure EstablecerFiltros(): Text[1024]
    var
        rstDate: Record Date;
        rstPSetup: Record "Purchases & Payables Setup";
    begin
        Clear(rstPSetup);
        rstPSetup.Get();
        datInicial := CalcDate(rstPSetup."Application formula", WorkDate);

        Clear(rstDate);
        rstDate.SetRange("Period Type", PeriodType);
        rstDate.SetRange("Period Start", 0D, datInicial);
        rstDate.FindLast;

        datInicial := rstDate."Period Start";

        Clear(rstDate);
        rstDate.SetRange("Period Type", PeriodType);
        rstDate.SetFilter("Period Start", '>=%1&<=%2', datInicial, CalcDate('<+200W>', datInicial));
        rstDate.FindLast;

        datFinal := NormalDate(rstDate."Period End");

        Clear(rstDate);
        rstDate.SetRange("Period Type", PeriodType);
        rstDate.SetFilter("Period Start", '>=%1', datInicial);
        rstDate.SetFilter("Period End", '<=%1', datFinal);
        rstDate.FindFirst;

        CurrPage.SubFormMatrix.PAGE.LiquidacionPago("No. Liquidacion", PeriodType, datInicial, datFinal);

        exit(Format(datInicial) + '..' + Format(datFinal));
    end;
}

