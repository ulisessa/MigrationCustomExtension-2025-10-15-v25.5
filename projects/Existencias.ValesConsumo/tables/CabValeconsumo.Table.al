table 50102 "Cab. Vale consumo"
{
    DrillDownPageID = "Vale de consumo";
    LookupPageID = "Vale de consumo";

    fields
    {
        field(1; "Nombre Libro Consumo"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Req. Wksh. Template";

            trigger OnValidate()
            var
                LibroDeman: Record "Req. Wksh. Template";
            begin
                LibroDeman.SetRange(Name, "Nombre Libro Consumo");
                if LibroDeman.Find('-') then;
                "No. Serie" := LibroDeman."No. Serie";
                "No. documento" := GestNoSerie.GetNextNo(LibroDeman."No. serie consumo", Today, true);

                //US.ARBU - 20040524 - Inicio Modificación Arbumasa para el seguimiento de documentos

                rstConfUsu.Reset;
                if rstConfUsu.Get(UserId) then
                    cduMensajeria.RegistrarMensaje('Alta Vale de Consumo', '', "No. documento", 'Vale de Consumo', 'Abierto', Today,
                    rstMensajeria."Tipo movimiento"::"Mensaje con Seguimiento", rstConfUsu.Grupo, '', '', '', '', '', '', '');

                //US.ARBU - 20040524 - Fin Modificación Arbumasa para el seguimiento de documentos
            end;
        }
        field(2; "No. documento"; Code[30])
        {
            NotBlank = true;
        }
        field(3; "Fecha registro"; Date)
        {
        }
        field(4; "Descripción"; Text[199])
        {
        }
        field(5; Usuario; Code[30])
        {
            TableRelation = "User Setup";
        }
        field(6; "No. Serie"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(7; Estado; Text[50])
        {
            CalcFormula = Lookup(Mensajeria.Estado WHERE("No. documento" = FIELD("No. documento"),
                                                          "Tipo Documento" = CONST('Vale de consumo')));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Nombre Libro Consumo", "No. documento")
        {
            Clustered = true;
        }
        key(Key2; "No. documento")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //US.ARBU - 20040524 - Inicio Modificación Arbumasa para el seguimiento de documentos
        if (Estado <> 'Abierto') and (Estado <> '') then
            Error('No se puede eliminar un vale registrado');

        rstConfUsu.Reset;
        if rstConfUsu.Get(UserId) then
            cduMensajeria.RegistrarMensaje('Vale de Consumo Eliminado', '', "No. documento", 'Vale de Consumo', 'Eliminado', Today,
            rstMensajeria."Tipo movimiento"::Seguimiento, rstConfUsu.Grupo, '', '', '', '', '', '', '');

        //US.ARBU - 20040524 - Fin Modificación Arbumasa para el seguimiento de documentos
    end;

    trigger OnInsert()
    begin
        "Fecha registro" := WorkDate;
        Usuario := UserId;
    end;

    trigger OnRename()
    begin
        Error('No se puede renombrar esta tabla.');
    end;

    var
        GestNoSerie: Codeunit "No. Series";
        ConfExis: Record "Inventory Setup";
        Lin: Record "Lín. vale consumo";
        PunProy: Record Job;
        PunAlm: Record Location;
        PunDep: Record Dimension;
        rstMensajeria: Record Mensajeria;
        cduMensajeria: Codeunit "Mensajería";
        rstConfUsu: Record "User Setup";
        rstLinVC: Record "Lín. vale consumo";

    [Scope('OnPrem')]
    procedure Navigate()
    var
        NavigateForm: Page Navigate;
    begin
        NavigateForm.SetDoc("Fecha registro", "No. documento");
        NavigateForm.Run;
    end;
}

