codeunit 50501 "Registro diarios"
{
    // 
    // US.ARBU - 2005-08-03 - Inicio - Con ésta modificación, se modifica el sistema de cálculo de las NC's para
    //                                 que acumulen sobre el registro de buffer de la factura a que aplican
    // 
    // US.ARBU - 2005-11-28 - Inicio Modificación. Si el pago es parcial, no debe utilizar el total de la factura
    //                        Además, al ser el primer pago hay que restar el total del IVA de la factura.

    Permissions = TableData "Cab. Liquidacion Pagos" = rimd,
                  TableData "Lín. Liquidacion Pagos" = rimd;

    trigger OnRun()
    begin
    end;

    var
        AsciiStr: Text[250];
        AnsiStr: Text[250];
        CharVar: array[32] of Char;

    [Scope('OnPrem')]
    procedure FechaRegistroDiarioGeneral(rstLinDiaGen: Record "Gen. Journal Line"): Boolean
    var
        rstLibroDiarioGeneral: Record "Gen. Journal Template";
        rstSecDiarioGeneral: Record "Gen. Journal Batch";
        rstSeguridadUsuario: Record "Seguridad por usuario";
        rstSeguridad: Record Seguridad;
    begin
        Clear(rstLibroDiarioGeneral);
        Clear(rstSecDiarioGeneral);

        if rstSeguridadUsuario.fntSeguridadPermiso(UserId, rstSeguridad.FieldNo(rstSeguridad."Omitir controles de fecha")) then
            exit(true);

        rstSecDiarioGeneral.Get(rstLinDiaGen."Journal Template Name", rstLinDiaGen."Journal Batch Name");
        rstLibroDiarioGeneral.Get(rstLinDiaGen."Journal Template Name");

        //Si la fecha de registro está dentro del rango establecido para el libro, registra sin mayor verificación.

        if (rstLibroDiarioGeneral."Fecha registro desde" <> 0D) and (rstLibroDiarioGeneral."Fecha registro hasta" <> 0D) then begin

            if (rstLinDiaGen."Posting Date" >= rstLibroDiarioGeneral."Fecha registro desde") and (rstLinDiaGen."Posting Date" <=
              rstLibroDiarioGeneral."Fecha registro hasta") then
                exit(true)
            else begin
                //Si la fecha de registro está fuera del rango del libro, verifico la fecha contra el rango de la sección correspondiente

                if (rstSecDiarioGeneral."Fecha registro desde" <> 0D) and (rstSecDiarioGeneral."Fecha registro hasta" <> 0D) then begin

                    if (rstLinDiaGen."Posting Date" >= rstSecDiarioGeneral."Fecha registro desde") and (rstLinDiaGen."Posting Date" <=
                      rstSecDiarioGeneral."Fecha registro hasta") then
                        exit(true)
                    else begin

                        Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, Sección Diario %2, tipo\' +
                                'de diario %3.', rstLinDiaGen."Journal Template Name", rstLinDiaGen."Journal Batch Name", rstLibroDiarioGeneral.Type
                );
                        exit(false);

                    end;

                end
                else begin

                    Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, tipo de diario %2.',
                    rstLinDiaGen."Journal Template Name", rstLibroDiarioGeneral.Type);
                    exit(false);

                end;

            end;

        end
        else begin

            /*
              MESSAGE('Especifique un rango de fechas de registro en el Libro Diario %1, tipo de diario %2',rstLibroDiarioGeneral.Name,
                      rstLibroDiarioGeneral.Type);
                      */
            exit(true);

        end;

    end;

    [Scope('OnPrem')]
    procedure FechaRegistroDiarioProducto(rstLinDiaProducto: Record "Item Journal Line"): Boolean
    var
        rstLibroDiarioProducto: Record "Item Journal Template";
        rstSecDiarioProducto: Record "Item Journal Batch";
    begin
        Clear(rstLibroDiarioProducto);
        Clear(rstSecDiarioProducto);

        if rstSecDiarioProducto.Get(rstLinDiaProducto."Journal Template Name", rstLinDiaProducto."Journal Batch Name") then;
        if rstLibroDiarioProducto.Get(rstLinDiaProducto."Journal Template Name") then;

        //Si la fecha de registro está dentro del rango establecido para el libro, registra sin mayor verificación.

        if (rstLibroDiarioProducto."Fecha registro desde" <> 0D) and (rstLibroDiarioProducto."Fecha registro hasta" <> 0D) then begin

            if (rstLinDiaProducto."Posting Date" >= rstLibroDiarioProducto."Fecha registro desde") and (rstLinDiaProducto."Posting Date"
              <= rstLibroDiarioProducto."Fecha registro hasta") then
                exit(true)

            else begin
                //Si la fecha de registro está fuera del rango del libro, verifico la fecha contra el rango de la sección correspondiente

                if (rstSecDiarioProducto."Fecha registro desde" <> 0D) and (rstSecDiarioProducto."Fecha registro hasta" <> 0D) then begin

                    if (rstLinDiaProducto."Posting Date" >= rstSecDiarioProducto."Fecha registro desde") and
                      (rstLinDiaProducto."Posting Date" <= rstSecDiarioProducto."Fecha registro hasta") then
                        exit(true)

                    else begin

                        Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, Sección Diario %2,\' +
                                'tipo de diario %3.',
                        rstLinDiaProducto."Journal Template Name", rstLinDiaProducto."Journal Batch Name", rstLibroDiarioProducto.Type);
                        exit(false);

                    end;

                end
                else begin

                    Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, tipo de diario %2',
                    rstLinDiaProducto."Journal Template Name", rstLibroDiarioProducto.Type);
                    exit(false);

                end;

            end;

        end
        else begin
            /*
             MESSAGE('Especifique un rango de fechas de registro en el Libro Diario %1, tipo de diario %2',rstLibroDiarioProducto.Name,
                     rstLibroDiarioProducto.Type);
             EXIT(FALSE);
            */
            exit(true);
        end;

    end;

    [Scope('OnPrem')]
    procedure FechaRegistroDiarioProyecto(rstLinDiaProyecto: Record "Job Journal Line"): Boolean
    var
        rstLibroDiarioProyecto: Record "Job Journal Template";
        rstSecDiarioProyecto: Record "Job Journal Batch";
    begin
        Clear(rstLibroDiarioProyecto);
        Clear(rstSecDiarioProyecto);

        rstSecDiarioProyecto.Get(rstLinDiaProyecto."Journal Template Name", rstLinDiaProyecto."Journal Batch Name");
        rstLibroDiarioProyecto.Get(rstLinDiaProyecto."Journal Template Name");

        if (rstLibroDiarioProyecto."Fecha registro desde" <> 0D) and (rstLibroDiarioProyecto."Fecha registro hasta" <> 0D) then begin

            //Si la fecha de registro está dentro del rango establecido para el libro, registra sin mayor verificación.

            if (rstLinDiaProyecto."Posting Date" >= rstLibroDiarioProyecto."Fecha registro desde") and (rstLinDiaProyecto."Posting Date"
              <= rstLibroDiarioProyecto."Fecha registro hasta") then
                exit(true)

            else begin
                //Si la fecha de registro está fuera del rango del libro, verifico la fecha contra el rango de la sección correspondiente

                if (rstSecDiarioProyecto."Fecha registro desde" <> 0D) and (rstSecDiarioProyecto."Fecha registro hasta" <> 0D) then begin

                    if (rstLinDiaProyecto."Posting Date" >= rstSecDiarioProyecto."Fecha registro desde") and
                      (rstLinDiaProyecto."Posting Date" <=
                      rstSecDiarioProyecto."Fecha registro hasta") then
                        exit(true)

                    else begin

                        Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, Sección Diario %2,\' +
                                'tipo de diario %3.',
                        rstLinDiaProyecto."Journal Template Name", rstLinDiaProyecto."Journal Batch Name", rstLibroDiarioProyecto."Source Code");
                        exit(false);

                    end;

                end
                else begin

                    Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, tipo de diario %2.',
                    rstLinDiaProyecto."Journal Template Name", rstLibroDiarioProyecto."Source Code");
                    exit(false);

                end;

            end;

        end
        else begin

            Message('Especifique un rango de fechas de registro en el Libro Diario %1, tipo de diario %2', rstLibroDiarioProyecto.Name,
                    rstLibroDiarioProyecto."Source Code");
            exit(false);

        end;
    end;

    [Scope('OnPrem')]
    procedure FechaRegistroFacturaVenta(rstCabVenta: Record "Sales Header"): Boolean
    var
        rstLibroDiarioGeneral: Record "Gen. Journal Template";
        rstSecDiarioGeneral: Record "Gen. Journal Batch";
    begin
        Clear(rstLibroDiarioGeneral);
        Clear(rstSecDiarioGeneral);

        rstSecDiarioGeneral.Get('', '');
        rstLibroDiarioGeneral.Get('');

        //Si la fecha de registro está dentro del rango establecido para el libro, registra sin mayor verificación.

        if (rstLibroDiarioGeneral."Fecha registro desde" <> 0D) and (rstLibroDiarioGeneral."Fecha registro hasta" <> 0D) then begin

            if (rstCabVenta."Posting Date" >= rstLibroDiarioGeneral."Fecha registro desde") and (rstCabVenta."Posting Date" <=
              rstLibroDiarioGeneral."Fecha registro hasta") then
                exit(true)
            else begin
                //Si la fecha de registro está fuera del rango del libro, verifico la fecha contra el rango de la sección correspondiente

                if (rstSecDiarioGeneral."Fecha registro desde" <> 0D) and (rstSecDiarioGeneral."Fecha registro hasta" <> 0D) then begin

                    if (rstCabVenta."Posting Date" >= rstSecDiarioGeneral."Fecha registro desde") and (rstCabVenta."Posting Date" <=
                      rstSecDiarioGeneral."Fecha registro hasta") then
                        exit(true)
                    else begin

                        Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, Sección Diario %2, tipo\' +
                                'de diario %3.', '', '', rstLibroDiarioGeneral.Type);
                        exit(false);

                    end;

                end
                else begin

                    Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, tipo de diario %2.',
                    '', rstLibroDiarioGeneral.Type);
                    exit(false);

                end;

            end;

        end
        else begin

            Message('Especifique un rango de fechas de registro en el Libro Diario %1, tipo de diario %2', rstLibroDiarioGeneral.Name,
                    rstLibroDiarioGeneral.Type);
            exit(false);

        end;
    end;

    [Scope('OnPrem')]
    procedure FechaRegistroDiarioRecurso(rstLinDiaRecurso: Record "Res. Journal Line"): Boolean
    var
        rstLibroDiarioRecurso: Record "Res. Journal Template";
        rstSecDiarioRecurso: Record "Res. Journal Batch";
    begin
        Clear(rstLibroDiarioRecurso);
        Clear(rstSecDiarioRecurso);

        rstSecDiarioRecurso.Get(rstLinDiaRecurso."Journal Template Name", rstLinDiaRecurso."Journal Batch Name");
        rstLibroDiarioRecurso.Get(rstLinDiaRecurso."Journal Template Name");

        if (rstLibroDiarioRecurso."Fecha registro desde" <> 0D) and (rstLibroDiarioRecurso."Fecha registro hasta" <> 0D) then begin

            //Si la fecha de registro está dentro del rango establecido para el libro, registra sin mayor verificación.

            if (rstLinDiaRecurso."Posting Date" >= rstLibroDiarioRecurso."Fecha registro desde") and (rstLinDiaRecurso."Posting Date"
              <= rstLibroDiarioRecurso."Fecha registro hasta") then
                exit(true)

            else begin
                //Si la fecha de registro está fuera del rango del libro, verifico la fecha contra el rango de la sección correspondiente

                if (rstSecDiarioRecurso."Fecha registro desde" <> 0D) and (rstSecDiarioRecurso."Fecha registro hasta" <> 0D) then begin

                    if (rstLinDiaRecurso."Posting Date" >= rstSecDiarioRecurso."Fecha registro desde") and
                      (rstLinDiaRecurso."Posting Date" <=
                      rstSecDiarioRecurso."Fecha registro hasta") then
                        exit(true)

                    else begin

                        Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, Sección Diario %2,\' +
                                'tipo de diario %3.',
                        rstLinDiaRecurso."Journal Template Name", rstLinDiaRecurso."Journal Batch Name", rstLinDiaRecurso."Source Code");
                        exit(false);

                    end;

                end
                else begin

                    Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, tipo de diario %2.',
                    rstLinDiaRecurso."Journal Template Name", rstLinDiaRecurso."Source Code");
                    exit(false);

                end;

            end;

        end
        else begin

            Message('Especifique un rango de fechas de registro en el Libro Diario %1, tipo de diario %2', rstLibroDiarioRecurso.Name,
                    rstLinDiaRecurso."Source Code");
            exit(false);

        end;
    end;

    [Scope('OnPrem')]
    procedure ImputacionDirecta(codCuenta: Code[20]): Boolean
    var
        rstCuenta: Record "G/L Account";
        rstConfUsu: Record "User Setup";
        rstEntradaDirectaPorSeguridad: Record "Imputación directa por grupo";
    begin
        Clear(rstCuenta);
        rstCuenta.Get(codCuenta);
        if rstCuenta."Direct Posting" then
            exit(true);

        Clear(rstConfUsu);
        Clear(rstEntradaDirectaPorSeguridad);
        if rstConfUsu.Get(UserId) then begin

            rstEntradaDirectaPorSeguridad.SetRange("No. Cuenta", codCuenta);
            rstEntradaDirectaPorSeguridad.SetRange("Grupo seguridad", rstConfUsu.Grupo);
            rstEntradaDirectaPorSeguridad.SetRange("Imputación directa", true);
            if rstEntradaDirectaPorSeguridad.FindFirst then
                exit(true)
            else
                exit(false);

        end;
    end;

    [Scope('OnPrem')]
    procedure FechaAnulacionFacturasCompra(rstHCFacComp: Record "Purch. Inv. Header"): Boolean
    var
        rstLibroDiarioGeneral: Record "Gen. Journal Template";
        rstSecDiarioGeneral: Record "Gen. Journal Batch";
    begin
        Clear(rstLibroDiarioGeneral);
        Clear(rstSecDiarioGeneral);

        rstSecDiarioGeneral.Get('', '');
        rstLibroDiarioGeneral.Get('');

        //Si la fecha de registro está dentro del rango establecido para el libro, registra sin mayor verificación.

        if (rstLibroDiarioGeneral."Fecha registro desde" <> 0D) and (rstLibroDiarioGeneral."Fecha registro hasta" <> 0D) then begin

            if (rstHCFacComp."Posting Date" >= rstLibroDiarioGeneral."Fecha registro desde") and (rstHCFacComp."Posting Date" <=
              rstLibroDiarioGeneral."Fecha registro hasta") then
                exit(true)
            else begin
                //Si la fecha de registro está fuera del rango del libro, verifico la fecha contra el rango de la sección correspondiente

                if (rstSecDiarioGeneral."Fecha registro desde" <> 0D) and (rstSecDiarioGeneral."Fecha registro hasta" <> 0D) then begin

                    if (rstHCFacComp."Posting Date" >= rstSecDiarioGeneral."Fecha registro desde") and (rstHCFacComp."Posting Date" <=
                      rstSecDiarioGeneral."Fecha registro hasta") then
                        exit(true)
                    else begin

                        Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, Sección Diario %2, tipo\' +
                                'de diario %3.', '', '', rstLibroDiarioGeneral.Type);
                        exit(false);

                    end;

                end
                else begin

                    Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, tipo de diario %2.',
                    '', rstLibroDiarioGeneral.Type);
                    exit(false);

                end;

            end;

        end
        else begin

            Message('Especifique un rango de fechas de registro en el Libro Diario %1, tipo de diario %2', rstLibroDiarioGeneral.Name,
                    rstLibroDiarioGeneral.Type);
            exit(false);

        end;
    end;

    [Scope('OnPrem')]
    procedure FechaAnulacionRemitosCompra(rstHCRemComp: Record "Purch. Rcpt. Header"): Boolean
    var
        rstLibroDiarioGeneral: Record "Gen. Journal Template";
        rstSecDiarioGeneral: Record "Gen. Journal Batch";
    begin
        Clear(rstLibroDiarioGeneral);
        Clear(rstSecDiarioGeneral);

        rstSecDiarioGeneral.Get('', '');
        rstLibroDiarioGeneral.Get('');

        //Si la fecha de registro está dentro del rango establecido para el libro, registra sin mayor verificación.

        if (rstLibroDiarioGeneral."Fecha registro desde" <> 0D) and (rstLibroDiarioGeneral."Fecha registro hasta" <> 0D) then begin

            if (rstHCRemComp."Posting Date" >= rstLibroDiarioGeneral."Fecha registro desde") and (rstHCRemComp."Posting Date" <=
              rstLibroDiarioGeneral."Fecha registro hasta") then
                exit(true)
            else begin
                //Si la fecha de registro está fuera del rango del libro, verifico la fecha contra el rango de la sección correspondiente

                if (rstSecDiarioGeneral."Fecha registro desde" <> 0D) and (rstSecDiarioGeneral."Fecha registro hasta" <> 0D) then begin

                    if (rstHCRemComp."Posting Date" >= rstSecDiarioGeneral."Fecha registro desde") and (rstHCRemComp."Posting Date" <=
                      rstSecDiarioGeneral."Fecha registro hasta") then
                        exit(true)
                    else begin

                        Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, Sección Diario %2, tipo\' +
                                'de diario %3.', '', '', rstLibroDiarioGeneral.Type);
                        exit(false);

                    end;

                end
                else begin

                    Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, tipo de diario %2.',
                    '', rstLibroDiarioGeneral.Type);
                    exit(false);

                end;

            end;

        end
        else begin

            Message('Especifique un rango de fechas de registro en el Libro Diario %1, tipo de diario %2', rstLibroDiarioGeneral.Name,
                    rstLibroDiarioGeneral.Type);
            exit(false);

        end;
    end;

    [Scope('OnPrem')]
    procedure FechaAnulacionNCCompra(rstHCNCComp: Record "Purch. Cr. Memo Hdr."): Boolean
    var
        rstLibroDiarioGeneral: Record "Gen. Journal Template";
        rstSecDiarioGeneral: Record "Gen. Journal Batch";
    begin
        Clear(rstLibroDiarioGeneral);
        Clear(rstSecDiarioGeneral);

        rstSecDiarioGeneral.Get('', '');
        rstLibroDiarioGeneral.Get('');

        //Si la fecha de registro está dentro del rango establecido para el libro, registra sin mayor verificación.

        if (rstLibroDiarioGeneral."Fecha registro desde" <> 0D) and (rstLibroDiarioGeneral."Fecha registro hasta" <> 0D) then begin

            if (rstHCNCComp."Posting Date" >= rstLibroDiarioGeneral."Fecha registro desde") and (rstHCNCComp."Posting Date" <=
              rstLibroDiarioGeneral."Fecha registro hasta") then
                exit(true)
            else begin
                //Si la fecha de registro está fuera del rango del libro, verifico la fecha contra el rango de la sección correspondiente

                if (rstSecDiarioGeneral."Fecha registro desde" <> 0D) and (rstSecDiarioGeneral."Fecha registro hasta" <> 0D) then begin

                    if (rstHCNCComp."Posting Date" >= rstSecDiarioGeneral."Fecha registro desde") and (rstHCNCComp."Posting Date" <=
                      rstSecDiarioGeneral."Fecha registro hasta") then
                        exit(true)
                    else begin

                        Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, Sección Diario %2, tipo\' +
                                'de diario %3.', '', '', rstLibroDiarioGeneral.Type);
                        exit(false);

                    end;

                end
                else begin

                    Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, tipo de diario %2.',
                    '', rstLibroDiarioGeneral.Type);
                    exit(false);

                end;

            end;

        end
        else begin

            Message('Especifique un rango de fechas de registro en el Libro Diario %1, tipo de diario %2', rstLibroDiarioGeneral.Name,
                    rstLibroDiarioGeneral.Type);
            exit(false);

        end;
    end;

    [Scope('OnPrem')]
    procedure FechaAnulacionFacturasVenta(rstHCFacVenta: Record "Sales Invoice Header"): Boolean
    var
        rstLibroDiarioGeneral: Record "Gen. Journal Template";
        rstSecDiarioGeneral: Record "Gen. Journal Batch";
    begin
        Clear(rstLibroDiarioGeneral);
        Clear(rstSecDiarioGeneral);

        rstSecDiarioGeneral.Get('', '');
        rstLibroDiarioGeneral.Get('');

        //Si la fecha de registro está dentro del rango establecido para el libro, registra sin mayor verificación.

        if (rstLibroDiarioGeneral."Fecha registro desde" <> 0D) and (rstLibroDiarioGeneral."Fecha registro hasta" <> 0D) then begin

            if (rstHCFacVenta."Posting Date" >= rstLibroDiarioGeneral."Fecha registro desde") and (rstHCFacVenta."Posting Date" <=
              rstLibroDiarioGeneral."Fecha registro hasta") then
                exit(true)
            else begin
                //Si la fecha de registro está fuera del rango del libro, verifico la fecha contra el rango de la sección correspondiente

                if (rstSecDiarioGeneral."Fecha registro desde" <> 0D) and (rstSecDiarioGeneral."Fecha registro hasta" <> 0D) then begin

                    if (rstHCFacVenta."Posting Date" >= rstSecDiarioGeneral."Fecha registro desde") and (rstHCFacVenta."Posting Date" <=
                      rstSecDiarioGeneral."Fecha registro hasta") then
                        exit(true)
                    else begin

                        Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, Sección Diario %2, tipo\' +
                                'de diario %3.', '', '', rstLibroDiarioGeneral.Type);
                        exit(false);

                    end;

                end
                else begin

                    Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, tipo de diario %2.',
                    '', rstLibroDiarioGeneral.Type);
                    exit(false);

                end;

            end;

        end
        else begin

            Message('Especifique un rango de fechas de registro en el Libro Diario %1, tipo de diario %2', rstLibroDiarioGeneral.Name,
                    rstLibroDiarioGeneral.Type);
            exit(false);

        end;
    end;

    [Scope('OnPrem')]
    procedure FechaAnulacionRemitosVenta(rstHCRemVenta: Record "Sales Shipment Header"): Boolean
    var
        rstLibroDiarioGeneral: Record "Gen. Journal Template";
        rstSecDiarioGeneral: Record "Gen. Journal Batch";
    begin
        Clear(rstLibroDiarioGeneral);
        Clear(rstSecDiarioGeneral);

        rstSecDiarioGeneral.Get('', '');
        rstLibroDiarioGeneral.Get('');

        //Si la fecha de registro está dentro del rango establecido para el libro, registra sin mayor verificación.

        if (rstLibroDiarioGeneral."Fecha registro desde" <> 0D) and (rstLibroDiarioGeneral."Fecha registro hasta" <> 0D) then begin

            if (rstHCRemVenta."Posting Date" >= rstLibroDiarioGeneral."Fecha registro desde") and (rstHCRemVenta."Posting Date" <=
              rstLibroDiarioGeneral."Fecha registro hasta") then
                exit(true)
            else begin
                //Si la fecha de registro está fuera del rango del libro, verifico la fecha contra el rango de la sección correspondiente

                if (rstSecDiarioGeneral."Fecha registro desde" <> 0D) and (rstSecDiarioGeneral."Fecha registro hasta" <> 0D) then begin

                    if (rstHCRemVenta."Posting Date" >= rstSecDiarioGeneral."Fecha registro desde") and (rstHCRemVenta."Posting Date" <=
                      rstSecDiarioGeneral."Fecha registro hasta") then
                        exit(true)
                    else begin

                        Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, Sección Diario %2, tipo\' +
                                'de diario %3.', '', '', rstLibroDiarioGeneral.Type);
                        exit(false);

                    end;

                end
                else begin

                    Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, tipo de diario %2.',
                    '', rstLibroDiarioGeneral.Type);
                    exit(false);

                end;

            end;

        end
        else begin

            Message('Especifique un rango de fechas de registro en el Libro Diario %1, tipo de diario %2', rstLibroDiarioGeneral.Name,
                    rstLibroDiarioGeneral.Type);
            exit(false);

        end;
    end;

    [Scope('OnPrem')]
    procedure FechaAnulacionNCVenta(rstHCNCVenta: Record "Sales Cr.Memo Header"): Boolean
    var
        rstLibroDiarioGeneral: Record "Gen. Journal Template";
        rstSecDiarioGeneral: Record "Gen. Journal Batch";
    begin
        Clear(rstLibroDiarioGeneral);
        Clear(rstSecDiarioGeneral);

        rstSecDiarioGeneral.Get('', '');
        rstLibroDiarioGeneral.Get('');

        //Si la fecha de registro está dentro del rango establecido para el libro, registra sin mayor verificación.

        if (rstLibroDiarioGeneral."Fecha registro desde" <> 0D) and (rstLibroDiarioGeneral."Fecha registro hasta" <> 0D) then begin

            if (rstHCNCVenta."Posting Date" >= rstLibroDiarioGeneral."Fecha registro desde") and (rstHCNCVenta."Posting Date" <=
              rstLibroDiarioGeneral."Fecha registro hasta") then
                exit(true)
            else begin
                //Si la fecha de registro está fuera del rango del libro, verifico la fecha contra el rango de la sección correspondiente

                if (rstSecDiarioGeneral."Fecha registro desde" <> 0D) and (rstSecDiarioGeneral."Fecha registro hasta" <> 0D) then begin

                    if (rstHCNCVenta."Posting Date" >= rstSecDiarioGeneral."Fecha registro desde") and (rstHCNCVenta."Posting Date" <=
                      rstSecDiarioGeneral."Fecha registro hasta") then
                        exit(true)
                    else begin

                        Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, Sección Diario %2, tipo\' +
                                'de diario %3.', '', '', rstLibroDiarioGeneral.Type);
                        exit(false);

                    end;

                end
                else begin

                    Message('La fecha del asiento no está dentro del rango especificado en el Libro Diario %1, tipo de diario %2.',
                    '', rstLibroDiarioGeneral.Type);
                    exit(false);

                end;

            end;

        end
        else begin

            Message('Especifique un rango de fechas de registro en el Libro Diario %1, tipo de diario %2', rstLibroDiarioGeneral.Name,
                    rstLibroDiarioGeneral.Type);
            exit(false);

        end;
    end;

    [Scope('OnPrem')]
    procedure GenerarNombreArchivo(strTipoDocumento: Text[100]; codBuque: Code[10]; codMarea: Code[10]; codDocumento: Code[20]): Text[100]
    begin
        exit(strTipoDocumento + '-' + UserId + '-' +
             codBuque + '-' +
             codMarea + '-' +
             codDocumento + '-' +
             Format(Date2DMY(WorkDate, 3)) + '-' +
             Format(Date2DMY(WorkDate, 2)) + '-' +
             Format(Date2DMY(WorkDate, 1)) + '.txt');
    end;

    local procedure "-------------------------"()
    begin
    end;

    [Scope('OnPrem')]
    procedure fntFillAlfa(var strAlfa: Text; intQ: Integer)
    begin
        if StrLen(strAlfa) < intQ then
            repeat

                strAlfa := strAlfa + ' ';

            until StrLen(strAlfa) = intQ;
    end;

    [Scope('OnPrem')]
    procedure fntFillNum(var strAlfa: Text; intQ: Integer)
    begin
        if StrLen(strAlfa) < intQ then
            repeat

                strAlfa := '0' + strAlfa;

            until StrLen(strAlfa) = intQ;
    end;

    [Scope('OnPrem')]
    procedure fntNum(intQty: Integer; strData: Text[30]): Text[30]
    begin
        strData := DelChr(strData, '=', '.');
        if StrLen(strData) < intQty then
            repeat

                strData := '0' + strData;

            until StrLen(strData) = intQty;

        if StrLen(strData) > intQty then
            repeat

                strData := CopyStr(strData, 2, 30);

            until StrLen(strData) = intQty;

        exit(fntAnularAcentosyEnes(strData));
    end;

    [Scope('OnPrem')]
    procedure fntDec(decImpo: Decimal; intDec: Integer; intEnt: Integer): Text
    var
        strDec: Text;
        strImpComp: Text;
    begin
        strDec := '';
        strDec := CopyStr(Format(Round(decImpo, 0.01, '<') - Round(decImpo, 1, '<')),
                          StrPos(Format(Round(decImpo, 0.01, '<') - Round(decImpo, 1, '<')), ',') + 1,
                          2);

        if StrLen(strDec) < intDec then
            repeat

                strDec := strDec + '0';

            until StrLen(strDec) = intDec;

        strImpComp := DelChr(Format(Round(decImpo, 1, '<')), '=', '-.,')/*+','*/+ DelChr(strDec, '=', ',-.');
        if StrLen(strImpComp) < intEnt then
            repeat

                strImpComp := '0' + strImpComp;

            until StrLen(strImpComp) = intEnt;

        exit(Format(strImpComp));

    end;

    [Scope('OnPrem')]
    procedure fntDecConComa(decImpo: Decimal; intDec: Integer; intEnt: Integer): Text
    var
        strDec: Text;
        strImpComp: Text;
    begin
        strDec := '';
        strDec := CopyStr(Format(Round(decImpo, 0.01, '<') - Round(decImpo, 1, '<')),
                          StrPos(Format(Round(decImpo, 0.01, '<') - Round(decImpo, 1, '<')), ',') + 1,
                          2);

        if StrLen(strDec) < intDec then
            repeat

                strDec := strDec + '0';

            until StrLen(strDec) = intDec;

        strImpComp := DelChr(Format(Round(decImpo, 1, '<')), '=', '-.,') + ',' + DelChr(strDec, '=', ',-.');
        if StrLen(strImpComp) < intEnt then
            repeat

                strImpComp := '0' + strImpComp;

            until StrLen(strImpComp) = intEnt;

        exit(Format(strImpComp));
    end;

    [Scope('OnPrem')]
    procedure fntDecConPunto(decImpo: Decimal; intDec: Integer; intEnt: Integer): Text
    var
        strDec: Text;
        strImpComp: Text;
    begin
        strDec := '';
        strDec := CopyStr(Format(Round(decImpo, 0.01, '<') - Round(decImpo, 1, '<')),
                          StrPos(Format(Round(decImpo, 0.01, '<') - Round(decImpo, 1, '<')), ',') + 1,
                          2);

        if StrLen(strDec) < intDec then
            repeat

                strDec := strDec + '0';

            until StrLen(strDec) = intDec;

        strImpComp := DelChr(Format(Round(decImpo, 1, '<')), '=', '-.,') + '.' + DelChr(strDec, '=', ',-.');
        if StrLen(strImpComp) < intEnt then
            repeat

                strImpComp := '0' + strImpComp;

            until StrLen(strImpComp) = intEnt;

        exit(Format(strImpComp));
    end;

    [Scope('OnPrem')]
    procedure fntAlfa(intQty: Integer; strData: Text[50]): Text[50]
    begin
        if StrLen(strData) < intQty then
            repeat

                strData := strData + ' ';

            until StrLen(strData) = intQty;

        if StrLen(strData) > intQty then
            repeat

                strData := CopyStr(strData, 1, StrLen(strData) - 1);

            until StrLen(strData) = intQty;

        exit(fntAnularAcentosyEnes(strData));
    end;

    [Scope('OnPrem')]
    procedure Ascii2Ansi(_Text: Text[250]): Text[250]
    begin
        MakeVars;
        exit(ConvertStr(_Text, AnsiStr, AsciiStr));
    end;

    [Scope('OnPrem')]
    procedure MakeVars()
    begin
        AsciiStr := '€‚©„…†‡ˆ‰ŠŽÇŽüŽéŽâŽäŽàŽêŽëŽèŽïŽîŽìŽÄŽòŽÖŽÜŽøŽ£ŽƒŽ‚Ž¥ ¡¢ôŽÅ¥ŽØŽÁŽ†©ª«¬Ž€®Ž«Ž¡Ž¡Ž¡Ž¡Ž¡ŽªŽ…Ž‡ŽÀŽ¡Ž¡++½Ž„++--+-+ÔÇÖÔé¼++--Ž¡-+';
        AsciiStr := AsciiStr + 'ŽÿŽæÑŽúŽáŽóiÔäó¥Ø++Ž¡_Ž¡Ž¿ÆÔÇªáãÆŽåÔÇ×ÔÇáÔÇÿÔÇíáé”åÔÇ€ìíÆÔÇ†ŽÉn=óÔÇ£ŽñÔÇØŽÂÔÇ‡ÔÇöúÔÇôüŽ¼Ž¡”£';
        CharVar[1] := 196;
        CharVar[2] := 197;
        CharVar[3] := 201;
        CharVar[4] := 242;
        CharVar[5] := 220;
        CharVar[6] := 186;
        CharVar[7] := 191;
        CharVar[8] := 188;
        CharVar[9] := 187;
        CharVar[10] := 193;
        CharVar[11] := 194;
        CharVar[12] := 192;
        CharVar[13] := 195;
        CharVar[14] := 202;
        CharVar[15] := 203;
        CharVar[16] := 200;
        CharVar[17] := 205;
        CharVar[18] := 206;
        CharVar[19] := 204;
        CharVar[20] := 175;
        CharVar[21] := 223;
        CharVar[22] := 213;
        CharVar[23] := 254;
        CharVar[24] := 218;
        CharVar[25] := 219;
        CharVar[26] := 217;
        CharVar[27] := 180;
        CharVar[28] := 177;
        CharVar[29] := 176;
        CharVar[30] := 185;
        CharVar[31] := 179;
        CharVar[32] := 178;
        AnsiStr := 'Ôé¼üéãÆÔÇ×ÔÇªÔÇáÔÇí”åÔÇ€áÔÇ†Æì' + Format(CharVar[1]) + Format(CharVar[2]) + Format(CharVar[3]) + 'ÔÇÿÔÇÖÔÇ£ÔÇØ' + Format(CharVar[4]);
        AnsiStr := AnsiStr + 'ÔÇôÔÇö”£Ôäó' + Format(CharVar[5]) + 'ÔÇ‡ôØ¥©áíóúnÑª' + Format(CharVar[6]) + Format(CharVar[7]);
        AnsiStr := AnsiStr + '®¬½' + Format(CharVar[8]) + '¡«' + Format(CharVar[9]) + '___ŽØŽØ' + Format(CharVar[10]) + Format(CharVar[11]);
        AnsiStr := AnsiStr + Format(CharVar[12]) + '©ŽØŽØ++¢¥++--+-+Žå' + Format(CharVar[13]) + '++--ŽØ-+ŽÅŽÉŽæ';
        AnsiStr := AnsiStr + Format(CharVar[14]) + Format(CharVar[15]) + Format(CharVar[16]) + 'i' + Format(CharVar[17]) + Format(CharVar[18]);
        AnsiStr := AnsiStr + 'Žÿ++__ŽØ' + Format(CharVar[19]) + Format(CharVar[20]) + 'Žá' + Format(CharVar[21]) + 'ŽóŽúŽñ';
        AnsiStr := AnsiStr + Format(CharVar[22]) + 'Žª' + Format(CharVar[23]) + 'Ž¿' + Format(CharVar[24]) + Format(CharVar[25]);
        AnsiStr := AnsiStr + Format(CharVar[26]) + 'Ž¼Ž¡Ž«' + Format(CharVar[27]) + 'Ž€' + Format(CharVar[28]) + '=Ž„Ž…ŽÁŽÂŽÀ' +
        Format(CharVar[29]);
        AnsiStr := AnsiStr + 'Ž†Ž‡' + Format(CharVar[30]) + Format(CharVar[31]) + Format(CharVar[32]) + '_ ';
    end;

    [Scope('OnPrem')]
    procedure Ansi2Ascii(_Text: Text[30]): Text[30]
    begin
        MakeVars;
        exit(ConvertStr(_Text, AnsiStr, AsciiStr));
    end;

    [Scope('OnPrem')]
    procedure fntAnularAcentosyEnes(strTexto: Text[100]): Text[100]
    begin
        exit(ConvertStr(strTexto, 'áéíóúñÑ"', 'aeiounN '));
    end;

    [Scope('OnPrem')]
    procedure fntEliminarLetras(_Text: Text[250]): Text[30]
    begin
        exit(DelChr(_Text, '=', 'QWERTYUIOPASDFGHJKLÑZXVBNMC\/ '));
    end;


    [Scope('OnPrem')]
    procedure fntGetAppliedVendorDocs(CreateVendLedgEntry: Record "Vendor Ledger Entry"; var TEMPVendLedgerEntry: Record "Vendor Ledger Entry"; AppliedAmtWithLCY: Boolean)
    var
        DtldVendLedgEntry1: Record "Detailed Vendor Ledg. Entry";
        DtldVendLedgEntry2: Record "Detailed Vendor Ledg. Entry";
        VendLedgerEntryRec: Record "Vendor Ledger Entry";
    begin
        Clear(TEMPVendLedgerEntry);
        DtldVendLedgEntry1.SetCurrentKey("Vendor Ledger Entry No.");
        DtldVendLedgEntry1.SetRange("Vendor Ledger Entry No.", CreateVendLedgEntry."Entry No.");
        DtldVendLedgEntry1.SetRange(Unapplied, false);
        if DtldVendLedgEntry1.Find('-') then
            repeat
                if DtldVendLedgEntry1."Vendor Ledger Entry No." =
                    DtldVendLedgEntry1."Applied Vend. Ledger Entry No."
                then begin
                    DtldVendLedgEntry2.Init;
                    DtldVendLedgEntry2.SetCurrentKey("Applied Vend. Ledger Entry No.", "Entry Type");
                    DtldVendLedgEntry2.SetRange(
                      "Applied Vend. Ledger Entry No.", DtldVendLedgEntry1."Applied Vend. Ledger Entry No.");
                    DtldVendLedgEntry2.SetRange("Entry Type", DtldVendLedgEntry2."Entry Type"::Application);
                    DtldVendLedgEntry2.SetRange(Unapplied, false);
                    if DtldVendLedgEntry2.Find('-') then
                        repeat
                            if DtldVendLedgEntry2."Vendor Ledger Entry No." <>
                                DtldVendLedgEntry2."Applied Vend. Ledger Entry No."
                            then begin
                                VendLedgerEntryRec.SetCurrentKey("Entry No.");
                                VendLedgerEntryRec.SetRange("Entry No.", DtldVendLedgEntry2."Vendor Ledger Entry No.");
                                if VendLedgerEntryRec.Find('-') then begin
                                    VendLedgerEntryRec.Mark(true);
                                    if not TEMPVendLedgerEntry.Get(VendLedgerEntryRec."Entry No.") then begin
                                        TEMPVendLedgerEntry := VendLedgerEntryRec;
                                        if AppliedAmtWithLCY then
                                            TEMPVendLedgerEntry."Amount to Apply" := Abs(DtldVendLedgEntry2."Amount (LCY)")
                                        else
                                            TEMPVendLedgerEntry."Amount to Apply" := Abs(DtldVendLedgEntry2.Amount);
                                        TEMPVendLedgerEntry."Transaction No." := DtldVendLedgEntry2."Entry No.";
                                        TEMPVendLedgerEntry.Insert;
                                        TEMPVendLedgerEntry.Mark(true);
                                    end
                                    else
                                        if TEMPVendLedgerEntry."Transaction No." <> DtldVendLedgEntry2."Entry No." then begin
                                            if AppliedAmtWithLCY then
                                                TEMPVendLedgerEntry."Amount to Apply" += Abs(DtldVendLedgEntry2."Amount (LCY)")
                                            else
                                                TEMPVendLedgerEntry."Amount to Apply" += Abs(DtldVendLedgEntry2.Amount);
                                            TEMPVendLedgerEntry.Modify;
                                            TEMPVendLedgerEntry.Mark(true);
                                        end;
                                end;
                            end;
                        until DtldVendLedgEntry2.Next = 0;
                end else begin
                    VendLedgerEntryRec.SetCurrentKey("Entry No.");
                    VendLedgerEntryRec.SetRange("Entry No.", DtldVendLedgEntry1."Applied Vend. Ledger Entry No.");
                    if VendLedgerEntryRec.Find('-') then begin
                        VendLedgerEntryRec.Mark(true);
                        if not TEMPVendLedgerEntry.Get(VendLedgerEntryRec."Entry No.") then begin
                            TEMPVendLedgerEntry := VendLedgerEntryRec;
                            if AppliedAmtWithLCY then
                                TEMPVendLedgerEntry."Amount to Apply" := Abs(DtldVendLedgEntry1."Amount (LCY)")
                            else
                                TEMPVendLedgerEntry."Amount to Apply" := Abs(DtldVendLedgEntry1.Amount);
                            TEMPVendLedgerEntry."Transaction No." := DtldVendLedgEntry1."Entry No.";
                            TEMPVendLedgerEntry.Insert;
                            TEMPVendLedgerEntry.Mark(true);
                        end
                        else
                            if TEMPVendLedgerEntry."Transaction No." <> DtldVendLedgEntry1."Entry No." then begin
                                if AppliedAmtWithLCY then
                                    TEMPVendLedgerEntry."Amount to Apply" += Abs(DtldVendLedgEntry1."Amount (LCY)")
                                else
                                    TEMPVendLedgerEntry."Amount to Apply" += Abs(DtldVendLedgEntry1.Amount);
                                TEMPVendLedgerEntry.Modify;
                                TEMPVendLedgerEntry.Mark(true);
                            end;
                    end;
                end;
            until DtldVendLedgEntry1.Next = 0;

        VendLedgerEntryRec.SetCurrentKey("Entry No.");
        VendLedgerEntryRec.SetRange("Entry No.");

        if CreateVendLedgEntry."Closed by Entry No." <> 0 then begin
            VendLedgerEntryRec."Entry No." := CreateVendLedgEntry."Closed by Entry No.";
            VendLedgerEntryRec.Mark(true);
            if not TEMPVendLedgerEntry.Get(VendLedgerEntryRec."Entry No.") then begin
                TEMPVendLedgerEntry := VendLedgerEntryRec;
                TEMPVendLedgerEntry.Insert;
                TEMPVendLedgerEntry.Mark(true);
            end
            else
                TEMPVendLedgerEntry.Mark(true);
        end;
        VendLedgerEntryRec.SetCurrentKey("Closed by Entry No.");
        VendLedgerEntryRec.SetRange("Closed by Entry No.", CreateVendLedgEntry."Entry No.");
        if VendLedgerEntryRec.Find('-') then
            repeat
                VendLedgerEntryRec.Mark(true);
                if not TEMPVendLedgerEntry.Get(VendLedgerEntryRec."Entry No.") then begin
                    TEMPVendLedgerEntry := VendLedgerEntryRec;
                    TEMPVendLedgerEntry.Insert;
                    TEMPVendLedgerEntry.Mark(true);
                end
                else
                    TEMPVendLedgerEntry.Mark(true);
            until VendLedgerEntryRec.Next = 0;

        VendLedgerEntryRec.SetCurrentKey("Entry No.");
        VendLedgerEntryRec.SetRange("Closed by Entry No.");

        VendLedgerEntryRec.MarkedOnly(true);

        TEMPVendLedgerEntry.SetCurrentKey("Entry No.");
        TEMPVendLedgerEntry.SetRange("Closed by Entry No.");

        TEMPVendLedgerEntry.MarkedOnly(true);
    end;

    [Scope('OnPrem')]
    procedure fntGetAppliedCustomerDocs(CreateCustLedgEntry: Record "Cust. Ledger Entry"; var TEMPCustLedgerEntry: Record "Cust. Ledger Entry"; AppliedAmtWithLCY: Boolean)
    var
        DtldCustLedgEntry1: Record "Detailed Cust. Ledg. Entry";
        DtldCustLedgEntry2: Record "Detailed Cust. Ledg. Entry";
        CustLedgerEntryRec: Record "Cust. Ledger Entry";
    begin
        Clear(TEMPCustLedgerEntry);
        DtldCustLedgEntry1.SetCurrentKey("Cust. Ledger Entry No.");
        DtldCustLedgEntry1.SetRange("Cust. Ledger Entry No.", CreateCustLedgEntry."Entry No.");
        DtldCustLedgEntry1.SetRange(Unapplied, false);
        if DtldCustLedgEntry1.Find('-') then
            repeat
                if DtldCustLedgEntry1."Cust. Ledger Entry No." =
                    DtldCustLedgEntry1."Applied Cust. Ledger Entry No."
                then begin
                    DtldCustLedgEntry2.Init;
                    DtldCustLedgEntry2.SetCurrentKey("Applied Cust. Ledger Entry No.", "Entry Type");
                    DtldCustLedgEntry2.SetRange(
                      "Applied Cust. Ledger Entry No.", DtldCustLedgEntry1."Applied Cust. Ledger Entry No.");
                    DtldCustLedgEntry2.SetRange("Entry Type", DtldCustLedgEntry2."Entry Type"::Application);
                    DtldCustLedgEntry2.SetRange(Unapplied, false);
                    if DtldCustLedgEntry2.Find('-') then
                        repeat
                            if DtldCustLedgEntry2."Cust. Ledger Entry No." <>
                                DtldCustLedgEntry2."Applied Cust. Ledger Entry No."
                            then begin
                                CustLedgerEntryRec.SetCurrentKey("Entry No.");
                                CustLedgerEntryRec.SetRange("Entry No.", DtldCustLedgEntry2."Cust. Ledger Entry No.");
                                if CustLedgerEntryRec.Find('-') then begin
                                    CustLedgerEntryRec.Mark(true);
                                    if not TEMPCustLedgerEntry.Get(CustLedgerEntryRec."Entry No.") then begin
                                        TEMPCustLedgerEntry := CustLedgerEntryRec;
                                        if AppliedAmtWithLCY then
                                            TEMPCustLedgerEntry."Amount to Apply" := Abs(DtldCustLedgEntry2."Amount (LCY)")
                                        else
                                            TEMPCustLedgerEntry."Amount to Apply" := Abs(DtldCustLedgEntry2.Amount);
                                        TEMPCustLedgerEntry."Transaction No." := DtldCustLedgEntry2."Entry No.";
                                        TEMPCustLedgerEntry.Insert;
                                        TEMPCustLedgerEntry.Mark(true);
                                    end
                                    else
                                        if TEMPCustLedgerEntry."Transaction No." <> DtldCustLedgEntry2."Entry No." then begin
                                            if AppliedAmtWithLCY then
                                                TEMPCustLedgerEntry."Amount to Apply" += Abs(DtldCustLedgEntry2."Amount (LCY)")
                                            else
                                                TEMPCustLedgerEntry."Amount to Apply" += Abs(DtldCustLedgEntry2.Amount);
                                            TEMPCustLedgerEntry.Modify;
                                            TEMPCustLedgerEntry.Mark(true);
                                        end;
                                end;
                            end;
                        until DtldCustLedgEntry2.Next = 0;
                end else begin
                    CustLedgerEntryRec.SetCurrentKey("Entry No.");
                    CustLedgerEntryRec.SetRange("Entry No.", DtldCustLedgEntry1."Applied Cust. Ledger Entry No.");
                    if CustLedgerEntryRec.Find('-') then begin
                        CustLedgerEntryRec.Mark(true);
                        if not TEMPCustLedgerEntry.Get(CustLedgerEntryRec."Entry No.") then begin
                            TEMPCustLedgerEntry := CustLedgerEntryRec;
                            if AppliedAmtWithLCY then
                                TEMPCustLedgerEntry."Amount to Apply" := Abs(DtldCustLedgEntry1."Amount (LCY)")
                            else
                                TEMPCustLedgerEntry."Amount to Apply" := Abs(DtldCustLedgEntry1.Amount);
                            TEMPCustLedgerEntry."Transaction No." := DtldCustLedgEntry1."Entry No.";
                            TEMPCustLedgerEntry.Insert;
                            TEMPCustLedgerEntry.Mark(true);
                        end
                        else
                            if TEMPCustLedgerEntry."Transaction No." <> DtldCustLedgEntry1."Entry No." then begin
                                if AppliedAmtWithLCY then
                                    TEMPCustLedgerEntry."Amount to Apply" += Abs(DtldCustLedgEntry1."Amount (LCY)")
                                else
                                    TEMPCustLedgerEntry."Amount to Apply" += Abs(DtldCustLedgEntry1.Amount);
                                TEMPCustLedgerEntry.Modify;
                                TEMPCustLedgerEntry.Mark(true);
                            end;
                    end;
                end;
            until DtldCustLedgEntry1.Next = 0;

        CustLedgerEntryRec.SetCurrentKey("Entry No.");
        CustLedgerEntryRec.SetRange("Entry No.");

        if CreateCustLedgEntry."Closed by Entry No." <> 0 then begin
            CustLedgerEntryRec."Entry No." := CreateCustLedgEntry."Closed by Entry No.";
            CustLedgerEntryRec.Mark(true);
            if not TEMPCustLedgerEntry.Get(CustLedgerEntryRec."Entry No.") then begin
                TEMPCustLedgerEntry := CustLedgerEntryRec;
                TEMPCustLedgerEntry.Insert;
                TEMPCustLedgerEntry.Mark(true);
            end
            else
                TEMPCustLedgerEntry.Mark(true);
        end;
        CustLedgerEntryRec.SetCurrentKey("Closed by Entry No.");
        CustLedgerEntryRec.SetRange("Closed by Entry No.", CreateCustLedgEntry."Entry No.");
        if CustLedgerEntryRec.Find('-') then
            repeat
                CustLedgerEntryRec.Mark(true);
                if not TEMPCustLedgerEntry.Get(CustLedgerEntryRec."Entry No.") then begin
                    TEMPCustLedgerEntry := CustLedgerEntryRec;
                    TEMPCustLedgerEntry.Insert;
                    TEMPCustLedgerEntry.Mark(true);
                end
                else
                    TEMPCustLedgerEntry.Mark(true);
            until CustLedgerEntryRec.Next = 0;

        CustLedgerEntryRec.SetCurrentKey("Entry No.");
        CustLedgerEntryRec.SetRange("Closed by Entry No.");

        CustLedgerEntryRec.MarkedOnly(true);

        TEMPCustLedgerEntry.SetCurrentKey("Entry No.");
        TEMPCustLedgerEntry.SetRange("Closed by Entry No.");

        TEMPCustLedgerEntry.MarkedOnly(true);
    end;
}

