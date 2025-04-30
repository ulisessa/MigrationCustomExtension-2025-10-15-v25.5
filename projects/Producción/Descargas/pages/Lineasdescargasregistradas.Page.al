page 50654 "Lineas descargas registradas"
{
    AutoSplitKey = true;
    DataCaptionFields = "No. Pallet", Description;
    DelayedInsert = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = ListPart;
    SourceTable = "Lín. descarga";
    SourceTableView = SORTING("No. proyecto", "Line no.");

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("No. proyecto"; "No. proyecto")
                {
                    Editable = blnRegistrado;
                    Visible = false;
                }
                field("Fecha remito"; "Fecha remito")
                {
                    Editable = blnRegistrado;
                }
                field("No. remito"; "No. remito")
                {
                    Editable = blnRegistrado;

                    trigger OnAssistEdit()
                    begin
                        Clear(frmDigitalizar);
                        Clear(rstDigitalizar);
                        Clear(rstConfusu);
                        rstConfusu.Get(UserId);
                        //rstDigitalizar.SETRANGE(Documento,'Descarga');
                        rstDigitalizar.SetRange(Departamento, rstConfusu.Grupo);
                        frmDigitalizar.funLlamarCapturador('Descarga', "No. remito", '', "No. proyecto", '', '', '', "No. remito", '', '', '');
                        frmDigitalizar.LookupMode(true);
                        frmDigitalizar.SetTableView(rstDigitalizar);
                        if frmDigitalizar.RunModal = ACTION::LookupOK then begin

                            frmDigitalizar.GetRecord(rstDigitalizar);
                            cduDigitalizarOAbrir.ImportarDocumento(rstDigitalizar.Documento,
                            Format(Today), rstDigitalizar.Departamento, "No. proyecto", UserId, "No. proyecto", Format(Today), '', '', '', '',
                            rstDigitalizar, false, false, true, '', false, false);

                        end;
                    end;
                }
                field("No. Pallet"; "No. Pallet")
                {
                    Editable = blnRegistrado;
                    Style = StrongAccent;
                    StyleExpr = "No. PalletEmphasize";

                    trigger OnValidate()
                    begin
                        UpdateForm;
                    end;
                }
                field(Location; Location)
                {
                    Editable = blnRegistrado;
                }
                field("Bin code"; "Bin code")
                {
                    Editable = blnRegistrado;
                }
                field("Item no."; "Item no.")
                {
                    Editable = blnRegistrado;

                    trigger OnValidate()
                    begin
                        UpdateForm;
                    end;
                }
                field(Description; Description)
                {
                    Editable = blnRegistrado;
                }
                field("Unidad medida"; "Unidad medida")
                {
                    Editable = blnRegistrado;
                }
                field(Cantidad; Cantidad)
                {
                    Editable = blnRegistrado;

                    trigger OnValidate()
                    begin
                        UpdateForm;
                    end;
                }
                field("Net weight"; "Net weight")
                {
                    Editable = blnRegistrado;

                    trigger OnValidate()
                    begin
                        UpdateForm;
                    end;
                }
                field("Gross weight"; "Gross weight")
                {
                    Editable = blnRegistrado;

                    trigger OnValidate()
                    var
                        l_pgeWeighing: Page Weighing;
                        l_rstCabDesc: Record "Cab. descarga";
                        l_rstScale: Record "Weighing Scale Parameters";
                        optTDoc: Option Salida,Descarga;
                    begin
                        Clear(l_rstScale);

                        if l_rstScale.Get(codBalanza) then begin
                            codBalanza := l_rstScale."Scale code";
                            strBalanza := l_rstScale.Name;
                            intBultos := Cantidad;
                            /*
                            IF Confirmed = Confirmed::Confirmada THEN
                              ERROR('La línea seleccionada ya fue confirmada, por favor reinicie la línea si desea corregir la pesada.');
                            CLEAR(l_pgeWeighing);
                            */
                            l_pgeWeighing.fntPesada(l_rstScale."Scale code", strBalanza, Cantidad, "Gross weight", "Item no.", Status, Tare);
                            l_pgeWeighing.fntMiDoc(optTDoc::Descarga, "No. proyecto", "Line no.");
                            l_pgeWeighing.Editable(true);
                            l_pgeWeighing.LookupMode := true;
                            l_pgeWeighing.Run;
                        end;
                        UpdateForm;

                    end;
                }
                field("Manual unit of measure"; "Manual unit of measure")
                {
                    Editable = true;
                }
                field("Manual weight"; "Manual weight")
                {
                    Editable = true;

                    trigger OnValidate()
                    var
                        l_rstCabDescarga: Record "Cab. descarga";
                    begin
                        Clear(l_rstCabDescarga);
                        l_rstCabDescarga.Get("No. proyecto");
                        l_rstCabDescarga.TestField(Registrado, true);
                    end;
                }
                field(Promedio; Promedio)
                {
                    Editable = blnRegistrado;
                }
                field(Temperatura; Temperatura)
                {
                    Editable = blnRegistrado;
                }
                field("Hora de ingreso"; "Hora de ingreso")
                {
                    Editable = blnRegistrado;
                }
                field("Tipo de amparo sanitario"; "Tipo de amparo sanitario")
                {
                    Editable = blnRegistrado;
                }
                field("No. amparo sanitario"; "No. amparo sanitario")
                {
                    Editable = blnRegistrado;
                }
                field(Destino; Destino)
                {
                    Editable = blnRegistrado;
                }
                field("Transport's license"; "Transport's license")
                {
                    Editable = blnRegistrado;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Action1100227002)
            {
                Caption = 'Acciones';
                action(Digitalizar)
                {
                    Caption = '&Digitalizar';
                    Image = DocInBrowser;

                    trigger OnAction()
                    begin
                        Clear(frmDigitalizar);
                        Clear(rstDigitalizar);
                        Clear(rstConfusu);
                        rstConfusu.Get(UserId);
                        //rstDigitalizar.SETRANGE(Documento,'Descarga');
                        //rstDigitalizar.SETRANGE(Departamento,rstConfusu.Grupo);
                        frmDigitalizar.funLlamarCapturador('Descarga', "No. remito", '', "No. proyecto", '', '', '', "No. remito", '', '', '');
                        frmDigitalizar.LookupMode(true);
                        frmDigitalizar.SetTableView(rstDigitalizar);
                        if frmDigitalizar.RunModal = ACTION::LookupOK then begin

                            frmDigitalizar.GetRecord(rstDigitalizar);
                            cduDigitalizarOAbrir.ImportarDocumento(rstDigitalizar.Documento,
                            Format(Today), rstDigitalizar.Departamento, "No. proyecto", UserId, "No. proyecto", Format(Today), '', '', '', '',
                            rstDigitalizar, false, false, true, '', false, false);

                        end;
                    end;
                }
                action("&Navegar")
                {
                    Caption = '&Navigate';
                    Image = Navigate;

                    trigger OnAction()
                    begin
                        Navigate;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        l_rstScale: Record "Weighing Scale Parameters";
        l_rstCabDesc: Record "Cab. descarga";
    begin
        N186PalletOnFormat;
        Clear(l_rstScale);
        Clear(l_rstCabDesc);
        l_rstCabDesc.Get("No. proyecto");
        if l_rstScale.Get(l_rstCabDesc."Scale code") then begin
            codBalanza := l_rstScale."Scale code";
            strBalanza := l_rstScale.Name;
            intBultos := Cantidad;
        end;
        if l_rstCabDesc."No. proyecto" <> '' then begin
            if l_rstCabDesc.Registrado then
                blnRegistrado := false
            else
                blnRegistrado := true;
        end;
    end;

    var
        rstDigitalizar: Record "Ruta digitalizacion depto/espe";
        rstConfusu: Record "User Setup";
        rstLinDescarga: Record "Lín. descarga";
        "No. PalletEmphasize": Boolean;
        cduDigitalizarOAbrir: Codeunit Escaneado;
        frmDigitalizar: Page "Ruta digitalización";
        decPesoUnitario: Decimal;
        codBalanza: Code[10];
        strBalanza: Text;
        intBultos: Integer;
        blnRegistrado: Boolean;

    local procedure N186PalletOnFormat()
    begin
        if "No. Pallet" <> '' then begin

            Clear(rstLinDescarga);
            rstLinDescarga.SetRange(rstLinDescarga."No. proyecto", "No. proyecto");
            rstLinDescarga.SetRange("No. Pallet", "No. Pallet");
            if rstLinDescarga.Count > 1 then
                "No. PalletEmphasize" := true
            else
                "No. PalletEmphasize" := false;

        end;
    end;

    [Scope('OnPrem')]
    procedure UpdateForm()
    begin
        /*IF ISCLEAR(WshShell) THEN
          CREATE(WshShell, TRUE, TRUE);
        WshShell.SendKeys('{F5}');
         */

    end;

    local procedure fntCalcQty()
    begin
        if Tare > 0 then
            Tare := Tare * -1;

        if (Tare <> 0) and ("Gross weight" <> 0) then begin
            "Gross + Tare" := "Gross weight" + Tare;
            if (intBultos <> 0) and ("Gross weight" <> 0) then
                decPesoUnitario := Round(("Gross weight" + Tare) / intBultos, 0.01)
            else
                decPesoUnitario := 0;
        end;
    end;

    local procedure fntConfirmed(): Boolean
    begin
        /*
        IF (Confirmed = Confirmed::Confirmada)
          AND ("Qty. per Bulk" <> 0)
          AND ("Scale code" <> '')
          AND ("Location code" <> '')
          AND ("Item no." <> '')
          AND (Tare <> 0)
        THEN
          EXIT(FALSE)
        ELSE
          EXIT(TRUE);
        */

    end;
}

