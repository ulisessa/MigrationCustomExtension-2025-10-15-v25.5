page 50510 "Grupos Seguridad"
{
    Caption = 'Grupos Seguridad';
    PageType = Card;
    SourceTable = Seguridad;
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            group(Seguridad)
            {
                Caption = 'Seguridad';
                field(Grupo; Grupo)
                {
                }
                field("Registrar - Enviar Pedidos"; "Registrar - Enviar Pedidos")
                {
                }
                field("Facturación Automática"; "Facturación Automática")
                {
                }
                field("Facturas vencidas"; "Facturas vencidas")
                {
                }
                field("Grupo Planilleras"; "Grupo Planilleras")
                {
                }
                field("Imputar a Proyectos Cerrados"; "Imputar a Proyectos Cerrados")
                {
                }
                field("Autorizar pago"; "Autorizar pago")
                {
                }
                field(Meta4; Meta4)
                {
                }
                field("Es lugar de Pago"; "Es lugar de Pago")
                {
                }
                field(Flota; Flota)
                {
                }
            }
            group("Aprobar/Modificar")
            {
                Caption = 'Aprobar/Modificar';
                field("Aprobar Pedidos"; "Aprobar Pedidos")
                {
                }
                field("Aprobar solicitudes"; "Aprobar solicitudes")
                {
                }
                field("Aprobar OC para recepción"; "Aprobar OC para recepción")
                {
                }
                field("Aprobar factura"; "Aprobar factura")
                {
                }
                field("Autorizar factura"; "Autorizar factura")
                {
                }
                field("Confirmar Líneas"; "Confirmar Líneas")
                {
                }
                field("Factura Venta - Registrar"; "Factura Venta - Registrar")
                {
                }
                field("Consumos sin stock"; "Consumos sin stock")
                {
                }
                field("Liquidación pagos en lote"; "Liquidación pagos en lote")
                {
                }
                field("Aprobar pago sin vincular"; "Aprobar pago sin vincular")
                {
                }
                field("Modificar Líneas Ajenas"; "Modificar Líneas Ajenas")
                {
                }
                field("Eliminar Líneas"; "Eliminar Líneas")
                {
                }
                field("Modificar solicitudes ajenas"; "Modificar solicitudes ajenas")
                {
                }
                field("Modificar rango registro"; "Modificar rango registro")
                {
                }
                field("Cambiar estado"; "Cambiar estado")
                {
                }
                field("Admite factura directa"; "Admite factura directa")
                {
                }
                field("Recurso de facturación directa"; "Recurso de facturación directa")
                {
                }
                field("Habilitar anticipos"; "Habilitar anticipos")
                {
                }
                field("Omitir validaciones WS-AFIP"; "Omitir validaciones WS-AFIP")
                {
                }
                field("Ignorar validación período inv"; "Ignorar validación período inv")
                {
                }
                field("Omitir controles impositivos"; "Omitir controles impositivos")
                {
                }
            }
            group(Anular)
            {
                Caption = 'Anular';
                field("Anular remitos de Compra"; "Anular remitos de Compra")
                {
                }
                field("Anular mov. producto"; "Anular mov. producto")
                {
                    Caption = 'Anular asientos contables';
                }
                field("Anular producción"; "Anular producción")
                {
                }
                field("Anular remito de venta"; "Anular remito de venta")
                {
                }
                field("Anular factura de venta"; "Anular factura de venta")
                {
                }
                field("Anular Vales de consumo"; "Anular Vales de consumo")
                {
                }
                field("Anular factura de compra"; "Anular factura de compra")
                {
                }
                field("Anular solicitud"; "Anular solicitud")
                {
                }
                field("Anular reparto de venta"; "Anular reparto de venta")
                {
                }
                field("Anular n/c de compra"; "Anular n/c de compra")
                {
                }
                field("Anular Descargas"; "Anular Descargas")
                {
                }
                field("Anular liquidación pagos"; "Anular liquidación pagos")
                {
                }
                field("Anular asientos contables"; "Anular asientos contables")
                {
                }
                field("Anular asientos proyecto"; "Anular asientos proyecto")
                {
                }
                field("Anular pase nómina"; "Anular pase nómina")
                {
                }
                field("Revertir mov. contabilidad"; "Revertir mov. contabilidad")
                {
                }
                field("Revertir lote movs. contab."; "Revertir lote movs. contab.")
                {
                }
            }
            group("Módulos")
            {
                Caption = 'Módulos';
                field(Contabilidad; Contabilidad)
                {
                }
                field("Ventas/Cobros"; "Ventas/Cobros")
                {
                }
                field("Compras/Pagos"; "Compras/Pagos")
                {
                }
                field(Existencias; Existencias)
                {
                }
                field("Producción"; Producción)
                {
                }
                field(Proyectos; Proyectos)
                {
                }
                field(Gerencia; Gerencia)
                {
                }
                field(Recursos; Recursos)
                {
                }
                field("Activos fijos"; "Activos fijos")
                {
                }
                field("Documentación"; Documentación)
                {
                }
                field(Asistencia; Asistencia)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Ve&r")
            {
                Caption = 'Ve&r';
                action("Relación seguridad")
                {
                    Caption = 'Relación seguridad';
                    RunObject = Page "Lista relación grupo seguridad";
                }
                action("Documentos por grupo")
                {
                    Caption = 'Documentos por grupo';
                    RunObject = Page "Lista documentos por grupo";
                    RunPageLink = Grupo = FIELD(Grupo);
                }
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    var
        TrackingSpec: Record "Tracking Specification";
        WMSManagement: Codeunit "WMS Management";
        AlreadyDeleted: Boolean;
    begin
    end;

    trigger OnModifyRecord(): Boolean
    var
        xTempTrackingSpec: Record "Tracking Specification" temporary;
    begin
    end;

    var
        xTempItemTrackingLine: Record "Tracking Specification" temporary;
        TotalItemTrackingLine: Record "Tracking Specification";
        TempItemTrackLineInsert: Record "Tracking Specification" temporary;
        TempItemTrackLineModify: Record "Tracking Specification" temporary;
        TempItemTrackLineDelete: Record "Tracking Specification" temporary;
        TempItemTrackLineReserv: Record "Tracking Specification" temporary;
        Item: Record Item;
        ItemTrackingCode: Record "Item Tracking Code";
        TempReservEntry: Record "Reservation Entry" temporary;
        NoSeriesMgt: Codeunit "No. Series";
        ItemTrackingMgt: Codeunit "Item Tracking Management";
        ReservEngineMgt: Codeunit "Reservation Engine Mgt.";
        ItemTrackingDataCollection: Codeunit "Item Tracking Data Collection";
        UndefinedQtyArray: array[3] of Decimal;
        SourceQuantityArray: array[15] of Decimal;
        QtyPerUOM: Decimal;
        QtyToAddAsBlank: array[3] of Decimal;
        CurrentSignFactor: Integer;
        Text002: Label 'Quantity must be %1.';
        Text003: Label 'negative';
        Text004: Label 'positive';
        LastEntryNo: Integer;
        CurrentSourceType: Integer;
        ExpectedReceiptDate: Date;
        ShipmentDate: Date;
        Text005: Label 'Error when writing to database.';
        Text006: Label 'The corrections cannot be saved as excess quantity has been defined.\Close the form anyway?';
        Text007: Label 'Another user has modified the item tracking data since it was retrieved from the database.\Start again.';
        CurrentEntryStatus: Option Reservation,Tracking,Surplus,Prospect;
        FormRunMode: Option ,Reclass,"Combined Ship/Rcpt","Drop Shipment",Transfer;
        InsertIsBlocked: Boolean;
        Text008: Label 'The quantity to create must be an integer.';
        Text009: Label 'The quantity to create must be positive.';
        Text011: Label 'Tracking specification with Serial No. %1 and Lot No. %2 already exists.';
        Text012: Label 'Tracking specification with Serial No. %1 already exists.';
        Text013: Label 'The string %1 contains no number and cannot be incremented.';
        DeleteIsBlocked: Boolean;
        Text014: Label 'The total item tracking quantity %1 exceeds the %2 quantity %3.\The changes cannot be saved to the database.';
        Text015: Label 'Do you want to synchronize item tracking on the line with item tracking on the related drop shipment %1?';
        BlockCommit: Boolean;
        IsCorrection: Boolean;
        CurrentFormIsOpen: Boolean;
        CalledFromSynchWhseItemTrkg: Boolean;
        SNAvailabilityActive: Boolean;
        LotAvailabilityActive: Boolean;
        Inbound: Boolean;
        CurrentSourceCaption: Text[255];
        CurrentSourceRowID: Text[100];
        SecondSourceRowID: Text[100];
        Text016: Label 'purchase order line';
        Text017: Label 'sales order line';
        Text018: Label 'Saving item tracking line changes';
        ForBinCode: Code[20];
        Text019: Label 'There are availability warnings on one or more lines.\Close the form anyway?';
        Text020: Label 'Placeholder';
        IsPick: Boolean;

        ApplFromItemEntryVisible: Boolean;

        ApplToItemEntryVisible: Boolean;

        "Item No.Editable": Boolean;

        "Variant CodeEditable": Boolean;

        "Location CodeEditable": Boolean;

        Handle1Visible: Boolean;

        Handle2Visible: Boolean;

        Handle3Visible: Boolean;

        "Qty. to Handle (Base)Visible": Boolean;

        Invoice1Visible: Boolean;

        Invoice2Visible: Boolean;

        Invoice3Visible: Boolean;

        "Qty. to Invoice (Base)Visible": Boolean;

        "New Serial No.Visible": Boolean;

        "New Lot No.Visible": Boolean;

        "New Expiration DateVisible": Boolean;

        ButtonLineReclassVisible: Boolean;

        ButtonLineVisible: Boolean;

        FunctionsSupplyVisible: Boolean;

        FunctionsDemandVisible: Boolean;
        InboundIsSet: Boolean;

        "Qty. to Handle (Base)Editable": Boolean;

        "Qty. to Invoice (Base)Editable": Boolean;

        "Quantity (Base)Editable": Boolean;

        "Serial No.Editable": Boolean;

        "Lot No.Editable": Boolean;

        DescriptionEditable: Boolean;

        "New Serial No.Editable": Boolean;

        "New Lot No.Editable": Boolean;

        "New Expiration DateEditable": Boolean;

        "Expiration DateEditable": Boolean;

        "Warranty DateEditable": Boolean;
        ExcludePostedEntries: Boolean;
        ProdOrderLineHandling: Boolean;
        decBlank: array[3] of Decimal;

    [Scope('OnPrem')]
    procedure SetFormRunMode(Mode: Option ,Reclass,"Combined Ship/Rcpt","Drop Shipment")
    begin
    end;

    [Scope('OnPrem')]
    procedure SetSource(TrackingSpecification: Record "Tracking Specification"; AvailabilityDate: Date)
    var
        ReservEntry: Record "Reservation Entry";
        TempTrackingSpecification: Record "Tracking Specification" temporary;
        TempTrackingSpecification2: Record "Tracking Specification" temporary;
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        Controls: Option Handle,Invoice,Quantity,Reclass,LotSN;
    begin
    end;

    [Scope('OnPrem')]
    procedure SetSecondSourceQuantity(SecondSourceQuantityArray: array[3] of Decimal)
    var
        Controls: Option Handle,Invoice;
    begin
    end;

    [Scope('OnPrem')]
    procedure SetSecondSourceRowID(RowID: Text[100])
    begin
    end;

    local procedure AddReservEntriesToTempRecSet(var ReservEntry: Record "Reservation Entry"; var TempTrackingSpecification: Record "Tracking Specification" temporary; SwapSign: Boolean; Color: Integer)
    begin
    end;

    local procedure AddToGlobalRecordSet(var TempTrackingSpecification: Record "Tracking Specification" temporary)
    var
        ExpDate: Date;
        EntriesExist: Boolean;
    begin
    end;

    local procedure SetControls(Controls: Option Handle,Invoice,Quantity,Reclass,LotSN; SetAccess: Boolean)
    begin
    end;

    local procedure GetItem(ItemNo: Code[20])
    begin
    end;

    local procedure SetFilters(TrackingSpecification: Record "Tracking Specification")
    begin
    end;

    local procedure CheckLine(TrackingLine: Record "Tracking Specification"): Boolean
    begin
    end;

    local procedure CalculateSums()
    var
        xTrackingSpec: Record "Tracking Specification";
    begin
    end;

    local procedure UpdateUndefinedQty(): Boolean
    begin
    end;

    local procedure UpdateUndefinedQtyArray()
    begin
    end;

    local procedure TempRecIsValid() OK: Boolean
    var
        ReservEntry: Record "Reservation Entry";
        RecordCount: Integer;
        IdenticalArray: array[2] of Boolean;
    begin
    end;

    local procedure EntriesAreIdentical(var ReservEntry1: Record "Reservation Entry"; var ReservEntry2: Record "Reservation Entry"; var IdenticalArray: array[2] of Boolean): Boolean
    begin
    end;

    local procedure QtyToHandleAndInvoiceChanged(var ReservEntry1: Record "Reservation Entry"; var ReservEntry2: Record "Reservation Entry"): Boolean
    begin
    end;

    local procedure NextEntryNo(): Integer
    begin
    end;

    local procedure WriteToDatabase()
    var
        Window: Dialog;
        ChangeType: Option Insert,Modify,Delete;
        EntryNo: Integer;
        NoOfLines: Integer;
        i: Integer;
        ModifyLoop: Integer;
        Decrease: Boolean;
    begin
    end;

    local procedure RegisterChange(var OldTrackingSpecification: Record "Tracking Specification"; var NewTrackingSpecification: Record "Tracking Specification"; ChangeType: Option Insert,Modify,FullDelete,PartDelete,ModifyAll; ModifySharedFields: Boolean) OK: Boolean
    var
        ReservEntry1: Record "Reservation Entry";
        ReservEntry2: Record "Reservation Entry";
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        ReservationMgt: Codeunit "Reservation Management";
        QtyToAdd: array[3] of Decimal;
        LostReservQty: array[3] of Decimal;
        IdenticalArray: array[2] of Boolean;
        decQty: array[3] of Decimal;
    begin
    end;

    local procedure UpdateOrderTracking()
    var
        TempReservEntry: Record "Reservation Entry" temporary;
    begin
    end;

    [Scope('OnPrem')]
    procedure ModifyFieldsWithinFilter(var ReservEntry1: Record "Reservation Entry"; var TrackingSpecification: Record "Tracking Specification")
    begin
    end;

    local procedure SetQtyToHandleAndInvoice(TrackingSpecification: Record "Tracking Specification") OK: Boolean
    var
        ReservEntry1: Record "Reservation Entry";
        ReservationMgt: Codeunit "Reservation Management";
        TotalQtyToHandle: Decimal;
        TotalQtyToInvoice: Decimal;
        QtyAlreadyHandledToInvoice: Decimal;
        QtyToHandleThisLine: Decimal;
        QtyToInvoiceThisLine: Decimal;
    begin
    end;

    local procedure CollectPostedTransferEntries(TrackingSpecification: Record "Tracking Specification"; var TempTrackingSpecification: Record "Tracking Specification" temporary)
    var
        ItemEntryRelation: Record "Item Entry Relation";
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
    end;

    local procedure CollectPostedAssemblyEntries(TrackingSpecification: Record "Tracking Specification"; var TempTrackingSpecification: Record "Tracking Specification" temporary)
    var
        ItemEntryRelation: Record "Item Entry Relation";
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
    end;

    local procedure CollectPostedOutputEntries(TrackingSpecification: Record "Tracking Specification"; var TempTrackingSpecification: Record "Tracking Specification" temporary)
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        ProdOrderRoutingLine: Record "Prod. Order Routing Line";
        BackwardFlushing: Boolean;
    begin
    end;

    local procedure ZeroLineExists() OK: Boolean
    var
        xTrackingSpec: Record "Tracking Specification";
    begin
    end;

    local procedure AssignSerialNo()
    var
        EnterQuantityToCreate: Page "Enter Quantity to Create";
        QtyToCreate: Decimal;
        QtyToCreateInt: Integer;
        CreateLotNo: Boolean;
    begin
    end;

    local procedure AssignSerialNoBatch(QtyToCreate: Integer; CreateLotNo: Boolean)
    var
        i: Integer;
    begin
    end;

    local procedure AssignLotNo()
    var
        QtyToCreate: Decimal;
    begin
    end;

    local procedure CreateCustomizedSN()
    var
        EnterCustomizedSN: Page "Enter Customized SN";
        QtyToCreate: Decimal;
        QtyToCreateInt: Integer;
        Increment: Integer;
        CreateLotNo: Boolean;
        CustomizedSN: Code[20];
    begin
    end;

    local procedure CreateCustomizedSNBatch(QtyToCreate: Decimal; CreateLotNo: Boolean; CustomizedSN: Code[20]; Increment: Integer)
    var
        i: Integer;
        Counter: Integer;
    begin
    end;

    local procedure TestTempSpecificationExists() Exists: Boolean
    var
        TempSpecification: Record "Tracking Specification" temporary;
    begin
    end;

    local procedure QtySignFactor(): Integer
    begin
    end;

    [Scope('OnPrem')]
    procedure RegisterItemTrackingLines(SourceSpecification: Record "Tracking Specification"; AvailabilityDate: Date; var TempSpecification: Record "Tracking Specification" temporary)
    begin
    end;

    [Scope('OnPrem')]
    procedure SynchronizeLinkedSources(DialogText: Text[250]): Boolean
    begin
    end;

    [Scope('OnPrem')]
    procedure SetBlockCommit(NewBlockCommit: Boolean)
    begin
    end;

    [Scope('OnPrem')]
    procedure TempItemTrackingDef(NewTrackingSpecification: Record "Tracking Specification")
    begin
    end;

    [Scope('OnPrem')]
    procedure SetCalledFromSynchWhseItemTrkg(CalledFromSynchWhseItemTrkg2: Boolean)
    begin
    end;

    [Scope('OnPrem')]
    procedure ModifyTrackingSpecification(NewTrackingSpecification: Record "Tracking Specification")
    var
        CrntTempTrackingSpec: Record "Tracking Specification" temporary;
    begin
    end;

    local procedure UpdateExpDateColor()
    begin
    end;

    local procedure UpdateExpDateEditable()
    begin
    end;

    [Scope('OnPrem')]
    procedure LookupAvailable(LookupMode: Option "Serial No.","Lot No.")
    begin
    end;

    [Scope('OnPrem')]
    procedure F6LookupAvailable()
    begin
    end;

    [Scope('OnPrem')]
    procedure LotSnAvailable(var TrackingSpecification: Record "Tracking Specification"; LookupMode: Option "Serial No.","Lot No."): Boolean
    begin
    end;

    [Scope('OnPrem')]
    procedure SelectEntries()
    var
        xTrackingSpec: Record "Tracking Specification";
        MaxQuantity: array[3] of Decimal;
    begin
    end;

    [Scope('OnPrem')]
    procedure ReserveItemTrackingLine()
    var
        LateBindingMgt: Codeunit "Late Binding Management";
    begin
    end;

    [Scope('OnPrem')]
    procedure ReestablishReservations()
    var
        LateBindingMgt: Codeunit "Late Binding Management";
    begin
    end;

    [Scope('OnPrem')]
    procedure SetInbound(NewInbound: Boolean)
    begin
    end;

    [Scope('OnPrem')]
    procedure SetPick(IsPick2: Boolean)
    begin
    end;

    local procedure SerialNoOnAfterValidate()
    begin
    end;

    local procedure LotNoOnAfterValidate()
    begin
    end;

    local procedure QuantityBaseOnAfterValidate()
    begin
    end;

    local procedure QuantityBaseOnValidate()
    begin
    end;

    local procedure QtytoHandleBaseOnAfterValidate()
    begin
    end;

    local procedure QtytoInvoiceBaseOnAfterValidat()
    begin
    end;

    local procedure ExpirationDateOnFormat()
    begin
    end;

    local procedure ChangeAlreadyNonSpecificReservations(var TempTrackingSpecification: Record "Tracking Specification" temporary; QuantityBase: Decimal): Boolean
    var
        ReservEntry: Record "Reservation Entry";
        ReservEntry2: Record "Reservation Entry";
        RemainingQtyBase: Decimal;
        EntryNo: Integer;
    begin
    end;

    local procedure TransferToNewReservation(ReservEntry: Record "Reservation Entry"; QtyBase: Decimal; EntryNo: Integer): Integer
    var
        ReservEntry2: Record "Reservation Entry";
        SignFactor: Integer;
    begin
    end;

    [Scope('OnPrem')]
    procedure CompareToReservationEntry(TempTrackingSpecification: Record "Tracking Specification" temporary; var ReservEntry: Record "Reservation Entry"; EntryNo: Integer; Pos: Boolean): Boolean
    begin
    end;

    [Scope('OnPrem')]
    procedure ModifyReservationEntry(var ReservEntry: Record "Reservation Entry"; SerialNo: Code[20]; LotNo: Code[20]; QuantityBase: Decimal)
    begin
    end;

    local procedure TempRecValid()
    begin
    end;

    local procedure GetHandleSource(TrackingSpecification: Record "Tracking Specification"): Boolean
    var
        QtyToHandleColumnIsHidden: Boolean;
    begin
    end;

    local procedure GetInvoiceSource(TrackingSpecification: Record "Tracking Specification"): Boolean
    var
        QtyToInvoiceColumnIsHidden: Boolean;
    begin
    end;
}

