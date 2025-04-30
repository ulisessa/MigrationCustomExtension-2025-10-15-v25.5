codeunit 50001 "Single Instance CU"
{
    SingleInstance = true;

    trigger OnRun()
    begin
        if not StoreToTemp then begin
            StoreToTemp := true;
        end else
            PAGE.RunModal(0, TempGLEntry);
    end;

    var
        TempGLEntry: Record "G/L Entry" temporary;
        StoreToTemp: Boolean;
        l_mxVndUsr: array[80, 2] of Code[20];

    [Scope('OnPrem')]
    procedure InsertGL(GLEntry: Record "G/L Entry")
    begin
        if StoreToTemp then begin
            TempGLEntry := GLEntry;
            if not TempGLEntry.Insert then begin
                TempGLEntry.DeleteAll;
                TempGLEntry.Insert;
            end;
        end;
    end;

    [Scope('OnPrem')]
    procedure fntSetVendor(l_codVendor: Code[20])
    var
        rstUS: Record "User Setup";
        i: Integer;
    begin
        i := 0;
        repeat

            i += 1;
            if l_mxVndUsr[i, 1] = '' then begin

                l_mxVndUsr[i, 1] := UserId;
                l_mxVndUsr[i, 2] := l_codVendor;

            end
            else begin

                if l_mxVndUsr[i, 1] = UserId then begin

                    l_mxVndUsr[i, 2] := l_codVendor;

                end;

            end;

        until l_mxVndUsr[i, 1] = UserId;
    end;

    [Scope('OnPrem')]
    procedure fntGetVendor() codVendor: Code[20]
    var
        rstUS: Record "User Setup";
        i: Integer;
    begin
        i := 0;
        repeat

            i += 1;
            if l_mxVndUsr[i, 1] = UserId then
                exit(l_mxVndUsr[i, 2]);

        until l_mxVndUsr[i, 1] = '';
    end;
}

