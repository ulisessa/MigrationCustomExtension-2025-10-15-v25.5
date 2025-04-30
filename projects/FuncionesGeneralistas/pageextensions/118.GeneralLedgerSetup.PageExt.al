pageextension 118 "Add dimensions to GLS" extends "General Ledger Setup"
{
    PromotedActionCategoriesML = ENU = ',,,,,,,,,,,,,,Recurrent activities,Detect inconsistencies', ESP = ',,,,,,,,,,,,,,Actividades recurrentes,Detectar inconsistencias';
    layout
    {
        addafter("Global Dimension 2 Code")
        {
            field("Global Dimension 3 Code"; "Global Dimension 3 Code")
            {
            }
            field("Global Dimension 4 Code"; "Global Dimension 4 Code")
            {
            }
            field("Global Dimension 5 Code"; "Global Dimension 5 Code")
            {
            }
            field("Global Dimension 6 Code"; "Global Dimension 6 Code")
            {
            }
            field("Global Dimension 7 Code"; "Global Dimension 7 Code")
            {
            }
        }
        addafter("Autocredit Memo Nos.")
        {
            group("Serie de retenciones")
            {
                CaptionML = ENU = 'Withholding serial numbers', ESP = 'Número serie retenciones';
                field("N° serie retención IVA"; "No. serie retención IVA")
                {
                }
                field("N° serie retención Ganancias"; "No. serie retención Ganancias")
                {
                }
                field("N° serie retención SS"; "No. serie retención SS")
                {
                }
                field("N° serie retención IIBB"; "No. serie retención IIBB")
                {
                }
            }
        }
        addafter(General)
        {
            group(Retenciones)
            {
                CaptionML = ENU = 'Withholdings', ESP = 'Retenciones';

                field("Persona habilitada certificado"; "Persona habilitada certificado")
                {
                }
                field("Carácter persona habilitada"; "Carácter persona habilitada")
                {
                }
                field(Signature; Signature)
                {
                }
                field("Fiscal Type"; "Fiscal Type")
                {
                }
                field("VAT withholding account"; "VAT withholding account")
                {
                }
                field("Winnings withholding account"; "Winnings withholding account")
                {
                }
                field("SS withholding account"; "SS withholding account")
                {
                }
                field("GI withholding account"; "GI withholding account")
                {
                }
                field("GI perception account"; "GI perception account")
                {
                }
                field("GI perception resource"; "GI perception resource")
                {
                }
                field("GI retention code"; "GI retention code")
                {
                }
                field("GI no retention code"; "GI no retention code")
                {
                }
                field("VAT perception account"; "VAT perception account")
                {
                }
                field("Apochryphal listing URL"; "Apochryphal listing URL")
                {
                }
                field("Apochryphal file ext."; "Apochryphal file ext.")
                {
                }
                field("Last apochryphal update"; "Last apochryphal update")
                {
                }
                field("RG17 URL"; "RG17 URL")
                {
                }
                field("RG17 ext"; "RG17 ext")
                {
                }
                field("RG18 URL"; "RG18 URL")
                {
                }
                field("RG18 ext"; "RG18 ext")
                {
                }
                field("RG830 URL"; "RG830 URL")
                {
                }
                field("RG830 ext"; "RG830 ext")
                {
                }
                field(Signatary; Signatary)
                {
                }
                field("AFIP QR URL"; "AFIP QR URL")
                {
                }
            }
            group("Recupero IVA")
            {
                Caption = 'Recupero IVA';
                field("Age recovery VAT formula"; "Age recovery VAT formula")
                {
                }
                field("General VAT rate for recovery"; "General VAT rate for recovery")
                {
                }
                field("VAT recover quotient summarize"; "VAT recover quotient summarize")
                {
                }
                field("VAT recovery end date margin"; "VAT recovery end date margin")
                {
                }
                field("Omit in months with no exports"; "Omit in months with no exports")
                {
                }
                field("Recover VAT from"; "Recover VAT from")
                {
                }
                field("Recovery VAT platform"; "Recovery VAT platform")
                {
                }
                field("Filter partials from recovery"; "Filter partials from recovery")
                {
                }
                field("Filter recovery by item cat."; "Filter recovery by item cat.")
                {
                }
            }
            group("Inflation adjustment")
            {
                Caption = 'Ajuste de inflación';
                field("Inflation Adjustment T.Journal"; "Inflation Adjustment T.Journal")
                {
                }
                field("Inflation Adjustment B.Journal"; "Inflation Adjustment B.Journal")
                {
                }
                field("Inflation Adjustment Dimension"; "Inflation Adjustment Dimension")
                {
                }
                field("Inflation Adj. Account filter"; "Inflation Adj. Account filter")
                {
                }
                field("Inflation Adj. Posting Acc."; "Inflation Adj. Posting Acc.")
                {
                }
            }
            group("AFIP - WS")
            {
                Caption = 'AFIP - WS';
                field("AFIP Certificate"; "AFIP Certificate")
                {
                }
                field("AFIP Private Key"; "AFIP Private Key")
                {
                }
                field("AFIP Result Path"; "AFIP Result Path")
                {
                }
                field("Tipo Regimen"; "Tipo Regimen")
                {
                }
                field("Tipo Dato Adicional"; "Tipo Dato Adicional")
                {
                }
                field("Block codes"; "Block codes")
                {
                }
                field("WS - Dimensión code"; "WS - Dimension code")
                {
                }
                field("WS - Reproweb Dimension"; "WS - Reproweb Dimension")
                {
                }
                field("WS - Verif. Comprobante"; "WS - Verif. Comprobante")
                {
                }
                field("WS - CUIT Check Dimension"; "WS - CUIT Check Dimension")
                {
                }
                field("WS - Taxes"; "WS - Taxes")
                {
                }
                field("WS - Collection request"; "WS - Collection request")
                {
                }
            }
        }
    }

    actions
    {
        addlast(processing)
        {
            group(Category15)
            {
                CaptionML = ENU = 'Recurrent activities', ESP = 'Actividades recurrentes', ESN = 'Actividades recurrentes';

                action("Get apochryphals")
                {
                    Caption = 'Consultar apócrifos';
                    Promoted = true;
                    PromotedCategory = Category15;

                    trigger OnAction()
                    var
                        rstRetenciones: Page Retenciones;
                    begin
                        rstRetenciones.fntImportarApocs;
                    end;
                }
                action("View Apochryphals")
                {
                    Caption = 'Ver apócrifos';
                    Promoted = true;
                    PromotedCategory = Category15;

                    trigger OnAction()
                    var
                        pge50579: Page "Record Links";
                        rstRL: Record "Record Link";
                    begin
                        Clear(rstRL);
                        rstRL.SetRange("Record ID", RecordId);

                        Clear(pge50579);
                        pge50579.SetTableView(rstRL);
                        pge50579.Run;
                    end;
                }
                action("Get Reproweb")
                {
                    Caption = 'Consulta Reproweb';
                    Promoted = true;
                    PromotedCategory = Category15;

                    trigger OnAction()
                    var
                        l_cduWS: Codeunit "WS - AFIP";
                        l_rstGLS: Record "General Ledger Setup";
                        l_codMes: Code[10];
                        l_codYear: Code[10];
                        l_rstCI: Record "Company Information";
                    begin
                        Clear(l_rstCI);
                        Clear(l_rstGLS);
                        l_rstCI.Get();
                        l_rstGLS.Get();

                        if l_rstGLS."WS - Reproweb Dimension" <> '' then begin

                            l_codMes := Format(Date2DMY(Today, 2));
                            l_codYear := Format(Date2DMY(Today, 3));
                            if StrLen(l_codMes) = 1 then
                                l_codMes := '0' + l_codMes;
                            l_cduWS.fntReprowebGrupal('wsagr', DelChr(l_rstCI."VAT Registration No.", '=', '-'), '', l_codMes + '/' + l_codYear);

                        end;
                    end;
                }
                action("Get RG17")
                {
                    Caption = 'Certificados de Exclusión Ret/Percep del IVA';
                    Promoted = true;
                    PromotedCategory = Category15;

                    trigger OnAction()
                    var
                        rstRetenciones: Page Retenciones;
                    begin
                        rstRetenciones.fntImportarIVA;
                    end;
                }
                action("Get RG18")
                {
                    Caption = 'Actualizar Agentes de Retención';
                    Promoted = true;
                    PromotedCategory = Category15;

                    trigger OnAction()
                    var
                        rstRetenciones: Page Retenciones;
                    begin
                        rstRetenciones.fntImportarAg;
                    end;
                }
                action("Get RG830")
                {
                    Caption = 'Certificados exlusión Ganancias - RG830';
                    Promoted = true;
                    PromotedCategory = Category15;

                    trigger OnAction()
                    var
                        rstRetenciones: Page Retenciones;
                    begin
                        rstRetenciones.fntImportarGan;
                    end;
                }
            }
            group(Category_16)
            {
                CaptionML = ENU = 'Decect inconsitencies', ESP = 'Detectar Inconsistencias';
                action("Iniciar Detección")
                {
                    Caption = 'Iniciar Detección';
                    Promoted = true;
                    PromotedCategory = Category16;
                    RunObject = Codeunit GLInconsistenceDetector;

                    trigger OnAction()
                    var
                        rst50512: Codeunit GLInconsistenceDetector;
                    begin
                    end;
                }
                action("Ver resultados")
                {
                    Caption = 'Ver resultados';
                    Promoted = true;
                    PromotedCategory = Category16;
                    RunObject = Codeunit GLInconsistenceDetector;

                    trigger OnAction()
                    var
                        rst50512: Codeunit GLInconsistenceDetector;
                    begin
                    end;
                }
            }
        }
    }

}