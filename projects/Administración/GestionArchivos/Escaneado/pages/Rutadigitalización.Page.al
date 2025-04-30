page 50594 "Ruta digitalización"
{
    DelayedInsert = true;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = "Ruta digitalizacion depto/espe";
    SourceTableView = SORTING(Departamento);
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; "No.")
                {
                }
                field(Departamento; Departamento)
                {
                }
                field(Especifico; Especifico)
                {
                }
                field(Documento; Documento)
                {
                }
                field("Tipo documento"; "Tipo documento")
                {
                }
                field(Tabla; Tabla)
                {
                }
                field("Nombre tabla"; "Nombre tabla")
                {
                }
                field("Niveles por ruta"; "Niveles por ruta")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Digitalizar")
            {
                Caption = '&Digitalizar';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                Visible = blnDigitalizar;

                trigger OnAction()
                var
                    cduDigitalizarOAbrir: Codeunit Escaneado;
                    strNivel1: Text[100];
                    strNivel2: Text[100];
                    strNivel3: Text[100];
                    strNivel4: Text[100];
                    strNivel5: Text[100];
                    strNivel6: Text[100];
                    strNivel7: Text[100];
                    strNivel8: Text[100];
                    strNivel9: Text[100];
                    strNivel10: Text[100];
                    strNivel11: Text[100];
                    strQR: Text;
                begin
                    /*
                    cduDigitalizarOAbrir.ImportarDocumento(Documento,FORMAT(TODAY),Departamento,g_codCodVinculante,USERID,'',FORMAT(g_datFecha),g_strNroDocumento,'','','',Rec,FALSE,
                    FALSE,TRUE,'',FALSE,FALSE);
                    */

                    strNivel1 := '';
                    strNivel2 := '';
                    strNivel3 := '';
                    strNivel4 := '';
                    strNivel5 := '';
                    strNivel6 := '';
                    strNivel7 := '';
                    strNivel8 := '';
                    strNivel9 := '';
                    strNivel10 := '';
                    strNivel11 := '';

                    if g_Nivel1 <> '' then
                        strNivel1 := g_Nivel1;
                    if g_Nivel2 <> '' then
                        strNivel2 := g_Nivel2
                    else
                        strNivel2 := Format(Today);
                    if g_Nivel3 <> '' then
                        strNivel3 := g_Nivel3;
                    if g_Nivel4 <> '' then
                        strNivel4 := g_Nivel4;
                    if g_Nivel5 <> '' then
                        strNivel5 := g_Nivel5
                    else
                        strNivel5 := UserId;
                    if g_Nivel6 <> '' then
                        strNivel6 := g_Nivel6;
                    if g_Nivel7 <> '' then
                        strNivel7 := g_Nivel7;
                    if g_Nivel8 <> '' then
                        strNivel8 := g_Nivel8;

                    if g_Nivel9 <> '' then
                        strNivel9 := g_Nivel9;
                    if g_Nivel10 <> '' then
                        strNivel10 := g_Nivel10;
                    if g_Nivel11 <> '' then
                        strNivel11 := g_Nivel11;

                    if strNivel1 = '' then
                        strNivel1 := Documento;
                    if strNivel2 = '' then
                        strNivel2 := Format(Today);
                    if strNivel3 = '' then
                        strNivel3 := Departamento;
                    if strNivel4 = '' then
                        strNivel4 := '';
                    if strNivel5 = '' then
                        strNivel5 := UserId;

                    funLlamarCapturador(strNivel1, strNivel2, strNivel3, strNivel4, strNivel5, strNivel6, strNivel7, strNivel8, strNivel9, strNivel10, strNivel11);
                    cduDigitalizarOAbrir.ImportarDocumento(g_Nivel1, g_Nivel2, g_Nivel3, g_Nivel4, g_Nivel5, g_Nivel6, g_Nivel7, g_Nivel8, g_Nivel9, g_Nivel10, g_Nivel11, Rec, false,
                    false, true, '', false, false);

                    funLlamarCapturador('', '', '', '', '', '', '', '', '', '', '');
                    g_Nivel1 := '';
                    g_Nivel2 := '';
                    g_Nivel3 := '';
                    g_Nivel4 := '';
                    g_Nivel5 := '';
                    g_Nivel6 := '';
                    g_Nivel7 := '';
                    g_Nivel8 := '';
                    g_Nivel9 := '';
                    g_Nivel10 := '';
                    g_Nivel11 := '';
                    Clear(strQR);

                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        DocumentoOnFormat;
    end;

    trigger OnInit()
    begin
        CurrPage.LookupMode := false;
    end;

    trigger OnOpenPage()
    begin
        if CurrPage.LookupMode = true then
            CurrPage.Editable(false);

        begin

            if
               (g_Nivel4 <> '')
                and
               (g_Nivel6 <> '')
                and
               (g_Nivel7 <> '')
                and
               (g_Nivel8 <> '')
            then
                blnDigitalizar := false
            else
                blnDigitalizar := true;

        end;
    end;

    var
        g_strTipoDocumento: Text[250];
        g_strNroDocumento: Text[250];
        g_intNroTabla: Integer;
        g_codCodVinculante: Text[30];
        cduSeleccionarCarpeta: Codeunit Mail;
        optFiletype: Option " ",Text,Excel,Word,Custom;

        DocumentoEmphasize: Boolean;
        g_datFecha: Text;
        g_Nivel1: Text[30];
        g_Nivel2: Text[30];
        g_Nivel3: Text[30];
        g_Nivel4: Text[30];
        g_Nivel5: Text[30];
        g_Nivel6: Text[30];
        g_Nivel7: Text[30];
        g_Nivel8: Text[30];
        g_Nivel9: Text[30];
        g_Nivel10: Text[30];
        g_Nivel11: Text[30];
        blnDigitalizar: Boolean;

    [Scope('OnPrem')]
    procedure funLlamarCapturador(strNivel1: Text[100]; strNivel2: Text[100]; strNivel3: Text[100]; strNivel4: Text[100]; strNivel5: Text[100]; strNivel6: Text[100]; strNivel7: Text[100]; strNivel8: Text[100]; strNivel9: Text[100]; strNivel10: Text[100]; strNivel11: Text[100]): Text[250]
    begin
        g_Nivel1 := strNivel1;
        g_Nivel2 := strNivel2;
        g_Nivel3 := strNivel3;
        g_Nivel4 := strNivel4;
        g_Nivel5 := strNivel5;
        g_Nivel6 := strNivel6;
        g_Nivel7 := strNivel7;
        g_Nivel8 := strNivel8;
        g_Nivel9 := strNivel9;
        g_Nivel10 := strNivel10;
        g_Nivel11 := strNivel11;
        Commit;
    end;

    [Scope('OnPrem')]
    procedure funEditable(blnEditable: Boolean)
    begin
        if blnEditable then
            CurrPage.Editable(true)
        else
            CurrPage.Editable(false);
    end;

    local procedure DocumentoOnFormat()
    begin
        if Documento in ['Fact.Vto.', 'Déb.Vto.'] then begin
            DocumentoEmphasize := true;
            //CurrPage.Documento.UPDATESELECTED(TRUE);

        end;
    end;
}

