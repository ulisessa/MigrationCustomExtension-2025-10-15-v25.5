page 50164 Weighing
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            field(strItemNo; strItemNo)
            {
                Caption = 'Item No.';
                Editable = false;
            }
            field(codBalanza; codBalanza)
            {
                Caption = 'Cód. balanza';
                Editable = false;
            }
            field(strBalanza; strBalanza)
            {
                Caption = 'Nombre balanza';
                Editable = false;
            }
            field(intBultos; intBultos)
            {
                Caption = 'Cantidad bultos';
                Editable = false;
            }
            field(decPesada; decPesada)
            {
                Caption = 'Pesada';
                Importance = Promoted;
                Style = StrongAccent;
                StyleExpr = TRUE;
            }
            field(decPesoUnitario; decPesoUnitario)
            {
                Caption = 'Peso unitario';
                Editable = false;
            }
            field(Estado; strStatus)
            {
                Editable = false;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Insertar pesada en ticket")
            {
                Image = Insert;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    fntDevolverPesada;
                    CurrPage.Close;
                end;
            }
        }
    }

    var
        StatusText: Text;
        decPesada: Decimal;
        codBalanza: Code[10];
        strBalanza: Text;
        intBultos: Integer;
        decPesoUnitario: Decimal;
        strItemNo: Code[20];
        strStatus: Text;
        codDoc: Code[20];
        intLin: Integer;
        optTDoc: Option Salida,Descarga;
        rstWP: Record "Weighing Scale Parameters";
        dlgLeyendo: Dialog;
        decTara: Decimal;

    [Scope('OnPrem')]
    procedure fntPesada(p_codBalanza: Code[10]; p_strBalanza: Text; p_intBultos: Integer; p_decPesoUnitario: Decimal; p_strItemNo: Code[20]; p_strStatus: Text; p_decTara: Decimal)
    begin
        codBalanza := p_codBalanza;
        strBalanza := p_strBalanza;
        intBultos := p_intBultos;
        decPesoUnitario := p_decPesoUnitario;
        strItemNo := p_strItemNo;
        strStatus := p_strStatus;
        decTara := p_decTara;
        Clear(rstWP);
        rstWP.Get(codBalanza);
    end;

    [Scope('OnPrem')]
    procedure fntMiDoc(p_optTDoc: Option Salida,Descarga; p_codDoc: Code[20]; p_intLin: Integer)
    begin
        codDoc := p_codDoc;
        intLin := p_intLin;
        optTDoc := p_optTDoc;
    end;

    [Scope('OnPrem')]
    procedure fntDevolverPesada(): Decimal
    var
        l_rstWR: Record "Weighing Records";
        optTDoc: Option Salida,Descarga;
        l_rstLD: Record "Lín. descarga";
    begin
        if optTDoc = optTDoc::Salida then begin
            Clear(l_rstWR);
            l_rstWR.SetRange("Shipment No.", codDoc);
            l_rstWR.SetRange("Weighing line no.", intLin);
            if l_rstWR.Find('-') then begin
                l_rstWR.Validate(Confirmed, l_rstWR.Confirmed::Confirmada);
                l_rstWR.Validate("Gross + Tare", decPesada);
                l_rstWR.Validate("Weighing Date and Time", CurrentDateTime);
                if decTara < 0 then
                    decTara := -decTara;
                if (intBultos <> 0) and (decPesada <> 0) then
                    decPesoUnitario := Round((decPesada - decTara) / intBultos, 1);
                l_rstWR.Status := 'Actualizado por última vez: ' + Format(CurrentDateTime, 0, '<Day,2><Month,2><Year4><Hours24,2><Minutes,2><Seconds,2><Second dec>');
                l_rstWR.Modify;
            end;
        end;
        if optTDoc = optTDoc::Descarga then begin
            Clear(l_rstLD);
            l_rstLD.SetRange("No. proyecto", codDoc);
            l_rstLD.SetRange("Line no.", intLin);
            if l_rstLD.Find('-') then begin
                l_rstLD.Validate(Confirmed, l_rstWR.Confirmed::Confirmada);
                l_rstLD.Validate("Gross + Tare", decPesada);
                l_rstLD.Validate("Weighing Date and Time", CurrentDateTime);
                l_rstLD.Status := 'Actualizado por última vez: ' + Format(CurrentDateTime, 0, '<Day,2><Month,2><Year4><Hours24,2><Minutes,2><Seconds,2><Second dec>');
                l_rstLD.Modify;
            end;
        end;
    end;
}

