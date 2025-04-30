page 50065 "Lista seguridad cambio estado"
{
    PageType = List;
    SourceTable = "Seguridad cambio estados";
    ApplicationArea = All;
    UsageCategory = Administration;
    
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                FreezeColumn = "Filtro por monto";
                ShowCaption = false;
                field(Usuario; Usuario)
                {
                }
                field("Tipo documento"; "Tipo documento")
                {
                }
                field("Estado original"; "Estado original")
                {
                }
                field("Estado destino"; "Estado destino")
                {
                }
                field("Grupo destino"; "Grupo destino")
                {
                }
                field(Recomendado; Recomendado)
                {
                }
                field("Filtro por monto"; "Filtro por monto")
                {
                }
                field("Enviar correo"; "Enviar correo")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        /*IF CurrPage.LOOKUPMODE() THEN
          CurrPage.EDITABLE(FALSE)
        ELSE
          CurrPage.EDITABLE(TRUE);
        */
        if UserCode <> '' then
            SetRange(Usuario, UserCode);

        //Setrange(Usuario,UserID);

        if DocType <> '' then
            SetRange("Tipo documento", DocType);

        if StatusCode <> '' then
            SetRange("Estado original", StatusCode);

        if DestGroupCode <> '' then
            SetRange("Grupo destino", DestGroupCode);

        if txtDestStatusCode <> '' then
            SetRange("Estado destino", txtDestStatusCode);

    end;

    trigger OnOpenPage()
    begin
        /*IF CurrPage.LOOKUPMODE() THEN
          CurrPage.EDITABLE(FALSE)
        ELSE
          CurrPage.EDITABLE(TRUE);
        */
        if UserCode <> '' then
            SetRange(Usuario, UserCode);

        //Setrange(Usuario,UserID);

        if DocType <> '' then
            SetRange("Tipo documento", DocType);

        if StatusCode <> '' then
            SetRange("Estado original", StatusCode);

        if DestGroupCode <> '' then
            SetRange("Grupo destino", DestGroupCode);

        if txtDestStatusCode <> '' then
            SetRange("Estado destino", txtDestStatusCode);

    end;

    var
        UserCode: Code[20];
        DocType: Text[50];
        StatusCode: Code[30];
        DestGroupCode: Code[30];
        txtDestStatusCode: Text[50];

    [Scope('OnPrem')]
    procedure FilterAll(l_UserCode: Code[20]; l_DocType: Text[50]; l_StatusCode: Code[30]; l_DestGroupCode: Code[30]; l_txtDestStatusCode: Text[50])
    begin
        UserCode := l_UserCode;
        DocType := l_DocType;
        StatusCode := l_StatusCode;
        DestGroupCode := l_DestGroupCode;
        txtDestStatusCode := l_txtDestStatusCode;
    end;

    [Scope('OnPrem')]
    procedure Seleccionado(var txtEstado: Text[30]; var codGrupo: Code[20])
    begin
    end;
}

