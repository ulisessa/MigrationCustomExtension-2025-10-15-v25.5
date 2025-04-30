codeunit 50099 "DescripciónAmpliada"
{

    trigger OnRun()
    begin
    end;

    var
        LinTexto: Record "Extended Text Line" temporary;
        Salir: Boolean;
        qOrden: Integer;
        LinOrigen: Integer;
        LinFinal: Integer;
        LinEspacio: Integer;
        NoSigLin: Integer;

    [Scope('OnPrem')]
    procedure "DescripciónLinVenta"(var Rec: Record "Sales Line")
    var
        LinVenta: Record "Sales Line";
    begin
        ClearAll;
        with Rec do begin
            LinTexto.DeleteAll;
            LinVenta.SetRange("Document Type", "Document Type");
            LinVenta.SetRange("Document No.", "Document No.");
            LinVenta.SetRange("Line No.", 0, "Line No.");
            LinVenta.SetRange("Attached to Line No.", 0);
            if LinVenta.Find('+') then begin
                LinOrigen := LinVenta."Line No.";
                LinVenta.SetRange("Attached to Line No.");
                LinVenta.SetRange("Line No.");
                repeat
                    LinFinal := LinVenta."Line No.";
                    qOrden := qOrden + 10000;
                    LinTexto."Line No." := qOrden;
                    LinTexto.Text := LinVenta.Description;
                    LinTexto.Insert;
                    Salir := (LinVenta.Next = 0);
                until Salir or (LinVenta."Attached to Line No." <> LinOrigen);
            end;
        end;

        if PAGE.RunModal(PAGE::"Descripción ampliada", LinTexto) <> ACTION::LookupOK then
            exit;

        //** borra descripción ampliada
        LinVenta.SetRange("Line No.", LinOrigen, LinFinal);
        LinVenta.SetFilter("Attached to Line No.", '<>0');
        LinVenta.DeleteAll;

        //** Actualiza la línea original con la primera línea de la pantalla
        LinVenta.SetRange("Attached to Line No.");
        LinVenta.Find('-');
        if LinTexto.Find('-') then begin
            LinVenta.Description := LinTexto.Text;
            LinTexto.Delete;
        end else
            LinVenta.Description := '';
        LinVenta.Modify;
        if LinTexto.Count = 0 then
            exit;

        //** Inserta líneas adicionales
        LinVenta.SetRange("Line No.");
        if LinVenta.Find('>') then begin
            LinEspacio :=
              (LinVenta."Line No." - LinOrigen) div
              (1 + LinTexto.Count);
            if LinEspacio = 0 then
                Error('No hay espacio suficiente para crear los textos adicionales.');
        end else
            LinEspacio := 10000;

        NoSigLin := LinOrigen + LinEspacio;

        LinTexto.Reset;
        if LinTexto.Find('-') then begin
            repeat
                LinVenta.Init;
                LinVenta."Document Type" := Rec."Document Type";
                LinVenta."Document No." := Rec."Document No.";
                LinVenta."Line No." := NoSigLin;
                NoSigLin := NoSigLin + LinEspacio;
                LinVenta.Description := LinTexto.Text;
                LinVenta."Attached to Line No." := LinOrigen;
                LinVenta.Insert;
            until LinTexto.Next = 0;
        end;
        LinTexto.DeleteAll;
    end;

    [Scope('OnPrem')]
    procedure "DescripciónLinCompra"(var Rec: Record "Purchase Line")
    var
        LinCompra: Record "Purchase Line";
    begin
        ClearAll;
        with Rec do begin
            LinTexto.DeleteAll;
            LinCompra.SetRange("Document Type", "Document Type");
            LinCompra.SetRange("Document No.", "Document No.");
            LinCompra.SetRange("Line No.", 0, "Line No.");
            LinCompra.SetRange("Attached to Line No.", 0);
            if LinCompra.Find('+') then begin
                LinOrigen := LinCompra."Line No.";
                LinCompra.SetRange("Attached to Line No.");
                LinCompra.SetRange("Line No.");
                repeat
                    LinFinal := LinCompra."Line No.";
                    qOrden := qOrden + 10000;
                    LinTexto."Line No." := qOrden;
                    LinTexto.Text := LinCompra.Description;
                    LinTexto.Insert;
                    Salir := (LinCompra.Next = 0);
                until Salir or (LinCompra."Attached to Line No." <> LinOrigen);
            end;
        end;

        if PAGE.RunModal(PAGE::"Descripción ampliada", LinTexto) <> ACTION::LookupOK then
            exit;

        //** borra descripción ampliada
        LinCompra.SetRange("Line No.", LinOrigen, LinFinal);
        LinCompra.SetFilter("Attached to Line No.", '<>0');
        LinCompra.DeleteAll;

        //** Actualiza la línea original con la primera línea de la pantalla
        LinCompra.SetRange("Attached to Line No.");
        LinCompra.Find('-');
        if LinTexto.Find('-') then begin
            LinCompra.Description := LinTexto.Text;
            LinTexto.Delete;
        end else
            LinCompra.Description := '';
        LinCompra.Modify;
        if LinTexto.Count = 0 then
            exit;

        //** Inserta líneas adicionales
        LinCompra.SetRange("Line No.");
        if LinCompra.Find('>') then begin
            LinEspacio :=
              (LinCompra."Line No." - LinOrigen) div
              (1 + LinTexto.Count);
            if LinEspacio = 0 then
                Error('No hay espacio suficiente para crear los textos adicionales.');
        end else
            LinEspacio := 10000;

        NoSigLin := LinOrigen + LinEspacio;

        LinTexto.Reset;
        if LinTexto.Find('-') then begin
            repeat
                LinCompra.Init;
                LinCompra."Document Type" := Rec."Document Type";
                LinCompra."Document No." := Rec."Document No.";
                LinCompra."Line No." := NoSigLin;
                NoSigLin := NoSigLin + LinEspacio;
                LinCompra.Description := LinTexto.Text;
                LinCompra."Attached to Line No." := LinOrigen;
                LinCompra.Insert;
            until LinTexto.Next = 0;
        end;
        LinTexto.DeleteAll;
    end;
}

