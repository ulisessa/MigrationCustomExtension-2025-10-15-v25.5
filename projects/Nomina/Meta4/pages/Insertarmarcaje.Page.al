page 50078 "Insertar marcaje"
{
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("rstMarkupInsert.""File no."""; rstMarkupInsert."File no.")
                {
                    Caption = 'Legajo';
                    TableRelation = Employee;

                    trigger OnValidate()
                    begin
                        Clear(rstRec);
                        if rstRec.Get(rstMarkupInsert."File no.") then begin

                            rstMarkupInsert."User ID" := rstMarkupInsert."File no.";
                            rstMarkupInsert.Userid := rstRec."No.";
                            rstMarkupInsert.Name := rstRec.Name;
                            rstMarkupInsert."Workday code" := rstRec."Workday code";
                            rstMarkupInsert."Hiring date" := rstRec."Employment Date";

                        end;
                    end;
                }
                field("rstMarkupInsert.Name"; rstMarkupInsert.Name)
                {
                    Caption = 'Nombre';
                    Editable = false;
                }
                field("rstMarkupInsert.""Markup date and time"""; rstMarkupInsert."Markup date and time")
                {
                    Caption = 'Marcaje';
                }
                field("rstMarkupInsert.""Workday code"""; rstMarkupInsert."Workday code")
                {
                    Caption = 'Jornada';
                    TableRelation = Workday;
                }
                field("rstMarkupInsert.""Event code"""; rstMarkupInsert."Event code")
                {
                    Caption = 'Evento';
                    TableRelation = "Meta4 concept";

                    trigger OnValidate()
                    begin
                        Clear(rstConcept);
                        if rstConcept.Get(rstMarkupInsert."Event code") then;
                        if rstConcept."Hours per unit" = 23.99 then begin

                            rstMarkupInsert."Markup date and time" := CreateDateTime(DT2Date(rstMarkupInsert."Markup date and time"), 0T);
                            rstMarkupInsert."Fecha filtro" := DT2Date(rstMarkupInsert."Markup date and time");
                            blnDiaCompletoVisible := true;
                            intCantidad := 0;

                        end
                        else begin

                            blnDiaCompletoVisible := false;
                            intCantidad := 1;

                        end;
                    end;
                }
                field(optDiasHoras; optDiasHoras)
                {
                    ShowCaption = false;
                }
                field(intCantidad; intCantidad)
                {
                    Caption = 'Cantidad repeticiones';
                }
                field(intCantidadMarcaje; intCantidadMarcaje)
                {
                    Caption = 'Cantidad horas';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Insertar")
            {
                Caption = '&Insertar';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    msa002: Label 'No puede ingresar una cantidad en días y horas, seleccione una sola opción';
                begin
                    if rstConcept.Get(rstMarkupInsert."Event code") then;

                    if Confirm(Msa001) then begin

                        if intCantidad = 0 then
                            Error('La cantidad debe ser superior a 0');

                        rstMarkupInsertOriginal := rstMarkupInsert;

                        intCantidadOriginal := intCantidad;

                        if intCantidad > 1 then
                            repeat

                                if intCantidadMarcaje > 0 then begin

                                    if intCantidadOriginal <> intCantidad then
                                        intEntrada += 1;

                                    //rstMarkupInsert."Entry no." := intEntrada;
                                    rstMarkupInsert."Entry no." := 0;
                                    rstMarkupInsert."Markup date and time" := rstMarkupInsertOriginal."Markup date and time" +
                                                                                                      86400000 * (intCantidadOriginal - intCantidad);
                                    rstMarkupInsert.Insert(true);

                                    intEntrada += 1;
                                    //rstMarkupInsert."Entry no." := intEntrada;
                                    rstMarkupInsert."Entry no." := 0;
                                    rstMarkupInsert."Markup date and time" := rstMarkupInsertOriginal."Markup date and time" + 86400000 *
                                                                                                                    (intCantidadOriginal - intCantidad) +
                                                                                                                    1000 * 60 * 60 * intCantidadMarcaje;
                                    rstMarkupInsert.Insert(true);

                                    intCantidad -= 1;

                                end
                                else begin

                                    if (intCantidadMarcaje = 0) and (rstConcept."Hours per unit" = 1) then begin

                                        Error('La cantidad de horas debe ser superior a 0');

                                    end
                                    else begin

                                        intEntrada += 1;
                                        //rstMarkupInsert."Entry no." := intEntrada;
                                        rstMarkupInsert."Entry no." := 0;
                                        rstMarkupInsert."Markup date and time" := rstMarkupInsertOriginal."Markup date and time" +
                                                                                                          86400000 * (intCantidadOriginal - intCantidad);
                                        rstMarkupInsert.Insert(true);
                                        intCantidad -= 1;

                                    end;

                                end;

                            until intCantidad = 0
                        else begin

                            //rstMarkupInsert."Entry no." := intEntrada;
                            rstMarkupInsert."Entry no." := 0;
                            rstMarkupInsert.Insert(true);

                            if intCantidadMarcaje <> 0 then begin

                                intEntrada += 1;
                                //rstMarkupInsert."Entry no." := intEntrada;
                                rstMarkupInsert."Entry no." := 0;
                                rstMarkupInsert."Markup date and time" := rstMarkupInsert."Markup date and time" + 1000 * 60 * 60 * intCantidadMarcaje;
                                rstMarkupInsert.Insert(true);

                            end;

                        end;

                        if (intCantidadMarcaje = 0) and (rstConcept."Hours per unit" = 1) then
                            Error('La cantidad de horas debe ser superior a 0');


                        ClearAll;
                        CurrPage.Update;

                    end;
                end;
            }
        }
    }

    trigger OnInit()
    begin
        blnDiaCompletoVisible := true;
    end;

    trigger OnOpenPage()
    begin
        fntActualizar;
    end;

    var
        rstMarkup: Record "Markup entry";
        rstMarkupInsert: Record "Markup entry";
        rstMarkupInsertDiaCompleto: Record "Markup entry";
        rstMarkupInsertOriginal: Record "Markup entry";
        intEntrada: Integer;
        rstRec: Record Employee;
        Msa001: Label '¿Está seguro que desea registrar este nuevo marcaje?';
        rstConcept: Record "Meta4 concept";

        blnDiaCompletoVisible: Boolean;
        Text19065178: Label 'Cantidad';
        blnDiaCompleto: Boolean;
        intCantidad: Integer;
        intCantidadMarcaje: Decimal;
        intCantidadOriginal: Integer;
        optDiasHoras: Option Horas,"Días";

    [Scope('OnPrem')]
    procedure fntMarcaje(rstMarca: Record "Markup entry")
    begin
        rstMarkupInsert.Get(rstMarca."Entry no.");
    end;

    [Scope('OnPrem')]
    procedure fntActualizar()
    begin
        Clear(rstMarkup);
        rstMarkup.FindLast;

        /*intEntrada := rstMarkup."Entry no."+1;
        rstMarkupInsert."Entry no." := intEntrada;
        */
        rstMarkupInsert."Entry no." := 0;
        rstMarkupInsert."Company no." := 1;
        rstMarkupInsert."Import date" := CurrentDateTime;
        rstMarkupInsert.Quantity := 1;
        rstMarkupInsert."Markup type" := 2;
        rstMarkupInsert.Validate("File no.");
        rstMarkupInsert.CheckType := 'I';
        rstMarkupInsert.Sensorid := '1';
        rstMarkupInsert.Checked := false;
        rstMarkupInsert.WorkType := 0;
        rstMarkupInsert.AttFlag := 1;
        Clear(rstRec);
        if rstRec.Get(rstMarkupInsert."File no.") then begin

            rstMarkupInsert."User ID" := rstMarkupInsert."File no.";
            rstMarkupInsert.Userid := rstRec."No.";
            rstMarkupInsert.Name := rstRec.Name;
            rstMarkupInsert."Workday code" := rstRec."Workday code";
            rstMarkupInsert."Hiring date" := rstRec."Employment Date";

        end;

        Clear(rstConcept);
        if rstConcept.Get(rstMarkupInsert."Event code") then;
        if rstConcept."Hours per unit" <> 1 then begin

            rstMarkupInsert."Markup date and time" := CreateDateTime(DT2Date(rstMarkupInsert."Markup date and time"), 0T);
            rstMarkupInsert."Fecha filtro" := DT2Date(rstMarkupInsert."Markup date and time");
            intCantidad := 1;
            blnDiaCompletoVisible := true

        end
        else
            blnDiaCompletoVisible := false;

        if not rstMarkupInsert.Insert(true) then
            rstMarkupInsert.Modify(true);

    end;
}

