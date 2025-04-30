page 50635 "Weighing records subform"
{
    AutoSplitKey = true;
    Caption = 'Subform Registro Pesajes';
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Weighing Records";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Weighing line no."; Rec."Weighing line no.")
                {
                }
                field("Scale code"; Rec."Scale code")
                {
                    TableRelation = "Weighing Scale Parameters"."Scale code";
                }
                field("Location code"; Rec."Location code")
                {
                    TableRelation = Location.Code;
                }
                field("Qty. per Bulk"; Rec."Qty. per Bulk")
                {

                    trigger OnValidate()
                    begin
                        if (Rec."Qty. per Bulk" <> 0) and (Rec.Gross <> 0) then
                            decPesoUnitario := Round((Rec.Gross) / Rec."Qty. per Bulk", 0.01)
                        else
                            decPesoUnitario := 0;
                    end;
                }
                field("Item no."; Rec."Item no.")
                {
                    TableRelation = Item."No.";
                }
                field("Item description"; Rec."Item description")
                {
                }
                field("Lot no."; Rec."Lot no.")
                {
                }
                field("Pallet no."; Rec."Pallet no.")
                {
                }
                field(Tare; Rec.Tare)
                {
                }
                field(Detail; Rec.Detail)
                {
                }
                field(Confirmed; Rec.Confirmed)
                {

                    trigger OnValidate()
                    begin
                        if (Rec.Confirmed = Rec.Confirmed::Confirmada) then begin
                            if Rec.Gross = 0 then
                                Error('No se ha detectado pesada.');
                            /*
                              IF Tare = 0 THEN
                                ERROR('No se ha ingresado tara.');
                                */
                            Rec."Weighing Date and Time" := CurrentDateTime;
                        end;
                        if Rec.Confirmed = Rec.Confirmed::Reabrir then begin
                            if Rec.Confirmed = Rec.Confirmed::Confirmada then begin
                                Rec."Weighing Date and Time" := 0DT;
                                Rec.Gross := 0;
                                Rec."Gross + Tare" := 0;
                                Rec.Confirmed := 0;
                            end;
                        end;

                    end;
                }
                field(Gross; Rec.Gross)
                {

                    trigger OnAssistEdit()
                    var
                        l_pgeWeighing: Page Weighing;
                        optTDoc: Option Salida,Descarga;
                        l_rstCR: Record "Cab. remito ventas";
                    begin
                        if Rec."Scale code" = '' then begin
                            Clear(l_rstCR);
                            if l_rstCR.Get(Rec."Shipment No.") then
                                Rec."Scale code" := l_rstCR."Scale code";
                        end;
                        Commit;
                        if Rec.Confirmed = Rec.Confirmed::Confirmada then
                            Error('La línea seleccionada ya fue confirmada, por favor reinicie la línea si desea corregir la pesada.');
                        Clear(l_pgeWeighing);
                        l_pgeWeighing.fntPesada(Rec."Scale code", strBalanza, Rec."Qty. per Bulk", Rec.Gross, Rec."Item no.", Rec.Status, Rec.Tare);
                        l_pgeWeighing.fntMiDoc(optTDoc::Salida, Rec."Shipment No.", Rec."Weighing line no.");
                        l_pgeWeighing.Editable(true);
                        l_pgeWeighing.LookupMode := true;
                        l_pgeWeighing.Run;

                        CurrPage.Update(false);
                    end;

                    trigger OnValidate()
                    begin
                        if not Rec.Insert then
                            Rec.Modify;
                        if (Rec."Qty. per Bulk" <> 0) and (Rec.Gross <> 0) then
                            decPesoUnitario := Round((Rec.Gross) / Rec."Qty. per Bulk", 0.01)
                        else
                            decPesoUnitario := 0;
                        CurrPage.Update(true);
                    end;
                }
                field("Gross + Tare"; Rec."Gross + Tare")
                {
                }
                field(decPesoUnitario; decPesoUnitario)
                {
                    Caption = 'Peso unitario';
                    Editable = false;
                }
                field("Weighing Date and Time"; Rec."Weighing Date and Time")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Caption = 'Estado';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Reiniciar registro seleccionado")
            {

                trigger OnAction()
                var
                    l_rstWR: Record "Weighing Records";
                begin
                    Clear(l_rstWR);
                    CurrPage.SetSelectionFilter(l_rstWR);
                    if l_rstWR.FindSet then
                        repeat
                            with l_rstWR do begin
                                if Confirmed = Confirmed::Confirmada then begin
                                    "Weighing Date and Time" := 0DT;
                                    Gross := 0;
                                    "Gross + Tare" := 0;
                                    Confirmed := Confirmed::" ";
                                    l_rstWR.Modify;
                                end;
                            end;
                        until l_rstWR.Next = 0;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        intLineNo: Integer;
        l_rstScale: Record "Weighing Scale Parameters";
        cduWeighing: Codeunit Weighing;
    begin
    end;

    trigger OnAfterGetRecord()
    var
        intLineNo: Integer;
        l_rstScale: Record "Weighing Scale Parameters";
        cduWeighing: Codeunit Weighing;
        l_rstCR: Record "Cab. remito ventas";
    begin
        if Rec."Scale code" = '' then begin
            Clear(l_rstCR);
            if l_rstCR.Get(Rec."Shipment No.") then
                Rec."Scale code" := l_rstCR."Scale code";
        end;
        Clear(l_rstScale);
        if l_rstScale.Get(Rec."Scale code") then;
        codBalanza := l_rstScale."Scale code";
        strBalanza := l_rstScale.Name;
        intBultos := Rec."Qty. per Bulk";
        if (Rec."Qty. per Bulk" <> 0) and (Rec.Gross <> 0) then
            decPesoUnitario := Round((Rec.Gross) / Rec."Qty. per Bulk", 0.01)
        else
            decPesoUnitario := 0;
        //IF Confirmed = Confirmed::"Pesar activamente" THEN
        //  decPesada := cduFishing.fntLeerBalanza(Rec);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        l_rstCR: Record "Cab. remito ventas";
    begin
        Clear(l_rstCR);
        if l_rstCR.Get(Rec."Shipment No.") then
            Rec."Location code" := l_rstCR."Location code";
    end;

    var
        decPesoUnitario: Decimal;
        StatusText: Text;
        rstWR: Record "Weighing Records";
        codBalanza: Code[10];
        strBalanza: Text;
        intBultos: Integer;

    [Scope('OnPrem')]
    procedure fntLinea(): Integer
    begin
        exit(Rec."Weighing line no.");
    end;

    local procedure fntConfirmed(): Boolean
    begin
        if (Rec.Confirmed = Rec.Confirmed::Confirmada)
          and (Rec."Qty. per Bulk" <> 0)
          and (Rec."Scale code" <> '')
          and (Rec."Location code" <> '')
          and (Rec."Item no." <> '')
          and (Rec.Tare <> 0)
        then
            exit(false)
        else
            exit(true);
    end;
}

