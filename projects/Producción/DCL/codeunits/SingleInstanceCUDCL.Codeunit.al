codeunit 50003 "Single Instance CU DCL"
{
    SingleInstance = true;

    trigger OnRun()
    begin
    end;

    [Scope('OnPrem')]
    procedure ShowDCL(l_rstDCLAppTemp: Record "DCL Application Lines temp")
    var
        l_pgeDCLApp: Page "DCL application lines temp";
    begin
        Clear(l_pgeDCLApp);
        l_pgeDCLApp.SetTableView(l_rstDCLAppTemp);
        l_pgeDCLApp.Run;
    end;
}

