codeunit 50042 Trazabilidad
{
    trigger OnRun()
    begin
        
    end;
    procedure fntLoteOrigen(l_codProy: Code[20]; l_codItem: Code[20]) l_codLoteOrigen: Code[10]
    var
        l_rst167: Record Job;
        l_rst27: Record Item;
        l_rstIS: Record "Inventory Setup";
        l_rstDV: Record "Dimension Value";
        l_rstGLS: Record "General Ledger Setup";
    begin
        if l_codProy = '' then
            exit('');
        Clear(l_rst27);
        l_rst27.Get(l_codItem);
        Clear(l_rstIS);
        l_rstIS.Get();
        Clear(l_rstGLS);
        l_rstGLS.Get();
        if l_rst27."Item Category Code" = l_rstIS."Categoria productos pesca" then begin
            Clear(l_rst167);
            l_rst167.Get(l_codProy);
            Clear(l_rstDV);
            l_rstDV.Get(l_rstGLS."Global Dimension 1 Code", l_rst167."Global Dimension 1 Code");
            if l_rstDV."Use code" = l_rstDV."Use code"::Buque then begin
                l_rst167.TestField("Global Dimension 1 Code");
                l_rst167.TestField("Global Dimension 3 Code");
                l_rst167.TestField("Lote origen");
                TestLoteOrigen(l_rst167, l_rst167."Lote origen");
                exit(l_rst167."Lote origen");
            end;
        end;
    end;

    [Scope('OnPrem')]
    procedure CalcLoteOrigen(l_rstJob: Record Job) l_codLoteOrigen: Code[10]
    var
        l_rstJS: Record "Jobs Setup";
        l_rstDV: Record "Dimension Value";
        l_rstGLS: Record "General Ledger Setup";
    begin
        Clear(l_rstJS);
        l_rstJS.Get();
        Clear(l_rstGLS);
        l_rstGLS.Get();
        with l_rstJob do begin
            if (l_rstJS."Calcular Lote Origen para" <> 0) and (Tipo = Tipo::Productivo) then begin
                if ("Global Dimension 1 Code" <> '') and ("Global Dimension 3 Code" <> '') then begin
                    Clear(l_rstDV);
                    l_rstDV.Get(l_rstGLS."Global Dimension 1 Code", "Global Dimension 1 Code");
                    if l_rstDV."Use code" = l_rstJS."Calcular Lote Origen para" then
                        l_codLoteOrigen := "Global Dimension 1 Code" + "Global Dimension 3 Code"
                    else
                        l_codLoteOrigen := '';
                end;
            end;
            TestLoteOrigen(l_rstJob, l_codLoteOrigen);
        end;
        exit(l_codLoteOrigen);
    end;

    [Scope('OnPrem')]
    procedure TestLoteOrigen(l_rst167: Record Job; l_codLO: Code[10]): Code[10]
    var
        l_rstJS: Record "Jobs Setup";
        l_rstDV: Record "Dimension Value";
        l_rstGLS: Record "General Ledger Setup";
    begin
        with l_rst167 do begin

            if l_codLO <> '' then begin
                if (StrPos("No.", "Global Dimension 1 Code") = 0) or (StrPos("No.", "Global Dimension 3 Code") = 0) then
                    if not Confirm('El lote de origen ' + "Lote origen" + ' es diferente al que se se deduce del número de proyecto ' + "No." + '.\ ¿Desea confirmar que el Lote de Origen para el Proyecto ' + "No." + ' es ' + "Lote origen" + '?') then
                        Error('El Lote de Origen no puede ser %1', l_codLO);
            end;

        end;
    end;
}
