table 50511 Solicitud
{
    // IBdos Argentina - USS - 111102 - Adicion Arbumasa
    // 
    // IBdos Argentina - USS - 261202 - Modificacion Arbumasa
    //  a) Ampliacion del campo "No. documento" a Code 20
    // 
    // IBdos Argentina - USS - 220503 - Modificacion Arbumasa
    //  a) Agregué el codigo de seguimiento de documentos en la tabla, estaba
    //     anteriormente en el formulario
    // 
    // IBdos Argentina - USS - 240603 - Modificacion Arbumasa
    //  a) Solo puede modificar la solicitud un usuario del mismo grupo de seguridad

    Caption = 'Solicitud';
    DataCaptionFields = "No. documento", "Nombre Libro Solicitud";

    fields
    {
        field(1; "Nombre Libro Solicitud"; Code[10])
        {
            NotBlank = true;
            TableRelation = "Req. Wksh. Template";
        }
        field(2; "Tipo documento"; Text[50])
        {
            TableRelation = "Tipos documento" WHERE("No. form" = CONST(50512));
        }
        field(3; "Descripción"; Text[199])
        {
        }
        field(100; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency.Code;

            trigger OnValidate()
            begin
                UpdateReqLines(FieldCaption("Currency Code"));
                UpdateCurrencyFactor;
                UpdateReqLines(FieldCaption("Currency Factor"));
            end;
        }
        field(101; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Currency Factor" <> xRec."Currency Factor" then
                    UpdateReqLines(FieldCaption("Currency Factor"));
            end;
        }
        field(50000; "No. documento"; Code[30])
        {

            trigger OnValidate()
            begin
                fntSeguridad;
            end;
        }
        field(50001; Aprobado; Boolean)
        {

        }
        field(50002; "Fecha registro"; Date)
        {

            trigger OnValidate()
            begin
                fntSeguridad;
            end;
        }
        field(50003; Usuario; Code[50])
        {
            TableRelation = User."User Name";
        }
        field(50004; "Global Dimension 1"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50005; "Global Dimension 2"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50006; "Global Dimension 3"; Code[10])
        {
            CaptionClass = '1,2,3';


            trigger OnValidate()
            begin
                //ActlzLinsVentas(FIELDNAME("Cod. 3o.Nivel"));
            end;
        }
        field(50007; "Global Dimension 4"; Code[10])
        {
            CaptionClass = '1,2,4';

        }
        field(50008; "Global Dimension 5"; Code[10])
        {
            CaptionClass = '1,2,5';

        }
        field(50009; "Global Dimension 6"; Code[10])
        {
            CaptionClass = '1,2,6';

        }
        field(50010; "Global Dimension 7"; Code[10])
        {
            CaptionClass = '1,2,7';

        }
        field(50011; "No. Serie"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50012; "Fecha Entrega"; Date)
        {

            trigger OnValidate()
            begin
                fntSeguridad;
            end;
        }
        field(50013; Importancia; Option)
        {
            OptionMembers = Normal,Urgente;

            trigger OnValidate()
            begin
                fntSeguridad;
            end;
        }
        field(50014; Procedencia; Option)
        {
            OptionMembers = Importado,Nacional;

            trigger OnValidate()
            begin
                fntSeguridad;
            end;
        }
        field(50016; Observaciones; Text[250])
        {

            trigger OnValidate()
            begin
                fntSeguridad;
            end;
        }
        field(50017; "Rechazado por motivo"; Text[250])
        {

            trigger OnValidate()
            begin
                Clear(rstSeguridad);
                Clear(rstSeguridadUsuario);

                if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Aprobar solicitudes")) then
                    Error('Usted no está habilitado para rechazar solicitudes');
            end;
        }
        field(50018; "Fecha pedido"; Date)
        {
        }
        field(50019; "Fecha aprobacion"; Date)
        {
        }
        field(50020; Estado; Text[50])
        {
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No. documento")));
            FieldClass = FlowField;
        }
        field(50021; "Concepto proyecto"; Code[10])
        {
            TableRelation = "Concepto proyecto";
        }
        field(50022; "Usuario Aprobacion"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50023; "Importe Solicitud"; Decimal)
        {
            CalcFormula = Sum("Lín. solicitud"."Importe neto" WHERE("Nombre libro Solicitud" = FIELD("Nombre Libro Solicitud"),
                                                                     "No. Documento" = FIELD("No. documento")));
            FieldClass = FlowField;
        }
        field(50024; "Importe OC"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Line Amount" WHERE("Document Type" = FILTER(Order),
                                                                   "No. Cab. Solicitud" = FIELD("No. documento")));
            FieldClass = FlowField;
        }
        field(50025; "Importe FC"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50026; "Importe NC"; Decimal)
        {
            CalcFormula = Sum("Purch. Cr. Memo Line"."Line Amount" WHERE("No. Cab. Solicitud" = FIELD("No. documento")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Nombre Libro Solicitud", "No. documento")
        {
            Clustered = true;
        }
        key(Key2; "No. documento")
        {
        }
        key(Key3; "Descripción")
        {
        }
        key(Key4; Usuario)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No. documento", "Descripción", Usuario)
        {
        }
    }



    trigger OnRename()
    begin
        Error('Esta tabla no permite esta operacion');
    end;

    var
        LibroDeman: Record "Req. Wksh. Template";
        LinDema: Record "Requisition Line";
        rstSeguridad: Record Seguridad;
        linhoja: Record "Lín. solicitud";
        rstConfUsuario: Record "User Setup";
        rstMensajeria: Record Mensajeria;
        rstLinSolicitud: Record "Lín. solicitud";
        rstSeguridadUsuario: Record "Seguridad por usuario";
        blnAprobar: Boolean;
        ConfUsu: Record "User Setup";
        PunMensajeria: Record Mensajeria;
        PunTipoDocumento: Record "Tipos documento";
        CurrExchRate: Record "Currency Exchange Rate";
        CurrencyDate: Date;
        HideValidationDialog: Boolean;
        Confirmed: Boolean;
        ReqLine: Record "Lín. solicitud";
        Text000: Label 'Do you want to print receipt %1?';
        Text001: Label 'Do you want to print invoice %1?';
        Text002: Label 'Do you want to print credit memo %1?';
        Text003: Label 'You cannot rename a %1.';
        Text004: Label 'Do you want to change %1?';
        Text005: Label 'You cannot reset %1 because the document still has one or more lines.';
        Text006: Label 'You cannot change %1 because the order is associated with one or more sales orders.';
        Text007: Label '%1 is greater than %2 in the %3 table.\';
        Text008: Label 'Confirm change?';
        Text009: Label 'Deleting this document will cause a gap in the number series for receipts. ';
        Text010: Label 'An empty receipt %1 will be created to fill this gap in the number series.\\';
        Text011: Label 'Do you want to continue?';
        Text012: Label 'Deleting this document will cause a gap in the number series for posted invoices. ';
        Text013: Label 'An empty posted invoice %1 will be created to fill this gap in the number series.\\';
        Text014: Label 'Deleting this document will cause a gap in the number series for posted credit memos. ';
        Text015: Label 'An empty posted credit memo %1 will be created to fill this gap in the number series.\\';
        Text016: Label 'If you change %1, the existing purchase lines will be deleted and new purchase lines based on the new information in the header will be created.\\';
        Text018: Label 'You must delete the existing purchase lines before you can change %1.';
        Text019: Label 'You have changed %1 on the purchase header, but it has not been changed on the existing purchase lines.\';
        Text020: Label 'You must update the existing purchase lines manually.';
        Text021: Label 'The change may affect the exchange rate used on the price calculation of the purchase lines.';
        Text022: Label 'Do you want to update the exchange rate?';
        Text023: Label 'You cannot delete this document. Your identification is set up to process from %1 %2 only.';
        Text024: Label 'Do you want to print return shipment %1?';
        Text025: Label 'You have modified the %1 field. Note that the recalculation of VAT may cause penny differences, so you must check the amounts afterwards. ';
        Text027: Label 'Do you want to update the %2 field on the lines to reflect the new value of %1?';
        Text028: Label 'Your identification is set up to process from %1 %2 only.';
        Text029: Label 'Deleting this document will cause a gap in the number series for return shipments. ';
        Text030: Label 'An empty return shipment %1 will be created to fill this gap in the number series.\\';
        Text032: Label 'You have modified %1.\\';
        Text033: Label 'Do you want to update the lines?';
        Text034: Label 'You cannot change the %1 when the %2 has been filled in.';
        Text037: Label 'Contact %1 %2 is not related to vendor %3.';
        Text038: Label 'Contact %1 %2 is related to a different company than vendor %3.';
        Text039: Label 'Contact %1 %2 is not related to a vendor.';
        Text040: Label 'You can not change the %1 field because %2 %3 has %4 = %5 and the %6 has already been assigned %7 %8.';
        Text041: Label 'The purchase %1 %2 has item tracking. Do you want to delete it anyway?';
        Text042: Label 'You must cancel the approval process if you wish to change the %1.';
        Text043: Label 'Do you want to print prepayment invoice %1?';
        Text044: Label 'Do you want to print prepayment credit memo %1?';
        Text045: Label 'Deleting this document will cause a gap in the number series for prepayment invoices. An empty prepayment invoice %1 will be created to fill this gap in the number series.\\Do you want to continue?';
        Text046: Label 'Deleting this document will cause a gap in the number series for prepayment credit memos. An empty prepayment credit memo %1 will be created to fill this gap in the number series.\\Do you want to continue?';
        Text049: Label '%1 is set up to process from %2 %3 only.';
        Text050: Label 'Reservations exist for this order. These reservations will be canceled if a date conflict is caused by this change.\\';
        Text051: Label 'You may have changed a dimension.\\Do you want to update the lines?';
        Text052: Label 'The %1 field on the purchase order %2 must be the same as on sales order %3.';
        Text053: Label 'There are unposted prepayment amounts on the document of type %1 with the number %2.';
        Text054: Label 'There are unpaid prepayment invoices that are related to the document of type %1 with the number %2.';
        Text1100000: Label 'It exists a Posted Purchase Receipt %1 %2 with %3 set to %4';
        Text1100002: Label 'The %1 does not exist. \Identification fields and values:\%1 = %2';
        Text1100003: Label '%1 cannot be applied, since it is included in a Payment Order.';
        Text1100004: Label ' Remove it from its Payment Order and try again.';
        Text10700: Label '%1 cannot be different from 0 when %2 is %3';
        ChangeCurrencyQst: Label 'If you change %1, the existing purchase lines will be deleted and new purchase lines based on the new information in the header will be created. You may need to update the price information manually.\\Do you want to change %1?';
        xReqLine: Record "Lín. solicitud";

    [Scope('OnPrem')]
    procedure fntSeguridad()
    var
        rstSeguridadActual: Record Seguridad;
        rstSeguridadRegistrado: Record Seguridad;
        rstSeguridadActualTemporal: Record Seguridad temporary;
        rstSeguridadRegistradoTemporal: Record Seguridad temporary;
        rstSeguridadUsuarioActual: Record "Seguridad por usuario";
        rstSeguridadUsuarioRegistrado: Record "Seguridad por usuario";
    begin
        //IBdos Argentina - USS - 240603 - Inicio Modificacion Arbumasa
        //Solo puede modificar la solicitud un usuario del mismo grupo de seguridad

        if Usuario <> '' then begin

            if not rstSeguridadUsuario.fntSeguridadComparada(UserId, Usuario) then begin

                if not rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Modificar solicitudes ajenas")) or
                   (rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Modificar solicitudes ajenas")) and
                   rstSeguridadUsuario.fntSeguridadPermiso(Usuario, rstSeguridad.FieldNo(rstSeguridad."Aprobar Pedidos"))) then
                    Error('Usted no posee permisos para realizar esta operacion');

            end;

        end;

        //IBdos Argentina - USS - 240603 - Fin Modificacion Arbumasa
    end;

    local procedure UpdateCurrencyFactor()
    begin
        if "Currency Code" <> '' then begin
            if "Fecha pedido" <> 0D then
                CurrencyDate := "Fecha pedido"
            else
                CurrencyDate := WorkDate;

            "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Currency Code");
        end else
            "Currency Factor" := 0;
    end;

    local procedure ConfirmUpdateCurrencyFactor()
    begin
        HideValidationDialog := true;
        if HideValidationDialog then
            Confirmed := true
        else
            Confirmed := Confirm(Text022, false);
        if Confirmed then
            Validate("Currency Factor")
        else
            "Currency Factor" := xRec."Currency Factor";
    end;

    [Scope('OnPrem')]
    procedure ReqLinesExist(): Boolean
    begin
        ReqLine.Reset;
        ReqLine.SetRange("Nombre libro Solicitud", "Nombre Libro Solicitud");
        ReqLine.SetRange("No. Documento", "No. documento");
        exit(ReqLine.FindFirst);
    end;

    [Scope('OnPrem')]
    procedure SetHideValidationDialog(NewHideValidationDialog: Boolean)
    begin
        HideValidationDialog := NewHideValidationDialog;
    end;

    [Scope('OnPrem')]
    procedure UpdateReqLines(ChangedFieldName: Text[100])
    var
        UpdateConfirmed: Boolean;
    begin
        if not ReqLinesExist then
            exit;

        ReqLine.LockTable;
        Modify;

        repeat
            xReqLine := ReqLine;
            case ChangedFieldName of
                FieldCaption("Currency Code"):
                    if ReqLine.Tipo <> ReqLine.Tipo::" " then
                        ReqLine.Validate("Currency Code", "Currency Code");
                FieldCaption("Currency Factor"):
                    if ReqLine.Tipo <> ReqLine.Tipo::" " then
                        ReqLine.Validate("Currency Factor", "Currency Factor");
                //++Migracion Arbumasa 2009
                FieldCaption("Global Dimension 1"):
                    if UpdateConfirmed and (ReqLine."Global Dimension 1" <> '') then
                        ReqLine.Validate("Global Dimension 1", "Global Dimension 1");
                FieldCaption("Global Dimension 2"):
                    if UpdateConfirmed and (ReqLine."Global Dimension 2" <> '') then
                        ReqLine.Validate("Global Dimension 2", "Global Dimension 2");
                FieldCaption("Global Dimension 3"):
                    if UpdateConfirmed and (ReqLine."Global Dimension 3" <> '') then
                        ReqLine.Validate("Global Dimension 3", "Global Dimension 3");
                FieldCaption("Global Dimension 4"):
                    if UpdateConfirmed and (ReqLine."Global Dimension 4" <> '') then
                        ReqLine.Validate("Global Dimension 4", "Global Dimension 4");
                FieldCaption("Global Dimension 5"):
                    if UpdateConfirmed and (ReqLine."Global Dimension 5" <> '') then
                        ReqLine.Validate("Global Dimension 5", "Global Dimension 5");
                FieldCaption("Global Dimension 6"):
                    if UpdateConfirmed and (ReqLine."Global Dimension 6" <> '') then
                        ReqLine.Validate("Global Dimension 6", "Global Dimension 6");
                FieldCaption("Global Dimension 7"):
                    if UpdateConfirmed and (ReqLine."Global Dimension 7" <> '') then
                        ReqLine.Validate("Global Dimension 7", "Global Dimension 7");
            //--Migracion Arbumasa 2009

            end;
            ReqLine.Modify(true);
        until ReqLine.Next = 0;
    end;

    [Scope('OnPrem')]
    procedure Navegar()
    var
        FormNavegar: Page Navigate;
    begin
        //IBdos Argentina - USS - 191202 - Inicio Modificacion Arbumasa
        //Adicion de funcion Navegar

        FormNavegar.SetDoc("Fecha registro", "No. documento");
        FormNavegar.Run;

        //IBdos Argentina - USS - 191202 - Fin Modificacion Arbumasa
    end;

    [Scope('OnPrem')]
    procedure fntImporteFacturaTotal() decFact: Decimal
    var
        l_rstPIL: Record "Purch. Inv. Line";
        l_rstPCL: Record "Purch. Cr. Memo Line";
    begin
        decFact := 0;
        Clear(l_rstPCL);
        l_rstPCL.SetRange("No. Cab. Solicitud", "No. documento");
        l_rstPCL.CalcSums("Importe DL", "Importe DA");

        Clear(l_rstPIL);
        l_rstPIL.SetRange("No. Cab. Solicitud", "No. documento");
        l_rstPIL.CalcSums("Importe DL", "Importe DA");

        if "Currency Code" <> '' then
            decFact := l_rstPIL."Importe DA" - l_rstPCL."Importe DA"
        else
            decFact := l_rstPIL."Importe DL" - l_rstPCL."Importe DL";
        exit(decFact);
    end;

    procedure fntNavegar()
    var
        t_rstPIL: Record "Purch. Inv. Line";
        l_rstPIL: Record "Purch. Inv. Line";
        l_rstPCL: Record "Purch. Cr. Memo Line";
    begin
        CLEAR(l_rstPCL);
        l_rstPCL.SETRANGE("No. Cab. Solicitud", "No. documento");
        IF l_rstPCL.FINDSET THEN
            REPEAT
                t_rstPIL.TRANSFERFIELDS(l_rstPCL);
                t_rstPIL.INSERT;
            UNTIL l_rstPCL.NEXT = 0;

        CLEAR(l_rstPIL);
        l_rstPIL.SETRANGE("No. Cab. Solicitud", "No. documento");
        IF l_rstPIL.FINDSET THEN
            REPEAT
                t_rstPIL.TRANSFERFIELDS(l_rstPIL);
                t_rstPIL.INSERT;
            UNTIL l_rstPIL.NEXT = 0;
        PAGE.RUN(50047, t_rstPIL);
    end;
}

