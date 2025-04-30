codeunit 50505 "Liquidación proveedores"
{

    trigger OnRun()
    begin
    end;

    [Scope('OnPrem')]
    procedure fntInsertarPago(codLiq: Code[20]; codLDPago: Code[20]; codSDPago: Code[20])
    var
        rstLinDiaGen: Record "Gen. Journal Line";
        rstLinDiaGenTot: Record "Gen. Journal Line";
        intLinea: Integer;
        rstMovLiq: Record "Lín. Liquidacion Pagos";
        GestNroDoc: Codeunit "No. Series";
        rstSeccion: Record "Gen. Journal Batch";
        rstCabLiq: Record "Cab. Liquidacion Pagos";
        rstMovProv: Record "Vendor Ledger Entry";
        cduRegistroDiarios: Codeunit "Retenciones";
        decImporteTotal: Decimal;
        codProv: Code[20];
        codDocumento: Code[20];
        codCheque: Code[10];
        i: Integer;
        j: Integer;
        dlgRegistrar: Dialog;
        h: Integer;
        decTotalLineas: Integer;
        rstHCabLiq: Record "Hist. cab. liquidacion pagos";
    begin
        if Confirm('Este proceso eliminará todas las líneas preexistentes en el diario ' + codLDPago + ',\' +
                   'sección ' + codSDPago + '\¿Desea registrar la liquidación ' + codLiq + '?') then begin

            Clear(dlgRegistrar);
            dlgRegistrar.Open('Registrando........N° líneas:  #1###########\' +
                              '...................Procesadas: #2###########\' +
                              '...................Pendientes: #3###########\');
            Clear(rstSeccion);
            rstSeccion.Get(codLDPago, codSDPago);

            Clear(rstLinDiaGen);
            rstLinDiaGen.SetRange("Journal Template Name", codLDPago);
            rstLinDiaGen.SetRange("Journal Batch Name", codSDPago);
            rstLinDiaGen.DeleteAll(true);
            h := 0;
            Clear(rstCabLiq);
            rstCabLiq.Get(codLiq);

            rstCabLiq.TestField("Cód. medio de pago");
            rstCabLiq.TestField("Fecha pago");
            rstCabLiq.CalcFields(Importe);
            Clear(rstMovLiq);
            rstMovLiq.SetRange(rstMovLiq."No. Liquidacion", codLiq);
            rstMovLiq.SetCurrentKey("No. Liquidacion", "No. proveedor");
            decTotalLineas := rstMovLiq.Count;
            dlgRegistrar.Update(1, decTotalLineas);
            if rstMovLiq.Find('-') then
                repeat

                    //Si el proveedor cambió o es el primer movimiento de liq.
                    if codProv <> rstMovLiq."No. proveedor" then begin

                        //Si no es el primer movimiento de liq.
                        if codProv <> '' then begin

                            //calculo retenciones
                            Clear(cduRegistroDiarios);
                            rstLinDiaGen.SetRecFilter;
                            cduRegistroDiarios.fntNoSolicitarConfirmaciones(false);
                            cduRegistroDiarios.Retenciones(rstLinDiaGen, false);

                            //Genero la contrapartida del último documento generado
                            decImporteTotal := 0;
                            intLinea := 0;
                            Clear(rstLinDiaGenTot);
                            rstLinDiaGenTot.SetRange(rstLinDiaGenTot."Journal Template Name", codLDPago);
                            rstLinDiaGenTot.SetRange(rstLinDiaGenTot."Journal Batch Name", codSDPago);
                            rstLinDiaGenTot.SetRange("Document No.", codDocumento);
                            if rstLinDiaGenTot.Find('-') then
                                repeat

                                    intLinea := rstLinDiaGenTot."Line No." + 10000;
                                    decImporteTotal += rstLinDiaGenTot."Amount (LCY)";
                                    rstLinDiaGenTot."No. liquidación" := codLiq;
                                    rstLinDiaGenTot."No. cheque" := codCheque;
                                    rstLinDiaGenTot.Modify;

                                until rstLinDiaGenTot.Next = 0;

                            Clear(rstMovProv);
                            rstMovProv.Get(rstMovLiq."No. mov.");

                            Clear(rstLinDiaGen);
                            rstLinDiaGen."Journal Template Name" := codLDPago;
                            rstLinDiaGen."Journal Batch Name" := codSDPago;
                            rstLinDiaGen."Line No." := intLinea;
                            case rstCabLiq."Pago mediante" of
                                rstCabLiq."Pago mediante"::Cuenta:
                                    rstLinDiaGen.Validate("Account Type", rstLinDiaGen."Account Type"::"G/L Account");
                                rstCabLiq."Pago mediante"::Banco:
                                    rstLinDiaGen.Validate("Account Type", rstLinDiaGen."Account Type"::"Bank Account");
                            end;

                            rstLinDiaGen.Validate("Posting Date", rstCabLiq."Fecha pago");
                            rstLinDiaGen.Validate("Account No.", rstCabLiq."Cód. medio de pago");
                            rstLinDiaGen.Validate("Document Type", rstLinDiaGen."Document Type"::Payment);
                            rstLinDiaGen."Document No." := codDocumento;
                            rstLinDiaGen."Posting No. Series" := rstSeccion."Posting No. Series";
                            rstLinDiaGen.Validate("Amount (LCY)", -decImporteTotal);
                            rstLinDiaGen."Transaction No." := i;
                            rstLinDiaGen."No. cheque" := codCheque;
                            rstLinDiaGen."No. liquidación" := codLiq;
                            rstLinDiaGen.Insert;

                            //Una vez generada la contrapartida del anterior, genero la nueva línea en que estoy parado
                            with rstMovLiq do begin

                                if codCheque <> '' then begin

                                    codCheque := IncStr(codCheque);
                                    i += 1;

                                end;

                                codProv := rstMovLiq."No. proveedor";
                                Clear(GestNroDoc);
                                codDocumento := GestNroDoc.GetNextNo(rstSeccion."No. Series Application", rstCabLiq."Fecha pago", true);

                                Clear(rstMovProv);
                                rstMovProv.Get(rstMovLiq."No. mov.");

                                Clear(rstLinDiaGen);
                                intLinea += 10000;
                                rstLinDiaGen."Journal Template Name" := codLDPago;
                                rstLinDiaGen."Journal Batch Name" := codSDPago;
                                rstLinDiaGen."Line No." := intLinea;
                                rstLinDiaGen.Validate("Account Type", rstLinDiaGen."Account Type"::Vendor);
                                rstLinDiaGen.Validate("Posting Date", rstCabLiq."Fecha pago");
                                rstLinDiaGen.Validate("Account No.", rstMovLiq."No. proveedor");
                                rstLinDiaGen.Validate("Document Type", rstLinDiaGen."Document Type"::Payment);
                                rstLinDiaGen."Document No." := codDocumento;
                                rstLinDiaGen."Posting No. Series" := rstSeccion."Posting No. Series";
                                rstLinDiaGen.Validate("Applies-to Doc. Type", rstMovProv."Document Type");
                                rstLinDiaGen.Validate("Applies-to Doc. No.", "No. documento");
                                rstLinDiaGen.Validate("Currency Code", "Cód. divisa");
                                rstLinDiaGen.Validate(Amount, -"Importe a pagar");
                                rstLinDiaGen."Transaction No." := i;
                                rstLinDiaGen."No. liquidación" := codLiq;
                                rstLinDiaGen.Insert;

                            end;

                            //Si es el primer movimiento de liq.
                        end
                        else begin

                            codCheque := Format(rstCabLiq."Primer No. cheque");
                            i := 1;

                            with rstMovLiq do begin

                                codProv := rstMovLiq."No. proveedor";
                                Clear(GestNroDoc);
                                codDocumento := GestNroDoc.GetNextNo(rstSeccion."No. Series Application"/*rstSeccion."No. Series"*/, rstCabLiq."Fecha pago", true);

                                Clear(rstMovProv);
                                rstMovProv.Get(rstMovLiq."No. mov.");

                                Clear(rstLinDiaGen);
                                intLinea += 10000;
                                rstLinDiaGen."Journal Template Name" := codLDPago;
                                rstLinDiaGen."Journal Batch Name" := codSDPago;
                                rstLinDiaGen."Line No." := intLinea;
                                rstLinDiaGen.Validate("Account Type", rstLinDiaGen."Account Type"::Vendor);
                                rstLinDiaGen.Validate("Posting Date", rstCabLiq."Fecha pago");
                                rstLinDiaGen.Validate("Account No.", rstMovLiq."No. proveedor");
                                rstLinDiaGen.Validate("Document Type", rstLinDiaGen."Document Type"::Payment);
                                rstLinDiaGen."Document No." := codDocumento;
                                rstLinDiaGen."Posting No. Series" := rstSeccion."Posting No. Series";
                                rstLinDiaGen.Validate("Applies-to Doc. Type", rstMovProv."Document Type");
                                rstLinDiaGen.Validate("Applies-to Doc. No.", "No. documento");
                                rstLinDiaGen.Validate("Currency Code", "Cód. divisa");
                                rstLinDiaGen.Validate(Amount, -"Importe a pagar");
                                rstLinDiaGen."Transaction No." := i;
                                rstLinDiaGen."No. liquidación" := codLiq;
                                rstLinDiaGen.Insert;

                            end;

                        end;

                        //Si el proveedor no cambió desde el último movimiento
                    end
                    else begin

                        with rstMovLiq do begin

                            Clear(rstMovProv);
                            rstMovProv.Get(rstMovLiq."No. mov.");

                            Clear(rstLinDiaGen);
                            intLinea += 10000;
                            rstLinDiaGen."Journal Template Name" := codLDPago;
                            rstLinDiaGen."Journal Batch Name" := codSDPago;
                            rstLinDiaGen."Line No." := intLinea;
                            rstLinDiaGen.Validate("Account Type", rstLinDiaGen."Account Type"::Vendor);
                            rstLinDiaGen.Validate("Posting Date", rstCabLiq."Fecha pago");
                            rstLinDiaGen.Validate("Account No.", rstMovLiq."No. proveedor");
                            rstLinDiaGen.Validate("Document Type", rstLinDiaGen."Document Type"::Payment);
                            rstLinDiaGen."Document No." := codDocumento;
                            rstLinDiaGen."Posting No. Series" := rstSeccion."Posting No. Series";
                            rstLinDiaGen.Validate("Applies-to Doc. Type", rstMovProv."Document Type");
                            rstLinDiaGen.Validate("Applies-to Doc. No.", "No. documento");
                            rstLinDiaGen.Validate("Currency Code", "Cód. divisa");
                            rstLinDiaGen.Validate(Amount, -"Importe a pagar");
                            rstLinDiaGen."No. liquidación" := codLiq;
                            rstLinDiaGen."Transaction No." := i;
                            rstLinDiaGen.Insert;

                        end;

                    end;

                    h += 1;
                    dlgRegistrar.Update(2, h);
                    dlgRegistrar.Update(3, decTotalLineas - h);

                until rstMovLiq.Next = 0;

            //Calculo retenciones
            Clear(cduRegistroDiarios);
            rstLinDiaGen.SetRecFilter;
            cduRegistroDiarios.fntNoSolicitarConfirmaciones(false);
            cduRegistroDiarios.Retenciones(rstLinDiaGen, false);

            //Una vez finalizados los movimientos, calculo la última contrapartida
            decImporteTotal := 0;
            intLinea := 0;
            Clear(rstLinDiaGenTot);
            rstLinDiaGenTot.SetRange(rstLinDiaGenTot."Journal Template Name", codLDPago);
            rstLinDiaGenTot.SetRange(rstLinDiaGenTot."Journal Batch Name", codSDPago);
            rstLinDiaGenTot.SetRange("Document No.", codDocumento);
            if rstLinDiaGenTot.Find('-') then
                repeat

                    intLinea := rstLinDiaGenTot."Line No." + 10000;
                    decImporteTotal += rstLinDiaGenTot."Amount (LCY)";
                    rstLinDiaGenTot."No. liquidación" := codLiq;
                    rstLinDiaGenTot."No. cheque" := codCheque;
                    rstLinDiaGenTot.Modify;

                until rstLinDiaGenTot.Next = 0;

            Clear(rstMovProv);
            rstMovProv.Get(rstMovLiq."No. mov.");

            Clear(rstLinDiaGen);
            rstLinDiaGen."Journal Template Name" := codLDPago;
            rstLinDiaGen."Journal Batch Name" := codSDPago;
            rstLinDiaGen."Line No." := intLinea;
            case rstCabLiq."Pago mediante" of
                rstCabLiq."Pago mediante"::Cuenta:
                    rstLinDiaGen.Validate("Account Type", rstLinDiaGen."Account Type"::"G/L Account");
                rstCabLiq."Pago mediante"::Banco:
                    rstLinDiaGen.Validate("Account Type", rstLinDiaGen."Account Type"::"Bank Account");
            end;

            rstLinDiaGen.Validate("Posting Date", rstCabLiq."Fecha pago");
            rstLinDiaGen.Validate("Account No.", rstCabLiq."Cód. medio de pago");
            rstLinDiaGen.Validate("Document Type", rstLinDiaGen."Document Type"::Payment);
            rstLinDiaGen."Document No." := codDocumento;
            rstLinDiaGen."Posting No. Series" := rstSeccion."Posting No. Series";
            rstLinDiaGen.Validate("Amount (LCY)", -decImporteTotal);
            rstLinDiaGen."No. cheque" := codCheque;
            rstLinDiaGen."Transaction No." := i;
            rstLinDiaGen."No. liquidación" := codLiq;
            rstLinDiaGen.Insert;

            rstCabLiq.Registrado := true;
            rstCabLiq.Modify;

            Clear(rstHCabLiq);
            rstHCabLiq.TransferFields(rstCabLiq);
            rstHCabLiq.Insert;
            //rstCabLiq.DELETE;

            dlgRegistrar.Close;
            Message('Se ha registrado correctamente la liquidación n° %1', codLiq);

        end
        else
            Message('Proceso cancelado');

    end;

}

