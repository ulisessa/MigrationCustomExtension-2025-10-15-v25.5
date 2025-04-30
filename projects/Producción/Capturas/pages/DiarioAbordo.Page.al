page 50500 "Diario Abordo"
{
    DataCaptionFields = Buque, Marea, "Zona de pesca";
    DelayedInsert = true;
    DeleteAllowed = true;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "On board capture";
    SourceTableView = SORTING(Buque)
                      ORDER(Ascending);
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group("Diario abordo")
            {
                group(General)
                {
                    field("Cód. Proyecto"; "Cód. Proyecto")
                    {
                        Caption = 'Proyecto';
                        Editable = false;
                        TableRelation = Job."No.";

                        trigger OnValidate()
                        begin
                            PunCabAbordo.Reset;
                            PunCabAbordo.SetCurrentKey(PunCabAbordo.Buque);
                            if PunCabAbordo.Get(Proyecto) then
                                Rec.Copy(PunCabAbordo)
                            else begin

                                PunProyecto.Reset;
                                if PunProyecto.Get(Buque) then begin
                                    Buque := PunProyecto."No.";
                                    Buque := PunProyecto."Global Dimension 1 Code";
                                    Marea := PunProyecto."Global Dimension 3 Code";
                                    Patrón := PunProyecto.Patron;
                                    "Fecha Salida" := PunProyecto."Starting Date";
                                    if PunProyecto."Starting Date" = 0D then
                                        //          BEGIN
                                        //            CurrForm."Fecha Salida".EDITABLE(TRUE);
                                        CurrPage.Update(true);
                                    //          END;

                                end;
                            end;
                            /*
                            CLEAR(rstConfEx);
                            rstConfEx.GET();
                            
                            IF PunProyecto.Actividad = 'LAN' THEN
                            BEGIN
                            
                              i +=10000;
                              IF rstConfEx."L-Producto 1" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."L-Producto 1";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."L-Producto 2" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."L-Producto 2";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."L-Producto 3" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."L-Producto 3";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."L-Producto 4" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."L-Producto 4";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."L-Producto 5" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."L-Producto 5";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."L-Producto 6" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."L-Producto 6";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."L-Producto 7" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."L-Producto 7";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."L-Producto 8" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."L-Producto 8";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."L-Producto 9" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."L-Producto 9";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."L-Producto 10" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."L-Producto 10";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."L-Producto 11" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."L-Producto 11";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."L-Producto 12" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."L-Producto 12";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                            END;
                            
                            IF PunProyecto.Actividad = 'CAL' THEN
                            BEGIN
                            
                              i +=10000;
                              IF rstConfEx."C-Producto 1" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."C-Producto 1";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."C-Producto 2" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."C-Producto 2";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."C-Producto 3" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."C-Producto 3";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."C-Producto 4" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."C-Producto 4";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."C-Producto 5" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."C-Producto 5";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."C-Producto 6" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."C-Producto 6";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."C-Producto 7" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."C-Producto 7";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."C-Producto 8" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."C-Producto 8";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."C-Producto 9" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."C-Producto 9";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."C-Producto 10" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."C-Producto 10";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."C-Producto 11" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."C-Producto 11";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                              i +=10000;
                              IF rstConfEx."C-Producto 12" <> '' THEN
                              BEGIN
                            
                                CLEAR(rstlinAbordo);
                                rstlinAbordo.Buque :=Buque;
                                rstlinAbordo.Marea := Marea;
                                rstlinAbordo."Fecha registro" := "Fecha Registro";
                                rstlinAbordo."Cód. proyecto" := "Cód. Proyecto";
                                rstlinAbordo."No. Semana" := "No. Semana";
                                rstlinAbordo."No. Línea" := i;
                                rstlinAbordo."Fecha salida" := "Fecha Salida";
                                rstlinAbordo."Cód. Producto" := rstConfEx."C-Producto 12";
                                rstlinAbordo.INSERT;
                            
                              END;
                            
                            END;
                             */

                        end;
                    }
                    field(Buque; Buque)
                    {
                        Editable = true;
                        Enabled = true;
                        TableRelation = "Dimension Value".Code WHERE("Use code" = CONST(Buque),
                                                                      "Global Dimension No." = CONST(1));
                    }
                    field(Marea; Marea)
                    {
                        Editable = true;
                        TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

                        trigger OnValidate()
                        begin
                            Clear(rstProyecto);
                            if rstProyecto.Get('PP-' + Buque + '-' + Marea) then
                                Validate("Cód. Proyecto", rstProyecto."No.");
                        end;
                    }
                    field("Patrón"; Patrón)
                    {
                    }
                    field("Zona de pesca"; "Zona de pesca")
                    {
                    }
                    field("Fecha Salida"; "Fecha Salida")
                    {
                    }
                    field("Histórico"; Histórico)
                    {
                        Editable = false;
                    }
                }
                part("Resumen de captura"; "Subform. Matriz Abordo")
                {
                    Description = 'Resumen de captura';
                    Editable = false;
                    ShowFilter = false;
                    SubPageLink = "Global Dimension 1 Filter" = FIELD(Buque),
                                  "Global Dimension 3 filter" = FIELD(Marea);
                }
            }
            group("Zona pesca")
            {
                Visible = false;
                field("Latitud - Grados"; "Latitud - Grados")
                {
                }
                field("Latitud - Minutos"; "Latitud - Minutos")
                {
                }
                field("Latitud - Segundos"; "Latitud - Segundos")
                {
                }
                field("Longitud - Grados"; "Longitud - Grados")
                {
                }
                field("Longitud - Minutos"; "Longitud - Minutos")
                {
                }
                field("Longitud - Segundos"; "Longitud - Segundos")
                {
                }
            }
            part(Control19; "Subform Diario Abordo")
            {
                SubPageLink = "Cód. proyecto" = FIELD("Cód. Proyecto");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Imprimir")
                {
                    Caption = '&Imprimir';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        //IBdos Argentina - USS - 040403 - Inicio Modificación Arbumasa
                        //Botón para imprimir

                        CurrPage.SetSelectionFilter(Rec);
                        REPORT.Run(REPORT::"Capturas diarias", true, false, Rec);
                        Reset;

                        //IBdos Argentina - USS - 040403 - Fin Modificación Arbumasa
                    end;
                }
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    begin
        rstLinDAbordo.Reset;
        rstLinDAbordo.SetRange(Buque, Buque);
        rstLinDAbordo.SetRange(Marea, Marea);
        rstLinDAbordo.SetRange("Fecha registro", "Fecha Registro");
        rstLinDAbordo.DeleteAll;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
    end;

    trigger OnOpenPage()
    begin
        Clear(rstConfUsu);
        rstConfUsu.Get(UserId);
        Clear(rstSeguridad);
        rstSeguridad.Get(rstConfUsu.Grupo);
        if rstSeguridad.Flota then
            SetFilter(Histórico, '%1', 0D);
    end;

    var
        rstLinDAbordo: Record "On board capture lines";
        Proyecto: Code[20];
        PunProyecto: Record Job;
        PunCabAbordo: Record "On board capture";
        rstlinAbordo: Record "On board capture lines";
        rstConfEx: Record "Inventory Setup";
        i: Integer;
        rstCabDiario: Record "On board capture";
        rstProyecto: Record Job;
        rstConfUsu: Record "User Setup";
        rstSeguridad: Record Seguridad;
        rstBuque: Record "Dimension Value";
        cduSMTPMail: Codeunit Mail;
        rstTipoDoc: Record "Tipos documento";
        Text50001: Label 'Se remite el presente Diario de Capturas.';
        Text50002: Label 'Muchas gracias.';
        cduRegistroDiarios: Codeunit "Registro diarios";
        rstSeguridadUsuario: Record "Seguridad por usuario";
        CodeMens: Codeunit "Mensajería";
        PunMensajeria: Record Mensajeria;

        IniciarNuevaVisible: Boolean;

    [Scope('OnPrem')]
    procedure fntEnviar()
    var
        l_strDestinatarios: Text;
        Base64: Codeunit "Base64 Convert";
    begin
        Clear(cduSMTPMail);
        Clear(rstConfUsu);
        rstConfUsu.Get(UserId);
        Clear(rstTipoDoc);
        rstTipoDoc.Get('Diario abordo', 50500);

        Clear(rstBuque);
        rstBuque.SetRange(rstBuque.Code, Buque);
        rstBuque.Find('-');
        If rstTipoDoc."e-mail" <> '' then
            l_strDestinatarios := rstConfUsu."E-Mail" + ';' + rstTipoDoc."e-mail"
        else
            If rstConfUsu."E-Mail" <> '' then
                l_strDestinatarios := rstConfUsu."E-Mail";
        cduSMTPMail.CreateMessage(l_strDestinatarios, '', '', 'Diario abordo' + ' ' + rstBuque.Name + ', N° ' + Marea,
                                  '', true, false);
        //cduSMTPMail.AddBodyline(Text50001);
        //cduSMTPMail.AddBodyline(Text50002);

        //cduSMTPMail.AttachFile(TemporaryPath + cduRegistroDiarios.GenerarNombreArchivo('Diario abordo', Buque, Marea, Buque));
        //cduSMTPMail.Send();

        Clear(rstConfUsu);
        rstConfUsu.Get(UserId);

        Clear(rstSeguridad);
        Clear(rstSeguridadUsuario);

        rstConfUsu.Reset;
        if rstConfUsu.Get(UserId) then
            CodeMens.RegistrarMensaje('', '', Marea, 'Diario abordo', 'Enviado', Today,
            PunMensajeria."Tipo movimiento"::Seguimiento, rstConfUsu.Grupo, '', '', '', '', '', '', '');

        Clear(rstLinDAbordo);
        rstLinDAbordo.SetRange(Buque, Buque);
        rstLinDAbordo.SetRange(Marea, Marea);
        rstLinDAbordo.SetRange(Enviado, false);
        if rstLinDAbordo.Find('-') then;

        Modify;

        rstConfUsu.Reset;
        if rstConfUsu.Get(UserId) then
            CodeMens.RegistrarMensaje('', '', Marea, 'Diario abordo', 'Registrado', Today,
            PunMensajeria."Tipo movimiento"::Seguimiento, rstConfUsu.Grupo, '', '', '', '', '', '', '');

        Clear(rstLinDAbordo);
        rstLinDAbordo.SetRange(Buque, Buque);
        rstLinDAbordo.SetRange(Marea, Marea);
        rstLinDAbordo.SetRange(Enviado, false);
        rstLinDAbordo.ModifyAll(Enviado, true);

    end;

    [Scope('OnPrem')]
    procedure fntEnviarCorreo(): Boolean
    var
        CodeCorreo: Codeunit Mail;
    begin
        Clear(cduSMTPMail);
        Clear(rstConfUsu);
        rstConfUsu.Get(UserId);
        Clear(rstTipoDoc);
        rstTipoDoc.Get('Diario abordo');
        Clear(rstBuque);
        rstBuque.SetRange(rstBuque.Code, Buque);
        rstBuque.Find('-');

        Clear(CodeCorreo);
        CodeCorreo.NewMessage(rstTipoDoc."e-mail", '', '',
          'Diario abordo' + ' ' + rstBuque.Name + ', No. ' + Marea, Text50001 + ' ' + Text50002,
          (TemporaryPath + cduRegistroDiarios.GenerarNombreArchivo('Diario abordo', Buque, Marea, Buque)), false);
    end;

    trigger OnAfterGetCurrRecord()
    begin
        xRec := Rec;

        if Histórico = 0D then begin

            CurrPage.Editable(true);
            if RecordLevelLocking then
                IniciarNuevaVisible := false
            else
                IniciarNuevaVisible := true;

        end
        else begin

            CurrPage.Editable(false);
            if RecordLevelLocking then
                IniciarNuevaVisible := false
            else
                IniciarNuevaVisible := true;

        end;
    end;
}

