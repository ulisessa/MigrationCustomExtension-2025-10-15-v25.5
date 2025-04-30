codeunit 50512 GLInconsistenceDetector
{
    SingleInstance = true;

    trigger OnRun()
    begin
        Clear(t_rstConfUsu);
        if not t_rstConfUsu.Get(UserId) then
            TempVerdadero;

        if t_rstConfUsu."Registro test" then
            PAGE.Run(0, TempGLEntry);
    end;

    var
        TempGLEntry: Record "G/L Entry" temporary;
        StoreToTemp: Boolean;
        codDoc: Code[20];
        t_rstConfUsu: Record "User Setup" temporary;
        rstConfUsu: Record "User Setup";

    [Scope('OnPrem')]
    procedure InsertGL(GLEntry: Record "G/L Entry")
    var
        rstGLSetup: Record "General Ledger Setup";
    begin
        TempGLEntry := GLEntry;
        if not TempGLEntry.Insert then begin
            TempGLEntry.DeleteAll;
            TempGLEntry.Insert;
        end;
    end;

    [Scope('OnPrem')]
    procedure TempFalso()
    begin
        Clear(t_rstConfUsu);
        t_rstConfUsu.Get(UserId);
        t_rstConfUsu."Registro test" := false;
        t_rstConfUsu.Modify;
        codDoc := '';
    end;

    [Scope('OnPrem')]
    procedure TempVerdadero()
    begin
        TempGLEntry.DeleteAll;
        t_rstConfUsu.DeleteAll;
        Clear(t_rstConfUsu);
        Clear(rstConfUsu);
        if rstConfUsu.Get(UserId) then begin

            t_rstConfUsu := rstConfUsu;
            t_rstConfUsu.Insert;

        end;

        t_rstConfUsu.Get(UserId);
        t_rstConfUsu."Registro test" := true;
        t_rstConfUsu.Modify;
    end;

    [Scope('OnPrem')]
    procedure ConsultarEstado(): Boolean
    begin
        Clear(t_rstConfUsu);
        if t_rstConfUsu.Get(UserId) then;
        exit(t_rstConfUsu."Registro test");
    end;

    [Scope('OnPrem')]
    procedure PasarDoc(l_codDoc: Code[20])
    begin
        codDoc := l_codDoc;
    end;
}

