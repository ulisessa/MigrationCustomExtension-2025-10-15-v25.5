codeunit 50504 InvoiceTemp
{
    SingleInstance = true;

    trigger OnRun()
    var
        i: Integer;
    begin
    end;

    var
        l_codUsrInv: array[30, 2] of Code[20];
        i: Integer;

    [Scope('OnPrem')]
    procedure fntUsrInv(p_codUsrInv: Code[20]; p_codInvoice: Code[20]): Code[20]
    begin
        if p_codInvoice = '' then begin

            for i := 1 to 30 do begin

                if l_codUsrInv[i, 1] = p_codUsrInv then begin

                    exit(l_codUsrInv[i, 2]);

                end;

            end;

        end
        else begin

            for i := 1 to 30 do begin

                if l_codUsrInv[i, 1] = '' then begin

                    l_codUsrInv[i, 1] := p_codUsrInv;
                    l_codUsrInv[i, 2] := p_codInvoice;
                    exit(l_codUsrInv[i, 2]);

                end
                else begin

                    if l_codUsrInv[i, 1] = p_codUsrInv then begin

                        l_codUsrInv[i, 2] := p_codInvoice;
                        exit(l_codUsrInv[i, 2]);

                    end;

                end;

            end;

        end;
    end;
}

