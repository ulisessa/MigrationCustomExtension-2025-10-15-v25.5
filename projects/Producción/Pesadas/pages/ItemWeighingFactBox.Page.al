page 50162 "Item Weighing FactBox"
{
    Caption = 'Item Details - Replenishment';
    PageType = CardPart;
    SourceTable = Item;

    layout
    {
        area(content)
        {

            field("No."; Rec."No.")
            {
                Caption = 'Item No.';
            }
            field(codBalanza; codBalanza)
            {
                Caption = 'Cód. balanza';
            }
            field(strBalanza; strBalanza)
            {
                Caption = 'Nombre balanza';
            }
            field(intBultos; intBultos)
            {
                Caption = 'Cantidad bultos';
            }
            field(decPesada; decPesada)
            {
                Caption = 'Pesada';
                Style = StrongAccent;
                StyleExpr = TRUE;
            }
            field(decPesoUnitario; decPesoUnitario)
            {
                Caption = 'Peso unitario';
            }
            field(Status; StatusText)
            {
                ShowCaption = false;

                //StatusText := 'Actualizado por última vez: ' + Format(CurrentDateTime);

            }
        }
    }

    var
        codBalanza: Code[10];
        decPesada: Decimal;
        strBalanza: Text;
        intBultos: Integer;
        decPesoUnitario: Decimal;
        rstWR: Record "Weighing Records";
        StatusText: Text;

    trigger OnAfterGetRecord()
    var
        intLineNo: Integer;
        l_rstScale: Record "Weighing Scale Parameters";
        cduWeigh: Codeunit Weighing;
    begin
        Clear(rstWR);
        rstWR.SetRange(rstWR."Shipment No.", Rec.GetFilter("Document No. Filter"));
        Evaluate(intLineNo, Rec.GetFilter("Document No. Line Filter"));
        rstWR.SetRange(rstWR."Weighing line no.", intLineNo);
        if rstWR.FindSet then begin
            Clear(l_rstScale);
            l_rstScale.Get(rstWR."Scale code");
            codBalanza := l_rstScale."Scale code";
            strBalanza := l_rstScale.Name;
            intBultos := rstWR."Qty. per Bulk";
            decPesada := cduWeigh.fntLeerBalanza(codBalanza, strBalanza, intBultos, decPesoUnitario, Rec."No.", StatusText);
            if (intBultos <> 0) and (decPesada <> 0) then
                decPesoUnitario := Round(decPesada / intBultos, 0.01)
            else
                decPesoUnitario := 0;

        end;
    end;


    [Scope('OnPrem')]
    procedure ShowDetails()
    begin
        PAGE.Run(PAGE::"Item Card", Rec);
    end;

    procedure StartTimer()
    var
        StartTime: DateTime;
        Interval: Duration;
    begin
        StartTime := CurrentDateTime();
        Interval := 1000; // 1 second in milliseconds

        while true do begin
            if (CurrentDateTime() >= StartTime + Interval) then begin
                StartTime := CurrentDateTime();
                HandleTimer(); // Call your action here
            end;
            Sleep(1); // Prevent CPU overload
        end;
    end;

    procedure HandleTimer()
    begin
        Message('Timer Triggered!');
    end;

}

